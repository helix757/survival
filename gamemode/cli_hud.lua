local ourMat = Material( "blurgm" )
function survival_hud()
	for i=1, 10 do -- Makes blur more dense
		ourMat:SetFloat("$blur", Fraction)
		ourMat:Recompute()
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( ourMat )
		render.UpdateFullScreenDepthTexture( )
		render.UpdatePowerOfTwoTexture( )
		render.UpdateRefractTexture( )
		if ( render ) then render.UpdateScreenEffectTexture() end
		surface.DrawTexturedRect( 15, ScrH() - 495, 350, 200 )
	end
draw.RoundedBox(4, 10, ScrH() - 500, 360, 210, Color(85, 0, 0, 255)) -- Outer Box
draw.RoundedBox(4, 15, ScrH() - 495, 350, 200, Color(170, 57, 57, 255)) -- Inner box

surface.SetMaterial( Material( "blurgm" ) )
surface.DrawTexturedRect( 15, ScrH() - 495, 350, 200 )


widthhp =  math.Clamp(LocalPlayer():Health() * 3, 0, 300)
widthap =  math.Clamp(LocalPlayer():Armor() * 3, 0, 300)

draw.RoundedBox(0, 185 - widthhp/2, ScrH() - 395, math.Clamp(LocalPlayer():Health() * 3, 5, 300), 40, Color(212, 106, 106, 255)) -- Health bar
draw.RoundedBox(0, 185 - widthap/2, ScrH() - 345, math.Clamp(LocalPlayer():Armor() * 3, 5, 300), 40, Color(255, 170, 170, 255)) -- Armor bar

draw.DrawText(LocalPlayer():GetName(), "DermaLarge", 140, ScrH() - 485, Color(255, 255, 255, 255))
end
hook.Add("HUDPaint", "survival_hud", survival_hud)