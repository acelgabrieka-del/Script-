local P,U,R,T,TS=game:GetService("Players"),game:GetService("UserInputService"),game:GetService("RunService"),game:GetService("TeleportService"),game:GetService("TweenService")
local lp,g=P.LocalPlayer,P.LocalPlayer:WaitForChild("PlayerGui")
if g:FindFirstChild("BSONTOP_GUI")then g.BSONTOP_GUI:Destroy()end

local PASS,KEY,BG_ID="123456",Enum.KeyCode.RightShift,""
local ok,fly,fp,spd,sv,nc,st=false,false,42,false,28,false,false
local sg=Instance.new("ScreenGui",g);sg.Name,sg.ResetOnSpawn,sg.ZIndexBehavior="BSONTOP_GUI",false,Enum.ZIndexBehavior.Sibling

local function tw(o,ti,pr)local a=TS:Create(o,ti,pr);a:Play();return a end
local function mk(c,p,par,r)local o=Instance.new(c);for k,v in pairs(p)do o[k]=v end;if r then Instance.new("UICorner",o).CornerRadius=UDim.new(0,r)end;o.Parent=par;return o end
local function drag(f,tap)
	local d,mv,s,p,inp
	f.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d,mv,s,p,inp=true,false,i.Position,f.Position,i end end)
	U.InputChanged:Connect(function(i)if d and i==inp then local dl=i.Position-s;if dl.Magnitude>5 then mv=true end;f.Position=UDim2.new(p.X.Scale,p.X.Offset+dl.X,p.Y.Scale,p.Y.Offset+dl.Y)end end)
	U.InputEnded:Connect(function(i)if d and i==inp then d,inp=false,nil;if not mv and tap then tap()end end end)
end

local fl=mk("TextButton",{Size=UDim2.new(0,126,0,34),Position=UDim2.new(0.5,-63,0,14),BackgroundColor3=Color3.fromRGB(24,24,30),Text="bsh on top",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=13,AutoButtonColor=false},sg,8)
Instance.new("UIStroke",fl).Color=Color3.fromRGB(0,145,255)

local lg=mk("Frame",{Size=UDim2.new(0,250,0,148),Position=UDim2.new(0.5,-125,0.42,-74),BackgroundColor3=Color3.fromRGB(22,22,28),Visible=false},sg,10)
mk("TextLabel",{Size=UDim2.new(1,0,0,34),BackgroundColor3=Color3.fromRGB(32,32,42),Text="BSONTOP - Login",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=14},lg,10)
local bx=mk("TextBox",{Size=UDim2.new(0.84,0,0,32),Position=UDim2.new(0.08,0,0.34,0),BackgroundColor3=Color3.fromRGB(38,38,48),PlaceholderText="Contraseña (123456)",Text="",TextColor3=Color3.new(1,1,1),Font=Enum.Font.Gotham,TextSize=13,ClearTextOnFocus=false},lg,6)
local sb=mk("TextButton",{Size=UDim2.new(0.84,0,0,32),Position=UDim2.new(0.08,0,0.62,0),BackgroundColor3=Color3.fromRGB(0,145,255),Text="Desbloquear",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=13},lg,6)
local er=mk("TextLabel",{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0.86,0),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(255,85,85),Font=Enum.Font.Gotham,TextSize=11},lg)

