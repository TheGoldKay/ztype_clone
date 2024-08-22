local settings = {
    win_width = 500,
    win_height = 700
}

function love.conf(t)
    t.window.title = "Z-type Clone"
    t.window.width = settings.win_width
    t.window.height = settings.win_height
    t.version = "11.5"
    t.console = true 
end

return settings 