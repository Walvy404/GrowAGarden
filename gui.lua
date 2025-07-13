-- Membuat ScreenGui untuk menampung semua elemen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Walvy Comunity"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame untuk sistem kunci
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Parent = screenGui
keyFrame.Size = UDim2.new(0, 300, 0, 150)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
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
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Draggable = true
mainFrame.Active = true

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
end)

-- Logika untuk minimize/maximize
local minimized = false
local originalSize = mainFrame.Size

minimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		mainFrame.Size = UDim2.new(0, 300, 0, 30)
		minimizeButton.Text = "+"
	else
		mainFrame.Size = originalSize
		minimizeButton.Text = "-"
	end
end)

-- Logika sistem kunci
local correctKey = "WalvyKey"

-- Frame Pemilihan Menu
local selectionFrame = Instance.new("Frame")
selectionFrame.Name = "SelectionFrame"
selectionFrame.Parent = screenGui
selectionFrame.Size = UDim2.new(0, 300, 0, 150)
selectionFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
selectionFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
selectionFrame.BorderSizePixel = 0
selectionFrame.Visible = false
local selectionFrameCorner = Instance.new("UICorner")
selectionFrameCorner.CornerRadius = UDim.new(0, 8)
selectionFrameCorner.Parent = selectionFrame

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


-- Frame untuk Menu Gratis
local freeMenuFrame = mainFrame:Clone()
freeMenuFrame.Name = "FreeMenuFrame"
freeMenuFrame.Parent = screenGui
freeMenuFrame.Visible = false
freeMenuFrame.TitleLabel.Text = "Free Menu"

-- Frame untuk Menu Premium
local premiumMenuFrame = mainFrame:Clone()
premiumMenuFrame.Name = "PremiumMenuFrame"
premiumMenuFrame.Parent = screenGui
premiumMenuFrame.Visible = false
premiumMenuFrame.TitleLabel.Text = "Premium Menu"


submitKeyButton.MouseButton1Click:Connect(function()
	if keyInput.Text == correctKey then
		keyFrame:Destroy()
		selectionFrame.Visible = true

		-- Notifikasi Discord
		local discordNotification = Instance.new("Frame")
		discordNotification.Name = "DiscordNotification"
		discordNotification.Parent = screenGui
		discordNotification.Size = UDim2.new(0, 300, 0, 100)
		discordNotification.Position = UDim2.new(0.5, -150, 0.5, -50)
		discordNotification.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		local discordCorner = Instance.new("UICorner")
		discordCorner.CornerRadius = UDim.new(0, 8)
		discordCorner.Parent = discordNotification

		local discordTitle = Instance.new("TextLabel")
		discordTitle.Parent = discordNotification
		discordTitle.Size = UDim2.new(1, 0, 0, 30)
		discordTitle.Text = "Join our Discord!"
		discordTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		discordTitle.Font = Enum.Font.SourceSansBold
		discordTitle.TextSize = 18
		discordTitle.BackgroundTransparency = 1

		local discordLink = Instance.new("TextButton")
		discordLink.Parent = discordNotification
		discordLink.Size = UDim2.new(0, 200, 0, 40)
		discordLink.Position = UDim2.new(0.5, -100, 0, 40)
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
	else
		keyInput.Text = "Incorrect Key"
	end
end)

freeMenuButton.MouseButton1Click:Connect(function()
	selectionFrame:Destroy()
	freeMenuFrame.Visible = true
end)

premiumMenuButton.MouseButton1Click:Connect(function()
	selectionFrame:Destroy()
	premiumMenuFrame.Visible = true
end)
