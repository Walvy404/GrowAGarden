--[[
    Script: Walvy Community GUI
    Description: A versatile GUI script with a key system, free/premium menus, and dynamic UI creation.
    Features: Draggable, Minimizable, Closable, Color Themed.
]]

--================================================================--
-- GUI ELEMENTS
--================================================================--
-- Free Menu UI for Roblox - Gaming Interface Style
-- Based on the provided interface design

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Create main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FreeMenuUI"
ScreenGui.ResetOnSpawn = false

-- Choose safe parent
local parentGui = game.CoreGui
pcall(function()
    if player then
        parentGui = player:FindFirstChild("PlayerGui") or game.CoreGui
    end
end)
ScreenGui.Parent = parentGui

-- Main container frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 800, 0, 600)
MainFrame.Active = true
MainFrame.Draggable = true

-- Add corner rounding
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 50)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Speed Hub X | Version 5.4.7 | Free Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- Main content area
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 50)
ContentFrame.Size = UDim2.new(1, 0, 1, -50)

-- Left navigation panel
local NavPanel = Instance.new("Frame")
NavPanel.Name = "NavPanel"
NavPanel.Parent = ContentFrame
NavPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
NavPanel.BorderSizePixel = 0
NavPanel.Size = UDim2.new(0, 250, 1, 0)

local NavCorner = Instance.new("UICorner")
NavCorner.CornerRadius = UDim.new(0, 5)
NavCorner.Parent = NavPanel

-- Navigation list
local NavList = Instance.new("ScrollingFrame")
NavList.Parent = NavPanel
NavList.BackgroundTransparency = 1
NavList.Position = UDim2.new(0, 10, 0, 10)
NavList.Size = UDim2.new(1, -20, 1, -20)
NavList.ScrollBarThickness = 6
NavList.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)

-- Right content panel
local RightPanel = Instance.new("Frame")
RightPanel.Name = "RightPanel"
RightPanel.Parent = ContentFrame
RightPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
RightPanel.BorderSizePixel = 0
RightPanel.Position = UDim2.new(0, 260, 0, 0)
RightPanel.Size = UDim2.new(1, -270, 1, 0)

local RightCorner = Instance.new("UICorner")
RightCorner.CornerRadius = UDim.new(0, 5)
RightCorner.Parent = RightPanel

