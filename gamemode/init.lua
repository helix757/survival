include("shared.lua")

local function SvModules()
	for k,v in pairs(file.Find("gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "sv" then
			print("[SV] Loaded serverside module"..v)
			include(v)
		end
	end
end
hook.Add("Initialize", "Sv_Modules_Hook", SvModules)

local function ClModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,3) == "cli" then
			print("[CLI] Loaded clientside module"..v)
			AddCSLuaFile(v)
			umsg.Start( "IncludeClient" )
				umsg.String(v)
			umsg.End()
		end
	end
end
hook.Add("Initialize", "Cl_Modules_Hook", ClModules2) 


local function AutoFastDL()
	for k,v in pairs(file.Find("gamemode/content/*", "GAME")) do
		resource.AddFile("gamemode/content/"..v)
	end
end
hook.Add("Initialize", "AutoFastDL", AutoFastDL)