local mn=mk("Frame",{Size=UDim2.new(0,415,0,295),Position=UDim2.new(0.5,-207,0.42,-147),BackgroundColor3=Color3.fromRGB(16,18,22),ClipsDescendants=true,Visible=false},sg,10)
mk("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image=BG_ID~="" and("rbxassetid://"..BG_ID)or"",ImageTransparency=0.65,ScaleType=Enum.ScaleType.Crop,ZIndex=0},mn,10)
local tp=mk("Frame",{Size=UDim2.new(1,0,0,36),BackgroundColor3=Color3.fromRGB(26,28,36),BackgroundTransparency=0.15,ZIndex=2},mn,10)
mk("TextLabel",{Size=UDim2.new(1,-46,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text="BSONTOP",TextColor3=Color3.new(1,1,1),TextXAlignment=Enum.TextXAlignment.Left,Font=Enum.Font.GothamBold,TextSize=15,ZIndex=3},tp)
local xb=mk("TextButton",{Size=UDim2.new(0,26,0,26),Position=UDim2.new(1,-32,0.5,-13),BackgroundColor3=Color3.fromRGB(220,55,65),Text="X",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=12,ZIndex=3},tp,6)
drag(mn)

local function slideFrame(f,show)
	local targetY=show and 0.5 or 0.43
	if show then f.Position=UDim2.new(f.Position.X.Scale,f.Position.X.Offset,0.43,f.Position.Y.Offset);f.Visible=true end
	local a=tw(f,TweenInfo.new(0.24,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=UDim2.new(f.Position.X.Scale,f.Position.X.Offset,targetY,f.Position.Y.Offset)})
	if not show then a.Completed:Once(function()if not f.Visible then return end;f.Visible=false end)end
end

local tb=mk("ScrollingFrame",{Size=UDim2.new(0,112,1,-44),Position=UDim2.new(0,8,0,40),BackgroundColor3=Color3.fromRGB(24,26,32),BackgroundTransparency=0.25,ScrollBarThickness=3,CanvasSize=UDim2.new(0,0,0,460),ZIndex=2},mn,8)
Instance.new("UIListLayout",tb).Padding=UDim.new(0,4)
local ct=mk("ScrollingFrame",{Size=UDim2.new(1,-132,1,-44),Position=UDim2.new(0,126,0,40),BackgroundColor3=Color3.fromRGB(24,26,32),BackgroundTransparency=0.25,ScrollBarThickness=4,CanvasSize=UDim2.new(0,0,0,980),ZIndex=2},mn,8)
local sl=mk("TextLabel",{Size=UDim2.new(0,145,0,24),Position=UDim2.new(0,18,0,54),BackgroundColor3=Color3.fromRGB(20,20,26),BackgroundTransparency=0.25,TextColor3=Color3.fromRGB(120,255,170),Font=Enum.Font.GothamBold,TextSize=12,Text="FPS: -- | Ping: --",Visible=false},sg,6)
drag(sl)

local tabs,pgs,tbtns={"Combat","Visual","Cosmetics","Shop","Gun","Vehicle","Utility","Misc","Fishing","Server","Settings","Info"},{},{}
local function hdr(p,t)mk("TextLabel",{Size=UDim2.new(1,-8,0,22),BackgroundColor3=Color3.fromRGB(34,34,46),BackgroundTransparency=0.15,Text="  "..t,TextColor3=Color3.fromRGB(130,200,255),TextXAlignment=Enum.TextXAlignment.Left,Font=Enum.Font.GothamBold,TextSize=11,ZIndex=3},p,5)end
local function row(p,t,tg,df,cb,opts)
	local b=mk("TextButton",{Size=UDim2.new(1,-8,0,28),BackgroundColor3=df and Color3.fromRGB(35,165,90)or Color3.fromRGB(40,40,52),BackgroundTransparency=0.15,Text=tg and(t.." : "..(df and"ON"or"OFF"))or t,TextColor3=Color3.new(1,1,1),Font=Enum.Font.Gotham,TextSize=11,ZIndex=3},p,6)
	local s,dd=df or false,nil
	b.MouseButton1Click:Connect(function()
		if tg then s=not s;b.Text=t.." : "..(s and"ON"or"OFF");b.BackgroundColor3=s and Color3.fromRGB(35,165,90)or Color3.fromRGB(40,40,52)end
		if opts and #opts>0 then
			if dd then dd:Destroy();dd=nil;return end
			local h=math.min(#opts*24+8,144)
			dd=mk("ScrollingFrame",{Size=UDim2.new(0,185,0,0),Position=UDim2.new(0.52,0,0.22,0),BackgroundColor3=Color3.fromRGB(28,30,38),ScrollBarThickness=2,CanvasSize=UDim2.new(0,0,0,#opts*24+4),ZIndex=20},mn,8)
			Instance.new("UIStroke",dd).Color=Color3.fromRGB(0,145,255)
			local lay=Instance.new("UIListLayout",dd);lay.Padding=UDim.new(0,2)
			for _,op in ipairs(opts)do
				local ob=mk("TextButton",{Size=UDim2.new(1,-4,0,22),BackgroundColor3=Color3.fromRGB(42,44,56),Text=op,TextColor3=Color3.new(1,1,1),Font=Enum.Font.Gotham,TextSize=11,ZIndex=21},dd,5)
				ob.MouseButton1Click:Connect(function()b.Text=t.." ("..op..")";dd:Destroy();dd=nil;if cb then cb(op)end end)
			end
			tw(dd,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,185,0,h)})
		elseif cb then cb(s) end
	end)
end

for _,n in ipairs(tabs)do
	local p=mk("Frame",{Size=UDim2.new(1,0,0,940),BackgroundTransparency=1,Visible=(n=="Combat"),ZIndex=2},ct);Instance.new("UIListLayout",p).Padding=UDim.new(0,4);pgs[n]=p
	local btn=mk("TextButton",{Size=UDim2.new(1,0,0,30),BackgroundColor3=(n=="Combat")and Color3.fromRGB(0,145,255)or Color3.fromRGB(38,38,48),BackgroundTransparency=0.15,Text=n,TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=12,ZIndex=3},tb,6);tbtns[n]=btn
	btn.MouseButton1Click:Connect(function()
		for k,pg in pairs(pgs)do
			tbtns[k].BackgroundColor3=(k==n)and Color3.fromRGB(0,145,255)or Color3.fromRGB(38,38,48)
			if k==n then pg.Position=UDim2.new(0,16,0,0);pg.Visible=true;tw(pg,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new(0,0,0,0)})
			else pg.Visible=false end
		end
	end)
end

local data={
	Combat={{"Fov"},{{"Enable Fov",1},{"Fov Size (212)",0,nil,{"120","180","212","300"}}},{"Silent Aim"},{{"Silent Aim",1},{"Aim Whitelist"},{"Double Shoot Bullet",1},{"Allow Shootable Without Scope",1},{"Auto Fight Back",1},{"Auto Fight Back Fire Rate x2",1}},{"Auto Heal"},{{"Auto Heal",1},{"Heal Threshold (Locked)"},{"Heal Interval (s) (Locked)"}},{"Melee Hit Aura"},{{"Melee Hit Aura",1},{"Hit Range (studs, normal 5)"},{"Hit Interval (s, 0 = animation)"}}},
	Visual={{"ESP Presets"},{{"Preset",0,nil,{"Custom","Minimal","Compact","Competitive","Loot Hunter","Full"}}},{"Visual"},{{"View Inventory",1},{"View Dropped Item",1},{"Box",1},{"Name",1},{"Avatar Head Icon",1},{"Health",1},{"Skeleton Bone",1},{"Etc Info",1}},{"ESP Style"},{{"ESP Layout",0,nil,{"Normal","Compact","Auto"}}},{"Stack Overlapping Players",1},{"Esp Crowd Limit (Power Saving)"},{"Box Style (Full)"},{"Health Bar",0,nil,{"Bottom","Left"}}},{"HP Text",1},{"Name Display",0,nil,{"DisplayName","Username","Both"}}},{"Name Background",1},{"Gradient Name",1}},{"ESP Colors"},{{"Color Theme (Custom)"},{"Locked Target (Visible) / (Blocked)"},{"Threat (Shot You) / Whitelisted Player / Aiming At You / Behind Wall / Default"}}},
	Cosmetics={{"Gun Cosmetics"},{{"Desired Wrap Gun",0,nil,{"Night","Sunset","Candy Flame","Carbon","Galaxy","Y2K","Toxic Drip","Monster Mash","Leopard Print","Witching Hour","Sci-Fi Grey Panel","Tiger Stripe","Red Wave","Volcanic","Pure White","Cherry Blossom"}}},{"Desired Scope",0,nil,{"10x Scope","Red Dot Sight","Digital Sight","Holographic Sight","Reflex Sight","Hybrid Scope","Thermal Scope","ACOG"}}},{"Desired Muzzle",0,nil,{"Heavy Barrel","Silencer","Short Barrel","Flash Hider","Boost Barrel","Compensator","Muzzle Brake"}}},{"Desired Underbarrel",0,nil,{"Red Laser","Double Laser","Green Laser","Flashlight"}}},{"Desired Grip",0,nil,{"Fold Grip"}},{"Apply Gun Cosmetics",1}},{"Car Cosmetics"},{{"Body Color"},{"Desired Wrap Car",0,nil,{"Purple Liquid","Nature","Night","Red Wave","Galaxy"}}},{"Desired Rims",0,nil,{"BRacing 25"}},{"Desired Glow",0,nil,{"Green Glow"}},{"Desired Spoiler",0,nil,{"Sport PlusX3","Sport PlusX6","Aero Max9","Race X4000"}},{"Apply Car Cosmetics (Locked)"}}},
	Shop={{"Ammo Crate / Bike Crate"},{{"Ammo Crate - Select Crate / Buy Crate"},{"Bike Crate - Select Crate / Buy Crate"}},{"Car Crate & Garage Crate"},{{"Car Crate",0,nil,{"Basic","Elite","Omega","Rare"}}},{"Garage Crate",0,nil,{"Body Wraps","Halloween Crate","Spoilers I","Spoilers III","Headlights","Rims I","Rims II"}}},{"Gunsmith, Personal Weapon & Weapon Crate"},{{"Gunsmith Crate",0,nil,{"Wraps 1","Wraps 2","Grips and Mags 1","Sights 1","Underbarrel and Barrel 1"}}},{"Personal Weapon Crate",0,nil,{"Basic","Superior","Advanced","LegendaryMansion","Halloween"}}},{"Weapon Crate",0,nil,{"Everything","Legendary","Superior","Advanced","Halloween","Basic","Elite"}}}},
	Gun={{"Gun Mod"},{{"Current Gun (None)"},{"Accuracy (1)"},{"Range (10000)"},{"Fire Rate (2000)"},{"Reload Time (0.01)"},{"Modify Gun"}}},
	Vehicle={{"Vehicle"},{{"Speed (Fly speed when Auto Speed is off)"},{"Fly height"},{"Car Burst Aura",1},{"Car Noclip",1},{"Auto Lock Vehicle",1},{"Auto Repair Vehicle (below 50% HP)",1},{"Pull Owned Car"},{"Select Which Car (Locked) / Change Car (Locked)"}}},
	Utility={{"Utility"},{{"Y Offset"},{"Ajustar hacia abajo",1}}},
	Fishing={{"Auto Fishing"},{{"Auto solve Fishing Minigame",1},{"Auto Cast",1},{"Cart Distance (studs)"},{"Auto Bait",1}},{"Fish Filter"},{{"Fish Filter",1},{"Minimum Rarity To Keep",0,nil,{"Common","Uncommon","Rare","Legendary","Omega"}}},{"Fishing Stats"},{{"Summary / Rarity Rates / Per Fish"},{"Reset Stats"}}},
	Server={{"Server Finder"},{{"Server Filter",0,nil,{"Lowest Ping","Lowest People","Highest People"}}},{"Max Shown Server"},{"Find Server"}},{"Quick Actions"},{{"Rejoin Current Server",0,function()T:TeleportToPlaceInstance(game.PlaceId,game.JobId,lp)end},{"Copy This Server ID",0,function()if setclipboard then setclipboard(tostring(game.JobId))end end}},{"Specific Server"},{{"Server ID / Paste Server ID"},{"Join Specific Server"}}},
	Settings={{"Settings"},{{"Silent Aim Preset",0,nil,{"Balance Mode","Body Only Mode","Rage Mode"}}},{"Snap Down Keybind"},{"UI Keybind (LeftControl)"},{"UI Theme",0,nil,{"Dark","Amber","CottonCandy","Crimson","Emerald","Indigo","Light","Mellowsi","Midnight"}}},{"Show FPS / Ping",1,function(v)st=v;sl.Visible=v end}},{"Config"},{{"Auto Save",1},{"Tecla: "..KEY.Name}}},
	Info={{"Info"},{{"BSONTOP • Blockspin GUI"}}}
}

