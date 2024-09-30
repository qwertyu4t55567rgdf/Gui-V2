local plrs = game:GetService("Players")
local me = plrs.LocalPlayer
local tween = game:GetService("TweenService")
local light = game:GetService("Lighting")
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local camera = game.Workspace.CurrentCamera

local functions = {
    FullbrightF = false;
    AutoOpenDoorsF = false;
    NoBarriersF = false;
    NoGrinderF = false;
    anti_voidF = nil;
    flyF = nil;
    glassbodyF = nil;
    anti_fling = nil;
    infstamina = nil;
    nofalldamage = false;
    highlight = false;
}

local remotes = {
    open_doorsRun;
    fovslider_dragging = false;
    fov_connection;
    gravityslider_dragging = false;
}

local function fullbrightL(value)
    light.ExposureCompensation = value
end

local function open_doorsL()
        remotes.open_doorsRun = run.RenderStepped:Connect(function()
        for _, i in pairs(game.Workspace.Map.Doors:GetChildren()) do
            if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - i:FindFirstChild("DoorBase").Position).Magnitude <= 20 then
                if i:FindFirstChild("Values"):FindFirstChild("Locked").Value == true then
                    i:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer("Unlock", i.Lock)
                    i:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer("Open", i.Lock)
                end
            end
        end
    end)
end

local function nobarriersL(value)
    local function disableTouchAndQuery(part)
        if part:IsA("BasePart") then
            part.CanTouch = value
            part.CanQuery = value
        end
    end

    local function findAndDisableParts()
        local partNames = {"BarbedWire", "RG_Part", "Spike"}

        for _, partName in ipairs(partNames) do
            for _, part in pairs(game.Workspace:GetDescendants()) do
                if part.Name == partName then
                    disableTouchAndQuery(part)
                end
            end
        end
    end

    findAndDisableParts()
end

local function nogrinderL(value)
    local function disableTouchAndQuery(part)
        if part:IsA("BasePart") then
            part.CanTouch = value
            part.CanQuery = value
        end
    end

    local function findAndDisableParts()
        local partNames = {"FirePart", "Grinder"}

        for _, partName in ipairs(partNames) do
            for _, part in pairs(game.Workspace:GetDescendants()) do
                if part.Name == partName then
                    disableTouchAndQuery(part)
                end
            end
        end
    end

    findAndDisableParts()
end

local Gui = Instance.new("ScreenGui")
Gui.Parent = me.PlayerGui
Gui.Name = "New"
Gui.Enabled = true
Gui.ResetOnSpawn = false

local mainframe = Instance.new("Frame")
mainframe.Parent = Gui
mainframe.Name = "Main"
mainframe.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
mainframe.Position = UDim2.new(0.025, 0, 0.16, 0)
mainframe.Size = UDim2.new(0, 986, 0, 610)
mainframe.Visible = true

local uicmf = Instance.new("UICorner")
uicmf.Parent = mainframe
uicmf.CornerRadius = UDim.new(0, 8)

local uiscmf = Instance.new("UIScale")
uiscmf.Parent = mainframe
uiscmf.Scale = 0.8

local uistmf = Instance.new("UIStroke")
uistmf.Parent = mainframe
uistmf.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
uistmf.Color = Color3.new(1, 1, 1)
uistmf.LineJoinMode = Enum.LineJoinMode.Round
uistmf.Thickness = 2
uistmf.Transparency = 0
uistmf.Enabled = true

local console = Instance.new("Frame")
console.Parent = mainframe
console.Name = "Console"
console.BackgroundColor3 = Color3.new(0, 0, 0)
console.Position = UDim2.new(1.009, 0, 0.031, 0)
console.Size = UDim2.new(0, 550, 0, 580)
console.Visible = true

local consoletext = Instance.new("TextLabel")
consoletext.Parent = console
consoletext.Name = "ConsoleText"
consoletext.BackgroundTransparency = 1
consoletext.Position = UDim2.new(0, 0, 0, 0)
consoletext.Size = UDim2.new(0, 550, 0, 580)
consoletext.TextColor3 = Color3.new(0, 1, 0)
consoletext.TextSize = 15
consoletext.Text = " output - soon"
consoletext.TextXAlignment = Enum.TextXAlignment.Left
consoletext.TextYAlignment = Enum.TextYAlignment.Top
consoletext.Visible = true

local list = Instance.new("Frame")
list.Parent = mainframe
list.Name = "List"
list.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
list.Position = UDim2.new(0, 0, 0, 0)
list.Size = UDim2.new(0, 197, 0, 609)
list.Visible = true

local uicl = Instance.new("UICorner")
uicl.Parent = list
uicl.CornerRadius = UDim.new(0, 8)

local uistl = Instance.new("UIStroke")
uistl.Parent = list
uistl.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
uistl.Color = Color3.new(1, 1, 1)
uistl.LineJoinMode = Enum.LineJoinMode.Round
uistl.Thickness = 2
uistl.Transparency = 0
uistl.Enabled = true

local beta = Instance.new("TextLabel")
beta.Parent = mainframe
beta.Name = "beta"
beta.BackgroundColor3 = Color3.new(1, 1, 1)
beta.BackgroundTransparency = 1
beta.Position = UDim2.new(0.952, 0, -0.061, 0)
beta.Rotation = -9
beta.Size = UDim2.new(0, 119, 0, 50)
beta.TextColor3 = Color3.new(0, 0, 0)
beta.Text = "Beta"
beta.TextScaled = true
beta.Visible = true

local uigb = Instance.new("UIGradient")
uigb.Parent = beta
uigb.Enabled = true

local uistb = Instance.new("UIStroke")
uistb.Parent = beta
uistb.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
uistb.Color = Color3.new(1, 1, 1)
uistb.LineJoinMode = Enum.LineJoinMode.Round
uistb.Thickness = 1
uistb.Transparency = 0
uistb.Enabled = true

local uiguist = Instance.new("UIGradient")
uiguist.Parent = uistb
uiguist.Enabled = true

local Menus = Instance.new("Folder")
Menus.Parent = mainframe
Menus.Name = "Menus"

local WorldList = Instance.new("TextButton")
WorldList.Parent = list
WorldList.Name = "World"
WorldList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
WorldList.Position = UDim2.new(0.054, 0, 0.021, 0)
WorldList.Size = UDim2.new(0, 176, 0, 38)
WorldList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
WorldList.Text = "World"
WorldList.TextScaled = true
WorldList.Visible = true

local uicworldl = Instance.new("UICorner")
uicworldl.Parent = WorldList
uicworldl.CornerRadius = UDim.new(0, 25)

local PlayerList = Instance.new("TextButton")
PlayerList.Parent = list
PlayerList.Name = "Player"
PlayerList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
PlayerList.Position = UDim2.new(0.054, 0, 0.103, 0)
PlayerList.Size = UDim2.new(0, 176, 0, 38)
PlayerList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
PlayerList.Text = "Player"
PlayerList.TextScaled = true
PlayerList.Visible = true

local uicplayerl = Instance.new("UICorner")
uicplayerl.Parent = PlayerList
uicplayerl.CornerRadius = UDim.new(0, 25)

local MainList = Instance.new("TextButton")
MainList.Parent = list
MainList.Name = "Main"
MainList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
MainList.Position = UDim2.new(0.054, 0, 0.19, 0)
MainList.Size = UDim2.new(0, 176, 0, 38)
MainList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
MainList.TextScaled = true
MainList.Text = "Main (soon)"
MainList.Visible = true

local uicmainl = Instance.new("UICorner")
uicmainl.Parent = MainList
uicmainl.CornerRadius = UDim.new(0, 25)

local VisualList = Instance.new("TextButton")
VisualList.Parent = list
VisualList.Name = "Visual"
VisualList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
VisualList.Position = UDim2.new(0.054, 0, 0.271, 0)
VisualList.Size = UDim2.new(0, 176, 0, 38)
VisualList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
VisualList.TextScaled = true
VisualList.Text = "Visual"
VisualList.Visible = true

