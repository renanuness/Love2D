--
-- Created by IntelliJ IDEA.
-- User: renan.silva
-- Date: 03/06/2020
-- Time: 09:30
-- To change this template use File | Settings | File Templates.
--
require 'src/Dependencies'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    gTextures = {
        ['world'] = love.graphics.newImage('graphics/tiles.png'),
        ['tiles2'] = love.graphics.newImage('graphics/tiles_2.png')
    }

    gGround = {
        ['brown'] = GenerateGroundQuads(gTextures['world'], 16, 16, 1),
        ['blue'] = GenerateGroundQuads(gTextures['world'], 16, 16, 2),
        ['gray'] = GenerateGroundQuads(gTextures['world'], 16, 16, 3),
        ['green'] = GenerateGroundQuads(gTextures['world'], 16, 16, 4)
    }

     gSky = GenerateQuad(gTextures['tiles2'], 16, 16, 1, 0)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })
end

function love.update()

end

function love.draw()
    push:apply('start')
    for i = 0, 26 do
        for j = 10, 15 do
            love.graphics.draw(gTextures['world'], gGround['brown'][1] ,i * 16, j * 16)
        end
    end
    push:apply('end')
end

