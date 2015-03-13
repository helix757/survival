
-- The start of the data saving of the player inventory.
local function CreateFolders()
  if not file.Exists(¨survival¨,¨DATA¨) then
    file.CreateDir("survival")
  end
end
hook.Add(¨Initialize¨, ¨Create_Data_Folders¨)


local function CheckForDataFile( ply )
  if file.Exists(¨survival/¨..ply:SteamID()..¨.txt¨,¨DATA¨) then
     local json = util.JSONToTable(file.Read(¨survival/¨..ply:SteamID()..¨.txt¨,¨DATA¨))
     ply.data = json
  else
    file.Write(¨survival/¨..SteamID()..¨.txt¨, ¨¨)
    ply.data = util.JSONToTable(file.Read(¨survival/¨..ply:SteamID()..¨.txt¨,¨DATA¨))
  end
end
hook.Add(¨PlayerInitialSpawn¨, ¨Data_Check¨, CheckForDataFile)

local meta = FindMetaTable(¨Player¨)

function meta:HasItem(item)
  if self.data[item] != nil then
    return true
  else
    return false
  end
end

-- Can be int,string,bool etc
function meta:SetItem(item,amt)
  self.data[item] = amt  
end

function meta:RemoveItem(item)
  self.data[item] = nil
end

function meta:GetItemVal(item)
  return self.data[item]
end







