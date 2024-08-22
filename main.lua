function love.load()
    package.path = package.path .. ";/home/jade/Code/love2d-helper/?.lua"
    helper = require "helper"
    settings = require "conf"
    love.graphics.setBackgroundColor(helper:get_color('phthalo_green'))
    words = getTextData()
    math.randomseed(os.time())
    current_word = dropWord(4)
    font = love.graphics.newFont("fonts/playfairDisplay_variableFont.ttf", 24)
    color_pressed = {1, 0.5, 0}
    color_normal = {1, 1, 1}
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
    local word = {text = "", final=0}
    repeat
        word.text = words[math.random(#words)]
    until #word.text == length
    return word
end

function displayWord(word)
    if word.final >= 1 then
        love.graphics.print({color_pressed, string.sub(word.text, 1, word.final),
                             color_normal, string.sub(word.text, word.final + 1)}, font, settings.win_width / 2, 0)
    else 
        love.graphics.print({color_normal, word.text}, font, settings.win_width / 2, 0)
    end
end

function love.draw()
    displayWord(current_word)
end

function checkPress(key)
    local next = current_word.final + 1
    if key == string.sub(current_word.text, next, next) then
        current_word.final = next
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    checkPress(key)
end