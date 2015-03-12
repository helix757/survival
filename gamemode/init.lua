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
	for k,v in pairs(file.Find("gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "cl" then
			print("[CL] Loaded serverside module"..v)
			include(v)
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