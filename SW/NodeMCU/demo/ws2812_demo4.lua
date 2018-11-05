ws2812.init()
pct = 1
tmr.alarm(0, 1500, tmr.ALARM_AUTO, function()
    pct = pct + 33
    if pct > 100 then pct = 1 end
    progress(24, pct)
end)

function progress(celkem, procent)
    local buffer = ws2812.newBuffer(celkem, 3)
    buffer:fill(0, 127, 0)
    local metr = procent * celkem / 100
    local odkonce = metr - celkem
    print(metr, odkonce)
    buffer:shift(odkonce, ws2812.SHIFT_LOGICAL, odkonce) -- vynulovat od konce
    ws2812.write(buffer)
end
