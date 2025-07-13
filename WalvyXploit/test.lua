local UI = require("WalvyXploit/ui")
local assert = require("luassert")

describe("UI", function()
    it("should create a window", function()
        local window = UI:CreateWindow("Test Window", {w = 100, h = 100})
        assert.are.equal("Test Window", window.title)
    end)

    it("should minimize a window", function()
        local window = UI:CreateWindow("Test Window", {w = 100, h = 100})
        assert.is_false(window.minimized)
        assert.is_true(window.visible)

        window:Minimize()
        assert.is_true(window.minimized)
        assert.is_false(window.visible)

        window:Minimize()
        assert.is_false(window.minimized)
        assert.is_true(window.visible)
    end)
end)
