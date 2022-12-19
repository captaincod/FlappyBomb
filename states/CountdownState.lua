CountdownState = Class{__includes = BaseState}

countdown_time = 0.5

function CountdownState:init()
    self.count = 3
    self.timer = 0
end

function CountdownState:update(dt)
    self.timer = self.timer + dt

    if self.timer > countdown_time then
        self.timer = self.timer % countdown_time
        self.count = self.count - 1

        if self.count == 0 then
            stateMachine:change('play')
        end
    end
end

function CountdownState:render()
    love.graphics.setFont(fonts['countFont'])
    love.graphics.printf(tostring(self.count), 0, 110, virtual_width, 'center')
    love.graphics.setFont(fonts['mediumFont'])
    love.graphics.printf('SPACE для прыжка', 0, 180, virtual_width, 'center')
end