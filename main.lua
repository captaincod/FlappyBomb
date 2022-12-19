push = require 'push'
Class = require 'class'
require 'Bomb'
require 'Pipe'
require 'PipePair'
require 'StateMachine'
require 'states/BaseState'
require 'states/PlayState'
require 'states/TitleState'
require 'states/ScoreState'
require 'states/CountdownState'
require 'states/AboutState'

width = 1280
height = 720
virtual_width = 512
virtual_height = 288

local background = love.graphics.newImage('src/images/back.png')
local backgroundScroll = 0

local scroll_speed = 30
local looping_point = 1015

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    math.randomseed(os.time())
    love.window.setTitle('Flappy Bomb')

    fonts = {
        ['smallFont'] = love.graphics.newFont('src/font/MultiroundPro.otf', 10),
        ['mediumFont'] = love.graphics.newFont('src/font/MultiroundPro.otf', 14),
        ['bigFont'] = love.graphics.newFont('src/font/MultiroundPro.otf', 28),
        ['countFont'] = love.graphics.newFont('src/font/MultiroundPro.otf', 56)
    }
    love.graphics.setFont(fonts['bigFont'])

    sounds = {
        ['explosion'] = love.audio.newSource('src/sounds/explosion.wav', 'static'),
        ['countdown'] = love.audio.newSource('src/sounds/countdown.wav', 'static'),
        ['score'] = love.audio.newSource('src/sounds/score.wav', 'static'),
        ['music'] = love.audio.newSource('src/sounds/Little_Big_Lolly_bomb_rock_cover.mp3', 'static')
    }
    sounds['music']:setLooping(true)
    sounds['music']:play()

    push:setupScreen(virtual_width, virtual_height, width, height, {
        vsync = true,
        fullscreen = false,
        resizable = false
    })

    stateMachine = StateMachine {
        ['title'] = function() return TitleState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end,
        ['countdown'] = function() return CountdownState() end,
        ['about'] = function() return AboutState() end
    }
    stateMachine:change('title')

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    
    if key == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    backgroundScroll = (backgroundScroll + scroll_speed * dt) 
        % looping_point

    stateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    love.graphics.draw(background, -backgroundScroll, 0)
    stateMachine:render()
    push:finish()
end