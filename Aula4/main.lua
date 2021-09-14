local anim=require 'anim8'

local imagem,animation

local  posx=100
local direcao = true

function love.load()
    imagem=love.graphics.newImage("stick.png")
    local g = anim.newGrid(180,340,imagem:getWidth(),imagem:getHeight())
    animation=anim.newAnimation(g('1-9',1,'1-9',2,'1-9',3,'1-9',4,'1-9',5,'1-9',6,'1-9',7,'1-7',8),0.01)
end

function love.update(dt)
    if love.keyboard.isDown('left') then
        posx=posx -150 *dt
        direcao=false
        animation:update(dt)
    end
    if love.keyboard.isDown('right') then
        posx=posx + 150 *dt
        direcao=true
        animation:update(dt)
    end
end

function love.draw()
    love.graphics.setBackgroundColor(255,255,255)
    if direcao then
        animation:draw(imagem,posx,50,0,1,1,90,0)
    elseif not direcao then
        animation:draw(imagem,posx,50,0,-1,1,90,0)
    end
end