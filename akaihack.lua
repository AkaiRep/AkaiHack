notification.AddLegacy( "Author discord fo questions: akaipureya#1488", NOTIFY_HINT, 10 )
notification.AddLegacy( "AkaiHack by expl01t ready!", NOTIFY_HINT, 10 )
surface.PlaySound( "buttons/button19.wav" )

--DEFAULT SETTINGS//СТАНДАРТНЫЕ НАСТРОЙКИ
renderdistt = 1500
AimFOV = 100
namecolor = Color(0,255,0,255)
othercolor = Color(255,255,0,255)
bonescolor = Color(0,255,0,255)
propstrans = Color(255,255,255,255)

enablebhop = true
enablebones = true
enableprinters = true
enableinfo = true
enableWeapon = false
enableAim = true
enableFovDrawing = true
--DEFAULT SETTINGS//СТАНДАРТНЫЕ НАСТРОЙКИ


Fonta = "HudHintTextLarge"
surface.CreateFont( "Fontte", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )


--menu

local frame = vgui.Create("DFrame")
frame:SetSize(295,400)
frame:Center()
frame:SetVisible(false)
frame:SetTitle("AkaiHack")
frame:ShowCloseButton(false)

local Distanceslider = vgui.Create( "DNumSlider", frame )
Distanceslider:SetPos( 10, 0 )				-- Set the position
Distanceslider:SetSize( 300, 100 )			-- Set the size
Distanceslider:SetText( "Render Distance" )	-- Set the text above the slider
Distanceslider:SetMin( 100 )				 	-- Set the minimum number you can slide to
Distanceslider:SetMax( 2500 )				-- Set the maximum number you can slide to
Distanceslider:SetDecimals( 0 )				-- Decimal places - zero for whole number
Distanceslider:SetDefaultValue( renderdistt )
Distanceslider:SetValue( renderdistt )
frame:MakePopup()
Distanceslider.OnValueChanged = function( panel, value )
renderdistt=value
end  

local AimFovSlider = vgui.Create( "DNumSlider", frame )
AimFovSlider:SetPos( 10, 260 )				-- Set the position
AimFovSlider:SetSize( 300, 100 )			-- Set the size
AimFovSlider:SetText( "Aim FOV Radius" )	-- Set the text above the slider
AimFovSlider:SetMin( 1 )				 	-- Set the minimum number you can slide to
AimFovSlider:SetMax( 300 )				-- Set the maximum number you can slide to
AimFovSlider:SetDecimals( 0 )				-- Decimal places - zero for whole number
AimFovSlider:SetDefaultValue( AimFOV )
AimFovSlider:SetValue( AimFOV )
frame:MakePopup()
AimFovSlider.OnValueChanged = function( panel, value )
AimFOV=value
end  

local PropsTransparentSlider = vgui.Create( "DNumSlider", frame )
PropsTransparentSlider:SetPos( 10, 285 )				-- Set the position
PropsTransparentSlider:SetSize( 300, 100 )			-- Set the size
PropsTransparentSlider:SetText( "Props Transparent" )	-- Set the text above the slider
PropsTransparentSlider:SetMin( 180 )				 	-- Set the minimum number you can slide to
PropsTransparentSlider:SetMax( 255 )				-- Set the maximum number you can slide to
PropsTransparentSlider:SetDecimals( 0 )				-- Decimal places - zero for whole number
PropsTransparentSlider:SetDefaultValue( propstrans.a )
PropsTransparentSlider:SetValue( propstrans.a )
frame:MakePopup()
PropsTransparentSlider.OnValueChanged = function( panel, value )
propstrans=Color(255,255,255,value)
end

local Bhopcheck = vgui.Create("DCheckBox",frame)
local bhoplabel = vgui.Create("DLabel",frame)
bhoplabel:SetText( "Bunny Hop" )
bhoplabel:SetPos( 10, 65)
Bhopcheck:SetPos( 132, 65 )	
Bhopcheck:SetChecked(enablebhop)

local BoneDraw = vgui.Create("DCheckBox",frame)
local BoneLabel = vgui.Create("DLabel",frame)
BoneLabel:SetText( "Draw Bones" )
BoneLabel:SetPos( 10, 90)
BoneDraw:SetPos( 132, 90 )	
BoneDraw:SetChecked(enablebones)

local InfoDraw = vgui.Create("DCheckBox",frame)
local InfoLabel = vgui.Create("DLabel",frame)
InfoLabel:SetText( "Draw Info" )
InfoLabel:SetPos( 10, 115)
InfoDraw:SetPos( 132, 115 )	
InfoDraw:SetChecked(enableinfo)

local DrawPrinters = vgui.Create("DCheckBox",frame)
local DrawPrintersLabel = vgui.Create("DLabel",frame)
DrawPrintersLabel:SetText( "Printers" )
DrawPrintersLabel:SetPos( 10, 200 )
DrawPrinters:SetPos( 132, 200 )	
DrawPrinters:SetChecked(enableprinters)

