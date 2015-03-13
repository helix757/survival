include("shared.lua")

local function ClModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,3) == "cli" then
			print("[CLI] Loaded clientside module "..v.."\n")
			include(v)
		end
	end
end
ClModules()
function ShModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "sh" then
			print("[CLI] Loaded shared module "..v.."\n")
			include(v)
		end
	end
end
ShModules()