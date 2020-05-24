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
    if love.keyboard.wasPressed('r') then
        print(self.board.highlightedBrick.indexX)
        print(self.board.highlightedBrick.indexY)
        print(self.board.highlightedBrick.selected)
    end

    if love.keyboard.wasPressed('up') then
        if self.board.highlightedBrick.indexY > 1 then
            self.board:changeSelected('y', -1)
        end
    end

    if love.keyboard.wasPressed('down') then
        if self.board.highlightedBrick.indexY < self.board.sizeY then
        self.board:changeSelected('y', 1)
        end
    end

    if love.keyboard.wasPressed('left') then
        if self.board.highlightedBrick.indexX > 1 then
            self.board:changeSelected('x', -1)
        end
    end

    if love.keyboard.wasPressed('right') then
        if self.board.highlightedBrick.indexX < self.board.sizeX then
            self.board:changeSelected('x', 1)
        end
    end
    -- quando apertar enter tem que pegar o highlighted e colocar na table
    -- se tiver um na table vida que segue
    -- se tiver 2 -> testar se podem ser trocados
    -- se puderem-> colocar o segundo na table e testar o match
    -- se não puderem-> limpar a table e colocar o highlighted

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if self.board.selectedBrick == nil then
            self.board.selectedBrick = self.board.highlightedBrick
        elseif self.board:changeBricks(self.board.selectedBrick, self.board.highlightedBrick) == true then
            local matchTable = self.board:checkForMatch()
            if next(matchTable) ~= nil then
                --do
                repeat
                self.board:cleanMatchs(matchTable)
                self.board:cleanSpaces()
                self.board:generateMissingBricks()
                matchTable = self.board:checkForMatch()
                until(next(matchTable) ~= nil)
            else
                self.board:changeBricks(self.board.selectedBrick, self.board.highlightedBrick)
            end
            self.board.selectedBrick = nil
            else
            self.board.selectedBrick = self.board.highlightedBrick
        end
    end
end

function PlayState:render()
    love.graphics.printf('Play', 100, 50, 100,'center')
    self.board:render()
end

