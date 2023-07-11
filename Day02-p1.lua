function wrappingPaperAmountPerBox (l, w, h)
  local a = l*w
  local b = l*h
  local c = h*w
  local bca = 2*(a + b + c)
  local min = math.min(a, b, c)
  local wrappingPaperPerBox = bca + min
  return wrappingPaperPerBox
end

assert (wrappingPaperAmountPerBox (1, 1, 2) == 11)
assert (wrappingPaperAmountPerBox(1, 2, 3) == 24)
assert (wrappingPaperAmountPerBox (2, 3, 4) == 58)

local function read_file(path)
    local file = io.open(path, "r") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

read_file ("Day02Input.txt")

function totalWrappingPaperAmount (dimensionList)
  local totalAmount = 0
  for box in string.gmatch (dimensionList, "[^\n]+") do
    local args = {}
    for boxDimension in string.gmatch (box, "[^x]+") do
      table.insert (args, boxDimension)
    end
    totalAmount = totalAmount + wrappingPaperAmountPerBox (args[1], args[2], args [3])
  end
  return totalAmount
end

print (totalWrappingPaperAmount (read_file ("Day02Input.txt")))


assert (totalWrappingPaperAmount ([[1x1x2
1x2x3
2x3x4
]]) == 93)
