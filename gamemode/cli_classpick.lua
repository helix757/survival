
function ClassDerma()
local BG = vgui.Create( "DFrame" )
	BG:SetTitle( "Test panel" )
	BG:SetSize( 300, 300 )
	BG:Center()			
	BG:MakePopup()
	BG.Paint = function( self, w, h ) 
		draw.RoundedBox( 0, 0, 0, w, h, Color( 160, 160, 160, 255 ) ) 
	end
		
local blah = vgui.Create("DButton")
	blah:SetParent( BG )
	blah:SetText( "Click me I'm pretty!" )
	blah:SetTextColor( Color(255, 255, 255) )
	blah:SetPos( 100, 100 )
	blah:SetSize( 100, 30 )
	blah.Paint = function( self, w, h )
		draw.RoundedBox(0, 0, 0, w, h, Color(255, 0, 0, 255) ) 
	end
	blah.DoClick = function()
		player_manager.SetPlayerClass( LocalPlayer(), "Hunter" )
		player_manager.OnPlayerSpawn( LocalPlayer() )
	end
end
net.Receive("OpenClassDerma", ClassDerma)
concommand.Add("class", ClassDerma)
