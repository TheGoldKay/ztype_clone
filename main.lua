
function love.load()
    package.path = package.path .. ";/home/jade/Code/love2d-helper/?.lua"
    helper = require "helper"
    settings = require "conf"
    love.graphics.setBackgroundColor(helper.colors.phthalo_green)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end