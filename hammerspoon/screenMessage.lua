-- Function to display a screen message
local function showHourlyMessage()
    local hour = os.date("%I") -- Get current hour (12-hour format)
    local minute = os.date("%M") -- AM or PM
    local ampm = os.date("%p") -- AM or PM
    local message = "      Time: " .. hour .. ":" .. minute .. " " .. ampm .."\nWalk and Drink Water !!!!"

    -- Show the message as a styled alert
    hs.alert.show(message, {
        textSize = 30,
        fillColor = {red = 0, green = 0.5, blue = 0.7, alpha = 0.8},
        strokeColor = {white = 0},
        strokeWidth = 2,
        radius = 12
    }, 5) -- Display for 2 seconds
end

-- Timer to trigger the message every hour
-- hs.timer.doAt("00:00", "1m", showHourlyMessage)
--
hs.timer.doEvery(60, showHourlyMessage)

-- Show message immediately upon reload (optional)
showHourlyMessage()

-- Notify that the script is active
hs.notify.new({title = "Hammerspoon", informativeText = "Hourly messages activated!"}):send()