local uicvisuall = Instance.new("UICorner")
uicvisuall.Parent = VisualList
uicvisuall.CornerRadius = UDim.new(0, 25)

local AnimationsList = Instance.new("TextButton")
AnimationsList.Parent = list
AnimationsList.Name = "Animations"
AnimationsList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
AnimationsList.Position = UDim2.new(0.054, 0, 0.355, 0)
AnimationsList.Size = UDim2.new(0, 176, 0, 38)
AnimationsList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
AnimationsList.TextScaled = true
AnimationsList.Text = "Animations (soon)"
AnimationsList.Visible = true

local uicanimationsl = Instance.new("UICorner")
uicanimationsl.Parent = AnimationsList
uicanimationsl.CornerRadius = UDim.new(0, 25)

local SkinsList = Instance.new("TextButton")
SkinsList.Parent = list
SkinsList.Name = "Skins"
SkinsList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
SkinsList.Position = UDim2.new(0.054, 0, 0.438, 0)
SkinsList.Size = UDim2.new(0, 176, 0, 38)
SkinsList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
SkinsList.TextScaled = true
SkinsList.Text = "Skins (soon)"
SkinsList.Visible = true

local uicskinsl = Instance.new("UICorner")
uicskinsl.Parent = SkinsList
uicskinsl.CornerRadius = UDim.new(0, 25)

local TrollList = Instance.new("TextButton")
TrollList.Parent = list
TrollList.Name = "Troll"
TrollList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
TrollList.Position = UDim2.new(0.054, 0, 0.524, 0)
TrollList.Size = UDim2.new(0, 176, 0, 38)
TrollList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TrollList.TextScaled = true
TrollList.Text = "Troll (soon)"
TrollList.Visible = true

local uictrolll = Instance.new("UICorner")
uictrolll.Parent = TrollList
uictrolll.CornerRadius = UDim.new(0, 25)

local SettingsList = Instance.new("TextButton")
SettingsList.Parent = list
SettingsList.Name = "Settings"
SettingsList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
SettingsList.Position = UDim2.new(0.054, 0, 0.612, 0)
SettingsList.Size = UDim2.new(0, 176, 0, 38)
SettingsList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
SettingsList.TextScaled = true
SettingsList.Text = "Settings (soon)"
SettingsList.Visible = true

local uicsettingsl = Instance.new("UICorner")
uicsettingsl.Parent = SettingsList
uicsettingsl.CornerRadius = UDim.new(0, 25)

local OthersList = Instance.new("TextButton")
OthersList.Parent = list
OthersList.Name = "Others"
OthersList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
OthersList.Position = UDim2.new(0.054, 0, 0.701, 0)
OthersList.Size = UDim2.new(0, 176, 0, 38)
OthersList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
OthersList.TextScaled = true
OthersList.Text = "Others (soon)"
OthersList.Visible = true

local uicothersl = Instance.new("UICorner")
uicothersl.Parent = OthersList
uicothersl.CornerRadius = UDim.new(0, 25)

local ConfigList = Instance.new("TextButton")
ConfigList.Parent = list
ConfigList.Name = "Config"
ConfigList.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
ConfigList.Position = UDim2.new(0.054, 0, 0.787, 0)
ConfigList.Size = UDim2.new(0, 176, 0, 38)
ConfigList.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
ConfigList.TextScaled = true
ConfigList.Text = "Config (soon)"
ConfigList.Visible = true

local uicconfigl = Instance.new("UICorner")
uicconfigl.Parent = ConfigList
uicconfigl.CornerRadius = UDim.new(0, 25)

local WorldMenu = Instance.new("Frame")
WorldMenu.Parent = Menus
WorldMenu.Name = "World"
WorldMenu.BackgroundTransparency = 1
WorldMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
WorldMenu.Size = UDim2.new(0, 774, 0, 598)
WorldMenu.Visible = true

local PlayerMenu = Instance.new("Frame")
PlayerMenu.Parent = Menus
PlayerMenu.Name = "Player"
PlayerMenu.BackgroundTransparency = 1
PlayerMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
PlayerMenu.Size = UDim2.new(0, 774, 0, 598)
PlayerMenu.Visible = false

local VisualMenu = Instance.new("Frame")
VisualMenu.Parent = Menus
VisualMenu.Name = "Visual"
VisualMenu.BackgroundTransparency = 1
VisualMenu.Position = UDim2.new(0.209, 0, 0.01, 0)
VisualMenu.Size = UDim2.new(0, 774, 0, 598)
VisualMenu.Visible = false

local Fullbright = Instance.new("TextLabel")
Fullbright.Parent = WorldMenu
Fullbright.Name = "Fullbright"
Fullbright.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Fullbright.Position = UDim2.new(0.016, 0, 0.022, 0)
Fullbright.Size = UDim2.new(0, 194, 0, 32)
Fullbright.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Fullbright.TextScaled = true
Fullbright.Text = "Fullbright"
Fullbright.Visible = true

local uicfullbright = Instance.new("UICorner")
uicfullbright.Parent = Fullbright
uicfullbright.CornerRadius = UDim.new(0, 8)

local FullbrightHow = Instance.new("ImageLabel")
FullbrightHow.Parent = Fullbright
FullbrightHow.Name = "how"
FullbrightHow.BackgroundColor3 = Color3.new(1, 1, 1)
FullbrightHow.Position = UDim2.new(1.077, 0, 0, 0)
FullbrightHow.Size = UDim2.new(0, 32, 0, 32)
FullbrightHow.Image = "rbxassetid://75772970732380"
FullbrightHow.ImageColor3 = Color3.new(1, 1, 1)
FullbrightHow.Visible = true

local uicfullbrighthow = Instance.new("UICorner")
uicfullbrighthow.Parent = FullbrightHow
uicfullbrighthow.CornerRadius = UDim.new(8, 8)

local FullbrightControl = Instance.new("Frame")
FullbrightControl.Parent = Fullbright
FullbrightControl.Name = "Control"
FullbrightControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
FullbrightControl.Position = UDim2.new(1.309, 0, 0, 0)
FullbrightControl.Size = UDim2.new(0, 58, 0, 32)
FullbrightControl.Visible = true

local uicfullbrightcontrol = Instance.new("UICorner")
uicfullbrightcontrol.Parent = FullbrightControl
uicfullbrightcontrol.CornerRadius = UDim.new(8, 8)

local FullbrightTurn = Instance.new("TextButton")
FullbrightTurn.Parent = FullbrightControl
FullbrightTurn.Name = "turn"
FullbrightTurn.BackgroundColor3 = Color3.new(1, 0, 0)
FullbrightTurn.Position = UDim2.new(0, 0, 0, 0)
FullbrightTurn.Size = UDim2.new(0, 35, 0, 32)
FullbrightTurn.Text = ""
FullbrightTurn.Visible = true

local uicfullbrightturn = Instance.new("UICorner")
uicfullbrightturn.Parent = FullbrightTurn
uicfullbrightturn.CornerRadius = UDim.new(8, 8)

local open_doors = Instance.new("TextLabel")
open_doors.Parent = WorldMenu
open_doors.Name = "open_doors"
open_doors.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
open_doors.Position = UDim2.new(0.016, 0, 0.109, 0)
open_doors.Size = UDim2.new(0, 194, 0, 32)
open_doors.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
open_doors.TextScaled = true
open_doors.Text = "Auto open doors"
open_doors.Visible = true

local uicopen_doors = Instance.new("UICorner")
uicopen_doors.Parent = open_doors
uicopen_doors.CornerRadius = UDim.new(0, 8)

local open_doorsHow = Instance.new("ImageLabel")
open_doorsHow.Parent = open_doors
open_doorsHow.Name = "how"
open_doorsHow.Position = UDim2.new(1.077, 0, 0, 0)
open_doorsHow.Size = UDim2.new(0, 32, 0, 32)
open_doorsHow.Image = "rbxassetid://75772970732380"
open_doorsHow.Visible = true