-- Function to create navigation buttons
local function createNavButton(parent, text, icon, yPos)
    local NavButton = Instance.new("TextButton")
    NavButton.Parent = parent
    NavButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    NavButton.Position = UDim2.new(0, 0, 0, yPos)
    NavButton.Size = UDim2.new(1, 0, 0, 35)
    NavButton.Font = Enum.Font.Gotham
    NavButton.Text = "  " .. icon .. "  " .. text
    NavButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    NavButton.TextSize = 14
    NavButton.TextXAlignment = Enum.TextXAlignment.Left
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 5)
    ButtonCorner.Parent = NavButton
    
    -- Hover effect
    NavButton.MouseEnter:Connect(function()
        local tween = TweenService:Create(NavButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})
        tween:Play()
    end)
    
    NavButton.MouseLeave:Connect(function()
        local tween = TweenService:Create(NavButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
        tween:Play()
    end)
    
    return NavButton
end

-- Function to create dropdown
local function createDropdown(parent, text, options, yPos)
    local DropdownFrame = Instance.new("Frame")
    DropdownFrame.Parent = parent
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    DropdownFrame.Position = UDim2.new(0, 20, 0, yPos)
    DropdownFrame.Size = UDim2.new(1, -40, 0, 35)
    
    local DropdownCorner = Instance.new("UICorner")
    DropdownCorner.CornerRadius = UDim.new(0, 5)
    DropdownCorner.Parent = DropdownFrame
    
    local DropdownButton = Instance.new("TextButton")
    DropdownButton.Parent = DropdownFrame
    DropdownButton.BackgroundTransparency = 1
    DropdownButton.Size = UDim2.new(1, 0, 1, 0)
    DropdownButton.Font = Enum.Font.Gotham
    DropdownButton.Text = text .. "  â–¼"
    DropdownButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    DropdownButton.TextSize = 12
    DropdownButton.TextXAlignment = Enum.TextXAlignment.Left
    
    local DropdownList = Instance.new("Frame")
    DropdownList.Parent = DropdownFrame
    DropdownList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    DropdownList.Position = UDim2.new(0, 0, 1, 5)
    DropdownList.Size = UDim2.new(1, 0, 0, #options * 30)
    DropdownList.Visible = false
    
    local DropdownListCorner = Instance.new("UICorner")
    DropdownListCorner.CornerRadius = UDim.new(0, 5)
    DropdownListCorner.Parent = DropdownList
    
    for i, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Parent = DropdownList
        OptionButton.BackgroundTransparency = 1
        OptionButton.Position = UDim2.new(0, 0, 0, (i-1) * 30)
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.Font = Enum.Font.Gotham
        OptionButton.Text = "  " .. option
        OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptionButton.TextSize = 11
        OptionButton.TextXAlignment = Enum.TextXAlignment.Left
        
        OptionButton.MouseEnter:Connect(function()
            OptionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            OptionButton.BackgroundTransparency = 0
        end)
        
        OptionButton.MouseLeave:Connect(function()
            OptionButton.BackgroundTransparency = 1
        end)
        
        OptionButton.MouseButton1Click:Connect(function()
            DropdownButton.Text = text .. ": " .. option .. "  â–¼"
            DropdownList.Visible = false
        end)
    end
    
    DropdownButton.MouseButton1Click:Connect(function()
        DropdownList.Visible = not DropdownList.Visible
    end)
    
    return DropdownFrame
end

-- Create navigation menu items
local homeButton = createNavButton(NavList, "Home", "ðŸ ", 0)
local mainButton = createNavButton(NavList, "Main", "ðŸ“‹", 45)
local autoButton = createNavButton(NavList, "Automatically", "âš™ï¸", 90)
local inventoryButton = createNavButton(NavList, "Inventory", "ðŸŽ’", 135)
local shopButton = createNavButton(NavList, "Shop", "ðŸ›’", 180)
local miscButton = createNavButton(NavList, "Misc", "ðŸ”§", 225)
local settingsButton = createNavButton(NavList, "Settings", "âš™ï¸", 270)
local settingsUIButton = createNavButton(NavList, "Settings UI", "ðŸŽ¨", 315)

-- Main content panels
local panels = {}

-- Home panel
panels.Home = Instance.new("Frame")
panels.Home.Name = "HomePanel"
panels.Home.Parent = RightPanel
panels.Home.BackgroundTransparency = 1
panels.Home.Size = UDim2.new(1, 0, 1, 0)

local HomeTitle = Instance.new("TextLabel")
HomeTitle.Parent = panels.Home
HomeTitle.BackgroundTransparency = 1
HomeTitle.Position = UDim2.new(0, 20, 0, 20)
HomeTitle.Size = UDim2.new(1, -40, 0, 40)
HomeTitle.Font = Enum.Font.GothamBold
HomeTitle.Text = "Welcome to Free Menu"
HomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeTitle.TextSize = 24
HomeTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Main panel with automation features
panels.Main = Instance.new("ScrollingFrame")
panels.Main.Name = "MainPanel"
panels.Main.Parent = RightPanel
panels.Main.BackgroundTransparency = 1
panels.Main.Size = UDim2.new(1, 0, 1, 0)
panels.Main.ScrollBarThickness = 6
panels.Main.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
panels.Main.Visible = false

local MainTitle = Instance.new("TextLabel")
MainTitle.Parent = panels.Main
MainTitle.BackgroundTransparency = 1
MainTitle.Position = UDim2.new(0, 20, 0, 20)
MainTitle.Size = UDim2.new(1, -40, 0, 40)
MainTitle.Font = Enum.Font.GothamBold
MainTitle.Text = "Main"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 24
MainTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Automation Plants section
local AutoPlantsLabel = Instance.new("TextLabel")
AutoPlantsLabel.Parent = panels.Main
AutoPlantsLabel.BackgroundTransparency = 1
AutoPlantsLabel.Position = UDim2.new(0, 20, 0, 80)
AutoPlantsLabel.Size = UDim2.new(1, -40, 0, 30)
AutoPlantsLabel.Font = Enum.Font.GothamBold
AutoPlantsLabel.Text = "Automation Plants                                           >"
AutoPlantsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoPlantsLabel.TextSize = 16
AutoPlantsLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Automation Collection section
local AutoCollectionLabel = Instance.new("TextLabel")
AutoCollectionLabel.Parent = panels.Main
AutoCollectionLabel.BackgroundTransparency = 1
AutoCollectionLabel.Position = UDim2.new(0, 20, 0, 120)
AutoCollectionLabel.Size = UDim2.new(1, -40, 0, 30)
AutoCollectionLabel.Font = Enum.Font.GothamBold
AutoCollectionLabel.Text = "Automation Collection                                    >"
AutoCollectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoCollectionLabel.TextSize = 16
AutoCollectionLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Automation Sprinkler section
local AutoSprinklerLabel = Instance.new("TextLabel")
AutoSprinklerLabel.Parent = panels.Main
AutoSprinklerLabel.BackgroundTransparency = 1
AutoSprinklerLabel.Position = UDim2.new(0, 20, 0, 160)
AutoSprinklerLabel.Size = UDim2.new(1, -40, 0, 30)
AutoSprinklerLabel.Font = Enum.Font.GothamBold
AutoSprinklerLabel.Text = "Automation Sprinkler                                     â–¼"
AutoSprinklerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoSprinklerLabel.TextSize = 16
AutoSprinklerLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Sprinkler dropdowns
local sprinklerDropdown = createDropdown(panels.Main, "Select Sprinkler", {"Sprinkler x26", "Sprinkler x39", "Sprinkler x21", "Trowel (12x Use)"}, 200)
local plantsDropdown = createDropdown(panels.Main, "Select Plants", {"Carrot", "Potato", "Corn", "Tomato", "Wheat"}, 250)
local positionDropdown = createDropdown(panels.Main, "Select Position", {"Position 1", "Position 2", "Position 3", "Auto Position"}, 300)

-- Function to switch panels
local function switchPanel(panelName)
    for name, panel in pairs(panels) do
        panel.Visible = (name == panelName)
    end
end

-- Button connections
homeButton.MouseButton1Click:Connect(function()
    switchPanel("Home")
end)

mainButton.MouseButton1Click:Connect(function()
    switchPanel("Main")
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Initialize with Home panel
switchPanel("Home")

-- Status label at bottom
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
StatusLabel.Position = UDim2.new(0, 0, 1, -30)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Status: Ready | Free Menu Active"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusLabel.TextSize = 12

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 5)
StatusCorner.Parent = StatusLabel

print("Free Menu UI loaded successfully!")
-- Main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Key System Frame
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Parent = screenGui
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.Size = UDim2.new(0, 300, 0, 150)
keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
keyFrame.BackgroundColor3 = Color3.fromRGB(25, 28, 41)
keyFrame.BorderSizePixel = 0
local keyFrameCorner = Instance.new("UICorner", keyFrame)
keyFrameCorner.CornerRadius = UDim.new(0, 8)

local keyTitle = Instance.new("TextLabel")
keyTitle.Name = "KeyTitle"
keyTitle.Parent = keyFrame
keyTitle.Size = UDim2.new(1, 0, 0, 30)
keyTitle.Text = "Enter Key"
keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTitle.Font = Enum.Font.SourceSansBold
keyTitle.TextSize = 18
keyTitle.BackgroundTransparency = 1

local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.Parent = keyFrame
keyInput.Size = UDim2.new(0, 260, 0, 40)
keyInput.Position = UDim2.new(0.5, -130, 0, 40)
keyInput.PlaceholderText = "Your Key"
keyInput.Font = Enum.Font.SourceSans
keyInput.TextSize = 16

local submitKeyButton = Instance.new("TextButton")
submitKeyButton.Name = "SubmitKeyButton"
submitKeyButton.Parent = keyFrame
submitKeyButton.Size = UDim2.new(0, 100, 0, 40)
submitKeyButton.Position = UDim2.new(0.5, -50, 0, 90)
submitKeyButton.Text = "Submit"
submitKeyButton.Font = Enum.Font.SourceSansBold
submitKeyButton.TextSize = 18
submitKeyButton.BackgroundColor3 = Color3.fromRGB(50, 58, 82)
submitKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local submitKeyButtonCorner = Instance.new("UICorner", submitKeyButton)
submitKeyButtonCorner.CornerRadius = UDim.new(0, 8)

-- Menu Selection Frame
local selectionFrame = Instance.new("Frame")
selectionFrame.Name = "SelectionFrame"
selectionFrame.Parent = screenGui
selectionFrame.AnchorPoint = Vector2.new(0.5, 0.5)
selectionFrame.Size = UDim2.new(0, 300, 0, 150)
selectionFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
selectionFrame.BackgroundColor3 = Color3.fromRGB(25, 28, 41)
selectionFrame.BorderSizePixel = 0
selectionFrame.Visible = false
local selectionFrameCorner = Instance.new("UICorner", selectionFrame)
selectionFrameCorner.CornerRadius = UDim.new(0, 8)

local selectionTitle = Instance.new("TextLabel")
selectionTitle.Name = "SelectionTitle"
selectionTitle.Parent = selectionFrame
selectionTitle.Size = UDim2.new(1, 0, 0, 30)
selectionTitle.Text = "Select Menu"
selectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
selectionTitle.Font = Enum.Font.SourceSansBold
selectionTitle.TextSize = 18
selectionTitle.BackgroundTransparency = 1

local freeMenuButton = Instance.new("TextButton")
freeMenuButton.Name = "FreeMenuButton"
freeMenuButton.Parent = selectionFrame
freeMenuButton.Size = UDim2.new(0, 120, 0, 50)
freeMenuButton.Position = UDim2.new(0.5, -130, 0.5, -25)
freeMenuButton.Text = "Free Menu"
freeMenuButton.Font = Enum.Font.SourceSansBold
freeMenuButton.TextSize = 18
freeMenuButton.BackgroundColor3 = Color3.fromRGB(50, 58, 82)
freeMenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local freeMenuButtonCorner = Instance.new("UICorner", freeMenuButton)
freeMenuButtonCorner.CornerRadius = UDim.new(0, 8)

local premiumMenuButton = Instance.new("TextButton")
premiumMenuButton.Name = "PremiumMenuButton"
premiumMenuButton.Parent = selectionFrame
premiumMenuButton.Size = UDim2.new(0, 120, 0, 50)
premiumMenuButton.Position = UDim2.new(0.5, 10, 0.5, -25)
premiumMenuButton.Text = "Premium Menu"
premiumMenuButton.Font = Enum.Font.SourceSansBold
premiumMenuButton.TextSize = 18
premiumMenuButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0) -- Gold color for premium
premiumMenuButton.TextColor3 = Color3.fromRGB(0, 0, 0)
local premiumMenuButtonCorner = Instance.new("UICorner", premiumMenuButton)
premiumMenuButtonCorner.CornerRadius = UDim.new(0, 8)

-- Discord Notification
local discordNotification = Instance.new("Frame")
discordNotification.Name = "DiscordNotification"
discordNotification.Parent = screenGui
discordNotification.AnchorPoint = Vector2.new(0.5, 0)
discordNotification.Size = UDim2.new(0, 300, 0, 60)
discordNotification.Position = UDim2.new(0.5, 0, 0, 10) -- Tengah atas
discordNotification.BackgroundColor3 = Color3.fromRGB(25, 28, 41)
discordNotification.Visible = false
local discordCorner = Instance.new("UICorner", discordNotification)
discordCorner.CornerRadius = UDim.new(0, 8)

local discordTitle = Instance.new("TextLabel")
discordTitle.Parent = discordNotification
discordTitle.Size = UDim2.new(1, 0, 0.5, 0)
discordTitle.Text = "Join our Discord!"
discordTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
discordTitle.Font = Enum.Font.SourceSansBold
discordTitle.TextSize = 18
discordTitle.BackgroundTransparency = 1

local discordLink = Instance.new("TextButton")
discordLink.Parent = discordNotification
discordLink.Size = UDim2.new(0, 200, 0, 30)
discordLink.Position = UDim2.new(0.5, -100, 0.5, 0)
discordLink.Text = "Click to copy link"
discordLink.Font = Enum.Font.SourceSans
discordLink.TextSize = 16
discordLink.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordLink.TextColor3 = Color3.fromRGB(255, 255, 255)
local discordLinkCorner = Instance.new("UICorner", discordLink)
discordLinkCorner.CornerRadius = UDim.new(0, 8)

-- Reopen Button (for after minimizing)
local reopenButton = Instance.new("TextButton")
reopenButton.Name = "ReopenButton"
reopenButton.Parent = screenGui
reopenButton.Size = UDim2.new(0, 100, 0, 40)
reopenButton.Position = UDim2.new(1, -110, 0, 10)
reopenButton.Text = "Open Menu"
reopenButton.Font = Enum.Font.SourceSansBold
reopenButton.TextSize = 16
reopenButton.BackgroundColor3 = Color3.fromRGB(50, 58, 82)
reopenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
reopenButton.Visible = false
local reopenButtonCorner = Instance.new("UICorner", reopenButton)
reopenButtonCorner.CornerRadius = UDim.new(0, 8)


--================================================================--
-- CORE LOGIC & FUNCTIONS
--================================================================--

local lastActiveFrame = nil
local correctKey = "WalvyKey"

-- Creates the base structure for a menu window
function createBaseMenu()
    local menuFrame = Instance.new("Frame")
    menuFrame.Name = "MenuFrame"
    menuFrame.Parent = screenGui
    menuFrame.Visible = true
    menuFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    menuFrame.Size = UDim2.new(0, 600, 0, 500)
    menuFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    menuFrame.BackgroundColor3 = Color3.fromRGB(25, 28, 41)
    menuFrame.BorderSizePixel = 0
    menuFrame.Draggable = true
    menuFrame.Active = true
    local cornerRadius = Instance.new("UICorner", menuFrame)
    cornerRadius.CornerRadius = UDim.new(0, 8)

    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Parent = menuFrame
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(35, 38, 51)
    titleBar.BorderSizePixel = 0
    local titleCorner = Instance.new("UICorner", titleBar)
    titleCorner.CornerRadius = UDim.new(0, 8)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = titleBar
    titleLabel.Size = UDim2.new(1, -60, 1, 0)
    titleLabel.Text = "Walvy Community"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Position = UDim2.new(0, 10, 0, 0)

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Parent = titleBar
    minimizeButton.Size = UDim2.new(0, 30, 1, 0)
    minimizeButton.Position = UDim2.new(1, -60, 0, 0)
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 38, 51)
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.TextSize = 24
    local minimizeCorner = Instance.new("UICorner", minimizeButton)
    minimizeCorner.CornerRadius = UDim.new(0, 8)
    minimizeButton.MouseButton1Click:Connect(function()
        menuFrame.Visible = false
        reopenButton.Visible = true
    end)

    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Parent = titleBar
    closeButton.Size = UDim2.new(0, 30, 1, 0)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 20
    local closeButtonCorner = Instance.new("UICorner", closeButton)
    closeButtonCorner.CornerRadius = UDim.new(0, 8)
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    return menuFrame
end

