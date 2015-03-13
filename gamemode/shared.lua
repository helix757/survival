if SERVER then
  AddCSLuaFile("shared.lua")
end


AddCSLuaFile( "ClassPick/cli_classpick.lua" )
AddCSLuaFile( "ClassPick/sv_classpick.lua" )
include( "ClassPick/cli_classpick.lua" )

team.SetUp( 1, "Hunter", Color( 255, 0, 0 ) )
team.SetUp( 2, "BowMan", Color( 0, 255, 255 ) )
team.SetUp( 3, "Prepper", Color( 255, 255, 0 ) )

local Class = {}
	Class.SetModel( "models/player/police.mdl" )
	Class.SetMaxHealth = 100
	Class.SetHealth = 100
	Class.WalkSpeed = 250
	Class.RunSpeed = 500
	Class.TeammateNoCollide = false
player_manager.RegisterClass( "Default", Class, "player_default" )