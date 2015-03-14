local ourMat = Material( "blurgm" )
local hex = Material( "materials/heaxagon_pattern_v2.png" )
/*function survival_hud()

if !LocalPlayer():Alive() then return false end
	
draw.RoundedBox(4, ScrW() - 370, ScrH() - 220, 360, 210, Color(85, 0, 0, 255)) -- Outer Box
draw.RoundedBox(4, ScrW() - 365, ScrH() - 215, 350, 200, Color(170, 57, 57, 255)) -- Inner box

draw.RoundedBox(0, ScrW() - 350, ScrH() - 125, 320, 48, Color(85, 0, 0, 255))
draw.RoundedBox(0, ScrW() - 350, ScrH() - 75, 320, 48, Color(85, 0, 0, 255))

for i=1, 10 do -- Makes blur more dense 
		ourMat:SetFloat("$blur", Fraction)
		ourMat:Recompute()
		surface.SetDrawColor( 170, 57, 57, 255 )
		surface.SetMaterial( ourMat )
		render.UpdateFullScreenDepthTexture( )
		render.UpdatePowerOfTwoTexture( )
		render.UpdateRefractTexture( )
		if ( render ) then render.UpdateScreenEffectTexture() end
		surface.DrawTexturedRect( ScrW() - 365, ScrH() - 215, 350, 200 )
	end
	surface.SetMaterial( Material( "blurgm" ) )
	surface.DrawTexturedRect( ScrW() - 365, ScrH() - 215, 350, 200 )

	
	surface.SetDrawColor( 170, 57, 57, 255 )
	surface.SetMaterial( hex )
	surface.DrawTexturedRect( ScrW() - 365, ScrH() - 215, 350, 200 )

widthhp =  math.Clamp(LocalPlayer():Health() * 3, 0, 300)
widthap =  math.Clamp(LocalPlayer():Armor() * 3, 0, 300)

draw.RoundedBox(0, ScrW() - 185 - widthhp/2, ScrH() - 115, math.Clamp(LocalPlayer():Health() * 3, 5, 300), 40, Color(212, 106, 106, 255)) -- Health bar
draw.RoundedBox(0, ScrW() - 185 - widthap/2, ScrH() - 65, math.Clamp(LocalPlayer():Armor() * 3, 5, 300), 40, Color(255, 170, 170, 255)) -- Armor bar

local namelen = string.len(LocalPlayer():Nick())

if namelen < 22 then
	draw.DrawText(LocalPlayer():Nick(), "BigBloodImpact", ScrW() - 185, ScrH() - 205, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER) -- Name
else
	draw.DrawText(string.sub(LocalPlayer():Nick(), 1, 22).."...", "BigBloodImpact", ScrW() - 185, ScrH() - 205, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER) -- Name
end
draw.DrawText("HP", "BigBloodImpact", ScrW() - 325, ScrH() - 114, Color(255, 255, 255, 255)) -- HP
draw.DrawText("AP", "BigBloodImpact", ScrW() - 325, ScrH() - 65, Color(255, 255, 255, 255)) -- AP

-- draw.DrawText("Wave", "SmallBloodImpact", ScrW() - 100, ScrH() - 200, Color(255, 255, 255, 255)) -- Wave
-- draw.DrawText("8", "SmallBloodImpact", ScrW() - 72, ScrH() - 170, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER) -- Wave number
end
hook.Add("HUDPaint", "survival_hud", survival_hud)*/

function survival_hud_ammo()

if !LocalPlayer():Alive() then return false end
	
draw.RoundedBox(4, 5, ScrH() - 120, 185, 110, Color(85, 0, 0, 255)) -- Outer Box
draw.RoundedBox(4, 10, ScrH() - 115, 175, 100, Color(170, 57, 57, 255)) -- Inner box

for b=1, 10 do -- Makes blur more dense 
		ourMat:SetFloat("$blur", Fraction)
		ourMat:Recompute()
		surface.SetDrawColor( 170, 57, 57, 255 )
		surface.SetMaterial( ourMat )
		render.UpdateFullScreenDepthTexture( )
		render.UpdatePowerOfTwoTexture( )
		render.UpdateRefractTexture( )
		if ( render ) then render.UpdateScreenEffectTexture() end
		surface.DrawTexturedRect( 10, ScrH() - 115, 175, 100 )
	end
	surface.SetMaterial( Material( "blurgm" ) )
	surface.DrawTexturedRect( 10, ScrH() - 115, 175, 100 )

	
	surface.SetDrawColor( 170, 57, 57, 255 )
	surface.SetMaterial( hex )
	surface.DrawTexturedRect( 10, ScrH() - 115, 175, 100 )

draw.DrawText("Ammo", "SmallBloodImpact", 30, ScrH() - 105, Color(255, 255, 255, 255)) -- Ammo Word
draw.DrawText("250".."/".."200", "BigBloodImpact", 170, ScrH() - 65, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT) -- Ammo Counter

