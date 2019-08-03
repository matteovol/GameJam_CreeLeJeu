local Player = {}

function Player.newPlayer(coord, spritesheet, rect, speed)
    P = {}
    P.sprite = love.graphics.newImage(spritesheet)
    P.coord = coord
    P.rect = rect
    P.quads = {}
    P.drawFrom = 28
    P.drawTo = 36
    P.toDraw = 28
    P.speed = speed or 10

    for y = 0, P.sprite:getHeight() - P.rect[2], P.rect[2] do
        for x = 0, P.sprite:getWidth() - P.rect[1], P.rect[1] do
            table.insert(P.quads, love.graphics.newQuad(x, y,
                P.rect[1], P.rect[2], P.sprite:getDimensions()))
        end
    end

    function P.draw()
        love.graphics.draw(P.sprite, P.quads[P.toDraw], P.coord[1], P.coord[2])
    end

    function P.update(dt)
        if love.keyboard.isDown("z") then

            -- Animate player
            if P.toDraw == 27 then
                P.toDraw = P.drawFrom
            elseif P.toDraw < 27 and P.toDraw >= 19 then
                P.toDraw = P.toDraw + 1
            else
                P.drawFrom = 19
                P.drawTo = 27
                P.toDraw = 19
            end

            -- Move player
            P.coord[2] = P.coord[2] - P.speed

        elseif love.keyboard.isDown("q") then

            -- Animate player
            if P.toDraw == 9 then
                P.toDraw = P.drawFrom
            elseif P.toDraw < 9 and P.toDraw >= 1 then
                P.toDraw = P.toDraw + 1
            else
                P.drawFrom = 1
                P.drawTo = 9
                P.toDraw = 1
            end

            -- Move player
            P.coord[1] = P.coord[1] - P.speed

        elseif love.keyboard.isDown("s") then

            -- Animate player
            if P.toDraw == 36 then
                P.toDraw = P.drawFrom
            elseif P.toDraw < 36 and P.toDraw >= 28 then
                P.toDraw = P.toDraw + 1
            else
                P.drawFrom = 28
                P.drawTo = 36
                P.toDraw = 28
            end

            -- Move player
            P.coord[2] = P.coord[2] + P.speed

        elseif love.keyboard.isDown("d") then

            -- Animate player
            if P.toDraw == 18 then
                P.toDraw = P.drawFrom
            elseif P.toDraw < 18 and P.toDraw >= 10 then
                P.toDraw = P.toDraw + 1
            else
                P.drawFrom = 10
                P.drawTo = 18
                P.toDraw = 10
            end

            -- Move player
            P.coord[1] = P.coord[1] + P.speed

        end
    end

    return P
end

return Player