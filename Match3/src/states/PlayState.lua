--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 08/05/2020
-- Time: 20:45
-- To change this template use File | Settings | File Templates.
--
PlayState = Class {__includes = BaseState }

function PlayState:enter()
    self.board = Board(10,6)
    self.board:fillBoard()

end

function PlayState:update(dt)
    if love.keyboard.wasPressed('up') then
        if self.board.selectedBrickY > 1 then
            self.board:changeSelected('y', -1)
        end
    end

    if love.keyboard.wasPressed('down') then
        if self.board.selectedBrickY < self.board.sizeY then
        self.board:changeSelected('y', 1)
        end
    end

    if love.keyboard.wasPressed('left') then
        if self.board.selectedBrickX > 1 then
            self.board:changeSelected('x', -1)
        end
    end

    if love.keyboard.wasPressed('right') then
        if self.board.selectedBrickX < self.board.sizeX then
            self.board:changeSelected('x', 1)
        end
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if self.board.highlightedBrick == nil then
            self.board.highlightedBrick = self.board.bricks[self.board.selectedBrickX][self.board.selectedBrickY]
            self.board.bricks[self.board.selectedBrickX][self.board.selectedBrickY].highlighted = true
        else
            self.board:changeBricks(self.board.highlightedBrick, self.board.bricks[self.board.selectedBrickX][self.board.selectedBrickY])
            local matchTable = self.board:checkForMatch()
            if next(matchTable) ~= nil then
                self.board:cleanMatchs(matchTable)
                self.board:generateMissingBricks()
            else
                self.board:changeBricks(self.board.bricks[self.board.selectedBrickX][self.board.selectedBrickY], self.board.highlightedBrick)
            end
            self.board.highlightedBrick = nil
        end
    end
end

function PlayState:render()
    love.graphics.printf('Play', 100, 50, 100,'center')
    self.board:render()
end

