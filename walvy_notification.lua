-- Walvy Comunity Notification System
-- Lua script for creating modern UI notifications

local WalvyNotification = {}

-- Configuration
local Config = {
    notification_duration = 5000, -- milliseconds
    animation_speed = 300,
    background_color = {0.29, 0.49, 0.35, 0.9}, -- Green background with transparency
    text_color = {1, 1, 1, 1}, -- White text
    border_color = {1, 1, 1, 0.3}, -- Semi-transparent white border
    icon_color = {1, 1, 1, 0.8}, -- White icon
    notification_width = 300,
    notification_height = 80,
    border_radius = 10,
    icon_size = 24
}

-- Notification state
local notification_active = false
local notification_timer = 0
local notification_alpha = 0
local notification_y_offset = -100

-- Create notification function
function WalvyNotification.create(title, status, icon_type)
    title = title or "Walvy Comunity"
    status = status or "Key Valid"
    icon_type = icon_type or "upload"
    
    local notification = {
        title = title,
        status = status,
        icon_type = icon_type,
        visible = true,
        alpha = 0,
        y_offset = -100,
        timer = 0
    }
    
    return notification
end

-- Animation functions
function WalvyNotification.animate_in(notification, dt)
    notification.timer = notification.timer + dt
    local progress = math.min(notification.timer / (Config.animation_speed / 1000), 1)
    
    -- Smooth easing function
    local eased_progress = 1 - math.pow(1 - progress, 3)
    
    notification.alpha = eased_progress
    notification.y_offset = -100 + (100 * eased_progress)
    
    return progress >= 1
end

function WalvyNotification.animate_out(notification, dt)
    notification.timer = notification.timer + dt
    local progress = math.min(notification.timer / (Config.animation_speed / 1000), 1)
    
    -- Smooth easing function
    local eased_progress = math.pow(progress, 3)
    
    notification.alpha = 1 - eased_progress
    notification.y_offset = eased_progress * -100
    
    return progress >= 1
end

-- Draw notification function
function WalvyNotification.draw(notification, screen_width, screen_height)
    if not notification.visible then return end
    
    local x = (screen_width - Config.notification_width) / 2
    local y = 50 + notification.y_offset
    
    -- Draw background with glassmorphism effect
    love.graphics.setColor(Config.background_color[1], Config.background_color[2], 
                          Config.background_color[3], Config.background_color[4] * notification.alpha)
    love.graphics.rectangle("fill", x, y, Config.notification_width, Config.notification_height, 
                           Config.border_radius, Config.border_radius)
    
    -- Draw border
    love.graphics.setColor(Config.border_color[1], Config.border_color[2], 
                          Config.border_color[3], Config.border_color[4] * notification.alpha)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle("line", x, y, Config.notification_width, Config.notification_height, 
                           Config.border_radius, Config.border_radius)
    
    -- Draw icon circle
    local icon_x = x + 20
    local icon_y = y + Config.notification_height / 2
    love.graphics.setColor(Config.icon_color[1], Config.icon_color[2], 
                          Config.icon_color[3], Config.icon_color[4] * notification.alpha)
    love.graphics.circle("line", icon_x, icon_y, Config.icon_size)
    
    -- Draw upload arrow icon
    love.graphics.setLineWidth(3)
    love.graphics.line(icon_x, icon_y + 8, icon_x, icon_y - 8) -- Vertical line
    love.graphics.line(icon_x - 6, icon_y - 4, icon_x, icon_y - 8) -- Left arrow
    love.graphics.line(icon_x + 6, icon_y - 4, icon_x, icon_y - 8) -- Right arrow
    
    -- Draw text
    love.graphics.setColor(Config.text_color[1], Config.text_color[2], 
                          Config.text_color[3], Config.text_color[4] * notification.alpha)
    
    -- Title
    love.graphics.setFont(love.graphics.newFont(16))
    love.graphics.print(notification.title, x + 60, y + 15)
    
    -- Status
    love.graphics.setFont(love.graphics.newFont(12))
    love.graphics.setColor(0.8, 0.8, 0.8, 1 * notification.alpha)
    love.graphics.print(notification.status, x + 60, y + 40)
end

-- Update notification function
function WalvyNotification.update(notification, dt)
    if not notification.visible then return end
    
    if notification.alpha < 1 then
        -- Animate in
        if WalvyNotification.animate_in(notification, dt) then
            notification.timer = 0
        end
    elseif notification.timer < Config.notification_duration / 1000 then
        -- Display duration
        notification.timer = notification.timer + dt
    else
        -- Animate out
        if WalvyNotification.animate_out(notification, dt) then
            notification.visible = false
        end
    end
end

-- Show notification function
function WalvyNotification.show(title, status, icon_type)
    local notification = WalvyNotification.create(title, status, icon_type)
    notification_active = true
    notification_timer = 0
    notification_alpha = 0
    notification_y_offset = -100
    
    return notification
end

-- Hide notification function
function WalvyNotification.hide(notification)
    notification.visible = false
end

-- Example usage for LÖVE2D or similar frameworks
function WalvyNotification.example_usage()
    --[[ 
    Example usage in main.lua:
    
    local WalvyNotification = require("walvy_notification")
    local current_notification = nil
    
    function love.load()
        current_notification = WalvyNotification.show("Walvy Comunity", "Key Valid", "upload")
    end
    
    function love.update(dt)
        if current_notification then
            WalvyNotification.update(current_notification, dt)
        end
    end
    
    function love.draw()
        if current_notification then
            WalvyNotification.draw(current_notification, love.graphics.getWidth(), love.graphics.getHeight())
        end
    end
    
    function love.keypressed(key)
        if key == "space" then
            current_notification = WalvyNotification.show("Walvy Comunity", "Key Valid", "upload")
        end
    end
    --]]
end

-- Alternative version for other Lua UI frameworks
function WalvyNotification.create_for_generic_framework()
    return {
        show_notification = function(ui_manager, title, status)
            local notification_data = {
                title = title or "Walvy Comunity",
                status = status or "Key Valid",
                background_color = "rgba(74, 124, 89, 0.9)",
                text_color = "white",
                border_color = "rgba(255, 255, 255, 0.3)",
                width = 300,
                height = 80,
                duration = 5000,
                position = "top-center",
                animation = "slide-down",
                icon = "upload-arrow"
            }
            
            -- Framework-specific implementation would go here
            -- ui_manager:create_notification(notification_data)
            
            return notification_data
        end
    }
end

return WalvyNotification