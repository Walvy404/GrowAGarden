-- Membuat ScreenGui untuk menampung semua elemen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame untuk sistem kunci
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Parent = screenGui
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.Size = UDim2.new(0, 300, 0, 150)
keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
keyFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
keyFrame.BorderSizePixel = 0
local keyFrameCorner = Instance.new("UICorner")
keyFrameCorner.CornerRadius = UDim.new(0, 8)
keyFrameCorner.Parent = keyFrame

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
submitKeyButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
submitKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local submitKeyButtonCorner = Instance.new("UICorner")
submitKeyButtonCorner.CornerRadius = UDim.new(0, 8)
submitKeyButtonCorner.Parent = submitKeyButton

-- Membuat Frame utama sebagai jendela
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.Visible = false -- Sembunyikan pada awalnya
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Size = UDim2.new(0, 27000, 0, 2800)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 0
freeMenuFrame.Name = "FreeMenuFrame"
freeMenuFrame.Parent = screenGui
freeMenuFrame.Visible = true
freeMenuFrame.TitleLabel.Text = "Free Menu"

-- Menambahkan pembulatan sudut pada frame utama
local cornerRadius = Instance.new("UICorner")
cornerRadius.CornerRadius = UDim.new(0, 8)
cornerRadius.Parent = mainFrame

-- Membuat bar judul
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Parent = mainFrame
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0

-- Menambahkan pembulatan sudut pada bar judul
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

-- Membuat judul teks
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = titleBar
titleLabel.Size = UDim2.new(1, -30, 1, 0)
titleLabel.Text = "My GUI"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Position = UDim2.new(0, 10, 0, 0)

-- Membuat tombol minimize
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Parent = titleBar
minimizeButton.Size = UDim2.new(0, 30, 1, 0)
minimizeButton.Position = UDim2.new(1, -30, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 24
minimizeButton.BorderSizePixel = 0

-- Menambahkan pembulatan sudut pada tombol minimize
local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 8)
minimizeCorner.Parent = minimizeButton

-- Efek hover pada tombol minimize
minimizeButton.MouseEnter:Connect(function()
	minimizeButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
end)

minimizeButton.MouseLeave:Connect(function()
	minimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
end)

-- Membuat teks "Walvy Community"
local communityLabel = Instance.new("TextLabel")
communityLabel.Name = "CommunityLabel"
communityLabel.Parent = mainFrame
communityLabel.Size = UDim2.new(1, 0, 0, 30)
communityLabel.Position = UDim2.new(0, 0, 0, 40)
communityLabel.Text = "Walvy Community"
communityLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
communityLabel.Font = Enum.Font.SourceSans
communityLabel.TextSize = 16
communityLabel.BackgroundTransparency = 1

-- Logika untuk minimize/maximize
-- Fungsi untuk logika minimize/maximize
local function setupMinimizeLogic(frame)
	local titleBar = frame:FindFirstChild("TitleBar")
	local minimizeButton = titleBar:FindFirstChild("MinimizeButton")

	local originalSize
    local originalPosition
	local minimized = false

    -- Perbarui posisi saat frame selesai dipindahkan
    frame:GetPropertyChangedSignal("Position"):Connect(function()
        if not minimized then
            originalPosition = frame.Position
        end
    end)

    -- Perbarui ukuran saat frame selesai di-resize
    frame:GetPropertyChangedSignal("Size"):Connect(function()
        if not minimized then
            originalSize = frame.Size
        end
    end)

	minimizeButton.MouseButton1Click:Connect(function()
		minimized = not minimized
		if minimized then
            originalSize = frame.Size
            originalPosition = frame.Position
            local titleBarHeight = titleBar.AbsoluteSize.Y
			frame.Size = UDim2.new(0, originalSize.X.Offset, 0, titleBarHeight)

            local newY = originalPosition.Y.Offset - (originalSize.Y.Offset / 2) + (titleBarHeight / 2)
            frame.Position = UDim2.new(originalPosition.X.Scale, originalPosition.X.Offset, originalPosition.Y.Scale, newY)

			minimizeButton.Text = "+"
		else
			frame.Size = originalSize
            frame.Position = originalPosition
			minimizeButton.Text = "-"
		end
	end)
