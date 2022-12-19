TitleState = Class{__includes = BaseState}

function TitleState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        stateMachine:change('countdown')
        sounds['countdown']:play()
    end
    if love.keyboard.wasPressed('r') then
        stateMachine:change('about')
    end
end

function TitleState:render()
    love.graphics.setFont(fonts['bigFont'])
    love.graphics.printf('Прыгать Бомба На Америка', 0, 70, virtual_width, 'center')
    love.graphics.setFont(fonts['mediumFont'])
    love.graphics.printf('Нажми ENTER для начала миссии', 0, 120, virtual_width, 'center')
    love.graphics.printf('либо R для чтения рапорта', 0, 150, virtual_width, 'center')
    love.graphics.setFont(fonts['smallFont'])
    love.graphics.printf('ESC - побег в Китай', 10, 270, virtual_width, 'left')
end