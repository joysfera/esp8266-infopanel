local abort = false

local function abortTest(data)
    abort = true    -- user requested abort
    uart.on('data') -- turns off uart scanning
end

local function abortInit()
    print('Press ENTER to abort startup')
    -- if <CR> is pressed, call abortTest
    uart.on('data', '\r', abortTest, 0)
    -- start timer to execute startup function in 1 second
    tmr.create():alarm(1000, tmr.ALARM_SINGLE, function()
        if abort then return end  -- if user requested abort, exit
        abort = nil
        uart.on('data')
        dofile('main.lc')
    end)
end

tmr.create():alarm(200, tmr.ALARM_SINGLE, abortInit) -- call abortInit after 0.2s