end


-- Logika sistem kunci
-- Frame Pemilihan Menu
local selectionFrame = Instance.new("Frame")
selectionFrame.Name = "SelectionFrame"
selectionFrame.Parent = screenGui
selectionFrame.AnchorPoint = Vector2.new(0.5, 0.5)
selectionFrame.Size = UDim2.new(0, 300, 0, 150)
selectionFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
selectionFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
selectionFrame.BorderSizePixel = 0
selectionFrame.Visible = false
local selectionFrameCorner = Instance.new("UICorner")
selectionFrameCorner.CornerRadius = UDim.new(0, 8)
selectionFrameCorner.Parent = selectionFrame

-- Notifikasi Discord
local discordNotification = Instance.new("Frame")
discordNotification.Name = "DiscordNotification"
discordNotification.Parent = screenGui
discordNotification.AnchorPoint = Vector2.new(0.5, 0)
discordNotification.Size = UDim2.new(0, 300, 0, 60)
discordNotification.Position = UDim2.new(0.5, 0, 0, 10) -- Tengah atas
discordNotification.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
discordNotification.Visible = false
local discordCorner = Instance.new("UICorner")
discordCorner.CornerRadius = UDim.new(0, 8)
discordCorner.Parent = discordNotification

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
local discordLinkCorner = Instance.new("UICorner")
discordLinkCorner.CornerRadius = UDim.new(0, 8)
discordLinkCorner.Parent = discordLink

discordLink.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://discord.gg/your-invite-link") -- Ganti dengan tautan Discord Anda
	end
	discordNotification:Destroy()
end)

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
freeMenuButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
freeMenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local freeMenuButtonCorner = Instance.new("UICorner")
freeMenuButtonCorner.CornerRadius = UDim.new(0, 8)
freeMenuButtonCorner.Parent = freeMenuButton

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
local premiumMenuButtonCorner = Instance.new("UICorner")
premiumMenuButtonCorner.CornerRadius = UDim.new(0, 8)
premiumMenuButtonCorner.Parent = premiumMenuButton


-- Terapkan logika minimize ke semua frame menu
setupMinimizeLogic(mainFrame)

function createFreeMenu()
    local freeMenuFrame = mainFrame:Clone()
    freeMenuFrame.Name = "FreeMenuFrame"
    freeMenuFrame.Parent = screenGui
    freeMenuFrame.Visible = true
    freeMenuFrame.TitleLabel.Text = "Free Menu"

    -- Konten untuk Menu Gratis
    local freeFeatureButton = Instance.new("TextButton")
    freeFeatureButton.Name = "FreeFeatureButton"
    freeFeatureButton.Parent = freeMenuFrame
    freeFeatureButton.Size = UDim2.new(0, 120, 0, 40)
    freeFeatureButton.Position = UDim2.new(0.1, 0, 0.2, 0)
    freeFeatureButton.Text = "Free Feature 1"
    freeFeatureButton.Font = Enum.Font.SourceSans
    freeFeatureButton.TextSize = 16
    freeFeatureButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    freeFeatureButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    local freeFeatureButtonCorner = Instance.new("UICorner")
    freeFeatureButtonCorner.CornerRadius = UDim.new(0, 8)
    freeFeatureButtonCorner.Parent = freeFeatureButton

    local freeToggleButton = Instance.new("TextButton")
    freeToggleButton.Name = "FreeToggleButton"
    freeToggleButton.Parent = freeMenuFrame
    freeToggleButton.Size = UDim2.new(0, 120, 0, 40)
    freeToggleButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    freeToggleButton.Text = "Toggle Off"
    freeToggleButton.Font = Enum.Font.SourceSans
    freeToggleButton.TextSize = 16
    freeToggleButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Merah untuk status Off
    freeToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    local freeToggleButtonCorner = Instance.new("UICorner")
    freeToggleButtonCorner.CornerRadius = UDim.new(0, 8)
    freeToggleButtonCorner.Parent = freeToggleButton

    local isToggled = false
    freeToggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        if isToggled then
            freeToggleButton.Text = "Toggle On"
            freeToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0) -- Hijau untuk status On
        else
            freeToggleButton.Text = "Toggle Off"
            freeToggleButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        end
    end)
    setupMinimizeLogic(freeMenuFrame)