-- Creates the Free Menu
function createFreeMenu()
    local freeMenuFrame = createBaseMenu()
    freeMenuFrame.Name = "FreeMenuFrame"
    freeMenuFrame.TitleBar.TitleLabel.Text = "Free Menu"

    -- Menu gratis sengaja dikosongkan sesuai permintaan

    lastActiveFrame = freeMenuFrame
end

-- Creates the Premium Menu
function createPremiumMenu()
    local premiumMenuFrame = createBaseMenu()
    premiumMenuFrame.Name = "PremiumMenuFrame"
    premiumMenuFrame.TitleBar.TitleLabel.Text = "Premium Menu"

    -- Menu premium sengaja dikosongkan sesuai permintaan

    lastActiveFrame = premiumMenuFrame
end


--================================================================--
-- EVENT CONNECTIONS
--================================================================--

-- Key submission
submitKeyButton.MouseButton1Click:Connect(function()
	if keyInput.Text == correctKey then
		keyFrame:Destroy()
		selectionFrame.Visible = true
		discordNotification.Visible = true
	else
		keyInput.Text = "Incorrect Key"
	end
end)

-- Menu selection
freeMenuButton.MouseButton1Click:Connect(function()
	selectionFrame:Destroy()
	createFreeMenu()
end)

premiumMenuButton.MouseButton1Click:Connect(function()
	selectionFrame:Destroy()
	createPremiumMenu()
end)

