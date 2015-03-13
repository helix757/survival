
util.AddNetworkString( "OpenClassDerma" )
function OpenDerma(ply)
	net.Start( "OpenClassDerma" )
	net.Send(ply)
end
hook.Add("PlayerInitialSpawn", "Open_Derma", OpenDerma)