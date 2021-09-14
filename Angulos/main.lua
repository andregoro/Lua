function love.load()
    personagenA={
        x=100,
        y=100
    }
    personagenB={
        x=200,
        y=100,
        velocidade=50
    }
end

function love.update(dt)
    if love.keyboard.isDown('left') then
        personagenB.x=personagenB.x-personagenB.velocidade *dt
    end
    if love.keyboard.isDown('right') then
        personagenB.x=personagenB.x+personagenB.velocidade *dt
    end
    if love.keyboard.isDown('up') then
        personagenB.y=personagenB.y-personagenB.velocidade *dt
    end
    if love.keyboard.isDown('down') then
        personagenB.y=personagenB.y+personagenB.velocidade *dt
    end
end

function love.draw()
    love.graphics.setColor(255,150,100)
    love.graphics.circle("fill",personagenA.x,personagenA.y,10,200)
    love.graphics.setColor(0,0,255)
    love.graphics.circle("fill",personagenB.x,personagenB.y,10,200)
end