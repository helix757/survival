AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_wasteland/controlroom_storagecloset001a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetPos(self:GetPos() + Vector(0,0,10))
	self:SetAngles(angle_zero)
	self:SetUseType( SIMPLE_USE )
	self:SetHealth(100)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	
end

function ENT:Use( activator, caller )
end