-- Reopen after minimize
reopenButton.MouseButton1Click:Connect(function()
    if lastActiveFrame then
        lastActiveFrame.Visible = true
    end
    reopenButton.Visible = false
end)

-- Discord link click
discordLink.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://discord.gg/your-invite-link") -- Ganti dengan tautan Discord Anda
	end
	discordNotification:Destroy()
end)
-- Free Menu Loader Script
-- Execute this script to load the Free Menu UI

print("Loading Free Menu UI...")

-- Check if the UI is already loaded
local existingUI = game.CoreGui:FindFirstChild("FreeMenuUI")
if existingUI then
    existingUI:Destroy()
    print("Removed existing Free Menu UI")
    wait(0.1)
end

-- Load the Free Menu UI
loadstring(game:HttpGet("https://raw.githubusercontent.com/your-repo/free_menu_ui.lua"))()

-- Alternative: If you have the script locally, uncomment the line below
-- loadstring(readfile("free_menu_ui.lua"))()

print("Free Menu UI loaded successfully!")
print("Press the navigation buttons to explore different sections.")
-- Free Menu UI for Roblox - Gaming Interface Style
-- Based on the provided interface design

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Create main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FreeMenuUI"
ScreenGui.ResetOnSpawn = false

-- Choose safe parent
local parentGui = game.CoreGui
pcall(function()
    if player then
        parentGui = player:FindFirstChild("PlayerGui") or game.CoreGui
    end
end)
ScreenGui.Parent = parentGui

