-- Set up a webview frame and HTML content
local webviewFrame = hs.geometry.rect(500, 400, 400, 200) -- Webview frame
local htmlContent = [[
    <html>
    <body style="margin: 0; padding: 0; display: flex; flex-direction: column; justify-content: center; align-items: center;
                 height: 100%; background-color: #333; color: #fff; font-family: Arial, sans-serif;">
        <div style="text-align: center;">
            <h1 style="color: #ff0000;">Custom Alert</h1>
            <p>This is a custom modal with a quit option.</p>
            <button id="quitButton" style="padding: 10px 20px; margin-top: 20px; background-color: #ff0000;
                                            border: none; color: white; font-size: 16px; cursor: pointer;">
                Quit
            </button>
        </div>
        <script>
            document.getElementById('quitButton').addEventListener('click', function() {
                window.webkit.messageHandlers.quit.postMessage(null);
            });
        </script>
    </body>
    </html>
]]

-- Create the webview
local webview = hs.webview.new(webviewFrame):html(htmlContent)
webview:allowGestures(true):windowTitle("Custom Alert"):setLevel(hs.drawing.windowLevels.modalPanel)

-- JavaScript-to-Lua messaging for Quit button
webview:policyDelegate(function(_, action)
    if action == "other" then
        hs.application.frontmostApplication():kill() -- Quit Hammerspoon
    end
end)

-- Function to display an hourly message
local function displayHourlyMessage()
    -- Get the current time
    local time = os.date("%H:%M:%S") -- Format as HH:MM:SS
    local message = "Hourly Message: Current Time is " .. time

    -- Create or update the text display
    if not hourlyMessage then
        hourlyMessage = hs.drawing.text(hs.geometry.rect(500, 350, 400, 50), message)
        hourlyMessage:setTextFont("Helvetica-Bold")
        hourlyMessage:setTextSize(18)
        hourlyMessage:setTextColor({red = 1, green = 1, blue = 1, alpha = 1})
        hourlyMessage:setFillColor({red = 0, green = 0, blue = 0, alpha = 0.8})
        hourlyMessage:setRoundedRectRadii(10, 10)
        hourlyMessage:setLevel(hs.drawing.windowLevels.overlay)
        hourlyMessage:show()
    else
        hourlyMessage:setText(message)
    end

    -- Update the message every hour
    if not hourlyTimer then
        hourlyTimer = hs.timer.doEvery(3600, displayHourlyMessage)
    end
end

-- Show both the webview and the hourly message
webview:show()
displayHourlyMessage()
