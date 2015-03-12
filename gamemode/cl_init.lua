print("test.lua")

local function ClModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,3) == "cli" then
			print("[CLI] Loaded clientside module"..v)
			AddCSLuaFile(v)
			include(v)
		end
	end
end
hook.Add("Initialize", "Cl_Modules_Hook", ClModules) 