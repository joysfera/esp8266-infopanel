-- demo WS2812 + HTTP
wifi.setmode(wifi.STATIONAP)
-- wifi.sta.config({ssid="openalt", pwd=""})

ws2812.init()
gbuffer = ws2812.newBuffer(24, 3)
ws2812_effects.init(gbuffer)
ws2812_effects.set_mode("gradient_rgb", string.char(0,0,200,200,0,0,0,200,0))
ws2812_effects.start()

buffer = ws2812.newBuffer(24, 3)
tmr.create():alarm(2000, tmr.ALARM_AUTO, function()
    http.get("http://test.sophics.cz/rnd.php", nil, function(code, data)
        buffer:fill(0, 0, 0)
        if code == 200 then
            print(data) -- 10 to 34
            buffer:mix(192, gbuffer)
            local start = data - 9
            if start < 1 then start = 1 end
            for i = start, 24 do
                buffer:set(i, 0, 0, 0)
            end
        else print(code)
        end
        ws2812.write(buffer)
    end)
end)

ws2812_effects.stop()
