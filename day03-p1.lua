local function read_file(path)
    local file = io.open(path, "r") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function numberOfHousesSantaAlone(instruction)
  --local totalNumber = 0
  local x = 0
  local y = 0
  local houseAddress = {}
  table.insert(houseAddress, {x, y})
  --local countHauses = 1
  for i = 1, string.len(instruction), 1 do
    local indexCharchter = string.sub(instruction, i, i)
    if indexCharchter == ">" then
      x = x + 1
    elseif indexCharchter == "<" then
      x = x -1
    elseif indexCharchter == "^"then
      y = y + 1
    else 
      y = y - 1
    end
    
    if not isTheElementInTheList(houseAddress, {x,y}) then
      table.insert(houseAddress, {x, y})
    end
  end
  return #houseAddress
end

function isTheElementInTheList (list, house)
  for i = 1, #list, 1 do
    if list[i][1] == house[1] and list[i][2] == house[2] then
      return true
    end
  end
  return false
end


function isItSantasTurn(index)
  if index % 2 == 0 then
    return true
  end
  return false
end

function numberOfHousesSantaRobosanta(instruction)
  local x = 0
  local y = 0
  local b = 0
  local a = 0
  local houseAddress = {}
  table.insert(houseAddress, {x, y})
  for i = 1, string.len(instruction), 1 do
  local indexCharchter = string.sub(instruction, i, i)
  
    if isItSantasTurn(i) then
      if indexCharchter == ">" then
        x = x + 1
      elseif indexCharchter == "<" then
        x = x -1
      elseif indexCharchter == "^"then
        y = y + 1
      else 
        y = y - 1
      end
      local m = x
      local n = y
    else
      if indexCharchter == ">" then
        a = a + 1
      elseif indexCharchter == "<" then
        a = a -1
      elseif indexCharchter == "^"then
        b = b + 1
      else 
        b = b - 1
      end
      local m = a
      local n = b
    end
  end
  if not isTheElementInTheList(houseAddress, {m, n}) then
      table.insert(houseAddress, {m, n})
  end
  return #houseAddress  
end


print(numberOfHousesSantaAlone(read_file("Day03p01.txt")))
print(numberOfHousesSantaRobosanta(read_file("Day03p02.txt")))


--assert (isTheElementInTheList({"A","B","C","D","E","F","G"}, "Z") == false)
--assert (not isTheElementInTheList({"A","B","C","D","E","F","G"}, "M"))
--assert (isTheElementInTheList({"A","B","C","D","E","F","G"}, "B") == true)
--assert (isTheElementInTheList({}, "A") == false)
assert (numberOfHousesSantaAlone(">") == 2)
assert (numberOfHousesSantaAlone(">>") == 3)
assert (numberOfHousesSantaAlone("^v") == 2)
assert (numberOfHousesSantaAlone("^>v<") == 4)
assert (numberOfHousesSantaAlone("^v^v^v^v^v") == 2)

assert (not isItSantasTurn(3))
assert (isItSantasTurn(12) == true)

assert (numberOfHousesSantaRobosanta(">") == 2)
assert (numberOfHousesSantaRobosanta(">>") == 2)
assert (numberOfHousesSantaRobosanta("^>v<") == 3)
assert (numberOfHousesSantaRobosanta("^v") == 3)
assert (numberOfHousesSantaRobosanta("^v^v^v^v^v") == 11)