local BonesMixer = vgui.Create("DRGBPicker",frame)
BonesMixer:SetPos(132 , 140)
BonesMixer:SetSize(30, 50)
BonesMixer:SetRGB(Color(255,255,0))
local BonesMixerLabel = vgui.Create("DLabel",frame)
BonesMixerLabel:SetPos(10,140)
BonesMixerLabel:SetText("Bones Color")
function BonesMixer:OnChange(col)
	bonescolor=col
end

local DrawWeapon = vgui.Create("DCheckBox",frame)
local DrawWeaponLabel = vgui.Create("DLabel",frame)
DrawWeaponLabel:SetText( "Weapons" )
DrawWeaponLabel:SetPos( 10, 225 )
DrawWeapon:SetPos( 132, 225 )	
DrawWeapon:SetChecked(enableWeapon)

local DrawAimFOV = vgui.Create("DCheckBox",frame)
local DrawAimFOVLabel = vgui.Create("DLabel",frame)
DrawAimFOVLabel:SetText( "Draw AFOV" )
DrawAimFOVLabel:SetPos( 10, 250 )
DrawAimFOV:SetPos( 132, 250 )	
DrawAimFOV:SetChecked(enableFovDrawing)

local EnableAimc = vgui.Create("DCheckBox",frame)
local EnableAimLabel = vgui.Create("DLabel",frame)
EnableAimLabel:SetText( "Enable AIM" )
EnableAimLabel:SetPos( 10, 275 )
EnableAimc:SetPos( 132, 275 )	
EnableAimc:SetChecked(enableAim)




--menu

function frame_open()
	frame:SetVisible(true)
end
 
function frame_close()
	frame:SetVisible(false)
end

concommand.Add("-our_concommand",frame_close)
concommand.Add("+our_concommand",frame_open)

hook.Add( "Think", "Another unique name", function()
	
end )

