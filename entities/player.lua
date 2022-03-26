local player = {}


function player:load(x,y)
  player.x = x or 0
  player.y = y or 0
  player.collider = world:newRectangleCollider(player.x,player.y,50,50)
  player.collider:setFixedRotation(true)
  player.collider:setCollisionClass("Player")
  player.friction = 2
  player.velx = 10000
  player.speed = 5000
  player.collider:setFriction(0.05)

end
function player:physics(dt)
  player.collider:applyForce(player.velx,0)
  player.velx = 0
  if love.keyboard.isDown("d") then player.velx = player.speed end
  if love.keyboard.isDown("a") then player.velx = -player.speed end
end

function player:update(dt)
  player:physics(dt)
  if player.collider:getX() > 600 then
    local _,y = player.collider:getLinearVelocity()
    player.collider:setLinearVelocity(0,y)
  end



end


function player:draw()

end

return player
