local plrs = game:GetService("Players")
local me = plrs.LocalPlayer
local tween = game:GetService("TweenService")
local light = game:GetService("Lighting")
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")

local functions = {
    FullbrightF = false;
    AutoOpenDoorsF = false;
    NoBarriersF = false;
    NoGrinderF = false;
    anti_voidF = false
}

local remotes = {
    open_doorsRun;
}

local function fullbrightL(value)
    light.ExposureCompensation = value
end

local function open_doorsL()
        remotes.open_doorsRun = run.RenderStepped:Connect(function()
        for _, i in pairs(game.Workspace.Map.Doors:GetChildren()) do
            if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v:FindFirstChild("DoorBase").Position).Magnitude <= 20 then
                if i:FindFirstChild("Values"):FindFirstChild("Locked").Value == true then
                    i:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer("Unlock", i.Lock)
                    i:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer("Open", i.Lock)
                end
            end
        end
    end)
end

local Gui = Instance.new("ScreenGui")
Gui.Parent = me.PlayerGui
Gui.Name = "New"
Gui.Enabled = true
Gui.ResetOnSpawn = true

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
consoletext.Text = "output - soon"
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
VisualList.Text = "Visual (soon)"
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
fovSlider.Text = "0/0"
fovSlider.Visible = true

local uicfovslider = Instance.new("UICorner")
uicfovslider.Parent = fovSlider
uicfovslider.CornerRadius = UDim.new(8, 8)

WorldList.MouseButton1Click:Connect(function()
    if WorldMenu.Visible == false then
       WorldMenu.Visible = true
       PlayerMenu.Visible = false
    else
        return nil
    end
end)

PlayerList.MouseButton1Click:Connect(function()
    if PlayerMenu.Visible == false then
        PlayerMenu.Visible = true
        WorldMenu.Visible = false
    else
        return nil
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
        fullbrightL(0.5)
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