local uicopen_doorshow = Instance.new("UICorner")
uicopen_doorshow.Parent = open_doorsHow
uicopen_doorshow.CornerRadius = UDim.new(8, 8)

local open_doorsControl = Instance.new("Frame")
open_doorsControl.Parent = open_doors
open_doorsControl.Name = "Control"
open_doorsControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
open_doorsControl.Position = UDim2.new(1.309, 0, 0, 0)
open_doorsControl.Size = UDim2.new(0, 58, 0, 32)
open_doorsControl.Visible = true

local uicopen_doorscontrol = Instance.new("UICorner")
uicopen_doorscontrol.Parent = open_doorsControl
uicopen_doorscontrol.CornerRadius = UDim.new(8, 8)

local TurnOpen_doors = Instance.new("TextButton")
TurnOpen_doors.Parent = open_doorsControl
TurnOpen_doors.Name = "turn"
TurnOpen_doors.BackgroundColor3 = Color3.new(1, 0, 0)
TurnOpen_doors.Position = UDim2.new(0, 0, 0, 0)
TurnOpen_doors.Size = UDim2.new(0, 35, 0, 32)
TurnOpen_doors.Text = ""
TurnOpen_doors.Visible = true

local uicturnopen_doors = Instance.new("UICorner")
uicturnopen_doors.Parent = TurnOpen_doors
uicturnopen_doors.CornerRadius = UDim.new(8, 8)

local nobarriers = Instance.new("TextLabel")
nobarriers.Parent = WorldMenu
nobarriers.Name = "NoBarriers"
nobarriers.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
nobarriers.Position = UDim2.new(0.016, 0, 0.192, 0)
nobarriers.Size = UDim2.new(0, 194, 0, 32)
nobarriers.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
nobarriers.TextScaled = true
nobarriers.Text = "No barriers"
nobarriers.Visible = true

local uicnobarriers = Instance.new("UICorner")
uicnobarriers.Parent = nobarriers
uicnobarriers.CornerRadius = UDim.new(0, 8)

local nobarriersHow = Instance.new("ImageLabel")
nobarriersHow.Parent = nobarriers
nobarriersHow.Name = "how"
nobarriersHow.BackgroundColor3 = Color3.new(1, 1, 1)
nobarriersHow.Position = UDim2.new(1.077, 0, 0, 0)
nobarriersHow.Size = UDim2.new(0, 32, 0, 32)
nobarriersHow.Image = "rbxassetid://75772970732380"
nobarriersHow.Visible = true

local uicnobarriershow = Instance.new("UICorner")
uicnobarriershow.Parent = nobarriersHow
uicnobarriershow.CornerRadius = UDim.new(8, 8)

local nobarriersControl = Instance.new("Frame")
nobarriersControl.Parent = nobarriers
nobarriersControl.Name = "Control"
nobarriersControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
nobarriersControl.Position = UDim2.new(1.309, 0, 0, 0)
nobarriersControl.Size = UDim2.new(0, 58, 0, 32)
nobarriersControl.Visible = true

local uicnobarrierscontrol = Instance.new("UICorner")
uicnobarrierscontrol.Parent = nobarriersControl
uicnobarrierscontrol.CornerRadius = UDim.new(8, 8)

local nobarriersTurn = Instance.new("TextButton")
nobarriersTurn.Parent = nobarriersControl
nobarriersTurn.Name = "turn"
nobarriersTurn.BackgroundColor3 = Color3.new(1, 0, 0)
nobarriersTurn.Position = UDim2.new(0, 0, 0, 0)
nobarriersTurn.Size = UDim2.new(0, 35, 0, 32)
nobarriersTurn.Text = ""
nobarriersTurn.Visible = true

local uicnobarriersturn = Instance.new("UICorner")
uicnobarriersturn.Parent = nobarriersTurn
uicnobarriersturn.CornerRadius = UDim.new(8, 8)

local nogrinder = Instance.new("TextLabel")
nogrinder.Parent = WorldMenu
nogrinder.Name = "nogrinder"
nogrinder.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
nogrinder.Position = UDim2.new(0.016, 0, 0.281, 0)
nogrinder.Size = UDim2.new(0, 194, 0, 32)
nogrinder.TextScaled = true
nogrinder.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
nogrinder.Text = "No grinder"
nogrinder.Visible = true

local uicnogrinder = Instance.new("UICorner")
uicnogrinder.Parent = nogrinder
uicnogrinder.CornerRadius = UDim.new(0, 8)

local nogrinderHow = Instance.new("ImageLabel")
nogrinderHow.Parent = nogrinder
nogrinderHow.Name = "how"
nogrinderHow.Position = UDim2.new(1.077, 0, 0, 0)
nogrinderHow.Size = UDim2.new(0, 32, 0, 32)
nogrinderHow.Image = "rbxassetid://75772970732380"
nogrinderHow.Visible = true

local uicnogrinderhow = Instance.new("UICorner")
uicnogrinderhow.Parent = nogrinderHow
uicnogrinderhow.CornerRadius = UDim.new(8, 8)

local nogrinderControl = Instance.new("Frame")
nogrinderControl.Parent = nogrinder
nogrinderControl.Name = "Control"
nogrinderControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
nogrinderControl.Position = UDim2.new(1.309, 0, 0, 0)
nogrinderControl.Size = UDim2.new(0, 58, 0, 32)
nogrinderControl.Visible = true

local uicnogrindercontrol = Instance.new("UICorner")
uicnogrindercontrol.Parent = nogrinderControl
uicnogrindercontrol.CornerRadius = UDim.new(8, 8)

local nogrinderTurn = Instance.new("TextButton")
nogrinderTurn.Parent = nogrinderControl
nogrinderTurn.Name = "turn"
nogrinderTurn.BackgroundColor3 = Color3.new(1, 0, 0)
nogrinderTurn.Position = UDim2.new(0, 0, 0, 0)
nogrinderTurn.Size = UDim2.new(0, 35, 0, 32)
nogrinderTurn.Text = ""
nogrinderTurn.Visible = true

local uicnogrinderturn = Instance.new("UICorner")
uicnogrinderturn.Parent = nogrinderTurn
uicnogrinderturn.CornerRadius = UDim.new(8, 8)

local antiVoid = Instance.new("TextLabel")
antiVoid.Parent = WorldMenu
antiVoid.Name = "anti-void"
antiVoid.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
antiVoid.Position = UDim2.new(0.016, 0, 0.363, 0)
antiVoid.Size = UDim2.new(0, 194, 0, 32)
antiVoid.TextScaled = true
antiVoid.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
antiVoid.Text = "anti-void"
antiVoid.Visible = true

local uicantivoid = Instance.new("UICorner")
uicantivoid.Parent = antiVoid
uicantivoid.CornerRadius = UDim.new(0, 8)

local antivoidHow = Instance.new("ImageLabel")
antivoidHow.Parent = antiVoid
antivoidHow.Name = "how"
antivoidHow.Position = UDim2.new(1.077, 0, 0, 0)
antivoidHow.Size = UDim2.new(0, 32, 0, 32)
antivoidHow.Image = "rbxassetid://75772970732380"
antivoidHow.Visible = true

local uicantivoidhow = Instance.new("UICorner")
uicantivoidhow.Parent = antivoidHow
uicantivoidhow.CornerRadius = UDim.new(8, 8)

local antivoidControl = Instance.new("Frame")
antivoidControl.Parent = antiVoid
antivoidControl.Name = "Control"
antivoidControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
antivoidControl.Position = UDim2.new(1.309, 0, 0, 0)
antivoidControl.Size = UDim2.new(0, 58, 0, 32)
antivoidControl.Visible = true

local uicantivoidcontrol = Instance.new("UICorner")
uicantivoidcontrol.Parent = antivoidControl
uicantivoidcontrol.CornerRadius = UDim.new(8, 8)

