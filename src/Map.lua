Map = {}

RSC = "ressources/"

-- Check if a file exist or not
function exist(filepath)
    local f = io.open(filepath, "rb")
    if f then f:close() end
    return f ~= nil
end

-- Return a list of all lines from the map file
function Map.loadMap(filepath)
    if not exist(filepath) then return {} end
    local lines = {}

    -- read lines and store them in 'lines' table
    for line in io.lines(filepath) do
        if string.sub(line, 1, 1) ~= "#" then
            lines[#lines + 1] = line
        end
    end

    return lines
end


-- Return a list of a map
function Map.loadTiles(dirpath)
    -- Create tiles array
    tiles = {}
    for name in io.popen("ls " .. dirpath):lines() do
        table.insert(tiles, love.graphics.newImage(RSC .. "tiles/" .. name))
    end

    return tiles
end

return Map