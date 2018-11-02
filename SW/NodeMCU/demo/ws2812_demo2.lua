-- demo WS2812 buffer
ws2812.init()
buffer = ws2812.newBuffer(24, 3)
buffer:fill(0, 0, 0)
i = 0
tmr.create():alarm(50, tmr.ALARM_AUTO, function()
    i = i + 1
    buffer:fade(2)
    buffer:set(i % buffer:size() + 1, 0, 255, 0)
    ws2812.write(buffer)
end)

