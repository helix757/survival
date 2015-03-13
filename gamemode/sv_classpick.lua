
util.AddNetworkString( "OpenClassDerma" )
function OpenDerma(ply)
	net.Start( "OpenClassDerma" )
	net.Send(ply)
end
hook.Add("PlayerInitialSpawn", "Open_Derma", OpenDerma)


team.SetUp( 1, "Hunter", Color( 255, 0, 0 ) )
team.SetUp( 2, "BowMan", Color( 0, 255, 255 ) )
team.SetUp( 3, "Prepper", Color( 255, 255, 0 ) )