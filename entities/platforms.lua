platforms = {}
platforms.instances = {}


function platforms:create(x,y,w,h,b)
  local platform = {}
  platform.b = b
  platform.x = x or 100
  platform.y = y or 300
  platform.w = w or 100
  platform.h = h or 1
  platform.collider = world:newRectangleCollider(platform.x,platform.y,platform.w,platform.h)
  platform.collider:setType("static")
  platform.collider:setCollisionClass("Platform")



  function platform:bounce()
    if platform.collider:enter("Player") then
      player.collider:applyLinearImpulse(0, -platform.b)
    end
  end

  function platform:oneway()
    if player.collider:getY()+25 > platform.collider:getY()  then
      platform.collider:setCollisionClass("Ghost")
    else platform.collider:setCollisionClass("Platform")
    end

  end
  table.insert(platforms.instances,platform)


  return platform
end

function platforms:update(dt)


  for i,v in pairs(platforms.instances) do
    v:bounce()
    v:oneway()
  end




end









return platforms
