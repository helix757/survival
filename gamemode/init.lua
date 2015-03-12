include("shared.lua")

local function SvModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "sv" then
			print("[SV] Loaded serverside module"..v)
			include(v)
		end
	end
end
hook.Add("Initialize", "Sv_Modules_Hook", SvModules)