local antivoidturn = Instance.new("TextButton")
antivoidturn.Parent = antivoidControl
antivoidturn.Name = "turn"
antivoidturn.BackgroundColor3 = Color3.new(1, 0, 0)
antivoidturn.Position = UDim2.new(0, 0, 0, 0)
antivoidturn.Size = UDim2.new(0, 35, 0, 32)
antivoidturn.Text = ""
antivoidturn.Visible = true

local uicantivoidturn = Instance.new("UICorner")
uicantivoidturn.Parent = antivoidturn
uicantivoidturn.CornerRadius = UDim.new(8, 8)

local antivoidSoon = Instance.new("TextLabel")
antivoidSoon.Parent = antiVoid
antivoidSoon.Name = "soon"
antivoidSoon.BackgroundTransparency = 1
antivoidSoon.Position = UDim2.new(1.656, 0, 0, 0)
antivoidSoon.Size = UDim2.new(0, 89, 0, 32)
antivoidSoon.TextScaled = true
antivoidSoon.TextColor3 = Color3.new(1, 1, 1)
antivoidSoon.Text = "- soon"
antivoidSoon.Visible = true

local WorldMenuSoon = Instance.new("TextLabel")
WorldMenuSoon.Parent = WorldMenu
WorldMenuSoon.Name = "Soon"
WorldMenuSoon.BackgroundColor3 = Color3.new(1, 1, 1)
WorldMenuSoon.Position = UDim2.new(0.037, 0, 0.518, 0)
WorldMenuSoon.Size = UDim2.new(0, 715, 0, 250)
WorldMenuSoon.TextScaled = true
WorldMenuSoon.TextColor3 = Color3.new(0, 0, 0)
WorldMenuSoon.Text = "Soon"
WorldMenuSoon.Visible = true

local FOV = Instance.new("TextLabel")
FOV.Parent = PlayerMenu
FOV.Name = "fov"
FOV.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
FOV.Position = UDim2.new(0.016, 0, 0.022, 0)
FOV.Size = UDim2.new(0, 194, 0, 32)
FOV.TextScaled = true
FOV.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
FOV.Text = "FOV"
FOV.Visible = true

local uicFov = Instance.new("UICorner")
uicFov.Parent = FOV
uicFov.CornerRadius = UDim.new(0, 8)

local fovHow = Instance.new("ImageLabel")
fovHow.Parent = FOV
fovHow.Name = "how"
fovHow.Position = UDim2.new(1.077, 0, 0, 0)
fovHow.Size = UDim2.new(0, 32, 0, 32)
fovHow.Image = "rbxassetid://75772970732380"
fovHow.Visible = true

local uicfovhow = Instance.new("UICorner")
uicfovhow.Parent = fovHow
uicfovhow.CornerRadius = UDim.new(8, 8)

local fovControl = Instance.new("TextLabel")
fovControl.Parent = FOV
fovControl.Name = "control"
fovControl.BackgroundColor3 = Color3.new(1, 1, 1)
fovControl.Position = UDim2.new(1.46, 0, 0.099, 0)
fovControl.Size = UDim2.new(0, 272, 0, 25)
fovControl.Text = ""
fovControl.Visible = true

local uicfovcontrol = Instance.new("UICorner")
uicfovcontrol.Parent = fovControl
uicfovcontrol.CornerRadius = UDim.new(8, 8)

local uisfovcontrol = Instance.new("UIStroke")
uisfovcontrol.Parent = fovControl
uisfovcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisfovcontrol.Color = Color3.new(0, 0, 0)
uisfovcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisfovcontrol.Thickness = 2.4
uisfovcontrol.Enabled = true

local fovSlider = Instance.new("TextButton")
fovSlider.Parent = fovControl
fovSlider.Name = "slide"
fovSlider.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
fovSlider.Position = UDim2.new(-0, 0, 0, 0)
fovSlider.Size = UDim2.new(0, 199, 0, 25)
fovSlider.TextSize = 15
fovSlider.TextColor3 = Color3.new(1, 1, 1)
fovSlider.Text = ""
fovSlider.Visible = true

local uicfovslider = Instance.new("UICorner")
uicfovslider.Parent = fovSlider
uicfovslider.CornerRadius = UDim.new(8, 8)

local speed = Instance.new("TextLabel")
speed.Parent = PlayerMenu
speed.Name = "speed"
speed.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
speed.Position = UDim2.new(0.016, 0, 0.104, 0)
speed.Size = UDim2.new(0, 194, 0, 32)
speed.TextScaled = true
speed.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
speed.Text = "speed"
speed.Visible = true

local uicspeed = Instance.new("UICorner")
uicspeed.Parent = speed
uicspeed.CornerRadius = UDim.new(0, 8)

local speedHow = Instance.new("ImageLabel")
speedHow.Parent = speed
speedHow.Position = UDim2.new(1.077, 0, 0, 0)
speedHow.Size = UDim2.new(0, 32, 0, 32)
speedHow.Image = "rbxassetid://75772970732380"
speedHow.Visible = true

local uicspeedhow = Instance.new("UICorner")
uicspeedhow.Parent = speedHow
uicspeedhow.CornerRadius = UDim.new(8, 8)

local speedControl = Instance.new("TextLabel")
speedControl.Parent = speed
speedControl.Name = "control"
speedControl.BackgroundColor3 = Color3.new(1, 1, 1)
speedControl.Position = UDim2.new(1.46, 0, 0.099, 0)
speedControl.Size = UDim2.new(0, 272, 0, 25)
speedControl.Text = ""
speedControl.Visible = true

local uicspeedcontrol = Instance.new("UICorner")
uicspeedcontrol.Parent = speedControl
uicspeedcontrol.CornerRadius = UDim.new(8, 8)

local uisspeedcontrol = Instance.new("UIStroke")
uisspeedcontrol.Parent = speedControl
uisspeedcontrol.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisspeedcontrol.Color = Color3.new(0, 0, 0)
uisspeedcontrol.LineJoinMode = Enum.LineJoinMode.Round
uisspeedcontrol.Thickness = 2.4

local speedSlide = Instance.new("TextButton")
speedSlide.Parent = speedControl
speedSlide.Name = "slide"
speedSlide.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
speedSlide.Position = UDim2.new(-0, 0, 0, 0)
speedSlide.Size = UDim2.new(0, 199, 0, 25)
speedSlide.Text = ""
speedSlide.Visible = true

local uicspeedslide = Instance.new("UICorner")
uicspeedslide.Parent = speedSlide
uicspeedslide.CornerRadius = UDim.new(8, 8)

local speedSoon = Instance.new("TextLabel")
speedSoon.Parent = speed
speedSoon.Name = "soon"
speedSoon.BackgroundTransparency = 1
speedSoon.Position = UDim2.new(2.861, 0, 0.078, 0)
speedSoon.Size = UDim2.new(0, 89, 0, 32)
speedSoon.TextScaled = true
speedSoon.TextColor3 = Color3.new(1, 1, 1)
speedSoon.Text = "- soon"
speedSoon.Visible = true

local gravity = Instance.new("TextLabel")
gravity.Parent = PlayerMenu
gravity.Name = "gravity"
gravity.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
gravity.Position = UDim2.new(0.016, 0, 0.192, 0)
gravity.Size = UDim2.new(0, 194, 0, 32)
gravity.TextScaled = true
gravity.TextColor3 = Color3.new(0.784314, 0.784314, 0.78431)
gravity.Text = "gravity"
gravity.Visible = true

local uicgravity = Instance.new("UICorner")
uicgravity.Parent = gravity
uicgravity.CornerRadius = UDim.new(0, 8)

local gravityHow = Instance.new("ImageLabel")
gravityHow.Parent = gravity
gravityHow.Name = "how"
gravityHow.Position = UDim2.new(1.077, 0, 0, 0)
gravityHow.Size = UDim2.new(0, 32, 0, 32)
gravityHow.Image = "rbxassetid://75772970732380"
gravityHow.Visible = true

