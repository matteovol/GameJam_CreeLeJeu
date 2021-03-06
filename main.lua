UI = require("src/UI")
Map = require("src/Map")
Player = require("src/Player")

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
    RSC_F = "ressources/"
    TILES_F = "ressources/tiles/"
    FONT = love.graphics.newFont(RSC_F .. "champifont.ttf", 20, "normal")
    love.graphics.setFont(FONT)
    MAP = Map.loadMap(RSC .. "map")
    TILES = Map.loadTiles(TILES_F)

    -- Load menu buttons in a single table
    Buttons = {}
    local buttonPlay = UI.newButton({100, 100}, RSC_F .. "button1.png", {648/3, 54})
    table.insert(Buttons, buttonPlay)
    local buttonOptions = UI.newButton({100, 300}, RSC_F .. "button2.png", {558/3, 53})
    table.insert(Buttons, buttonOptions)
    local buttonCredit = UI.newButton({100, 500}, RSC_F .. "button3.png", {513/3, 49})
    table.insert(Buttons, buttonCredit)

    P = Player.newPlayer({100, 100}, RSC .. "warrior.png", {576/9, 256/4})
end

function love.update(dt)
    -- Pseudo Scene Manager: update only the right scene
    if SCENE == SceneType.Menu then

        -- Event checker for ui elements
        for i = 1, #Buttons do
            pressed = Buttons[i].checkEvent()
            if pressed then
                if i == 1 then
                    SCENE = SceneType.Game
                elseif i == 2 then
                    SECNE = SceneType.Options
                elseif i == 3 then
                    SCENE = SceneType.Credit
                end
            end
        end

    elseif SCENE == SceneType.Game then

        -- Event checker for game scene
        P.animate()
        P.coordUpdate()

    end
end

function love.draw()
    -- Pseudo Scene Manager: draw only the right scene
    if SCENE == SceneType.Menu then

        -- Draw ui elements
        for i = 1, #Buttons do
            Buttons[i].draw()
        end

    elseif SCENE == SceneType.Options then

    elseif SCENE == SceneType.Credit then

        -- Draw credits
        love.graphics.print("Created by Ryugha and pl0xxxy", WIN_SIZE.width / 2, WIN_SIZE.height / 2 - 20)

    elseif SCENE == SceneType.Game then

        -- fence, grass, pnj, sand, tree, wood
        for j = 1, #MAP do
            for i = 1, #MAP[j] do
                local c = string.sub(MAP[j], i, i)
                local x = (i - 1) * 64
                local y = (j - 1) * 64
                if c == 'a' then
                    love.graphics.draw(TILES[2], x, y)
                elseif c == 'b' then
                    love.graphics.draw(TILES[5], x, y)
                elseif c == 'c' then
                    love.graphics.draw(TILES[1], x, y)
                elseif c == 'd' then
                    love.graphics.draw(TILES[4], x, y)
                elseif c == 'e' then
                    love.graphics.draw(TILES[3], x, y)
                elseif c == 'f' then
                    love.graphics.draw(TILES[6], x, y)
                end
            end
        end

        P.draw()

    elseif SCENE == SceneType.Fight then

    end
end

function love.keypressed(key, scancode, isrepeat)
    if SCENE == SceneType.Menu then
        if key == "escape" then
            love.event.quit()
        end
    elseif SCENE == SceneType.Option then
        if key == "escape" then
            SCENE = SceneType.Menu
        end
    elseif SCENE == SceneType.Credit then
        if key == "escape" then
            SCENE = SceneType.Menu
        end
    elseif SCENE == SceneType.Game then
        if key == "escape" then
            SCENE = SceneType.Menu
        end
    elseif SCENE == SceneType.Fight then
    end
end
