--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 02/05/2020
-- Time: 16:38
-- To change this template use File | Settings | File Templates.
--
StartState = Class {__includes = BaseState }

function StartState:enter()

end

function StartState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
        gStateMachine:change('play')
    end

end

function StartState:render()
    love.graphics.setFont(gFonts['medium'])
    love.graphics.print('dw')
    love.graphics.printf('Start', 100, 50, 100,'center')


end