hook.Add( "HUDPaint", "HelloThere", function() 

	for k,v in pairs ( player.GetAll()) do
		
		enablebhop = Bhopcheck:GetChecked()
		enablebones = BoneDraw:GetChecked()
		enableinfo = InfoDraw:GetChecked()
		enableprinters = DrawPrinters:GetChecked()
		enableWeapon = DrawWeapon:GetChecked()
		enableAim = EnableAimc:GetChecked()
		enableFovDrawing = DrawAimFOV:GetChecked()
		

		if (enablebhop)then
			if input.IsKeyDown(KEY_SPACE) then
	 			if LocalPlayer():IsOnGround() then
	 				RunConsoleCommand("+jump")
	 				timer.Create("Bhop", 0, 0.01, function()
	 		 		RunConsoleCommand("-jump")
	 				end)
	 			end
	 		end
		end
	 


		a=0
		if (input.IsKeyDown(KEY_HOME)) then
			hook.Remove( "HUDPaint", "HelloThere" )
			break
		end
		if (enableFovDrawing) then
			surface.DrawCircle( 960,540,AimFOV, Color( 0, 255, 0 ) )
		end

		if (enableAim) then
			local aocpl = LocalPlayer():GetPos()
			local aanpl = v:GetPos()
			distanai = math.Distance(aanpl.x, aanpl.y, aocpl.x, aocpl.y )
			if(distanai<renderdistt) then
			local targethead = v:LookupBone("ValveBiped.Bip01_Head1")
			local HeadPosOnScreen = v:GetBonePosition(targethead):ToScreen()
			crosshairPos = {}
			crosshairPos.x = 960
			crosshairPos.y = 540
			local DistanceToHead = math.Distance(crosshairPos.x,crosshairPos.y,HeadPosOnScreen.x,HeadPosOnScreen.y)
			
			if (DistanceToHead<AimFOV) then
				
				if(input.IsKeyDown(KEY_LALT)) then
					if(v:Alive()) then 
						if(v:IsPlayer()) then
						if(v:GetName()!=LocalPlayer():GetName()) then
							local ply = LocalPlayer()
							local targetheadpos,targetheadang = v:GetBonePosition(targethead) -- Get the position/angle of the head.
							ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle())
						end
						end
					end
				else
					
				end
			
			end	
			end
		end
		local locpl = LocalPlayer():GetPos()
		local anpl = v:GetPos()
		distan = math.Distance(anpl.x, anpl.y, locpl.x, locpl.y )
		if (v:GetName()==LocalPlayer():GetName()) then
			--print("")
		elseif (v:Alive() ) then
				if(distan<renderdistt) then
				--surface.SetDrawColor( 255, 255, 255, 128 )

				--must must delete must delete must must delete must delete
				local positionstep = ( v:GetPos() + Vector( 0,0,0 ) ):ToScreen()
				local positioneye = ( v:EyePos() + Vector(0,0,0)):ToScreen()
				pheight = (positionstep.y-positioneye.y)
				pwidth = pheight /4

				--debug
				--draw.DrawText("step " .. positionstep.y,Fontt, positionstep.x, positionstep.y, Color(0,255,0,255),1)
			--draw.DrawText("eye" .. positioneye.y,Fontt, positioneye.x, positioneye.y, Color(0,255,0,255),1)

			
			while a<40 do
				a=a+1
				--local bonepos = (v:GetBonePosition( a )):ToScreen(); draw.DrawText(a,Fontt, bonepos.x, bonepos.y, Color(0,255,0,255),1)
			end
			
			

			--bonedrawing
			if (enablebones) then
				surface.SetDrawColor(bonescolor)
				local abone = (v:GetBonePosition( 6 )):ToScreen();local bbone = (v:GetBonePosition( 5 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 5 )):ToScreen();local bbone = (v:GetBonePosition( 9 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 5 )):ToScreen();local bbone = (v:GetBonePosition( 14 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 9 )):ToScreen();local bbone = (v:GetBonePosition( 10 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 10 )):ToScreen();local bbone = (v:GetBonePosition( 11 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 14 )):ToScreen();local bbone = (v:GetBonePosition( 15 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 15 )):ToScreen();local bbone = (v:GetBonePosition( 16 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 5 )):ToScreen();local bbone = (v:GetBonePosition( 1 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 1 )):ToScreen();local bbone = (v:GetBonePosition( 18 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 1 )):ToScreen();local bbone = (v:GetBonePosition( 22 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 18 )):ToScreen();local bbone = (v:GetBonePosition( 19 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 19 )):ToScreen();local bbone = (v:GetBonePosition( 20 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 22 )):ToScreen();local bbone = (v:GetBonePosition( 23 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
				local abone = (v:GetBonePosition( 23 )):ToScreen();local bbone = (v:GetBonePosition( 24 )):ToScreen();surface.DrawLine(abone.x,abone.y,bbone.x,bbone.y)
			end
			--bonedrawing

			--infodrawing
			if (enableWeapon) then
				local weap = v:GetActiveWeapon():GetClass()
				local NamePosition = ( v:GetPos() + Vector( 0,0,120 ) ):ToScreen()
				local WeaponPos = {}
				WeaponPos.y=NamePosition.y+35
				WeaponPos.x=NamePosition.x
				draw.DrawText(weap,"Fontte", WeaponPos.x, WeaponPos.y, Color(255,100,0,255),1)
			end
			if (enableinfo) then
				local NamePosition = ( v:GetPos() + Vector( 0,0,120 ) ):ToScreen()
				


				local HpPosition = {}
				HpPosition.y=NamePosition.y+20
				HpPosition.x=NamePosition.x
				local WeaponPos = {}
				WeaponPos.y=NamePosition.y+40
				WeaponPos.x=NamePosition.x
				local TargetPos = {}
				TargetPos.x=NamePosition.x
				TargetPos.y=NamePosition.y-20

				local Name = v:GetName()
				local Hp = v:Health()
				local Arm = v:Armor()
				local SteamId = v:SteamID()

				--print(Weap:GetClass())	
				if(v:IsPlayer()) then
					--local Proff = v:getJobTable()
					if(Hp>0) then

					draw.DrawText(Name .. " [" .. v:GetUserGroup() .. "]","Fontte", NamePosition.x, NamePosition.y, Color(0,255,0,255),1)
					--.. Arm .. Weap:GetClass()
					draw.DrawText(Hp .. "HP  " ..Arm.. "AR  " ,"Fontte", HpPosition.x, HpPosition.y, Color(255,255,0,255),1)
				else
					--surface.PlaySound( "buttons/button18.wav" )
					draw.DrawText("DEAD","Fontte", HpPosition.x, HpPosition.y, Color(255,0,0),1)
				end
				end
			end
			--infodrawing

		
			end
		end
	end

	for k,v in pairs ( ents:GetAll()) do
		local locpl = LocalPlayer():GetPos()
		local anpl = v:GetPos()
		distan = math.Distance(anpl.x, anpl.y, locpl.x, locpl.y )
		if (distan<renderdistt) then
			if (v:GetClass()=="prop_physics") then 
				v:SetColor(Color(v:GetColor().r,v:GetColor().g,v:GetColor().b,propstrans.a))
				v:SetRenderMode( RENDERMODE_TRANSCOLOR )
			end
			if (v:GetClass()=="derma_printer") then
				if (enableprinters) then
				local entpos = v:GetPos():ToScreen()
				draw.DrawText("Printer","Fontte", entpos.x, entpos.y, Color(100,100,255), 1)
				end
			end
		end

	end
end )