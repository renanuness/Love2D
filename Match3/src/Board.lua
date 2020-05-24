--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 09/05/2020
-- Time: 14:28
-- To change this template use File | Settings | File Templates.
--
Board = Class{}

function Board:init(sizeX, sizeY)
    self.sizeX = sizeX
    self.sizeY = sizeY
    self.bricks = {}
    self.initialX = 32
    self.initialY = 32
    self.highlightedBrick = nil
    self.selectedBrickX = 1
    self.selectedBrickY = 1
end

function Board:changeSelected(axis, dir)
    self.bricks[self.selectedBrickX][self.selectedBrickY].selected = false
    if axis == 'y' then
        self.selectedBrickY = self.selectedBrickY + dir
    elseif axis == 'x' then
        self.selectedBrickX = self.selectedBrickX + dir
    end
    self.bricks[self.selectedBrickX][self.selectedBrickY].selected = true

end

function Board:changeBricks(brick1, brick2)
    if brick1.enabled == true and brick2.enabled == true then
        if math.abs((brick1.indexX + brick1.indexY) -(brick2.indexX + brick2.indexY)) > 1 then
            return false
        end
        --unction Brick:init(color, x, y, indexX, indexY, selected)
        local tempBrick1 = Brick(brick1.color, brick1.x, brick1.y, brick1.indexX, brick1.indexY, brick1.selected)
        local tempBrick2 = Brick(brick2.color, brick2.x, brick2.y, brick2.indexX, brick2.indexY, brick2.selected)

        brick1.color = tempBrick2.color
        brick2.color = tempBrick1.color
    end
end

function Board:cleanMatchs(matchTable)
    for k, v in pairs(matchTable) do
        print(v.x)
        print(v.y)
        print(v.matchs)
        print(v.axys)
        if v.axys == 'x' then
            for i = v.x - v.matchs + 1, v.x, 1 do
                self.bricks[i][v.y].enabled = false
            end
        elseif v.axys == 'y' then
            for i =  (v.y - v.matchs) +1, v.y, 1 do
                self.bricks[v.x][i].enabled = false
            end
        end
    end
end


function Board:generateMissingBricks()

end

function Board:fillBoard()
    repeat
        for i = 1,  self.sizeX do
            self.bricks[i] = {}
            for j = 1, self.sizeY do
                local y = self.initialY + (32*(j-1))
                local x = self.initialX + (32*(i-1))
                if(i == self.selectedBrickY and j == self.selectedBrickX) then
                    selected = true
                else
                    selected = false
                end
                local color = self:randomColor()
                b = Brick(color, x, y, i, j, selected)

                self.bricks[i][j] = b
            end
        end
        until(next(self:checkForMatch()) == nil)

end

function Board:checkForMatch()
    local matchs = 1
    local lastColor = ''
    local matchTable = {}

    --Horizontal search
    for j = 1, self.sizeY do
        for i = 1, self.sizeX do
            if self.bricks[i][j].enabled == true then
                if self.bricks[i][j].color == lastColor then
                    matchs = matchs + 1
                else
                    if matchs >= 3 then
                        local x = i == self.sizeX and i or i -1
                        table.insert(matchTable,{x = x, y = j, matchs = matchs, axys = 'x'})
                    end
                    matchs = 1
                    lastColor = self.bricks[i][j].color
                end
            end
        end
    end

--Vertical search
    matchs = 1
    for i = 1, self.sizeX do
        for j = 1, self.sizeY do
            if self.bricks[i][j].color == lastColor then
                matchs = matchs + 1
            else
                if matchs >= 3 then
                    local y = j == self.sizeY and j or j -1
                    table.insert(matchTable, {x = i, y = y, matchs = matchs, axys = 'y'})
                end
                matchs = 1
                lastColor = self.bricks[i][j].color
            end
        end
    end
    return matchTable
end

function Board:randomColor()
    local highestColor = 8
    local colors = {}
    colors[1] = 'yellow'
    colors[2] ='gold'
    colors[3] ='green'
    colors[4] =  'blue'
    colors[5] = 'pink'
    colors[6] = 'red'
    colors[7] = 'orange'
    colors[8] = 'gray'

    local n = math.random(1, highestColor)
    return colors[n]
end

function Board:render()
    for i = 1, self.sizeX do
        for j = 1, self.sizeY do
            self.bricks[i][j]:render()
        end
    end

end