local UI = {}

function UI.newButton(coord, spritesheet, rect, scale)
    local Button = {}
    Button.sprite = love.graphics.newImage(spritesheet)
    Button.coord = coord
    Button.rect = rect
    Button.scale = scale or {1, 1}
    Button.quads = {}
    Button.toDraw = 1

    for y = 0, Button.sprite:getWidth() - Button.rect[1], Button.rect[1] do
        for x = 0, Button.sprite:getHeight() - Button.rect[2], Button.rect[2] do
            table.insert(Button.quads, love.graphics.newQuad(x, y,
                Button.rect[1], Button.rect[2], Button.sprite:getDimensions()))
        end
    end

    Button.lel = function()
        print("lel")
    end

    Button.draw = function()
        love.graphics.draw(Button.sprite, Button.quads[Button.toDraw], Button.coord[1],
        Button.coord[2], 0, Button.scale[1], Button.scale[2], 0, 0, 0, 0)
    end

    Button.checkEvent = function()
        local x, y = love.mouse.getPosition()

        if x >= Button.coord[1] and x <= Button.coord[1] + Button.rect[1] and
        y >= Button.coord[2] and y <= Button.coord[2] + Button.rect[2] and
        love.mouse.isDown(1) then
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