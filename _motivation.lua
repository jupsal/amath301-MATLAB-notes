-- Show or hide every ::: {.motivation} block.
-- Turn them all off with `show-motivations: false` in _quarto.yml.
local show = true

local function Meta(m)
  local v = m["show-motivations"]
  if v == false or (v ~= nil and type(v) ~= "boolean"
      and pandoc.utils.stringify(v) == "false") then
    show = false
  end
end

local function Div(el)
  if el.classes:includes("motivation") and not show then
    return {}
  end
end

return { { Meta = Meta }, { Div = Div } }
