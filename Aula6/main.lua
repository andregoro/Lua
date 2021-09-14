--som=love.audio.newSource("Sukima.mp3", "static")
require "camera"
imagem=love.graphics.newImage("play.png")
outraImagem=love.graphics.newImage("stop.png")
-- pause=love.graphics.newImage("pause.png")

volume=2
x,y,x2,y2=200,100,600,300
tamanho=1
function love.update( dt )
    if love.keyboard.isDown('left') then
        x=x-100*dt
    end

    if love.keyboard.isDown('right')then
        x=x+100*dt
    end

    if math.dist(x,y,x2,y2) then
        tamanho=tamanho +0.5* dt
        if tamanho >= 1.5 then
            tamanho=1.5
        end
    else
        tamanho=tamanho-0.5 *dt
        if tamanho <= 1 then
            tamanho=1
        end
    end
end

function love.draw()
   -- love.graphics.draw(play,100,50,0)
    camera:set()
    love.graphics.scale(tamanho)
    love.graphics.translate(-(x-100),-(y-380))
    love.graphics.draw(imagem     ,x ,y ,0,1,1,38.5,38.5)
    love.graphics.draw(outraImagem,x2,y2,0,1,1,38.5,38.5)
    camera:unset()
end

function math.dist(x1,y1,x2,y2)
    return((x2 - x1) ^ 2 + (y2 - y1) ^ 2 ) ^ 0.5
end

-- function love.mousepressed(mx,my,button)
--     if button ==1 and mx >=100 and mx < 100 +play:getWidth() and my >= 50 and my < 50 + play:getHeight() then
--         som:play()
--     end
--     if button ==1 and mx >=300 and mx < 300 +play:getWidth() and my >= 50 and my < 50 + pause:getHeight() then
--         som:pause()
--     end
--     if button ==1 and mx >=500 and mx < 600 +play:getWidth() and my >= 50 and my < 50 + stop:getHeight() then
--         som:stop()
--     end
-- end

-- function love.wheelmoved(x,y)
--     if y >0 then
--         volume = volume + 0.1
--         if volume >=1 then
--             volume = 1
--         end
--     elseif y < 0 then
--         volume =volume - 0.1
--         if volume <0.1 then
--             volume=0
--         end
--     end
-- end