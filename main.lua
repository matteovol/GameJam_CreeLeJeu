UI = require("src/UI")

-- Different types of scene
SceneType = {
    Menu = 0,
    Options = 1,
    Credit = 2,
    Game = 3,
    Fight = 4
}

function love.load(args)
    -- Load some default values
    WIN_SIZE = {width = 1920, height = 1080}
    SCENE = SceneType.Menu
    FONT = love.graphics.newFont("ressources/champifont.ttf", 20, "normal")
    love.graphics.setFont(FONT)

    -- Load menu buttons in a single table
    Buttons = {}
    local buttonPlay = UI.newButton({100, 100}, "ressources/button1.png", {648/3, 54})
    table.insert(Buttons, buttonPlay)
    local buttonOptions = UI.newButton({100, 300}, "ressources/button2.png", {558/3, 53})
    table.insert(Buttons, buttonOptions)
    local buttonCredit = UI.newButton({100, 500}, "ressources/button3.png", {513/3, 49})
    table.insert(Buttons, buttonCredit)
end

function love.update(dt)
    -- Pseudo Scene Manager: update only the right scene
    if SCENE == SceneType.Menu then

        -- Event checker for ui elements
        for i = 1, #Buttons do
            Buttons[i].checkEvent()
        end

    end
end

function love.draw()
    -- Pseudo Scene Manager: draw only the right scene
    if SCENE == SceneType.Menu then

        -- Draw ui elements
        for i = 1, #Buttons do
            Buttons[i].draw()
        end

    elseif SCENE == SceneType.Credit then

        -- Draw credits
        love.graphics.print("Created by Ryugha and pl0xxxy", WIN_SIZE.width / 2, WIN_SIZE.height / 2 - 20)

    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end
