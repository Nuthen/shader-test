game = {}

-- Game TODO:
--      * Add identity and title to conf.lua

function game:enter()
    self.img = love.graphics.newImage('assets/img/dark_soul.png')
    self.shader = love.graphics.newShader('shaders/distort.glsl')
    self.shaderBurn = love.graphics.newShader('shaders/burn.glsl')
    self.imgMask = love.graphics.newImage('assets/img/height_mask.png')

    self.shader:send('mask', self.imgMask)
    self.shaderBurn:send('mask', self.imgMask)
    self.time = 0
    self.canvas = love.graphics.newCanvas()
end

function game:update(dt)
	self.time = self.time+dt
    self.shader:send('time', self.time)
    self.shaderBurn:send('time', self.time)
end

function game:keypressed(key, code)

end

function game:mousepressed(x, y, mbutton)

end

function game:draw()
    love.graphics.setColor(255, 255, 255)
    local text = "This is the game"
    love.graphics.setFont(font[48])
    local x = love.graphics.getWidth()/2 - love.graphics.getFont():getWidth(text)/2
    local y = love.graphics.getHeight()/2 - love.graphics.getFont():getHeight(text)/2

    love.graphics.setShader(self.shader)
    self.canvas:renderTo(function()
    	love.graphics.draw(self.img)
    end)

	love.graphics.setShader(self.shashaderBurn)
    love.graphics.draw(self.canvas)
	love.graphics.setShader()
end