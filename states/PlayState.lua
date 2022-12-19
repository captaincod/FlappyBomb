PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.bomb = Bomb()
    self.pipePairs = {}
    self.timer = 0
    self.score = 0
    -- self.lastY = -pipe_height + math.random(90) + 55
    self.lastY = math.random(15 - pipe_height, virtual_height - gap_height - pipe_height - 15)
end

function PlayState:update(dt)
    self.timer = self.timer + dt
    if self.timer > 2 then
        local y = math.random(
            math.max(15 - pipe_height, self.lastY - 90), 
            math.min(self.lastY + 90, virtual_height - gap_height - pipe_height - 15))
        self.lastY = y
        
        table.insert(self.pipePairs, PipePair(y))
        self.timer = 0
    end

    for k, pair in pairs(self.pipePairs) do
        if not pair.scored then
            if pair.x + pipe_width < self.bomb.x then
                self.score = self.score + 1
                pair.scored = true
                sounds['score']:play()
            end
        end
        pair:update(dt)
    end

    for k, pair in pairs(self.pipePairs) do
        if pair.remove then
            table.remove(self.pipePairs, k)
        end
    end

    self.bomb:update(dt)

    for k, pair in pairs(self.pipePairs) do
        for l, pipe in pairs(pair.pipes) do
            if self.bomb:collides(pipe) then
                sounds['explosion']:play()
                stateMachine:change('score', {
                    score = self.score
                })
            end
        end
    end

    if self.bomb.y > virtual_height - (self.bomb.height - 4) or self.bomb.y < -4 then
        sounds['explosion']:play()
        stateMachine:change('score', {
            score = self.score
        })
    end
end

function PlayState:render()
    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end

    love.graphics.setFont(fonts['bigFont'])
    love.graphics.print('Очки  ' .. tostring(self.score), 8, 8)

    self.bomb:render()
end