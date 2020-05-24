--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 02/05/2020
-- Time: 17:59
-- To change this template use File | Settings | File Templates.
--

function GenerateQuads(atlas, tileWidth, tileHeight)
    local sheetWidth = atlas:getWidth() / tileWidth
    local sheetHeight = atlas:getHeight() / tileHeight

    local sheetCounter = 1
    local spriteSheet = {}
    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spriteSheet[sheetCounter] =
                love.graphics.newQuad(x * tileWidth, y * tileHeight, tileWidth, tileHeight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end
    return spriteSheet
end

function GenerateTiles(atlas, tileWidth, tileHeight, row, column)
    local sheetWidth = atlas:getWidth()/2 / tileWidth

    local sheetCounter = 1
    local spriteSheet = {}
    local xOffset = ((column -1) * (atlas:getWidth()/2))

    for x = 0, sheetWidth - 1 do
        spriteSheet[sheetCounter] =
        love.graphics.newQuad(xOffset + (x * tileWidth), (row -1) * tileHeight, tileWidth, tileHeight, atlas:getDimensions())
        sheetCounter = sheetCounter + 1
    end

    return spriteSheet
end