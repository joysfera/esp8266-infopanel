-- simple clock on MAX7219 based 32x8 LED matrix
-- driven by ESP8266 running NodeMCU with u8g2 library
-- Petr Stehlik @ https://github.com/joysfera

local function init_display()
    spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, 8, 8)
    return u8g2.max7219_32x8(1, 8, 4) -- CS on GPIO 15
end

local function prepare_font()
    disp:setFont(u8g2.font_6x10_tf)
    disp:setFontRefHeightExtendedText()
    disp:setDrawColor(1)
    disp:setFontPosTop()
    disp:setFontDirection(0)
end

local function show_hello()
    disp:clearBuffer()
    disp:drawStr(0, 0, "Ahoj")
    disp:sendBuffer()
end

local function show_time()
    local tz_offset = 3600
    local tm = rtctime.epoch2cal(rtctime.get() + tz_offset)
    -- local tim = string.format("%02d:%02d", tm["hour"], tm["min"])
    local tim = string.format("%02d:%02d", tm["min"], tm["sec"])
    disp:clearBuffer()
    disp:drawStr(0, 0, tim)
    disp:sendBuffer()
end

disp = init_display()
prepare_font()
show_hello()

enduser_setup.start(
    function()
        sntp.sync(nil, nil, nil, 1)
        tmr.create():alarm(1000, tmr.ALARM_AUTO, show_time)
    end,
    function(err, str)
        print("enduser_setup: Err #" .. err .. ": " .. str)
    end,
    print -- Lua print function can serve as the debug callback
)

--[[
// vim: tabstop=4 shiftwidth=4 expandtab cindent
--]]
