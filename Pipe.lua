Pipe = Class{}

pipe_width = 70
pipe_height = 288

local images = {
    ['1'] = love.graphics.newImage('src/images/pipe1.png'),
    ['2'] = love.graphics.newImage('src/images/pipe2.png'),
    ['3'] = love.graphics.newImage('src/images/pipe3.png'),
    ['4'] = love.graphics.newImage('src/images/pipe4.png')
}

function Pipe:init(orientation, y)
    self.x = virtual_width
    self.y = y
    self.image = images[tostring(math.random(1,4))]
    self.width = pipe_width
    self.height = pipe_height
    self.orientation = orientation
end

function Pipe:render()
    love.graphics.draw(self.image, self.x, 
    (self.orientation == 'top' and self.y + pipe_height or self.y), 
    0, -- rotation
    1, -- X scale
    self.orientation == 'top' and -1 or 1) -- Y scale
end
