-- UI Library
local UI = {}

function UI:CreateWindow(title, size)
    local window = {}
    window.title = title
    window.size = size
    window.minimized = false
    window.visible = true

    function window:Minimize()
        self.minimized = not self.minimized
        self.visible = not self.minimized
    end

    return window
end

return UI
