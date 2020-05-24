--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 09/05/2020
-- Time: 14:43
-- To change this template use File | Settings | File Templates.
--
Brick = Class{}

function Brick:init(color, x, y, indexX, indexY, selected)
    self.color = color
    self.indexX = indexX
    self.indexY = indexY
    self.x = x
    self.y = y
    self.selected = selected
    self.enabled= true
end

function Brick:changePosition(x, y)
    self.x = x
    self.y = y
end

function Brick:render()

    love.graphics.setColor(255,255,255,255)
    if self.enabled == true then
        love.graphics.draw(gTextures['tiles'], gTiles[self.color][1], self.x, self.y)
        if self.selected == true then
            love.graphics.setColor(0,0,0,100)
            love.graphics.rectangle('line', self.x, self.y, 32,32)
        end
    end

end