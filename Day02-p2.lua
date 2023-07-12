function ribbonLengthPerBox (l, w, h)
  local array = {l, w, h}
  local extraRibbon = l*w*h
  table.sort(array)
  local sideRibbon = (2*array[1]) + (2*array[2])
  return extraRibbon + sideRibbon
end

assert (ribbonLengthPerBox (1, 10, 1) == 14)
assert (ribbonLengthPerBox (2, 4, 3) == 34)


local function read_file(path)
    local file = io.open(path, "r") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

read_file ("Day02Input.txt")

function totalRibbonLength (dimensionList)
  local totalAmount = 0
  for box in string.gmatch (dimensionList, "[^\n]+") do
     local args = {}
    for boxDimension in string.gmatch (box, "[^x]+") do
      table.insert (args, boxDimension)
    end
    totalAmount = totalAmount + ribbonLengthPerBox (tonumber(args[1] , 10), tonumber(args[2] , 10), tonumber(args[3]) , 10)
  end
  return totalAmount
end

print (totalRibbonLength (read_file ("Day02Input.txt"))) 

assert (totalRibbonLength ([[1x10x1
2x4x3
]]) == 48)