if SERVER then
  AddCSLuaFile("shared.lua")
end

local function ShModules()
	for k,v in pairs(file.Find("gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "sh" then
			Error("[SV] Loaded shared module "..v.."\n")
			include(v)
		end
	end
end
ShModules()

team.SetUp( 1, "Hunter", Color( 255, 0, 0 ) )
team.SetUp( 2, "BowMan", Color( 0, 255, 255 ) )
team.SetUp( 3, "Prepper", Color( 255, 255, 0 ) )