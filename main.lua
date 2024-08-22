
function love.load()
    package.path = package.path .. ";/home/jade/Code/love2d-helper/?.lua"
    helper = require "helper"
    settings = require "conf"
    love.graphics.setBackgroundColor(helper:get_color('phthalo_green'))
    words = getTextData()
    math.randomseed(os.time())
    current_word = dropWord()
    font = love.graphics.newFont("fonts/playfairDisplay_variableFont.ttf", 24)
end

function getTextData()
    local file = io.open('wordlist.txt', 'r')
    local words = {}
    for line in file:lines() do
        table.insert(words, line)
    end
    file:close()
    return words
end

function dropWord(length)
    length = length or 3
    local word
    repeat
        word = words[math.random(#words)]
    until #word == length
    return word
end

function love.draw()
    love.graphics.print({{1, 0.5, 0}, current_word}, font, settings.win_width / 2, 0)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    if key == "space" then
        current_word = dropWord()
    end
end