local uicgravityhow = Instance.new("UICorner")
uicgravityhow.Parent = gravityHow
uicgravityhow.CornerRadius = UDim.new(8, 8)

local gravityControl = Instance.new("TextLabel")
gravityControl.Parent = gravity
gravityControl.Name = "control"
gravityControl.BackgroundColor3 = Color3.new(1, 1, 1)
gravityControl.Position = UDim2.new(1.46, 0, 0.099, 0)
gravityControl.Size = UDim2.new(0, 272, 0, 25)
gravityControl.Text = ""
gravityControl.Visible = true

local uicgravityControl = Instance.new("UICorner")
uicgravityControl.Parent = gravityControl
uicgravityControl.CornerRadius = UDim.new(8, 8)

local uisgravityControl = Instance.new("UIStroke")
uisgravityControl.Parent = gravityControl
uisgravityControl.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uisgravityControl.Color = Color3.new(0, 0, 0)
uisgravityControl.LineJoinMode = Enum.LineJoinMode.Round
uisgravityControl.Thickness = 2.4

local gravitySlider = Instance.new("TextButton")
gravitySlider.Parent = gravityControl
gravitySlider.Name = "slide"
gravitySlider.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
gravitySlider.Position = UDim2.new(-0, 0, 0, 0)
gravitySlider.Size = UDim2.new(0, 199, 0, 25)
gravitySlider.Text = ""
gravitySlider.Visible = true

local uicgravityslider = Instance.new("UICorner")
uicgravityslider.Parent = gravitySlider
uicgravityslider.CornerRadius = UDim.new(8, 8)

local fly = Instance.new("TextLabel")
fly.Parent = PlayerMenu
fly.Name = "Fly"
fly.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
fly.Position = UDim2.new(0.016, 0, 0.275, 0)
fly.Size = UDim2.new(0, 194, 0, 32)
fly.TextScaled = true
fly.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
fly.Text = "Fly"
fly.Visible = true

local uicfly = Instance.new("UICorner")
uicfly.Parent = fly
uicfly.CornerRadius = UDim.new(0, 8)

local flyHow = Instance.new("ImageLabel")
flyHow.Parent = fly
flyHow.Name = "how"
flyHow.Position = UDim2.new(1.077, 0, 0, 0)
flyHow.Size = UDim2.new(0, 32, 0, 32)
flyHow.Image = "rbxassetid://75772970732380"
flyHow.Visible = true

local uicflyhow = Instance.new("UICorner")
uicflyhow.Parent = flyHow
uicflyhow.CornerRadius = UDim.new(8, 8)

local flyControl = Instance.new("Frame")
flyControl.Parent = fly
flyControl.Name = "Control"
flyControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
flyControl.Position = UDim2.new(1.309, 0, 0, 0)
flyControl.Size = UDim2.new(0, 58, 0, 32)
flyControl.Visible = true

local uicflycontrol = Instance.new("UICorner")
uicflycontrol.Parent = flyControl
uicflycontrol.CornerRadius = UDim.new(8, 8)

local flyTurn = Instance.new("TextButton")
flyTurn.Parent = flyControl
flyTurn.Name = "turn"
flyTurn.BackgroundColor3 = Color3.new(1, 0, 0)
flyTurn.Position = UDim2.new(0, 0, 0, 0)
flyTurn.Size = UDim2.new(0, 35, 0, 32)
flyTurn.Text = ""
flyTurn.Visible = true

local uicflyturn = Instance.new("UICorner")
uicflyturn.Parent = flyTurn
uicflyturn.CornerRadius = UDim.new(8, 8)

local flySoon = Instance.new("TextLabel")
flySoon.Parent = fly
flySoon.Name = "soon"
flySoon.BackgroundTransparency = 1
flySoon.BackgroundColor3 = Color3.new(1, 1, 1)
flySoon.Position = UDim2.new(1.656, 0, 0, 0)
flySoon.Size = UDim2.new(0, 89, 0, 32)
flySoon.TextScaled = true
flySoon.TextColor3 = Color3.new(1, 1, 1)
flySoon.Text = "- soon"
flySoon.Visible = true

local GlassBody = Instance.new("TextLabel")
GlassBody.Parent = PlayerMenu
GlassBody.Name = "body"
GlassBody.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
GlassBody.Position = UDim2.new(0.016, 0, 0.359, 0)
GlassBody.Size = UDim2.new(0, 194, 0, 32)
GlassBody.TextScaled = true
GlassBody.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
GlassBody.Text = "Glass body"
GlassBody.Visible = true

local uicglassbody = Instance.new("UICorner")
uicglassbody.Parent = GlassBody
uicglassbody.CornerRadius = UDim.new(0, 8)

local glassbodyHow = Instance.new("ImageLabel")
glassbodyHow.Parent = GlassBody
glassbodyHow.Name = "how"
glassbodyHow.Position = UDim2.new(1.077, 0, 0, 0)
glassbodyHow.Size = UDim2.new(0, 32, 0, 32)
glassbodyHow.Image = "rbxassetid://75772970732380"
glassbodyHow.Visible = true

local uicglassbodyHow = Instance.new("UICorner")
uicglassbodyHow.Parent = glassbodyHow
uicglassbodyHow.CornerRadius = UDim.new(8, 8)

local glassbodyControl = Instance.new("Frame")
glassbodyControl.Parent = GlassBody
glassbodyControl.Name = "Control"
glassbodyControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
glassbodyControl.Position = UDim2.new(1.309, 0, 0, 0)
glassbodyControl.Size = UDim2.new(0, 58, 0, 32)
glassbodyControl.Visible = true

local uicglassbodyControl = Instance.new("UICorner")
uicglassbodyControl.Parent = glassbodyControl
uicglassbodyControl.CornerRadius = UDim.new(8, 8)

local glassbodyTurn = Instance.new("TextButton")
glassbodyTurn.Parent = glassbodyControl
glassbodyTurn.Name = "turn"
glassbodyTurn.BackgroundColor3 = Color3.new(1, 0, 0)
glassbodyTurn.Position = UDim2.new(0, 0, 0, 0)
glassbodyTurn.Size = UDim2.new(0, 35, 0, 32)
glassbodyTurn.Text = ""
glassbodyTurn.Visible = true

local uicglassbodyturn = Instance.new("UICorner")
uicglassbodyturn.Parent = glassbodyTurn
uicglassbodyturn.CornerRadius = UDim.new(8, 8)

local glassbodySoon = Instance.new("TextLabel")
glassbodySoon.Parent = GlassBody
glassbodySoon.Name = "soon"
glassbodySoon.BackgroundTransparency = 1
glassbodySoon.BackgroundColor3 = Color3.new(1, 1, 1)
glassbodySoon.Position = UDim2.new(1.656, 0, 0, 0)
glassbodySoon.Size = UDim2.new(0, 89, 0, 32)
glassbodySoon.TextScaled = true
glassbodySoon.TextColor3 = Color3.new(1, 1, 1)
glassbodySoon.Text = "- soon"
glassbodySoon.Visible = true

local antifling = Instance.new("TextLabel")
antifling.Parent = PlayerMenu
antifling.Name = "anti-fling"
antifling.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
antifling.Position = UDim2.new(0.016, 0, 0.446, 0)
antifling.Size = UDim2.new(0, 194, 0, 32)
antifling.TextScaled = true
antifling.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
antifling.Text = "anti-fling"
antifling.Visible = true

local uicantifling = Instance.new("UICorner")
uicantifling.Parent = antifling
uicantifling.CornerRadius = UDim.new(0, 8)

local antiflingHow = Instance.new("ImageLabel")
antiflingHow.Parent = antifling
antiflingHow.Name = "how"
antiflingHow.Position = UDim2.new(1.077, 0, 0, 0)
antiflingHow.Size = UDim2.new(0, 32, 0, 32)
antiflingHow.Image = "rbxassetid://75772970732380"
antiflingHow.Visible = true

local uicantiflinghow = Instance.new("UICorner")
uicantiflinghow.Parent = antiflingHow
uicantiflinghow.CornerRadius = UDim.new(8, 8)

