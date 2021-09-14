-- Create a new color
local white = Color.new(255, 255, 255)
--Network.init()
-- skt = Socket.connect("192.168.100.154", 8000)

-- Our payload to request a file

-- Sending request
-- Socket.send(skt, payload)

-- raw_data = ""
-- while raw_data == "" do
-- 		raw_data =raw_data..Socket.receive(skt, 1024)
-- end

-- Main loop
while true do

    -- Draw a string on the screen

    Graphics.initBlend()
    Screen.clear()
    Graphics.debugPrint(5, 5, "Hello World!", white)
    Graphics.debugPrint(5, 25, "Press X para selecionar ip e porta.", white)
    Graphics.debugPrint(5, 26, "Press T para sair", white)
    Graphics.termBlend()

    -- Update screen (For double buffering)
    Screen.flip()

    -- Check controls for exiting
    if Controls.check(Controls.read(), SCE_CTRL_TRIANGLE) then break end
    if Controls.check(Controls.read(), SCE_CTRL_CROSS) then ip() end
end
--Network.term()
function ip() Keyboard.show("Sample Title", "Sample Text") end

function s()
    Keyboard.show("Sample Title", "Sample Text")
    ret = "Waiting for user input..."

    -- Main loop
    while true do

        -- Initializing drawing phase
        Graphics.initBlend()
        Screen.clear()

        -- Checking for keyboard status
        status = Keyboard.getState()
        if status ~= RUNNING then

            -- Check if user didn't canceled the keyboard
            if status ~= CANCELED then
                ret = "IP seu ip: " .. Keyboard.getInput()
            else
                ret = "You canceled the keyboard"
            end

            -- Terminating keyboard
            Keyboard.clear()

        end

        -- Dtawing state on screen
        Graphics.debugPrint(5, 5, ret, Color.new(255, 255, 255))
        if ret ~= "Waiting for user input..." then
            Graphics.debugPrint(5, 25,
                                "Press TRIANGLE to return to the sample selector.",
                                Color.new(255, 255, 255))
            if Controls.check(Controls.read(), SCE_CTRL_TRIANGLE) then
                Graphics.termBlend()
                return
            end
        end
        Graphics.termBlend()
        Screen.flip()

    end
end
