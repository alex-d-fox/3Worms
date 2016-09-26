--2worms
--by alex fox
--alex.d.fox@icloud.com

function love.load()
	love.mouse.setVisible(false)
	width, height = love.window.getDesktopDimensions()
	love.window.setFullscreen(true)
	local joysticks = love.joystick.getJoysticks()
	joystick = joysticks[1]
	players={}
	players[1]={}
	players[2]={}
	players[3]={}
	for i=1,60 do
		spot={x=randomspotx(),y=randomspoty(),color=randomcolor()}
		p=i%3+1
		table.insert(players[p],spot)
	end
	speed=300
end

function love.draw()
	for p=1,3 do
		for i=20,1,-1 do
		  if (p == 1) then love.graphics.setColor(255, 0, 0, 255) end -- red
			if (p == 2) then love.graphics.setColor(0, 0, 255, 255) end -- blue
			if (p == 3) then love.graphics.setColor(0, 255, 0, 255) end -- green
			love.graphics.circle("fill",players[p][i].x,players[p][i].y,15,15,300)
		end
	end
end

function randomcolor()
	return love.math.random(0,255)
end

function randomspoty()
	return love.math.random(0,height)
end
function randomspotx()
	return love.math.random(0,width)
end

function randomdotcolor()
	return love.math.random(0,255)
end

function love.update(dt)
	if joystick then
		if joystick:getGamepadAxis("leftx") < 0 then
			players[1][1].x = players[1][1].x - speed * dt
		elseif joystick:getGamepadAxis("leftx") > 0 then
			players[1][1].x = players[1][1].x + speed * dt
		end
		if joystick:getGamepadAxis("lefty") < 0 then
			players[1][1].y = players[1][1].y - speed * dt
		elseif joystick:getGamepadAxis("lefty") > 0 then
			players[1][1].y = players[1][1].y + speed * dt
		end
		if joystick:getGamepadAxis("rightx") < 0 then
			players[2][1].x = players[2][1].x - speed * dt
		elseif joystick:getGamepadAxis("rightx") > 0 then
			players[2][1].x = players[2][1].x + speed * dt
		end
		if joystick:getGamepadAxis("righty") < 0 then
			players[2][1].y = players[2][1].y - speed * dt
		elseif joystick:getGamepadAxis("righty") > 0 then
			players[2][1].y = players[2][1].y + speed * dt
		end
		if joystick:isGamepadDown("b") then
			for i=1,20 do
				players[1][i].x = randomspotx()
				players[1][i].y = randomspoty()
			end
		end
		-- if joystick:isGamepadDown("triggerleft") then
		-- 	players[3][1].x = players[3][1].x - speed * dt
		-- end
		-- if joystick:isGamepadDown("triggerright") then
		-- 	players[3][1].x = players[3][1].x + speed * dt
		-- end
		if joystick:isGamepadDown("leftshoulder") then
			players[3][1].y = players[3][1].y - speed * dt
		end
		if joystick:isGamepadDown("rightshoulder") then
			players[3][1].y = players[3][1].y + speed * dt
		end
		if joystick:isGamepadDown("b") then
			for i=1,20 do
				players[1][i].x = randomspotx()
				players[1][i].y = randomspoty()
			end
		end
		if joystick:isGamepadDown("x") then
			for i=1,20 do
				players[2][i].x = randomspotx()
				players[2][i].y = randomspoty()
			end
		end
		if joystick:isGamepadDown("a") then
			for i=1,20 do
				players[3][i].x = randomspotx()
				players[3][i].y = randomspoty()
			end
		end
		if joystick:isGamepadDown("y") then
			for i=1,20 do
				love.event.quit(0)
			end
		end
	end
	if love.keyboard.isDown("left") then
		players[1][1].x = players[1][1].x - speed * dt
	elseif love.keyboard.isDown("right") then
		players[1][1].x = players[1][1].x + speed * dt
	end
	if love.keyboard.isDown("up") then
		players[1][1].y = players[1][1].y - speed * dt
	elseif love.keyboard.isDown("down") then
		players[1][1].y = players[1][1].y + speed * dt
	end
	if love.keyboard.isDown("d") then
		players[2][1].x = players[2][1].x - speed * dt
	elseif love.keyboard.isDown("g") then
		players[2][1].x = players[2][1].x + speed * dt
	end
	if love.keyboard.isDown("r") then
		players[2][1].y = players[2][1].y - speed * dt
	elseif love.keyboard.isDown("f") then
		players[2][1].y = players[2][1].y + speed * dt
	end
	if love.keyboard.isDown("q") or love.keyboard.isDown(1) then
		love.event.quit(0)
	end
	if love.keyboard.isDown("z") then
		for i=1,20 do
			players[1][i].x = randomspotx()
			players[1][i].y = randomspoty()
		end
	end
	if love.keyboard.isDown("w") then
		for i=1,20 do
			players[2][i].x = randomspotx()
			players[2][i].y = randomspoty()
		end
	end
	if love.keyboard.isDown("z") and love.keyboard.isDown("w") then
		for i=1,20 do
			players[1][i].x = randomspotx()
			players[2][i].x = randomspotx()
			players[1][i].y = randomspoty()
			players[2][i].y = randomspoty()
		end
	end
	players[3][1].x = love.mouse.getX()
	players[3][1].y = love.mouse.getY()
	for i=2,20 do
		players[1][i].x=players[1][i].x*0.8+players[1][i-1].x*0.2
		players[1][i].y=players[1][i].y*0.8+players[1][i-1].y*0.2
		players[2][i].x=players[2][i].x*0.8+players[2][i-1].x*0.2
		players[2][i].y=players[2][i].y*0.8+players[2][i-1].y*0.2
		players[3][i].x=players[3][i].x*0.8+players[3][i-1].x*0.2
		players[3][i].y=players[3][i].y*0.8+players[3][i-1].y*0.2
	end
	if (players[1][1].x < 0) then players[1][1].x = 0 end
	if (players[1][1].y < 0) then players[1][1].y = 0 end
	if (players[1][1].x > width) then players[1][1].x = width end
	if (players[1][1].y > height) then players[1][1].y = height end
	if (players[2][1].x < 0) then players[2][1].x = 0 end
	if (players[2][1].y < 0) then players[2][1].y = 0 end
	if (players[2][1].x > width) then players[2][1].x = width end
	if (players[2][1].y > height) then players[2][1].y = height end
	if (players[3][1].x < 0) then players[3][1].x = 0 end
	if (players[3][1].y < 0) then players[3][1].y = 0 end
	if (players[3][1].x > width) then players[3][1].x = width end
	if (players[3][1].y > height) then players[3][1].y = height end
end
