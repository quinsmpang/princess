local TestApp = class("TestApp", cc.load("mvc").AppBase)

function TestApp:onCreate()
    self.shogi = require("lib.shogi").new(0)
end

function TestApp:getTeam()
    return "red"
end

function TestApp:getShogi()
    return self.shogi
end

function TestApp:addListener(listener)
    self.listener = listener
end

function TestApp:commitForm(form)
    self.shogi:commitForm({
        red = form,
        blue = {"113", "224", "331"},
    })
    self:enterScene("GameScene")
end

function TestApp:commit(charaId, chipIdx)
    self.listener({charaId .. chipIdx})
end

function TestApp:reset()
    self.shogi:reset()
    self:enterScene("FormationScene")
end

return TestApp

