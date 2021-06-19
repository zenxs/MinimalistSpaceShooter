-- Original Game's Art Resolution: 180x320
-- 
function love.load()

	love.window.setMode(540, 960, nil) -- Setting up 9:16 resolution

	sprites = {}
	sprites.scrollingBackground = love.graphics.newImage('sprites/scrollingBackground.png')
	sprites.player = love.graphics.newImage('sprites/player.png')
	sprites.boss = love.graphics.newImage('sprites/boss.png')

	player = {}
	player.x = love.graphics.getWidth() / 2
	player.y = 800
	player.speed = 500
	player.health = 100

	boss = {}
	boss.x = love.graphics.getWidth()/2
	boss.y = 200
	boss.speed = 0
	boss.state = 0
	boss.health = 100

	--Background Animation------------
	scrollingBackground = {}
	scrollingBackground.x = 0
	scrollingBackground.y = -960
	scrollingBackground.speed = 50
	----------------------------------
end

function love.update(dt)

	--Animated Background------------------------------- --
	scrollingBackground.y = scrollingBackground.y + scrollingBackground.speed * dt
	if scrollingBackground.y >= 0 then
		scrollingBackground.y = -960
	end
	-- ------------------------------------------------- -- 
	if love.keyboard.isDown("d") then 
		player.x = player.x + player.speed * dt 
	end	

	if love.keyboard.isDown("a") then 
		player.x = player.x - player.speed * dt 
	end	

	if love.keyboard.isDown("w") then 
		player.y = player.y - player.speed * dt 
	end

	if love.keyboard.isDown("s") then 
		player.y = player.y + player.speed * dt 
	end

end

function love.draw()

	love.graphics.draw(sprites.scrollingBackground, scrollingBackground.x, scrollingBackground.y)

	love.graphics.draw(sprites.player, player.x, player.y, nil, nil, nil, 32, 32)

	love.graphics.draw(sprites.boss, boss.x, boss.y, nil, nil, nil, 64, 64)

end	

function spawnBullet()
	local bullet = {}
	bullet.x = player.x 
	bullet.y = player.y
	bullet.speed = 500
	bullet.dead = false
	bullet.direction = playerMouseAngle()
	table.insert(bullets, bullet)
	
end