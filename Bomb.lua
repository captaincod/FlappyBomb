Bomb = Class{}

local gravity = 15

function Bomb:init()
    self.image = love.graphics.newImage('src/images/bomb.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = virtual_width / 2 - (self.width / 2)
    self.y = virtual_height / 2 - (self.height / 2)

    self.dy = 0
end

function Bomb:update(dt)
    self.dy = self.dy + gravity * dt

    -- jump
    if love.keyboard.wasPressed('space') then
        self.dy = -3
    end

    self.y = self.y + self.dy
end

function Bomb:collides(pipe)
    local top_offset = 2
    local bottom_offset = 4
    if (self.x + top_offset) + (self.width - bottom_offset) >= pipe.x and self.x + top_offset <= pipe.x + pipe_width then
        if (self.y + top_offset) + (self.height - bottom_offset) >= pipe.y and self.y + top_offset <= pipe.y + pipe_height then
            return true
        end
    end

    return false
end

function Bomb:render()
    love.graphics.draw(self.image, self.x, self.y)
end