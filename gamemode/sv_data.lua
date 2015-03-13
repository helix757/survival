
-- The start of the data saving of the player inventory.
function CreateFolders()
  if not file.Exists(¨survival¨,¨DATA¨) then
    file.CreateDir("survival")
  end
end
hook.Add(¨Initialize¨, ¨Create_Data_Folders¨)


function CheckForDataFile( ply )
  if file.Exists(¨survival/¨..ply:SteamID()..¨.txt¨,¨DATA¨) then
     local json = util.JSONToTable(file.Read(¨survival/¨..ply:SteamID()..¨.txt¨,¨DATA¨))
     ply.data = json
  else
    file.Write(¨survival/¨..SteamID()..¨.txt¨, ¨¨)
    ply.data = util.JSONToTable(file.Read(¨survival/¨..ply:SteamID()..¨.txt¨,¨DATA¨))
  end
end
hook.Add(¨PlayerInitialSpawn¨, ¨Data_Check¨, CheckForDataFile)