-- Main container frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 800, 0, 600)
MainFrame.Active = true
MainFrame.Draggable = true

-- Add corner rounding
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 50)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Speed Hub X | Version 5.4.7 | Free Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

-- Main content area
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 50)
ContentFrame.Size = UDim2.new(1, 0, 1, -50)

-- Left navigation panel
local NavPanel = Instance.new("Frame")
NavPanel.Name = "NavPanel"
NavPanel.Parent = ContentFrame
NavPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
NavPanel.BorderSizePixel = 0
NavPanel.Size = UDim2.new(0, 250, 1, 0)

local NavCorner = Instance.new("UICorner")
NavCorner.CornerRadius = UDim.new(0, 5)
NavCorner.Parent = NavPanel

-- Navigation list
local NavList = Instance.new("ScrollingFrame")
NavList.Parent = NavPanel
NavList.BackgroundTransparency = 1
NavList.Position = UDim2.new(0, 10, 0, 10)
NavList.Size = UDim2.new(1, -20, 1, -20)
NavList.ScrollBarThickness = 6
NavList.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)

-- Right content panel
local RightPanel = Instance.new("Frame")
RightPanel.Name = "RightPanel"
RightPanel.Parent = ContentFrame
RightPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
RightPanel.BorderSizePixel = 0
RightPanel.Position = UDim2.new(0, 260, 0, 0)
RightPanel.Size = UDim2.new(1, -270, 1, 0)