local antiflingControl = Instance.new("Frame")
antiflingControl.Parent = antifling
antiflingControl.Name = "Control"
antiflingControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
antiflingControl.Position = UDim2.new(1.309, 0, 0, 0)
antiflingControl.Size = UDim2.new(0, 58, 0, 32)
antiflingControl.Visible = true

local uicantiflingcontrol = Instance.new("UICorner")
uicantiflingcontrol.Parent = antiflingControl
uicantiflingcontrol.CornerRadius = UDim.new(8, 8)

local antiflingTurn = Instance.new("TextButton")
antiflingTurn.Parent = antiflingControl
antiflingTurn.Name = "turn"
antiflingTurn.BackgroundColor3 = Color3.new(1, 0, 0)
antiflingTurn.Position = UDim2.new(0, 0, 0, 0)
antiflingTurn.Size = UDim2.new(0, 35, 0, 32)
antiflingTurn.Text = ""
antiflingTurn.Visible = true

local uicantiflingturn = Instance.new("UICorner")
uicantiflingturn.Parent = antiflingTurn
uicantiflingturn.CornerRadius = UDim.new(8, 8)

local antiflingSoon = Instance.new("TextLabel")
antiflingSoon.Parent = antifling
antiflingSoon.Name = "soon"
antiflingSoon.BackgroundTransparency = 1
antiflingSoon.BackgroundColor3 = Color3.new(1, 1, 1)
antiflingSoon.Position = UDim2.new(1.656, 0, 0, 0)
antiflingSoon.Size = UDim2.new(0, 89, 0, 32)
antiflingSoon.TextScaled = true
antiflingSoon.TextColor3 = Color3.new(1, 1, 1)
antiflingSoon.Text = "- soon"
antiflingSoon.Visible = true

local infstamina = Instance.new("TextLabel")
infstamina.Parent = PlayerMenu
infstamina.Name = "infstamina"
infstamina.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
infstamina.Position = UDim2.new(0.016, 0, 0.533, 0)
infstamina.Size = UDim2.new(0, 194, 0, 32)
infstamina.TextScaled = true
infstamina.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
infstamina.Text = "inf-stamina"
infstamina.Visible = true

local uicinfstamina = Instance.new("UICorner")
uicinfstamina.Parent = infstamina
uicinfstamina.CornerRadius = UDim.new(0, 8)

local infstaminaHow = Instance.new("ImageLabel")
infstaminaHow.Parent = infstamina
infstaminaHow.Name = "how"
infstaminaHow.Position = UDim2.new(1.077, 0, 0, 0)
infstaminaHow.Size = UDim2.new(0, 32, 0, 32)
infstaminaHow.Image = "rbxassetid://75772970732380"
infstaminaHow.Visible = true

local uicinfstaminahow = Instance.new("UICorner")
uicinfstaminahow.Parent = infstaminaHow
uicinfstaminahow.CornerRadius = UDim.new(8, 8)

local infstaminaControl = Instance.new("Frame")
infstaminaControl.Parent = infstamina
infstaminaControl.Name = "Control"
infstaminaControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
infstaminaControl.Position = UDim2.new(1.309, 0, 0, 0)
infstaminaControl.Size = UDim2.new(0, 58, 0, 32)
infstaminaControl.Visible = true

local uicinfstaminacontrol = Instance.new("UICorner")
uicinfstaminacontrol.Parent = infstaminaControl
uicinfstaminacontrol.CornerRadius = UDim.new(8, 8)

local infstaminaTurn = Instance.new("TextButton")
infstaminaTurn.Parent = infstaminaControl
infstaminaTurn.Name = "turn"
infstaminaTurn.BackgroundColor3 = Color3.new(1, 0, 0)
infstaminaTurn.Position = UDim2.new(0, 0, 0, 0)
infstaminaTurn.Size = UDim2.new(0, 35, 0, 32)
infstaminaTurn.Text = ""
infstaminaTurn.Visible = true

local uicinfstaminaturn = Instance.new("UICorner")
uicinfstaminaturn.Parent = infstaminaTurn
uicinfstaminaturn.CornerRadius = UDim.new(8, 8)

local infstaminaSoon = Instance.new("TextLabel")
infstaminaSoon.Parent = infstamina
infstaminaSoon.Name = "soon"
infstaminaSoon.BackgroundTransparency = 1
infstaminaSoon.BackgroundColor3 = Color3.new(1, 1, 1)
infstaminaSoon.Position = UDim2.new(1.656, 0, 0, 0)
infstaminaSoon.Size = UDim2.new(0, 89, 0, 32)
infstaminaSoon.TextScaled = true
infstaminaSoon.TextColor3 = Color3.new(1, 1, 1)
infstaminaSoon.Text = "- soon"
infstaminaSoon.Visible = true

local nofalldamage = Instance.new("TextLabel")
nofalldamage.Parent = PlayerMenu
nofalldamage.Name = "nofalldamage"
nofalldamage.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
nofalldamage.Position = UDim2.new(0.016, 0, 0.619, 0)
nofalldamage.Size = UDim2.new(0, 194, 0, 32)
nofalldamage.TextScaled = true
nofalldamage.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
nofalldamage.Text = "no fall damage"
nofalldamage.Visible = true

local uicnofalldamage = Instance.new("UICorner")
uicnofalldamage.Parent = nofalldamage
uicnofalldamage.CornerRadius = UDim.new(0, 8)

local nofalldamageHow = Instance.new("ImageLabel")
nofalldamageHow.Parent = nofalldamage
nofalldamageHow.Name = "how"
nofalldamageHow.Position = UDim2.new(1.077, 0, 0, 0)
nofalldamageHow.Size = UDim2.new(0, 32, 0, 32)
nofalldamageHow.Image = "rbxassetid://75772970732380"
nofalldamageHow.Visible = true

local uicnofalldamagehow = Instance.new("UICorner")
uicnofalldamagehow.Parent = nofalldamageHow
uicnofalldamagehow.CornerRadius = UDim.new(8, 8)

local nofalldamageControl = Instance.new("Frame")
nofalldamageControl.Parent = nofalldamage
nofalldamageControl.Name = "Control"
nofalldamageControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
nofalldamageControl.Position = UDim2.new(1.309, 0, 0, 0)
nofalldamageControl.Size = UDim2.new(0, 58, 0, 32)
nofalldamageControl.Visible = true

local uicnofalldamagecontrol = Instance.new("UICorner")
uicnofalldamagecontrol.Parent = nofalldamageControl
uicnofalldamagecontrol.CornerRadius = UDim.new(8, 8)

local nofalldamageTurn = Instance.new("TextButton")
nofalldamageTurn.Parent = nofalldamageControl
nofalldamageTurn.Name = "turn"
nofalldamageTurn.BackgroundColor3 = Color3.new(1, 0, 0)
nofalldamageTurn.Position = UDim2.new(0, 0, 0, 0)
nofalldamageTurn.Size = UDim2.new(0, 35, 0, 32)
nofalldamageTurn.Text = ""
nofalldamageTurn.Visible = true

local uicnofalldamageturn = Instance.new("UICorner")
uicnofalldamageturn.Parent = nofalldamageTurn
uicnofalldamageturn.CornerRadius = UDim.new(8, 8)

local PlayerMenuSoon = Instance.new("TextLabel")
PlayerMenuSoon.Parent = PlayerMenu
PlayerMenuSoon.Name = "soon"
PlayerMenuSoon.BackgroundColor3 = Color3.new(1, 1, 1)
PlayerMenuSoon.Position = UDim2.new(0.027, 0, 0.704, 0)
PlayerMenuSoon.Size = UDim2.new(0, 745, 0, 169)
PlayerMenuSoon.TextScaled = true
PlayerMenuSoon.TextColor3 = Color3.new(0, 0, 0)
PlayerMenuSoon.Text = "Soon"
PlayerMenuSoon.Visible = true

