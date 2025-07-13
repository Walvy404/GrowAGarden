-- Membuat ScreenGui untuk menampung semua elemen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyGui"
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
local correctKey = "WALVYXYZ"

submitKeyButton.MouseButton1Click:Connect(function()
	if keyInput.Text == correctKey then
		keyFrame:Destroy()
		mainFrame.Visible = true

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
				setclipboard("https://discord.gg/WahJckA7") -- Ganti dengan tautan Discord Anda
			end
			discordNotification:Destroy()
		end)
	else
		keyInput.Text = "Incorrect Key"
	end
end)
