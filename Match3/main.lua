--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 01/05/2020
-- Time: 17:14
-- To change this template use File | Settings | File Templates.
--

require 'src/Dependencies'

function love.conf(t)
    t.console = true
end


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    math.randomseed(os.time())
    love.window.setTitle('Match3')

    local matchTable = {}

    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
    }
    gTextures = {
        ['background'] = love.graphics.newImage('graphics/background.png'),
        ['tiles'] = love.graphics.newImage('graphics/match3.png')
    }

    gTiles = {
        ['yellow'] = GenerateTiles(gTextures['tiles'], 32, 32, 1, 1),
        ['gold'] = GenerateTiles(gTextures['tiles'], 32, 32, 2, 1),
        ['green'] = GenerateTiles(gTextures['tiles'], 32, 32, 5, 1),
        ['blue'] = GenerateTiles(gTextures['tiles'], 32, 32, 6, 1),
        ['pink'] = GenerateTiles(gTextures['tiles'], 32, 32, 1, 2),
        ['red'] = GenerateTiles(gTextures['tiles'], 32, 32, 3, 2),
        ['orange'] = GenerateTiles(gTextures['tiles'], 32, 32, 6, 2),
        ['gray'] = GenerateTiles(gTextures['tiles'], 32, 32, 7, 2),
    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    gStateMachine = StateMachine {
        ['start'] = function () return StartState() end,
        ['play'] = function() return PlayState() end
    }

    gStateMachine:change('start')

    love.keyboard.keysPressed = {}
end

function love.update(dt)
    gStateMachine:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.draw()
    push:apply('start')
    gStateMachine:render()

    push:apply('end')
end