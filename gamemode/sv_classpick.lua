
util.AddNetworkString( "OpenClassDerma" )
function GM:PlayerInitialSpawn(ply)
	net.Start( "OpenClassDerma" )
	net.Send(ply)
end
