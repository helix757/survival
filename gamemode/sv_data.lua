
-- The start of the data saving of the player inventory.
function CreateSurvFolders()
	if not file.IsDir( "survival", "DATA" ) then
		file.CreateDir("survival")
		print("Folder Was Created!")
	end
end
hook.Add("Initialize","CreateSurvFolders",CreateSurvFolders)

local function CheckForDataFile( ply )
  if file.Exists("survival/"..ply:SteamID64()..".txt","DATA") then
     local json = util.JSONToTable(file.Read("survival/"..ply:SteamID64()..".txt","DATA"))
     ply.data = json
  else
    file.Write("survival/"..ply:SteamID64()..".txt", "")
    ply.data = nil
  end
end
hook.Add("PlayerInitialSpawn", "Data_Check", CheckForDataFile) 

local meta = FindMetaTable("Player")

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







