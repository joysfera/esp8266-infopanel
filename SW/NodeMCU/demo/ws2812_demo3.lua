--demo ws2812_effects
demo = 5
ws2812.init()
buffer = ws2812.newBuffer(24,3)
ws2812_effects.init(buffer)
ws2812_effects.set_speed(10)
ws2812_effects.set_brightness(10)
ws2812_effects.set_color(0,255,0)
if demo == 1 then
    ws2812_effects.set_mode("blink")
    
elseif demo == 2 then
    ws2812_effects.set_mode("gradient_rgb", string.char(0,200,0,200,200,0,0,200,0))
    
elseif demo == 3 then
    ws2812_effects.set_mode("random_dot", 3)
    
elseif demo == 4 then
    ws2812_effects.set_mode("halloween")

elseif demo == 5 then
    ws2812_effects.set_mode("larson_scanner")
    ws2812_effects.set_speed(250)

end
ws2812_effects.start()
-- at exit must call either ws2812_effects.stop() or node.restart()