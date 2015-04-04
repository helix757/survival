include("shared.lua")

function ENT:Draw()
	self:DrawModel()
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
 
	Ang:RotateAroundAxis(Ang:Right(), 90)
	
 	for k,v in pairs(ents.GetAll()) do
	if v:GetClass() == self:GetClass() then
	local dist = (LocalPlayer():GetShootPos() - v:GetPos()):Length()
	if (dist < 750) then
	cam.Start3D2D(Pos + Ang:Up() * -13.4, Ang, .1)
		draw.RoundedBox(0, 361, -222, 50, 150, Color(0, 162, 232, 255))
	cam.End3D2D()
	
	cam.Start3D2D(Pos + Ang:Right() * -26.4, Ang, .1)
		draw.DrawText("Hi", "DermaLarge", 25, 25, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER)
	cam.End3D2D()
		end
	end
end
end