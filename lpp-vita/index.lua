-- Loading background image
local bg = Graphics.loadImage("ux0:/data/lpp-vita/bg.png") 

local samples = {
	{["name"] = "Hello World", ["desc"] = "Basic Hello World, prints a string on screen."},
	{["name"] = "Image", ["desc"] = "Shows how to correctly integrate images in your applications."},
	{["name"] = "Timer", ["desc"] = "Shows how to correctly use timers in your applications."},
	{["name"] = "Touch", ["desc"] = "Shows how to correctly use touch in your applications."},
	{["name"] = "System Message", ["desc"] = "Shows how to correctly show system messages and progressbars."},
	{["name"] = "Keyboard", ["desc"] = "Shows how to correctly use built-in keyboard in your applications."},
	{["name"] = "File Manager", ["desc"] = "Simple File Manager sample."},
	{["name"] = "Font", ["desc"] = "Shows how to correctly use fonts in your applications."},
	{["name"] = "Sound", ["desc"] = "Shows how to correctly use sounds and musics in your applications."},
	{["name"] = "Microphone", ["desc"] = "Shows how to correctly use microphone in your applications."},
	{["name"] = "Camera", ["desc"] = "Shows how to use photo camera in your applications."},
	{["name"] = "HTTP", ["desc"] = "Shows how to correctly use Network in your applications."},
	{["name"] = "Sockets", ["desc"] = "Shows how to correctly use sockets in your applications."},
	{["name"] = "FTP", ["desc"] = "Shows how to correctly initialize an FTP server in your applications."},
	{["name"] = "3D Cube", ["desc"] = "Shows how to correctly use Render module to create a textured cube."},
	{["name"] = "3D Model", ["desc"] = "Shows how to correctly use Render module to load and render a 3D model."},
	{["name"] = "Test", ["desc"] = "Tesre."},
	{["name"] = "RayCasting", ["desc"] = "Shows"} ,{["name"]=os.date()}
}

-- Initializing oldpad variable
oldpad = SCE_CTRL_CROSS

-- Used colors
local white = Color.new(255, 255, 255)
local yellow = Color.new(255, 255, 0)
local gray_transparent = Color.new(195, 195, 195, 80)

-- Cursor index
local idx = 1

-- Main loop
while true do
	
	-- Starting drawing phase
	Graphics.initBlend()
	
	-- Drawing background
	Graphics.drawImage(0,0, bg)
	Graphics.fillRect(20, 350, 20, 400, gray_transparent)
	Graphics.fillRect(20, 940, 490, 535, gray_transparent)
	
	-- Drawing samples selector
	local y = 10
	for i,sample in pairs(samples) do
		local x = 25
		local color = white
		if i == idx then
			color = yellow
			x = 30
		end
		Graphics.debugPrint(x, y + 20*i, sample.name, color)
	end
	
	-- Drawing selected sample description
	Graphics.debugPrint(25, 500, samples[idx].desc, white)

	-- Drawing instructions
	Graphics.debugPrint(700, 5, "Press START to exit.", white)
	
	-- Terminating drawing phase
	Graphics.termBlend()
	Screen.flip()
	
	-- Controls checking
	pad = Controls.read()
	if Controls.check(pad, SCE_CTRL_UP) and not Controls.check(oldpad, SCE_CTRL_UP) then
		idx = idx - 1
		if idx == 0 then
			idx = #samples
		end
	elseif Controls.check(pad, SCE_CTRL_DOWN) and not Controls.check(oldpad, SCE_CTRL_DOWN) then
		idx = idx + 1
		if idx > #samples then
			idx = 1
		end
	elseif Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS) then
		dofile("ux0:/data/lpp-vita/samples/" .. samples[idx].name .. "/index.lua")
	elseif Controls.check(pad, SCE_CTRL_START) and not Controls.check(oldpad, SCE_CTRL_START) then
		Graphics.freeImage(bg)
		System.exit()
	end
	
	-- Saving old controls scheme
	oldpad = pad
	
end
