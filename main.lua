UI = require("src/UI")

SceneType = {
    Menu = 0,
    Options = 1,
    Credit = 2,
    Game = 3,
    Fight = 4
}

function love.load(args)
    WIN_SIZE = {width = 1920, height = 1080}
    SCENE = SceneType.Menu
    FONT = love.graphics.newFont("ressources/champifont.ttf", 20, "normal")
    love.graphics.setFont(FONT)

    Buttons = {}
    local buttonPlay = UI.newButton({100, 100}, "ressources/button1.png", {190, 49})
    table.insert(Buttons, buttonPlay)
    local buttonOptions = UI.newButton({100, 300}, "ressources/button2.png", {190, 49})
    table.insert(Buttons, buttonOptions)
    local buttonCredit = UI.newButton({100, 500}, "ressources/button1.png", {190, 49})
    table.insert(Buttons, buttonCredit)
end

function love.update(dt)
    if SCENE == SceneType.Menu then
        for i = 1, #Buttons do
            Buttons[i].checkEvent()
        end
    end
end

function love.draw()
    if SCENE == SceneType.Menu then
        for i = 1, #Buttons do
            Buttons[i].draw()
        end
    elseif SCENE == SceneType.Credit then
        love.graphics.print("Created by Ryugha and pl0xxxy", WIN_SIZE.width / 2, WIN_SIZE.height / 2 - 20)
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end
