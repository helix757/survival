include("shared.lua")

local function SvModules()
	for k,v in pairs(file.Find("gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "sv" then
			Error("[SV] Loaded serverside module "..v)
			include(v)
		end
	end
end
hook.Add("Initialize", "Sv_Modules_Hook", SvModules)

local function ClModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,3) == "cli" then
			Error("[CLI] Loaded clientside module "..v)
			AddCSLuaFile("survival/gamemode/"..v)
		end
	end
end
hook.Add("Initialize", "Cl_Modules_Hook", ClModules) 


local function AutoFastDL()
	for k,v in pairs(file.Find("gamemode/content/*", "GAME")) do
		resource.AddFile("gamemode/content/"..v)
	end
end
hook.Add("Initialize", "AutoFastDL", AutoFastDL)

resource.AddFile("materials/blurgm.vmt")
resource.AddFile("materials/heaxagon_pattern_v2.png")