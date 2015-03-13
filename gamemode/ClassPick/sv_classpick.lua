
util.AddNetworkString( "OpenClassDerma" )
function GM:PlayerInitialSpawn( LocalPlayer() )
	net.Start( "OpenClassDerma" )
	net.Send( LocalPlayer() )
end