local highlight = Instance.new("TextLabel")
highlight.Parent = VisualMenu
highlight.Name = "Highlight"
highlight.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
highlight.Position = UDim2.new(0.016, 0, 0.022, 0)
highlight.Size = UDim2.new(0, 194, 0, 32)
highlight.TextScaled = true
highlight.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
highlight.Text = "Highlight"
highlight.Visible = true

local uichighlight = Instance.new("UICorner")
uichighlight.Parent = highlight
uichighlight.CornerRadius = UDim.new(0, 8)

local highlightHow = Instance.new("ImageLabel")
highlightHow.Parent = highlight
highlightHow.Name = "how"
highlightHow.Position = UDim2.new(1.077, 0, 0, 0)
highlightHow.Size = UDim2.new(0, 32, 0, 32)
highlightHow.Image = "rbxassetid://75772970732380"
highlightHow.Visible = true

local uichighlighthow = Instance.new("UICorner")
uichighlighthow.Parent = highlightHow
uichighlighthow.CornerRadius = UDim.new(8, 8)

local highlightControl = Instance.new("Frame")
highlightControl.Parent = highlight
highlightControl.Name = "Control"
highlightControl.BackgroundColor3 = Color3.new(0.611765, 0.611765, 0.611765)
highlightControl.Position = UDim2.new(1.309, 0, 0, 0)
highlightControl.Size = UDim2.new(0, 58, 0, 32)
highlightControl.Visible = true

local uichighlightcontrol = Instance.new("UICorner")
uichighlightcontrol.Parent = highlightControl
uichighlightcontrol.CornerRadius = UDim.new(8, 8)

local highlightTurn = Instance.new("TextButton")
highlightTurn.Parent = highlightControl
highlightTurn.Name = "turn"
highlightTurn.BackgroundColor3 = Color3.new(1, 0, 0)
highlightTurn.Position = UDim2.new(0, 0, 0, 0)
highlightTurn.Size = UDim2.new(0, 35, 0, 32)
highlightTurn.Text = ""
highlightTurn.Visible = true

local uichighlightturn = Instance.new("UICorner")
uichighlightturn.Parent = highlightTurn
uichighlightturn.CornerRadius = UDim.new(8, 8)

local VisualSoon = Instance.new("TextLabel")
VisualSoon.Parent = VisualMenu
VisualSoon.Name = "Soon"
VisualSoon.BackgroundColor3 = Color3.new(1, 1, 1)
VisualSoon.Position = UDim2.new(0.037, 0, 0.518, 0)
VisualSoon.Size = UDim2.new(0, 715, 0, 250)
VisualSoon.TextScaled = true
VisualSoon.TextColor3 = Color3.new(0, 0, 0)
VisualSoon.Text = "Soon"
VisualSoon.Visible = true

WorldList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= WorldMenu then
                  a.Visible = false
                  WorldMenu.Visible = true
            end
      end
end)

PlayerList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= PlayerMenu then
                  a.Visible = false
                  PlayerMenu.Visible = true
            end
      end
end)

VisualList.MouseButton1Click:Connect(function()
      for _, a in pairs(Menus:GetChildren()) do
            if a:IsA("Frame") and a ~= VisualMenu then
                  a.Visible = false
                  VisualMenu.Visible = true
            end
      end
end)

FullbrightTurn.MouseButton1Click:Connect(function()
    if functions.FullbrightF == false then
        functions.FullbrightF = true
        local fullbrightinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local fullbrightanim1 = tween:Create(FullbrightTurn, fullbrightinfo1, {Position = UDim2.new(0.388, 0, 0, 0)})
        fullbrightanim1:Play()
        fullbrightanim1.Completed:Connect(function()
            FullbrightTurn.BackgroundColor3 = Color3.new(0.0941176, 0.517647, 0)
        end)
        fullbrightL(1)
     elseif functions.FullbrightF == true then
            functions.FullbrightF = false
            fullbrightL(0)
            local fullbrightinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            local fullbrightanim2 = tween:Create(FullbrightTurn, fullbrightinfo2, {Position = UDim2.new(0, 0, 0, 0)})
            fullbrightanim2:Play()
            fullbrightanim2.Completed:Connect(function()
            FullbrightTurn.BackgroundColor3 = Color3.new(1, 0, 0)
        end)
    end
end)

TurnOpen_doors.MouseButton1Click:Connect(function()
    if functions.AutoOpenDoorsF == false then
        functions.AutoOpenDoorsF = true
        open_doorsL()
        local openDoorsinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local openDoorsanim1 = tween:Create(TurnOpen_doors, openDoorsinfo1, {Position = UDim2.new(0.388, 0, 0, 0)})
        openDoorsanim1:Play()
        openDoorsanim1.Completed:Connect(function()
        TurnOpen_doors.BackgroundColor3 = Color3.new(0.0941176, 0.517647, 0)
        end)
    elseif functions.AutoOpenDoorsF == true then
        functions.AutoOpenDoorsF = false
        remotes.open_doorsRun:Disconnect()
        local openDoorsinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local openDoorsanim2 = tween:Create(TurnOpen_doors, openDoorsinfo2, {Position = UDim2.new(0, 0, 0, 0)})
        openDoorsanim2:Play()
        openDoorsanim2.Completed:Connect(function()
            TurnOpen_doors.BackgroundColor3 = Color3.new(1, 0, 0)
        end)
    end
end)

nobarriersTurn.MouseButton1Click:Connect(function()
    if functions.NoBarriersF == false then
        functions.NoBarriersF = true
        local nobarriersinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local nobarriersanim1 = tween:Create(nobarriersTurn, nobarriersinfo1, {Position = UDim2.new(0.388, 0, 0, 0)})
        nobarriersanim1:Play()
        nobarriersanim1.Completed:Connect(function()
            nobarriersTurn.BackgroundColor3 = Color3.new(0.0941176, 0.517647, 0)
        end)
        nobarriersL(false)
    elseif functions.NoBarriersF == true then
        functions.NoBarriersF = false
        local nobarriersinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local nobarriersanim2 = tween:Create(nobarriersTurn, nobarriersinfo2, {Position = UDim2.new(0, 0, 0, 0)})
        nobarriersanim2:Play()
        nobarriersanim2.Completed:Connect(function()
            nobarriersTurn.BackgroundColor3 = Color3.new(1, 0, 0)
        end)
        nobarriersL(true)
    end
end)

nogrinderTurn.MouseButton1Click:Connect(function()
    if functions.NoGrinderF == false then
        functions.NoGrinderF = true
        local nogrinderinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local nogrinderanim1 = tween:Create(nogrinderTurn, nogrinderinfo1, {Position = UDim2.new(0.388, 0, 0, 0)})
        nogrinderanim1:Play()
        nogrinderanim1.Completed:Connect(function()
            nogrinderTurn.BackgroundColor3 = Color3.new(0.0941176, 0.517647, 0)
        end)
        nogrinderL(false)
    elseif functions.NoGrinderF == true then
        functions.NoGrinderF = false
        local nogrinderinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local nogrinderanim2 = tween:Create(nogrinderTurn, nogrinderinfo2, {Position = UDim2.new(0, 0, 0, 0)})
        nogrinderanim2:Play()
        nogrinderanim2.Completed:Connect(function()
            nogrinderTurn.BackgroundColor3 = Color3.new(1, 0, 0)
        end)
        nogrinderL(true)
    end
end)

local min1 = 0.08 * fovControl.AbsoluteSize.X
local max1 = fovControl.AbsoluteSize.X

local minfov = 30
local maxfov = 120

fovSlider.MouseButton1Down:Connect(function()
    remotes.fovslider_dragging = true
end)

input.InputEnded:Connect(function(check)
    if check.UserInputType == Enum.UserInputType.MouseButton1 then
        remotes.fovslider_dragging = false
    end
end)

