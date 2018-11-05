-- init WS2812 buffer
ws2812.init()
buffer = ws2812.newBuffer(43, 3)
ws2812_effects.init(buffer)
ws2812_effects.stop()
buffer:fill(0, 0, 0)
ws2812.write(buffer)
