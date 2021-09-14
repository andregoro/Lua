BUTTON_HEIGHT = 64
local function newButton(text, fn)
    return {text = text, fn = fn, now = false, last = false}
end

local buttons = {}
local font = nil

function love.load()
    font = love.graphics.newFont(32)

    table.insert(buttons, newButton("Start", function() print("Start") end))

    table.insert(buttons, newButton("Load", function() print("Load") end))

    table.insert(buttons, newButton("Quit", function()
        print("Quit")
        love.event.quit(0)
    end))
end

function love.update(dt) end

function love.draw()
    local ww = love.graphics.getWidth()
    local wh = love.graphics.getHeight()

    local button_width = ww * (1 / 2)
    local margin = 10

    local total_height = (BUTTON_HEIGHT + margin) * #buttons
    local curso_y = 0

    for i, button in ipairs(buttons) do
        button.last = button.now

        local bx = (ww * 0.5) - (button_width * 0.5)
        local by = (wh * 0.3) - (BUTTON_HEIGHT * 0.3) + curso_y

        local color = {0.4, 0.4, 0.5, 1.0}

        local mx, my = love.mouse.getPosition()

        local hot = mx > by and mx < by + button_width and 
                    my > by and by < by + BUTTON_HEIGHT
        if hot then color = {0.8, 0.8, 0.9, 1.0} end

        button.now = love.mouse.isDown(1)
        if button.now and not button.last and hot then button.fn() end
        love.graphics.setColor(0.4, 0.4, 0.5, 1.0)
        love.graphics.rectangle("fill", bx, by, button_width, BUTTON_HEIGHT)
        love.graphics.setColor(0, 0, 0, 1)

        local textW = font:getWidth(button.text)
        local textH = font:getHeight(button.text)

        love.graphics.print(button.text, font, (ww * 0.5) - textW * 0.5,
                            by + textH * 0.5)
        curso_y = curso_y + (BUTTON_HEIGHT + margin)
    end
end
