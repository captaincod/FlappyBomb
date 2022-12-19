ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        stateMachine:change('countdown')
        sounds['countdown']:play()
    end
    if love.keyboard.wasPressed('q') then
        stateMachine:change('title')
    end
end

function ScoreState:render()
    love.graphics.setFont(fonts['bigFont'])
    love.graphics.printf('Клятый русский Иван!', 0, 64, virtual_width, 'center')
    love.graphics.printf('Позор Корея!', 0, 94, virtual_width, 'center')

    love.graphics.setFont(fonts['mediumFont'])
    love.graphics.printf('Очки  ' .. tostring(self.score), 0, 130, virtual_width, 'center')
    love.graphics.printf('Нажми ENTER для повтора миссии', 0, 170, virtual_width, 'center')
    love.graphics.printf('либо Q для выхода на главную', 0, 200, virtual_width, 'center')
end