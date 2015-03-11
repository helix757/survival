
function GAMEMODE:HUDPaint()

draw.RoundedBox(4, 10, ScrH() - 5, 360, 210, Color(85, 0, 0, 255)) -- Outer Box
draw.RoundedBox(4, 15, ScrH() - 10, 350, 200, Color(170, 57, 57, 255)) -- Inner box

draw.RoundedBox(0, 20, ScrH() - 15, math.Clamp(LocalPlayer():Health(), 0, 200), 40, Color(212, 106, 106, 255)) -- Health bar
draw.RoundedBox(0, 20, ScrH() - 65, math.Clamp(LocalPlayer():Armor(), 0, 200), 40, Color(255, 170, 170, 255)) -- Armor bar

end
