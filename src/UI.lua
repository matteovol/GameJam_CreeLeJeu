local UI = {}

function UI.newButton(coord, spritesheet, rect)
    local Button = {}
    Button.sprite = love.graphics.newImage(spritesheet)
    Button.coord = coord
    Button.rect = rect
    Button.quads = {}
    Button.toDraw = 1

    for y = 0, Button.sprite:getHeight() - Button.rect[1], Button.rect[1] do
        for x = 0, Button.sprite:getWidth() - Button.rect[2], Button.rect[2] do
            table.insert(Button.quads, love.graphics.newQuad(x, y,
                Button.rect[1], Button.rect[2], Button.sprite:getDimensions()))
        end
    end

    Button.lel = function()
        print("lel")
    end

    Button.draw = function()
        local scaleX = 1.5
        local scaleY = 1.5
        if Button.toDraw == 2 then
            scaleX = 1.7
            scaleY = 1.7
        end
        love.graphics.draw(Button.sprite, Button.quads[Button.toDraw], Button.coord[1], Button.coord[2],
    0, scaleX, scaleY, 0, 0, 0, 0)
    end

    Button.checkEvent = function()
        local x, y = love.mouse.getPosition()
        if x >= Button.coord[1] and x <= Button.rect[1] * 1.5 and
        y >= Button.coord[2] and y <= Button.rect[2] * 1.5 then
            Button.toDraw = 2
        else
            Button.toDraw = 1
        end
    end

    return Button
end

function UI.newList(coord, elem)
    local List = {}
    local f = love.graphics.getFont()
    List.coord = coord
    List.elem = elem
    List.offset = 0
    List.fontH = f:getHeight()

    List.draw = function()
        love.graphics.setColor(0, 0, 0)
        List.offset = 0
        for i = 1, #List.elem do
            love.graphics.print(List.elem[i], List.coord[1], List.coord[2] + List.offset)
            List.offset = List.offset + List.fontH
        end
    end

    List.checkEvent = function()

    end

    return List
end

return UI