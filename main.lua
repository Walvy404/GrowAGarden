-- Example main.lua for Walvy Comunity Notification System
-- This example works with LÖVE2D (Love2D) framework

local WalvyNotification = require("walvy_notification")

-- Global variables
local current_notification = nil
local background_pattern = {}
local screen_width, screen_height

function love.load()
    -- Set up screen dimensions
    screen_width = love.graphics.getWidth()
    screen_height = love.graphics.getHeight()
    
    -- Create background pattern
    for i = 1, 100 do
        table.insert(background_pattern, {
            x = math.random(0, screen_width),
            y = math.random(0, screen_height),
            size = math.random(2, 4),
            alpha = math.random(0.1, 0.3)
        })
    end
    
    -- Show initial notification
    current_notification = WalvyNotification.show("Walvy Comunity", "Key Valid", "upload")
    
    -- Set window title
    love.window.setTitle("Walvy Comunity Notification Demo")
end

function love.update(dt)
    -- Update notification
    if current_notification then
        WalvyNotification.update(current_notification, dt)
    end
end

function love.draw()
    -- Draw background gradient
    love.graphics.setColor(0.29, 0.49, 0.35, 1) -- Green background
    love.graphics.rectangle("fill", 0, 0, screen_width, screen_height)
    
    -- Draw background pattern
    for _, dot in ipairs(background_pattern) do
        love.graphics.setColor(1, 1, 1, dot.alpha)
        love.graphics.circle("fill", dot.x, dot.y, dot.size)
    end
    
    -- Draw notification
    if current_notification and current_notification.visible then
        WalvyNotification.draw(current_notification, screen_width, screen_height)
    end
    
    -- Draw instructions
    love.graphics.setColor(1, 1, 1, 0.8)
    love.graphics.setFont(love.graphics.newFont(14))
    love.graphics.print("Press SPACE to show notification", 20, screen_height - 80)
    love.graphics.print("Press ENTER to show custom notification", 20, screen_height - 60)
    love.graphics.print("Press ESC to hide notification", 20, screen_height - 40)
    love.graphics.print("Press Q to quit", 20, screen_height - 20)
end

function love.keypressed(key)
    if key == "space" then
        -- Show default notification
        current_notification = WalvyNotification.show("Walvy Comunity", "Key Valid", "upload")
        
    elseif key == "return" then
        -- Show custom notification
        local messages = {
            {title = "Walvy Comunity", status = "Connected Successfully"},
            {title = "Walvy Comunity", status = "Authentication Complete"},
            {title = "Walvy Comunity", status = "System Ready"},
            {title = "Walvy Comunity", status = "Update Available"}
        }
        local msg = messages[math.random(1, #messages)]
        current_notification = WalvyNotification.show(msg.title, msg.status, "upload")
        
    elseif key == "escape" then
        -- Hide current notification
        if current_notification then
            WalvyNotification.hide(current_notification)
        end
        
    elseif key == "q" then
        -- Quit application
        love.event.quit()
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then -- Left mouse button
        -- Show notification on click
        current_notification = WalvyNotification.show("Walvy Comunity", "Mouse Clicked!", "upload")
    end
end