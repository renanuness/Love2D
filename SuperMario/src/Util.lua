--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 03/06/2020
-- Time: 10:02
-- To change this template use File | Settings | File Templates.
--

function GenerateGroundQuads(atlas, tileWidth, tileHeight, groundPair)
    local atlasWidth = atlas:getWidth()
    local spriteSheet = {}
    local sheetCounter = 1
    for j = 0, 2 do
        for i = 0, 23 do
            spriteSheet[sheetCounter] =
                love.graphics.newQuad( (i * tileWidth), (j * tileHeight) * groundPair, tileWidth, tileHeight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end
    return spriteSheet
end

function GenerateQuad(atlas, tileWidth, tileHeight, indexX, indexY)
    local quad = love.graphics.newQuad(tileWidth * indexX, tileHeight * indexY, tileWidth, tileHeight, atlas:getDimensions())
    return quad
end