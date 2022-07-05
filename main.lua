wf = require"modules/windfield"
gam = require"modules/gamera"
player = require"entities/player"
require"entities/platforms"
function love.load()
  world = wf.newWorld(0,0,true)
  world:addCollisionClass('Player')
  world:addCollisionClass('Platform')
  world:addCollisionClass("Ghost",{ignores = {"Player"}})
  cam = gam.new(0,-10000,1200,100000)
  world:setGravity(0, 1000)
  world:setQueryDebugDrawing(true)
  player:load()
  platforms:create(-1000,600,100000,1,5000)
  uwu = platforms:create(100,300,300,1,2000)
  uwu.state = "destroyed"
end

function love.update(dt)
  player:update(dt)
  world:update(dt)
  platforms:update(dt)
  cam:setPosition(player.collider:getX(),player.collider:getY())
end


function love.draw()
  love.graphics.print(player.collider:getY())
  cam:draw(function()
    world:draw()
    love.graphics.rectangle("fill", player.collider:getX(), player.collider:getY(), 10, 10)
  end)
end
