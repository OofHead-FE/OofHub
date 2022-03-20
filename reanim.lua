if _G.mode == "Simple" then
    local plr = game.Players.LocalPlayer
    local char = game.Players.LocalPlayer.Character
    local srv = game:GetService('RunService')
    local ct = {}
    local te = table.insert

    HumanDied=false

    for i,v in next, char:GetDescendants() do 
    if v:IsA('BasePart') then
    te(ct,srv.Heartbeat:Connect(function()
    v.Velocity = Vector3.new(-35,0,0)
    sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",10000)
    end))
    end
    end

        
    _G.Animated = true
    _G.Netless = Vector3.new(-35,0,0)
    _G.Fling = Vector3.new(9e9,9e9,9e9)





    wait(.1)
    local function Align(P0,P1,Position,Rotate)
    local AlignPosition = Instance.new("AlignPosition", P0)
    local AlignOrientation = Instance.new("AlignOrientation", P0)
    local Attachment1 = Instance.new("Attachment", P0)
    local Attachment2 = Instance.new("Attachment", P1)
    -- Main Attach Thingy:
    AlignPosition.Attachment0,AlignPosition.Attachment1 = Attachment1,Attachment2 -- Shortcut
    AlignOrientation.Attachment0,AlignOrientation.Attachment1 = Attachment1,Attachment2 -- Shortcut
    -- Properties:
    AlignPosition.RigidityEnabled = true
    AlignOrientation.RigidityEnabled = true
    -- Rotate/Position
    Attachment1.Position = Position or Vector3.new(0,0,0)
    Attachment1.Rotation = Rotate or Vector3.new(0,0,0)
    end

    -- Main (R6)

    local Character = workspace[game.Players.LocalPlayer.Name]
    Character.Animate.Disabled = false
    local Humanoid = Character.Humanoid
    Humanoid:ChangeState("Physics")



    Character.Archivable = true
    Humanoid:ChangeState("Physics")
    local Reanim = Character:Clone()
    Reanim.Parent = Character
    Reanim.Name = "OofHub"

    Character.Head.Transparency = 0
    Reanim.Head.Transparency = 1
    Character.Head.face.Transparency = 0
    Reanim.Head.face.Transparency = 1
    for i,v in pairs(Reanim:GetChildren()) do 
        if v:IsA("BasePart") then v.Transparency = 1
            elseif v:IsA("Accessory") then v.Handle.Transparency = 1
        end
    end
    for i,v in pairs(Character:GetChildren()) do 
        if v:IsA("Accessory") then v.Handle.Transparency = 0
            elseif v:IsA("Accessory") then v.Handle.Transparency = 0
        end
    end
    Reanim.Head.Transparency = 1
    --Noclip
    game:GetService("RunService").Stepped:Connect(function()
        Humanoid.Died:Connect(function()
            return 
        end)
        for i,v in pairs(Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
    --Aligning
    local Name2 = Character:WaitForChild("Pal Hair")

    Character["Right Arm"].Transparency = 0


    Character.Torso['Right Shoulder']:Destroy()
    Character.Torso['Left Shoulder']:Destroy()
    Character.Torso['Right Hip']:Destroy()
    Character.Torso['Left Hip']:Destroy()
    Character.HumanoidRootPart:Destroy()
    function att(P0)
        Align(Character[P0],Reanim[P0])
    end
    att("Right Arm")
    att("Left Arm")
    att("Right Leg")
    att("Left Leg")
    att("Torso")






    Reanim['Left Arm'].Velocity = _G.Netless
    Reanim['Right Arm'].Velocity = _G.Netless
    Reanim['Right Leg'].Velocity = _G.Netless
    Reanim['Left Leg'].Velocity = _G.Netless
    Reanim['Head'].Velocity = _G.Netless
    Character['Left Arm'].Velocity = _G.Netless
    Character['Right Arm'].Velocity = _G.Netless
    Character['Right Leg'].Velocity = _G.Netless
    Character['Left Leg'].Velocity = _G.Netless
    Character['Head'].Velocity = _G.Netless
    Character.Torso.Velocity = _G.Netless
    function Pos(part, parent, p)
        Instance.new("Attachment",part)
        Instance.new("AlignPosition",part)
        Instance.new("Attachment",parent)
        part.Attachment.Name = part.Name
        parent.Attachment.Name = part.Name
        part.AlignPosition.Attachment0 = part[part.Name]
        part.AlignPosition.Attachment1 = parent[part.Name]
        parent[part.Name].Position = p or Vector3.new()
        part.AlignPosition.MaxForce = 999999999*10
        part.AlignPosition.MaxVelocity = math.huge
        part.AlignPosition.ReactionForceEnabled = false
        part.AlignPosition.Responsiveness = math.huge
        part.AlignPosition.RigidityEnabled = false
    end

 


    for i,part in next, Character:GetDescendants() do
        if part:IsA('BasePart') then
            te(ct,srv.RenderStepped:Connect(function()
                part.CanCollide=false
            end))
        end
    end

    for i,part in next, Character:GetDescendants() do
        if part:IsA('BasePart') then
            te(ct,srv.Stepped:Connect(function()
                part.CanCollide=false
            end))
        end
    end

    function flinger(p)
        f=Instance.new('BodyAngularVelocity',p)
        f.AngularVelocity = Vector3.new(9e9*10,9e9*10,9e9*10)
        f.MaxTorque=Vector3.new(9e9*10,9e9*10,9e9*10)
    end

    function fix(p)
        fixer=Instance.new('BodyPosition',p)
        fixer.Name='BP'
        fixer.P=9e9
        fixer.D=9e9
        fixer.MaxForce=Vector3.new(99999,99999,99999)
    end



    --Death Trigger
    game.Players.LocalPlayer.Character = Reanim
    game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
        Character.Humanoid:ChangeState(15)
        game.Players.LocalPlayer.Character = workspace[game.Players.LocalPlayer.Name]
        _G.Animated = false
        Reanim:Destroy()
    end)
    workspace:FindFirstChildOfClass("Camera").CameraSubject = Reanim.Humanoid
elseif _G.mode == "Arm Fling" then
    local plr = game.Players.LocalPlayer
    local char = game.Players.LocalPlayer.Character
    local srv = game:GetService('RunService')
    local ct = {}
    local te = table.insert

    HumanDied=false

    for i,v in next, char:GetDescendants() do 
    if v:IsA('BasePart') then
    te(ct,srv.Heartbeat:Connect(function()
    v.Velocity = Vector3.new(-35,0,0)
    sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",10000)
    end))
    end
    end

        
    _G.Animated = true
    _G.Netless = Vector3.new(-35,0,0)
    _G.Fling = Vector3.new(9e9,9e9,9e9)





    wait(.1)
    local function Align(P0,P1,Position,Rotate)
    local AlignPosition = Instance.new("AlignPosition", P0)
    local AlignOrientation = Instance.new("AlignOrientation", P0)
    local Attachment1 = Instance.new("Attachment", P0)
    local Attachment2 = Instance.new("Attachment", P1)
    -- Main Attach Thingy:
    AlignPosition.Attachment0,AlignPosition.Attachment1 = Attachment1,Attachment2 -- Shortcut
    AlignOrientation.Attachment0,AlignOrientation.Attachment1 = Attachment1,Attachment2 -- Shortcut
    -- Properties:
    AlignPosition.RigidityEnabled = true
    AlignOrientation.RigidityEnabled = true
    -- Rotate/Position
    Attachment1.Position = Position or Vector3.new(0,0,0)
    Attachment1.Rotation = Rotate or Vector3.new(0,0,0)
    end

    -- Main (R6)

    local Character = workspace[game.Players.LocalPlayer.Name]
    Character.Animate.Disabled = false
    local Humanoid = Character.Humanoid
    Humanoid:ChangeState("Physics")
    local Hat = Character:WaitForChild("Pal Hair").Handle

    Hat.Mesh:Remove()
    Hat.AccessoryWeld:Remove()
    Character.Archivable = true
    Humanoid:ChangeState("Physics")
    local Reanim = Character:Clone()
    Reanim.Parent = Character
    Reanim.Name = "OofHub"

    Character.Head.Transparency = 1
    Reanim.Head.Transparency = 0
    Character.Head.face.Transparency = 1
    Reanim.Head.face.Transparency = 1
    for i,v in pairs(Reanim:GetChildren()) do 
        if v:IsA("BasePart") then v.Transparency = 1
            elseif v:IsA("Accessory") then v.Handle.Transparency = 1
        end
    end
    for i,v in pairs(Character:GetChildren()) do 
        if v:IsA("Accessory") then v.Handle.Transparency = 0
            elseif v:IsA("Accessory") then v.Handle.Transparency = 0
        end
    end
    Reanim.Head.Transparency = 1
    Character['Pal Hair'].Handle.Transparency = 0
    Reanim['Pal Hair'].Handle.Transparency = 1
    --Noclip
    game:GetService("RunService").Stepped:Connect(function()
        Humanoid.Died:Connect(function()
            return 
        end)
        for i,v in pairs(Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
    --Aligning
    local Name2 = Character:WaitForChild("Pal Hair")

    Character["Right Arm"].Transparency = 0


    Character.Torso['Right Shoulder']:Destroy()
    Character.Torso['Left Shoulder']:Destroy()
    Character.Torso['Right Hip']:Destroy()
    Character.Torso['Left Hip']:Destroy()
    Character.HumanoidRootPart:Destroy()
    function att(P0)
        Align(Character[P0],Reanim[P0])
    end
    att("Right Arm")
    att("Left Arm")
    att("Right Leg")
    att("Left Leg")
    att("Torso")
    Align(Character['Pal Hair'].Handle,Reanim['Right Arm'])



    Hat.Attachment.Rotation = Vector3.new(90,0,0)

    Character['Pal Hair'].Handle.Velocity = _G.Netless
    Reanim['Left Arm'].Velocity = _G.Netless
    Reanim['Right Leg'].Velocity = _G.Netless
    Reanim['Left Leg'].Velocity = _G.Netless
    Reanim['Head'].Velocity = _G.Netless
    Character['Left Arm'].Velocity = _G.Netless
    Character['Right Leg'].Velocity = _G.Netless
    Character['Left Leg'].Velocity = _G.Netless
    Character['Head'].Velocity = _G.Netless
    Character.Torso.Velocity = _G.Netless
    Character["Right Arm"].Name = "Bullet"
    function Pos(part, parent, p)
        Instance.new("Attachment",part)
        Instance.new("AlignPosition",part)
        Instance.new("Attachment",parent)
        part.Attachment.Name = part.Name
        parent.Attachment.Name = part.Name
        part.AlignPosition.Attachment0 = part[part.Name]
        part.AlignPosition.Attachment1 = parent[part.Name]
        parent[part.Name].Position = p or Vector3.new()
        part.AlignPosition.MaxForce = 999999999*10
        part.AlignPosition.MaxVelocity = math.huge
        part.AlignPosition.ReactionForceEnabled = false
        part.AlignPosition.Responsiveness = math.huge
        part.AlignPosition.RigidityEnabled = false
    end

    Pos(Character['Bullet'],Reanim.Torso)


    for i,part in next, Character:GetDescendants() do
    if part:IsA('BasePart') then
    te(ct,srv.RenderStepped:Connect(function()
    part.CanCollide=false
    end))
    end
    end

    for i,part in next, Character:GetDescendants() do
        if part:IsA('BasePart') then
            te(ct,srv.Stepped:Connect(function()
                part.CanCollide=false
            end))
        end
    end

    function flinger(p)
        f=Instance.new('BodyAngularVelocity',p)
        f.AngularVelocity = Vector3.new(9e9*10,9e9*10,9e9*10)
        f.MaxTorque=Vector3.new(9e9*10,9e9*10,9e9*10)
    end

    function fix(p)
        fixer=Instance.new('BodyPosition',p)
        fixer.Name='BP'
        fixer.P=9e9
        fixer.D=9e9
        fixer.MaxForce=Vector3.new(99999,99999,99999)
    end

    flinger(Character['Bullet'])

    --Death Trigger
    game.Players.LocalPlayer.Character = Reanim
    game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
        Character.Humanoid:ChangeState(15)
        game.Players.LocalPlayer.Character = workspace[game.Players.LocalPlayer.Name]
        _G.Animated = false
        Reanim:Destroy()
    end)
    workspace:FindFirstChildOfClass("Camera").CameraSubject = Reanim.Humanoid
end
