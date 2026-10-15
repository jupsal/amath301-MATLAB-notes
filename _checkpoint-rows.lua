-- Group rows in a table (used by the Lesson index).
--
-- 1. Group headings. A row with text in the FIRST cell only, e.g.
--      | Quiz 1: Lessons 1–2 (Mon Oct 20) | | | | |
--    becomes a full-width heading. The rows under it, up to the next
--    heading, are shaded as one group, alternating between two shades.
--
-- 2. Exam rows. If that first cell is marked with {.exam}, e.g.
--      | [Midterm (Fri Oct 31): Quizzes 1–3, Lessons 1–8]{.exam} | | | | |
--    it becomes a full-width exam row instead. It does NOT start a new
--    group, so the quiz grouping around it is unchanged.
local function is_empty(cell)
  return pandoc.utils.stringify(cell.contents):match("^%s*$") ~= nil
end

local function first_cell_only(row)
  if #row.cells < 2 or is_empty(row.cells[1]) then return false end
  for i = 2, #row.cells do
    if not is_empty(row.cells[i]) then return false end
  end
  return true
end

local function is_exam(cell)
  local found = false
  pandoc.walk_block(pandoc.Div(cell.contents), {
    Span = function(s) if s.classes:includes("exam") then found = true end end
  })
  return found
end

function Table(tbl)
  local ncols = #tbl.colspecs
  local group = 0
  for _, body in ipairs(tbl.bodies) do
    for _, row in ipairs(body.body) do
      if first_cell_only(row) then
        local first = row.cells[1]
        first.col_span = ncols
        row.cells = { first }
        if is_exam(first) then
          row.attr.classes:insert("exam-row")
        else
          group = group + 1
          row.attr.classes:insert("group-heading")
        end
      elseif group > 0 then
        row.attr.classes:insert(group % 2 == 1 and "group-a" or "group-b")
      end
    end
  end
  return tbl
end
