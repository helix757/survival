local ourMat = Material( "blurgm" )
local hex = Material( "materials/heaxagon_pattern_v2.png" )
function survival_hud()
	
draw.RoundedBox(4, 10, ScrH() - 500, 360, 210, Color(85, 0, 0, 255)) -- Outer Box
draw.RoundedBox(4, 15, ScrH() - 495, 350, 200, Color(170, 57, 57, 255)) -- Inner box

for i=1, 10 do -- Makes blur more dense
		ourMat:SetFloat("$blur", Fraction)
		ourMat:Recompute()
		surface.SetDrawColor( 170, 57, 57, 255 )
		surface.SetMaterial( ourMat )
		render.UpdateFullScreenDepthTexture( )
		render.UpdatePowerOfTwoTexture( )
		render.UpdateRefractTexture( )
		if ( render ) then render.UpdateScreenEffectTexture() end
		surface.DrawTexturedRect( 15, ScrH() - 495, 350, 200 )
	end
	surface.SetMaterial( Material( "blurgm" ) )
	surface.DrawTexturedRect( 15, ScrH() - 495, 350, 200 )

	
	surface.SetDrawColor( 170, 57, 57, 255 )
	surface.SetMaterial( hex )
	surface.DrawTexturedRect( 15, ScrH() - 495, 350, 200 )

widthhp =  math.Clamp(LocalPlayer():Health() * 3, 0, 300)
widthap =  math.Clamp(LocalPlayer():Armor() * 3, 0, 300)

draw.RoundedBox(0, 185 - widthhp/2, ScrH() - 395, math.Clamp(LocalPlayer():Health() * 3, 5, 300), 40, Color(212, 106, 106, 255)) -- Health bar
draw.RoundedBox(0, 185 - widthap/2, ScrH() - 345, math.Clamp(LocalPlayer():Armor() * 3, 5, 300), 40, Color(255, 170, 170, 255)) -- Armor bar

draw.DrawText(LocalPlayer():GetName(), "DermaLarge", 140, ScrH() - 485, Color(255, 255, 255, 255))

draw.DrawText("Wave", "Trebuchet24", 300, ScrH() - 460, Color(255, 255, 255, 255))
draw.DrawText("8", "Trebuchet24", 325, ScrH() - 430, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
end
hook.Add("HUDPaint", "survival_hud", survival_hud)

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

