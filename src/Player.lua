local Player = {}

function Player.newPlayer(coord, spritesheet, rect)
    P = {}
    P.sprite = love.graphics.newImage(spritesheet)
    P.coord = coord
    P.rect = rect
    P.quads = {}
    P.toDraw = 1

    for x = 0, P.sprite:getWidth() - P.rect[1], P.rect[1] do
        for y = 0, P.sprite:getHeight() - P.rect[2], P.rect[2] do
            table.insert(P.quads, love.graphics.newQuad(x, y,
                P.rect[1], P.rect[2], P.sprite:getDimensions()))
        end
    end

    function P.draw()
    end

    function P.update(dt)
        if love.keyboard.isDown("z") then

        elseif love.keyboard.isDown("q") then

        elseif love.keyboard.isDown("s") then

        elseif love.keyboard.isDown("d") then

        end
    end

    return P
end

return Player