print("test.lua")

local function ClModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "cl" then
			print("[SV] Loaded clientside module"..v)
			AddCSLuaFile(v)
			include(v)
		end
	end
end
hook.Add("Initialize", "Cl_Modules_Hook", ClModules) 