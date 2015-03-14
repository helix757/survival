

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
		
		draw.DrawText("Select a Class", "BiggerBloodImpact", basepanel:GetWide() / 2, 4, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER)
		
		for k,v in pairs(teamtable) do
			draw.DrawText("Class Info Here somehow", "SuperSmallBloodImpact", basepanel:GetWide() - 180, basepanel:GetTall() - 225, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		end
	end
	
local modelpreviewpanel = vgui.Create("DPanel", basepanel)
	modelpreviewpanel:SetPos( basepanel:GetWide() - 280, 60 )
	modelpreviewpanel:SetSize( 200, 300 )
		
	function modelpreviewpanel.Paint()
		draw.RoundedBox(0, 0, 0, modelpreviewpanel:GetWide(), modelpreviewpanel:GetTall(), Color(212, 106, 106, 255))
	end
		
local classwepsandstats = vgui.Create( "DPanel", basepanel )
	classwepsandstats:SetPos( basepanel:GetWide() - 325, basepanel:GetTall() - 175 )
	classwepsandstats:SetSize(300, 150)
	
	function classwepsandstats.Paint()
		draw.RoundedBox(0, 0, 0, classwepsandstats:GetWide(), classwepsandstats:GetTall(), Color(212, 106, 106, 255))
		
		draw.DrawText("Weapons", "SmallBloodImpact", classwepsandstats:GetWide() / 2, 5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
	end
	
		
local modelpreview = vgui.Create( "DModelPanel", modelpreviewpanel ) -- Make it retrieve playermodel for a team
modelpreview:SetPos(5, 5)
modelpreview:SetSize(modelpreviewpanel:GetWide() - 10, modelpreviewpanel:GetTall() - 10)
modelpreview:SetModel( "models/player/alyx.mdl" )
modelpreview:SetCamPos(Vector( 40, 0, 55))
function modelpreview:LayoutEntity( Entity ) return end

	
local teamlist = vgui.Create("DPanelList", basepanel)
	teamlist:SetPos( 5, 60 )
	teamlist:SetSize( basepanel:GetWide() / 2 - 20, basepanel:GetTall() - 65)
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
			print("The team you chose was "..v[1])
			print("Thats all for now...")
		end
	end
end
concommand.Add("classselect", Class_Selection_Nikorev_Edition)

teamtable = {}
teamtable[1] = {"Hunter", Color(255, 0, 0), "models/weapons/v_357.mdl", "Go in sneaky beaky like."}
teamtable[2] = {"Bowman", Color(255, 0, 0), "models/weapons/v_357.mdl", "Arch down your foes."}
teamtable[3] = {"Prepper", Color(255, 0, 0), "models/weapons/v_357.mdl", "Almost as good as Dr. Pepper."}


surface.CreateFont("BiggerBloodImpact", {
	font = "Bloody Impact", 
	size = 45, 
	antialias = true,
})

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

surface.CreateFont("SuperSmallBloodImpact", {
	font = "Bloody Impact", 
	size = 20, 
	antialias = true,
})
