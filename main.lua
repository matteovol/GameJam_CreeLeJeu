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
end

function love.update(dt)
end

function love.draw()
    if SCENE == SceneType.Menu then
    elseif SCENE == SceneType.Credit then
        love.graphics.print("Created by Ryugha and pl0xxxy", WIN_SIZE.width / 2, WIN_SIZE.height / 2 - 20)
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end
