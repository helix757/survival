
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

function Class_Selection_Nikorev_Edition()
local basepanel = vgui.Create( "DFrame" )
	basepanel:SetTitle("")
	basepanel:SetSize( 800, 600 )
	basepanel:Center()
	basepanel:MakePopup()
	basepanel:ShowCloseButton(true) -- for now
	basepanel:SetDraggable(false)
	
	function basepanel.Paint()
		draw.RoundedBox(0, 0, 0, basepanel:GetWide(), basepanel:GetTall(), Color(85, 0, 0, 255))
		draw.RoundedBox(0, 5, 5, basepanel:GetWide() - 10, basepanel:GetTall() - 10, Color(170, 57, 57, 255))
	end
	
local extrainfolabel = vgui.Create("DLabel", basepanel)
	extrainfolabel:SetPos( basepanel:GetWide() - 200, basepanel:GetTall() - 100 )
	extrainfolabel:SetSize( basepanel:GetWide() / 2 + 20, 50 )
	extrainfolabel:Hide()
	for k,v in pairs(teamtable) do -- FIX THIS
		extrainfolabel:SetText(v[4]) -- FIX THIS
	end -- FIX THIS
	
local teamlist = vgui.Create("DPanelList", basepanel)
	teamlist:SetPos( 0, 60 )
	teamlist:SetSize( basepanel:GetWide() / 2 - 20, basepanel:GetTall() - 120)
	teamlist:SetSpacing(10)
	teamlist:SetPadding(5)
	teamlist:EnableHorizontal( true ) 
	teamlist:EnableVerticalScrollbar( true )
	teamlist:MoveToFront()
	
	for k,v in pairs(teamtable) do
		local teampanel = vgui.Create("DPanel", teamlist)
			teampanel:SetPos( 5, 5 )
			teampanel:SetSize( teamlist:GetWide(), 40 )
			teampanel:MoveToFront()
		
		function teampanel.Paint()
			draw.RoundedBox(0, 0, 0, teampanel:GetWide(), teampanel:GetTall(), Color(212, 106, 106, 255))
			
			draw.DrawText(v[1], "SmallBloodImpact", teampanel:GetWide() / 2, 4, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER)
		end
		teamlist:AddItem(teampanel)
		
		local teampanelbutton = vgui.Create("DButton", teampanel)
			teampanelbutton:SetPos(0, 0)
			teampanelbutton:SetText("")
			teampanelbutton:SetSize(teampanel:GetWide(), teampanel:GetTall())
			teampanelbutton:MoveToFront()
			
		function teampanelbutton.Paint()
		end
		
		function teampanelbutton.DoClick()
			print("hi")
			extrainfolabel:Hide()
			extrainfolabel:Show()
		end
	end
end
concommand.Add("classselect", Class_Selection_Nikorev_Edition)

teamtable = {}
teamtable[1] = {"Hunter", Color(255, 0, 0), "models/weapons/v_357.mdl", "Go in sneaky beaky like."}
teamtable[2] = {"Bowman", Color(255, 0, 0), "models/weapons/v_357.mdl", "Arch down your foes."}
teamtable[3] = {"Prepper", Color(255, 0, 0), "models/weapons/v_357.mdl", "Almost as good as Dr. Pepper."}

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

