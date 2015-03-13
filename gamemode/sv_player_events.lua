
function Tombstone( ply )
local weps = {}
for k, v in pairs(ply:GetWeapons()) do
	table.insert( weps, v:GetClass() )
	end
		local npc =	ents.Create("grave")
		npc:SetPos(ply:GetPos()) 
		npc:SetAngles(ply:GetAngles())
		npc:Spawn()
		npc:Activate()
		npc:SetNWString("name", ply:Nick())
		npc.WepTable = weps
		
end
hook.Add("PlayerDeath","Death_Tombstone",Tombstone)