-- Once guns and ammo are ready:
/*if LocalPlayer():Clip1() != nil then
	if LocalPlayer():Clip2() != nil then
		draw.DrawText("LocalPlayer():Clip1()".."/"..LocalPlayer():Clip2(), "BigBloodImpact", 170, ScrH() - 65, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT) -- Ammo Counter
	end
end*/
end
hook.Add("HUDPaint", "survival_hud_ammo", survival_hud_ammo)
----------------Start BC Stuff-------------
hook.Add( "HUDPaint", "SurvivalBCHUD", function() 
	
	draw.RoundedBox(4, ScrW() - 370, ScrH() - 220, 360, 210, Color(85, 0, 0, 255)) -- Outer Box
	draw.RoundedBox(4, ScrW() - 365, ScrH() - 215, 350, 200, Color(170, 57, 57, 255)) -- Inner box

	draw.RoundedBox(0, ScrW() - 350, ScrH() - 125, 320, 48, Color(85, 0, 0, 255))
	draw.RoundedBox(0, ScrW() - 350, ScrH() - 75, 320, 48, Color(85, 0, 0, 255))
--Blur
	for i=1, 10 do -- Makes blur more dense 
		ourMat:SetFloat("$blur", Fraction)
		ourMat:Recompute()
		surface.SetDrawColor( 170, 57, 57, 255 )
		surface.SetMaterial( ourMat )
		render.UpdateFullScreenDepthTexture( )
		render.UpdatePowerOfTwoTexture( )
		render.UpdateRefractTexture( )
		if ( render ) then render.UpdateScreenEffectTexture() end
		surface.DrawTexturedRect( ScrW() - 365, ScrH() - 215, 350, 200 )
	end
	surface.SetMaterial( Material( "blurgm" ) )
	surface.DrawTexturedRect( ScrW() - 365, ScrH() - 215, 350, 200 )
--Hex
	surface.SetDrawColor( 170, 57, 57, 255 )
	surface.SetMaterial( hex )
	surface.DrawTexturedRect( ScrW() - 365, ScrH() - 215, 350, 200 )
--Health and Armor
	local HP = LocalPlayer():Health()
	local AP = LocalPlayer():Armor()
	widthhp =  math.Clamp(LocalPlayer():Health() * 3, 0, 300)
	widthap =  math.Clamp(LocalPlayer():Armor() * 3, 0, 300)
	draw.RoundedBox(0, ScrW() - 335, ScrH() - 115, 300, 40, Color(40, 40, 40, 255)) -- Health bar
	draw.RoundedBox(0, ScrW() - 335, ScrH() - 65, 300, 40, Color(40, 40, 40, 255))
	draw.RoundedBox(0, ScrW() - 185 - widthhp/2, ScrH() - 115, math.Clamp(LocalPlayer():Health() * 3, 5, 300), 40, Color(255, 0, 0, 255)) -- Health bar
	draw.RoundedBox(0, ScrW() - 185 - widthap/2, ScrH() - 65, math.Clamp(LocalPlayer():Armor() * 3, 5, 300), 40, Color(10, 150, 255, 255)) -- Armor bar
	draw.DrawText("HP", "BigBloodImpact", ScrW() - 325, ScrH() - 114, Color(255, 255, 255, 255)) -- HP
	draw.DrawText("AP", "BigBloodImpact", ScrW() - 325, ScrH() - 65, Color(255, 255, 255, 255)) -- AP
	draw.DrawText(HP.." %", "BigBloodImpact", ScrW() - 180, ScrH() - 114, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER) -- HP
	draw.DrawText(AP.." %", "BigBloodImpact", ScrW() - 180, ScrH() - 65, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER) -- AP
--Name
	local namelen = string.len(LocalPlayer():Nick())
	if namelen < 22 then
		draw.DrawText(LocalPlayer():Nick(), "BigBloodImpact", ScrW() - 185, ScrH() - 205, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER) -- Name
	else
		draw.DrawText(string.sub(LocalPlayer():Nick(), 1, 22).."...", "BigBloodImpact", ScrW() - 185, ScrH() - 205, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER) -- Name
	end
--Team Name
	local class =  team.GetName(LocalPlayer():Team())
	draw.DrawText("Class: "..class, "BigBloodImpact", ScrW() - 185, ScrH() - 165, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER)
end)



local hideHUDElements = {
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudBattery"] = true, 
	["CHudHealth"] = true, 
	
}

function HideHUDS(hide)
	if hideHUDElements[hide] then return false end
end
hook.Add( "HUDShouldDraw", "HideRegHUD", HideHUDS )

hook.Add("HUDDrawTargetID", "HMHUD", function()
	return
end)

surface.CreateFont("BigBloodImpact", {
	font = "Bloody Impact", 
	size = 35, 
	antialias = true,
})

surface.CreateFont("SmallBloodImpact", {
	font = "Bloody Impact", 
	size = 30, 
	antialias = true,
})