end

function createPremiumMenu()
    local premiumMenuFrame = mainFrame:Clone()
    premiumMenuFrame.Name = "PremiumMenuFrame"
    premiumMenuFrame.Parent = screenGui
    premiumMenuFrame.Visible = true
    premiumMenuFrame.TitleLabel.Text = "Premium Menu"

    -- Konten untuk Menu Premium
    local premiumFeatureButton1 = Instance.new("TextButton")
    premiumFeatureButton1.Name = "PremiumFeatureButton1"
    premiumFeatureButton1.Parent = premiumMenuFrame
    premiumFeatureButton1.Size = UDim2.new(0, 140, 0, 40)
    premiumFeatureButton1.Position = UDim2.new(0.1, 0, 0.2, 0)
    premiumFeatureButton1.Text = "Premium Feature 1"
    premiumFeatureButton1.Font = Enum.Font.SourceSans
    premiumFeatureButton1.TextSize = 16
    premiumFeatureButton1.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    premiumFeatureButton1.TextColor3 = Color3.fromRGB(0, 0, 0)
    local premiumFeatureButton1Corner = Instance.new("UICorner")
    premiumFeatureButton1Corner.CornerRadius = UDim.new(0, 8)
    premiumFeatureButton1Corner.Parent = premiumFeatureButton1

    local premiumFeatureButton2 = Instance.new("TextButton")
    premiumFeatureButton2.Name = "PremiumFeatureButton2"
    premiumFeatureButton2.Parent = premiumMenuFrame
    premiumFeatureButton2.Size = UDim2.new(0, 140, 0, 40)
    premiumFeatureButton2.Position = UDim2.new(0.1, 0, 0.4, 0)
    premiumFeatureButton2.Text = "Premium Feature 2"
    premiumFeatureButton2.Font = Enum.Font.SourceSans
    premiumFeatureButton2.TextSize = 16
    premiumFeatureButton2.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    premiumFeatureButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
    local premiumFeatureButton2Corner = Instance.new("UICorner")
    premiumFeatureButton2Corner.CornerRadius = UDim.new(0, 8)
    premiumFeatureButton2Corner.Parent = premiumFeatureButton2

    local premiumToggleButton = Instance.new("TextButton")
    premiumToggleButton.Name = "PremiumToggleButton"
    premiumToggleButton.Parent = premiumMenuFrame
    premiumToggleButton.Size = UDim2.new(0, 140, 0, 40)
    premiumToggleButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    premiumToggleButton.Text = "Super Toggle Off"
    premiumToggleButton.Font = Enum.Font.SourceSans
    premiumToggleButton.TextSize = 16
    premiumToggleButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    premiumToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    local premiumToggleButtonCorner = Instance.new("UICorner")
    premiumToggleButtonCorner.CornerRadius = UDim.new(0, 8)
    premiumToggleButtonCorner.Parent = premiumToggleButton

    local isPremiumToggled = false
    premiumToggleButton.MouseButton1Click:Connect(function()
        isPremiumToggled = not isPremiumToggled
        if isPremiumToggled then
            premiumToggleButton.Text = "Super Toggle On"
            premiumToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        else
            premiumToggleButton.Text = "Super Toggle Off"
            premiumToggleButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        end
    end)
    setupMinimizeLogic(premiumMenuFrame)
end

freeMenuButton.MouseButton1Click:Connect(function()
	selectionFrame:Destroy()
	createFreeMenu()
end)

premiumMenuButton.MouseButton1Click:Connect(function()
	selectionFrame:Destroy()
	createPremiumMenu()
end)

local correctKey = "WalvyKey" -- Kunci Anda di sini

submitKeyButton.MouseButton1Click:Connect(function()
	if keyInput.Text == correctKey then
		keyFrame:Destroy()
		selectionFrame.Visible = true
		discordNotification.Visible = true
	else
		keyInput.Text = "Incorrect Key"
	end
end)