local RightCorner = Instance.new("UICorner")
RightCorner.CornerRadius = UDim.new(0, 5)
RightCorner.Parent = RightPanel

-- Function to create navigation buttons
local function createNavButton(parent, text, icon, yPos)
    local NavButton = Instance.new("TextButton")
    NavButton.Parent = parent
    NavButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    NavButton.Position = UDim2.new(0, 0, 0, yPos)
    NavButton.Size = UDim2.new(1, 0, 0, 35)
    NavButton.Font = Enum.Font.Gotham
    NavButton.Text = "  " .. icon .. "  " .. text
    NavButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    NavButton.TextSize = 14
    NavButton.TextXAlignment = Enum.TextXAlignment.Left
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 5)
    ButtonCorner.Parent = NavButton
    
    -- Hover effect
    NavButton.MouseEnter:Connect(function()
        local tween = TweenService:Create(NavButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})
        tween:Play()
    end)
    
    NavButton.MouseLeave:Connect(function()
        local tween = TweenService:Create(NavButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
        tween:Play()
    end)
    
    return NavButton
end

-- Function to create dropdown
local function createDropdown(parent, text, options, yPos)
    local DropdownFrame = Instance.new("Frame")
    DropdownFrame.Parent = parent
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    DropdownFrame.Position = UDim2.new(0, 20, 0, yPos)
    DropdownFrame.Size = UDim2.new(1, -40, 0, 35)
    
    local DropdownCorner = Instance.new("UICorner")
    DropdownCorner.CornerRadius = UDim.new(0, 5)
    DropdownCorner.Parent = DropdownFrame
    
    local DropdownButton = Instance.new("TextButton")
    DropdownButton.Parent = DropdownFrame
    DropdownButton.BackgroundTransparency = 1
    DropdownButton.Size = UDim2.new(1, 0, 1, 0)
    DropdownButton.Font = Enum.Font.Gotham
    DropdownButton.Text = text .. "  ▼"
    DropdownButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    DropdownButton.TextSize = 12
    DropdownButton.TextXAlignment = Enum.TextXAlignment.Left
    
    local DropdownList = Instance.new("Frame")
    DropdownList.Parent = DropdownFrame
    DropdownList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    DropdownList.Position = UDim2.new(0, 0, 1, 5)
    DropdownList.Size = UDim2.new(1, 0, 0, #options * 30)
    DropdownList.Visible = false
    
    local DropdownListCorner = Instance.new("UICorner")
    DropdownListCorner.CornerRadius = UDim.new(0, 5)
    DropdownListCorner.Parent = DropdownList
    
    for i, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Parent = DropdownList
        OptionButton.BackgroundTransparency = 1
        OptionButton.Position = UDim2.new(0, 0, 0, (i-1) * 30)
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.Font = Enum.Font.Gotham
        OptionButton.Text = "  " .. option
        OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptionButton.TextSize = 11
        OptionButton.TextXAlignment = Enum.TextXAlignment.Left
        
        OptionButton.MouseEnter:Connect(function()
            OptionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            OptionButton.BackgroundTransparency = 0
        end)
        
        OptionButton.MouseLeave:Connect(function()
            OptionButton.BackgroundTransparency = 1
        end)
        
        OptionButton.MouseButton1Click:Connect(function()
            DropdownButton.Text = text .. ": " .. option .. "  ▼"
            DropdownList.Visible = false
        end)
    end
    
    DropdownButton.MouseButton1Click:Connect(function()
        DropdownList.Visible = not DropdownList.Visible
    end)
    
    return DropdownFrame
end

-- Create navigation menu items
local homeButton = createNavButton(NavList, "Home", "🏠", 0)
local mainButton = createNavButton(NavList, "Main", "📋", 45)
local autoButton = createNavButton(NavList, "Automatically", "⚙️", 90)
local inventoryButton = createNavButton(NavList, "Inventory", "🎒", 135)
local shopButton = createNavButton(NavList, "Shop", "🛒", 180)
local miscButton = createNavButton(NavList, "Misc", "🔧", 225)
local settingsButton = createNavButton(NavList, "Settings", "⚙️", 270)
local settingsUIButton = createNavButton(NavList, "Settings UI", "🎨", 315)

-- Main content panels
local panels = {}

-- Home panel
panels.Home = Instance.new("Frame")
panels.Home.Name = "HomePanel"
panels.Home.Parent = RightPanel
panels.Home.BackgroundTransparency = 1
panels.Home.Size = UDim2.new(1, 0, 1, 0)

local HomeTitle = Instance.new("TextLabel")
HomeTitle.Parent = panels.Home
HomeTitle.BackgroundTransparency = 1
HomeTitle.Position = UDim2.new(0, 20, 0, 20)
HomeTitle.Size = UDim2.new(1, -40, 0, 40)
HomeTitle.Font = Enum.Font.GothamBold
HomeTitle.Text = "Welcome to Free Menu"
HomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeTitle.TextSize = 24
HomeTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Main panel with automation features
panels.Main = Instance.new("ScrollingFrame")
panels.Main.Name = "MainPanel"
panels.Main.Parent = RightPanel
panels.Main.BackgroundTransparency = 1
panels.Main.Size = UDim2.new(1, 0, 1, 0)
panels.Main.ScrollBarThickness = 6
panels.Main.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
panels.Main.Visible = false

local MainTitle = Instance.new("TextLabel")
MainTitle.Parent = panels.Main
MainTitle.BackgroundTransparency = 1
MainTitle.Position = UDim2.new(0, 20, 0, 20)
MainTitle.Size = UDim2.new(1, -40, 0, 40)
MainTitle.Font = Enum.Font.GothamBold
MainTitle.Text = "Main"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 24
MainTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Automation Plants section
local AutoPlantsLabel = Instance.new("TextLabel")
AutoPlantsLabel.Parent = panels.Main
AutoPlantsLabel.BackgroundTransparency = 1
AutoPlantsLabel.Position = UDim2.new(0, 20, 0, 80)
AutoPlantsLabel.Size = UDim2.new(1, -40, 0, 30)
AutoPlantsLabel.Font = Enum.Font.GothamBold
AutoPlantsLabel.Text = "Automation Plants                                           >"
AutoPlantsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoPlantsLabel.TextSize = 16
AutoPlantsLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Automation Collection section
local AutoCollectionLabel = Instance.new("TextLabel")
AutoCollectionLabel.Parent = panels.Main
AutoCollectionLabel.BackgroundTransparency = 1
AutoCollectionLabel.Position = UDim2.new(0, 20, 0, 120)
AutoCollectionLabel.Size = UDim2.new(1, -40, 0, 30)
AutoCollectionLabel.Font = Enum.Font.GothamBold
AutoCollectionLabel.Text = "Automation Collection                                    >"
AutoCollectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoCollectionLabel.TextSize = 16
AutoCollectionLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Automation Sprinkler section
local AutoSprinklerLabel = Instance.new("TextLabel")
AutoSprinklerLabel.Parent = panels.Main
AutoSprinklerLabel.BackgroundTransparency = 1
AutoSprinklerLabel.Position = UDim2.new(0, 20, 0, 160)
AutoSprinklerLabel.Size = UDim2.new(1, -40, 0, 30)
AutoSprinklerLabel.Font = Enum.Font.GothamBold
AutoSprinklerLabel.Text = "Automation Sprinkler                                     ▼"
AutoSprinklerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoSprinklerLabel.TextSize = 16
AutoSprinklerLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Sprinkler dropdowns
local sprinklerDropdown = createDropdown(panels.Main, "Select Sprinkler", {"Sprinkler x26", "Sprinkler x39", "Sprinkler x21", "Trowel (12x Use)"}, 200)
local plantsDropdown = createDropdown(panels.Main, "Select Plants", {"Carrot", "Potato", "Corn", "Tomato", "Wheat"}, 250)
local positionDropdown = createDropdown(panels.Main, "Select Position", {"Position 1", "Position 2", "Position 3", "Auto Position"}, 300)

-- Function to switch panels
local function switchPanel(panelName)
    for name, panel in pairs(panels) do
        panel.Visible = (name == panelName)
    end
end

-- Button connections
homeButton.MouseButton1Click:Connect(function()
    switchPanel("Home")
end)

mainButton.MouseButton1Click:Connect(function()
    switchPanel("Main")
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Initialize with Home panel
switchPanel("Home")

-- Status label at bottom
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
StatusLabel.Position = UDim2.new(0, 0, 1, -30)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Status: Ready | Free Menu Active"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusLabel.TextSize = 12

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 5)
StatusCorner.Parent = StatusLabel

print("Free Menu UI loaded successfully!")
