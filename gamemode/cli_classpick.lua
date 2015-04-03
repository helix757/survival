
teamtable = {}
teamtable[1] = {Name = "Hunter", Clr = Color(255, 0, 0), Mdl = "models/player/alyx.mdl", Desc = "Go in sneaky beaky like.", Weps = {"fgt", "fgt2", "isucktittiesforbreakfast", "a", "ab", "tits"}}
teamtable[2] = {Name = "Bowman", Clr = Color(255, 0, 0), Mdl = "models/player/alyx.mdl", Desc = "Arch down your foes.", Weps = {"Niiger", "Niggasynthesis" }}
teamtable[3] = {Name = "Prepper", Clr = Color(255, 0, 0),Mdl = "models/weapons/v_357.mdl", Desc = "Almost as good as Dr. Pepper.", Weps = {"Prepper Niiger", "Nigga moment"}}


function Class_Selection_Nikorev_Edition()
local desc = teamtable[1].Desc
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
			draw.DrawText(desc, "SuperSmallBloodImpact", basepanel:GetWide() - 180, basepanel:GetTall() - 225, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER)
		end
	end
	
local modelpreviewpanel = vgui.Create("DPanel", basepanel)
	modelpreviewpanel:SetPos( basepanel:GetWide() - 280, 60 )
	modelpreviewpanel:SetSize( 200, 300 )
	// THE MODEL IS SET ON THE BUTTON BELOW
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
modelpreview:SetModel( teamtable[1].Mdl )
modelpreview:SetCamPos(Vector( 40, 0, 55))
function modelpreview:LayoutEntity( Entity ) return end


local wepslist = vgui.Create("DPanelList", classwepsandstats)
	wepslist:SetPos( 10, 40 )
	wepslist:SetSize( classwepsandstats:GetWide() - 10, classwepsandstats:GetTall() - 45)
	wepslist:SetSpacing(5)
	wepslist:SetPadding(5)
	wepslist:EnableHorizontal( false ) 
	wepslist:EnableVerticalScrollbar( true )
	wepslist:MoveToFront()
	
	for k,v in pairs(teamtable[1].Weps) do
		wepnamess = vgui.Create("DLabel", wepslist)
		wepnamess:SetPos( wepslist:GetWide() / 2, 3 )
		wepnamess:SetText( v )
		wepnamess:SetColor( Color(0, 0, 0, 255) )
		wepnamess:SetFont( "SuperSmallBloodImpact" )
		wepnamess:SetContentAlignment( 5 )
	
		wepslist:AddItem(wepnamess)
	end

	
local teamlist = vgui.Create("DPanelList", basepanel)
	teamlist:SetPos( 5, 60 )
	teamlist:SetSize( basepanel:GetWide() / 2 - 20, basepanel:GetTall() - 65)
	teamlist:SetSpacing(5)
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
			
			draw.DrawText(v.Name, "SmallBloodImpact", teampanel:GetWide() / 2, 4, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER)
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
			modelpreview:SetModel( teamtable[k].Mdl )
			desc = teamtable[k].Desc
			wepslist:Clear()
			for k,v in pairs(teamtable[k].Weps) do
				wepnamess = vgui.Create("DLabel", wepslist)
				wepnamess:SetPos( wepslist:GetWide() / 2, 3 )
				wepnamess:SetText( v )
				wepnamess:SetColor( Color(0, 0, 0, 255) )
				wepnamess:SetFont( "SuperSmallBloodImpact" )
				wepnamess:SetContentAlignment( 5 )
	
				wepslist:AddItem(wepnamess)
			end
		end
	end
	
end
concommand.Add("classselect", Class_Selection_Nikorev_Edition)




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
