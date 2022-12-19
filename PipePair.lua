PipePair = Class{}

gap_height = 80
pipe_speed = 85

function PipePair:init(y)
    self.x = virtual_width + 32
    self.y = y
    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + pipe_height + gap_height)
    }
    self.remove = false
    self.scored = false
end

function PipePair:update(dt)
    if self.x > -pipe_height then
        self.x = self.x - pipe_speed * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end
end

function PipePair:render()
    for k, pipe in pairs(self.pipes) do
        pipe:render()
    end
end