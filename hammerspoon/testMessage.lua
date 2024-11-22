-- Function to display a screen message with a Quit button
local function showMinuteMessage()
    local time = os.date("%I:%M %p") -- Get current time in 12-hour format with minutes and AM/PM
    local message = "It's now:\n" .. time .. "\n\n\nSTAND AND DRINK WATER\n\nPress 'Quit' to stop alerts."

    -- Display a dialog with a Quit button
    local buttonClicked = hs.dialog.blockAlert(
        message,
        "This will stop the script.",
        "Quit"
    )

    -- If "Quit" is clicked, stop the timer
    if buttonClicked == "Quit" then
        hs.alert.show("Alerts stopped!", 1)
        if minuteTimer then
            minuteTimer:stop()
            minuteTimer = nil
        end
    end
end

-- Timer to trigger the message every minute
-- minuteTimer = hs.timer.doEvery(60, showMinuteMessage)
hs.timer.doEvery(3600, showMinuteMessage)

-- Show message immediately upon reload (optional)
showMinuteMessage()

-- Notify that the script is active
hs.notify.new({title = "Hammerspoon", informativeText = "Minute messages with Quit button activated!"}):send()
