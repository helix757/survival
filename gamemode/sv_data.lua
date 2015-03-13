
-- The start of the data saving of the player inventory.
function CreateSurvFolders()
	if not file.IsDir( "survival", "DATA" ) then
		file.CreateDir("survival")
		print("Folder Was Created!")
	end
end
hook.Add("Initialize","CreateSurvFolders",CreateSurvFolders)

util.AddNetworkString("SendData")
function CheckForDataFile( ply )
  if file.Exists("survival/"..ply:SteamID64()..".txt","DATA") then
     local json = util.JSONToTable(file.Read("survival/"..ply:SteamID64()..".txt","DATA"))
     if json == nil then
		ply.data = {}
	net.Start("SendData")
		net.WriteTable(ply.data)
	net.Send(ply)
	 else
		ply.data = json
	net.Start("SendData")
		net.WriteTable(ply.data)
	net.Send(ply)
	end
  else
    file.Write("survival/"..ply:SteamID64()..".txt", "")
    ply.data = {}
	net.Start("SendData")
		net.WriteTable(ply.data)
	net.Send(ply)
  end
end
hook.Add("PlayerInitialSpawn", "Data_Check", CheckForDataFile) 