for tabName,blocks in pairs(data)do
	for i=1,#blocks,2 do
		hdr(pgs[tabName],blocks[i][1])
		for _,item in ipairs(blocks[i+1])do row(pgs[tabName],item[1],item[2]==1,false,item[3],item[4])end
	end
end

hdr(pgs.Misc,"Fly Jump & Player")
row(pgs.Misc,"Fly Jump",true,false,function(v)fly=v end)
local pr=mk("Frame",{Size=UDim2.new(1,-8,0,30),BackgroundColor3=Color3.fromRGB(34,34,44),BackgroundTransparency=0.15,ZIndex=3},pgs.Misc,6)
local mb=mk("TextButton",{Size=UDim2.new(0,32,0,22),Position=UDim2.new(0,4,0.5,-11),BackgroundColor3=Color3.fromRGB(52,52,68),Text="-",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=14,ZIndex=4},pr,5)
local pl=mk("TextLabel",{Size=UDim2.new(1,-76,1,0),Position=UDim2.new(0,38,0,0),BackgroundTransparency=1,Text="FlyJump Fuerza: "..fp,TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=11,ZIndex=4},pr)
local ab=mk("TextButton",{Size=UDim2.new(0,32,0,22),Position=UDim2.new(1,-36,0.5,-11),BackgroundColor3=Color3.fromRGB(52,52,68),Text="+",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=14,ZIndex=4},pr,5)
mb.MouseButton1Click:Connect(function()fp=math.max(15,fp-5);pl.Text="FlyJump Fuerza: "..fp end)
ab.MouseButton1Click:Connect(function()fp=math.min(120,fp+5);pl.Text="FlyJump Fuerza: "..fp end)
row(pgs.Misc,"Walk Speed ("..sv..")",true,false,function(v)spd=v;local h=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid");if h and not v then h.WalkSpeed=16 end end)
row(pgs.Misc,"Noclip Character",true,false,function(v)nc=v end)
for _,o in ipairs({"Invisible (Locked)","Head Protection","Hide Head Underground (You can't get headshot)","Filter Pickup By Rarity","Minimum Pickup Rarity (Common / Uncommon / Rare...)","Always Pickup Items","Hide Other Players' Names","Instant Open Case","Instant Prompt","change weather","Claim All Quests","Take all missions rewards"})do row(pgs.Misc,o,not o:find("Locked")and not o:find("Rarity")and not o:find("Quests")and not o:find("rewards"),false)end

local function chk()
	if bx.Text==PASS then ok=true;lg.Visible=false;slideFrame(mn,true)
	else er.Text="Contraseña incorrecta";bx.Text="" end
end
sb.MouseButton1Click:Connect(chk);bx.FocusLost:Connect(function(e)if e then chk()end end)
drag(fl,function()
	if not ok then slideFrame(lg,not lg.Visible)
	else slideFrame(mn,not mn.Visible) end
end)
xb.MouseButton1Click:Connect(function()slideFrame(mn,false)end)
U.InputBegan:Connect(function(i,gp)if not gp and i.KeyCode==KEY and ok then slideFrame(mn,not mn.Visible)end end)

R.Heartbeat:Connect(function(dt)
	local c=lp.Character;local h=c and c:FindFirstChildOfClass("Humanoid");local r=c and c:FindFirstChild("HumanoidRootPart")
	if fly and h and r and h.Jump then r.AssemblyLinearVelocity=Vector3.new(r.AssemblyLinearVelocity.X,fp,r.AssemblyLinearVelocity.Z)end
	if spd and h then h.WalkSpeed=sv end
	if nc and c then for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=false end end end
	if st then sl.Text=string.format("FPS: %d | Ping: %d ms",math.floor(1/math.max(dt,0.001)),math.floor(lp:GetNetworkPing()*2000))end
end)
