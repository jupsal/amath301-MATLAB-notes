-- MATLAB output blocks (``` {.output}) are not code, so don't number their
-- lines. Line numbers stay on for every other code block.
function CodeBlock(el)
  if el.classes:includes("output") then
    el.attributes["code-line-numbers"] = "false"
    return el
  end
end