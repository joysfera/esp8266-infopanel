max7219 = require("max7219")
max7219.setup({ debug = true, numberOfModules = 4, slaveSelectPin = 8, intensity = 6 })
i = 0
tmr.create():alarm(1000, tmr.ALARM_AUTO, function()
    i = i + 1
    max7219.print(string.format("%04d", i))
end)
