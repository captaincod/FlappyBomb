AboutState = Class{__includes = BaseState}

function AboutState:update(dt)
    if love.keyboard.wasPressed('q') then
        stateMachine:change('title')
    end
end

function AboutState:render()
    love.graphics.setFont(fonts['bigFont'])
    love.graphics.printf('Здравствуй, глупый Иван!', 0, 40, virtual_width, 'center')
    love.graphics.setFont(fonts['mediumFont'])
    love.graphics.printf('Ты попал сюда после того, как руководитель партии, армии и народа заметил твой инженерный талант во Владивостоке.', 0, 90, virtual_width, 'center')
    love.graphics.printf('Теперь твоя великая задача - восславить Корею, отправив любимую бомбу главного товарища в гнусную Америку.', 0, 145, virtual_width, 'center')
    love.graphics.printf('Не задень ни единого партийного щита, если не хочешь лишиться пальцев!', 0, 185, virtual_width, 'center')
    love.graphics.printf('Да прибудет с тобой СОЛНЦЕ ЧУЧХЕ!', 0, 230, virtual_width, 'center')
    love.graphics.setFont(fonts['smallFont'])
    love.graphics.printf('Q для выхода на главную', 10, 270, virtual_width, 'left')
end