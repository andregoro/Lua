som=love.audio.newSource("Sukima.mp3", "static")
play=love.graphics.newImage("play.png")
stop=love.graphics.newImage("stop.png")
pause=love.graphics.newImage("pause.png")

volume=2
local textoVolume=""
function love.update()
    som:setVolume(volume)
    textoVolume=volume
end

function love.draw()
    love.graphics.setColor(0,0,0)
    love.graphics.print(textoVolume,50,50)
    love.graphics.setColor(255,255,255)
    love.graphics.setBackgroundColor(255,255,255)
    love.graphics.draw(play,100,50,0)
    love.graphics.draw(pause,300,50,0)
    love.graphics.draw(stop,500,50,0)
end

function love.mousepressed(mx,my,button)
    if button ==1 and mx >=100 and mx < 100 +play:getWidth() and my >= 50 and my < 50 + play:getHeight() then
        som:play()
    end
    if button ==1 and mx >=300 and mx < 300 +play:getWidth() and my >= 50 and my < 50 + pause:getHeight() then
        som:pause()
    end
    if button ==1 and mx >=500 and mx < 600 +play:getWidth() and my >= 50 and my < 50 + stop:getHeight() then
        som:stop()
    end
end

function love.wheelmoved(x,y)
    if y >0 then
        volume = volume + 0.1
        if volume >=1 then
            volume = 1
        end
    elseif y < 0 then
        volume =volume - 0.1
        if volume <0.1 then
            volume=0
        end
    end
end
