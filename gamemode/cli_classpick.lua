
function ClassDerma()
local Frame = vgui.Create( "DFrame" )
	Frame:SetTitle( "Test panel" )
	Frame:SetSize( 300, 300 )
	Frame:Center()			
	Frame:MakePopup()
	Frame.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
		draw.RoundedBox( 0, 0, 0, w, h, Color( 160, 160, 160, 255 ) ) -- Draw a red box instead of the frame
	end
		
local Button = vgui.Create("DButton", Frame)
	Button:SetText( "Click me I'm pretty!" )
	Button:SetTextColor( Color(255, 255, 255) )
	Button:SetPos( 100, 100 )
	Button:SetSize( 100, 30 )
	Button.Paint = function( self, w, h )
		draw.RoundedBox(0, 0, 0, w, h, Color(255, 0, 0, 255) ) -- Draw a blue button
	end
	Button.DoClick = function()
		player_manager.SetPlayerClass( ply, "Default" )
		player_manager.OnPlayerSpawn( ply )
	end
end
net.Receive("OpenClassDerma", ClassDerma)
concommand.Add("class", ClassDerma)
