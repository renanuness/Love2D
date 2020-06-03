--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 03/06/2020
-- Time: 10:02
-- To change this template use File | Settings | File Templates.
--

function GenerateQuads(atlas, tileWidth, tileHeight)
    local atlasWidth = atlas:getWidth()
    print(atlasWidth)
    local spriteSheet = {}
    local sheetCounter = 1
    for j = 0, 2 do
        for i = 0, 23 do
            spriteSheet[sheetCounter] =
                love.graphics.newQuad( (i * tileWidth), (j * tileHeight), tileWidth, tileHeight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end
    return spriteSheet
end

function GenerateQuad(atlas, tileWidth, tileHeight, indexX, indexY)
    local quad = love.graphics.newQuad(tileWidth * indexX, tileHeight * indexY, atlas:getDimensions())
    return quad
end