input.InputChanged:Connect(function(check2)
    if remotes.fovslider_dragging and check2.UserInputType == Enum.UserInputType.MouseMovement then
        local mousepos = input:GetMouseLocation().X
        local newsize = math.clamp(mousepos - fovControl.AbsolutePosition.X, min1, max1)
        local btnSizeScale = newsize / fovControl.AbsoluteSize.X
        fovSlider.Size = UDim2.new(btnSizeScale, 0, fovSlider.Size.Y.Scale, fovSlider.Size.Y.Offset)
        local fovProgress = (newsize - min1) / (max1 - min1)
        local fov = math.clamp(minfov + (fovProgress * (maxfov - minfov)), minfov, maxfov)
        
        if remotes.fov_connection then
            remotes.fov_connection:Disconnect()
        end
        
        remotes.fov_connection =  run.RenderStepped:Connect(function()
            camera.FieldOfView = fov
        end)
    end
end)

local min2 = 0.08 * gravityControl.AbsoluteSize.X
local max2 = gravityControl.AbsoluteSize.X

local minGravity = 195
local maxGravity = 75

gravitySlider.MouseButton1Down:Connect(function()
      remotes.gravityslider_dragging = true
end)

input.InputEnded:Connect(function(check3)
      if check3.UserInputType == Enum.UserInputType.MouseButton1 then
            remotes.gravityslider_dragging = false
      end
end)

input.InputChanged:Connect(function(check4)
      if remotes.gravityslider_dragging and check4.UserInputType == Enum.UserInputType.MouseMovement then
            local mousepos = input:GetMouseLocation().X
            local newsize = math.clamp(mousepos - gravityControl.AbsolutePosition.X, min2, max2)
            local btnSizeScale = newsize / gravityControl.AbsoluteSize.X
            gravitySlider.Size = UDim2.new(btnSizeScale, 0, gravitySlider.Size.Y.Scale, gravitySlider.Size.Y.Offset)
            local gravityprogress = (newsize - min2) / (max2 - min2)
            local Gravity = math.clamp(minGravity + (gravityprogress * (maxGravity - minGravity)), maxGravity, minGravity)
            game.Workspace.Gravity = Gravity
      end
end)

nofalldamageTurn.MouseButton1Click:Connect(function()
      if functions.nofalldamage == false then
            functions.nofalldamage = true
            local nofalldamegeinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            local nofalldamageanim1 = tween:Create(nofalldamageTurn, nofalldamegeinfo1, {Position = UDim2.new(0.388, 0, 0, 0)})
            nofalldamageanim1:Play()
            nofalldamageanim1.Completed:Connect(function()
                  nofalldamageTurn.BackgroundColor3 = Color3.new(0.0941176, 0.517647, 0)
            end)

            local char1 = me.Character or me.CharacterAdded:Wait()
            local force = Instance.new("ForceField")
            force.Parent = char1
            force.Visible = false

            me.CharacterAdded:Connect(function(newChar)
                  if functions.nofalldamage then
                        local newForce = Instance.new("ForceField")
                        newForce.Parent = newChar
                        newForce.Visible = false
                  end
            end)
      elseif functions.nofalldamage == true then
            functions.nofalldamage = false
            local nofalldamageinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            local nofalldamageanim2 = tween:Create(nofalldamageTurn, nofalldamageinfo2, {Position = UDim2.new(0, 0, 0, 0)})
            nofalldamageanim2:Play()
            nofalldamageanim2.Completed:Connect(function()
                  nofalldamageTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)

            local char2 = me.Character or me.CharacterAdded:Wait()
            local forceField = char2:FindFirstChildOfClass("ForceField")
            if forceField then
                  forceField:Destroy()
            end
      end
end)

highlightTurn.MouseButton1Click:Connect(function()
      if functions.highlight == false then
            functions.highlight = true
            local highlightinfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            local highlightanim1 = tween:Create(highlightTurn, highlightinfo1, {Position = UDim2.new(0.388, 0, 0, 0)})
            highlightanim1:Play()
            highlightanim1.Completed:Connect(function()
                  highlightTurn.BackgroundColor3 = Color3.new(0.0941176, 0.517647, 0)
            end)
            for _, a in pairs(plrs:GetPlayers()) do
                  if a ~= me and functions.highlight and not a.Character:FindFirstChildOfClass("Highlight") then
                        local char = a.Character or a.CharacterAdded:Wait()
                        if char and not char:FindFirstChildOfClass("Highlight") then
                              local highlightload = Instance.new("Highlight")
                              highlightload.Parent = char
                              highlightload.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                              highlightload.FillColor = Color3.new(1, 0, 0)
                              highlightload.FillTransparency = 0.5
                        end
                        a.CharacterAdded:Connect(function(char)
                              if char and functions.highlight then
                                    if not char:FindFirstChildOfClass("Highlight") then
                                          local highlightload = Instance.new("Highlight")
                                          highlightload.Parent = char
                                          highlightload.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                          highlightload.FillColor = Color3.new(1, 0, 0)
                                          highlightload.FillTransparency = 0.5
                                    end
                              end
                        end)
                  end
            end
            plrs.PlayerAdded:Connect(function(newPlayer)
                  newPlayer.CharacterAdded:Connect(function(char)
                        if functions.highlight and not char:FindFirstChildOfClass("Highlight") then
                              local highlightload = Instance.new("Highlight")
                              highlightload.Parent = char
                              highlightload.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                              highlightload.FillColor = Color3.new(1, 0, 0)
                              highlightload.FillTransparency = 0.5
                        end
                  end)
            end)
      elseif functions.highlight == true then
            functions.highlight = false
            local highlightinfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            local highlightanim2 = tween:Create(highlightTurn, highlightinfo2, {Position = UDim2.new(0, 0, 0, 0)})
            highlightanim2:Play()
            highlightanim2.Completed:Connect(function()
                  highlightTurn.BackgroundColor3 = Color3.new(1, 0, 0)
            end)
            for _, a in pairs(plrs:GetPlayers()) do
                  if a ~= me then
                        local char = a.Character or a.CharacterAdded:Wait()
                        local highlight = char:FindFirstChildOfClass("Highlight")
                        if highlight then
                              highlight:Destroy()
                        end
                  end
            end
      end
end)

input.InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.Insert then
        if mainframe.Visible == true then
            mainframe.Visible = false
        else
            mainframe.Visible = true
        end
    end
end)

local cfg1 = {
	Rotation = 360
}

uiguist.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0.0, Color3.new(1, 0, 0.0156863)),
	ColorSequenceKeypoint.new(0.2, Color3.new(0.933333, 0.0235294, 1)),
	ColorSequenceKeypoint.new(0.4, Color3.new(0, 0.0156863, 1)),
	ColorSequenceKeypoint.new(0.6, Color3.new(0.0666667, 1, 0)),
	ColorSequenceKeypoint.new(0.8, Color3.new(1, 0.933333, 0.00392157)),
	ColorSequenceKeypoint.new(1, Color3.new(0.00392157, 1, 0.933333))
})

uigb.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0.0, Color3.new(0.729412, 0.231373, 0)),
	ColorSequenceKeypoint.new(0.2, Color3.new(0.729412, 0.231373, 0)),
	ColorSequenceKeypoint.new(0.4, Color3.new(0.729412, 0.231373, 0)),
	ColorSequenceKeypoint.new(0.6, Color3.new(1, 1, 1)),
	ColorSequenceKeypoint.new(0.8, Color3.new(1, 1, 1)),
	ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
})

local bittween = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 3 , true)
local bittweenanim = tween:Create(uiguist, bittween, cfg1)
bittweenanim:Play()

bittweenanim.Completed:Connect(function()
	beta.TextColor3 = Color3.new(1, 1, 1)
	local uitextinfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 3, true)
	local uitextanim = tween:Create(uigb, uitextinfo, cfg1)
	uitextanim:Play()
	uiguist.Enabled = false
	uitextanim.Completed:Connect(function()
		beta.TextColor3 = Color3.new(0, 0, 0)
		uiguist.Enabled = true
		bittweenanim:Play()
	end)
end)
