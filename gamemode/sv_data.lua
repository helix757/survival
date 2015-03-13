
-- The start of the data saving of the player inventory.
function CreateSurvFolders()
	if not file.IsDir( "survival", "DATA" ) then
		file.CreateDir("survival")
		print("Folder Was Created!")
	end
end
hook.Add("Initialize","CreateSurvFolders",CreateSurvFolders)

function CheckForDataFile( ply )
  if file.Exists("survival/"..ply:SteamID64()..".txt","DATA") then
     local json = util.JSONToTable(file.Read("survival/"..ply:SteamID64()..".txt","DATA"))
     if json == nil then
		ply.data = {}
	 else
		ply.data = json
	end
  else
    file.Write("survival/"..ply:SteamID64()..".txt", "")
    ply.data = {}
  end
end
hook.Add("PlayerInitialSpawn", "Data_Check", CheckForDataFile) 