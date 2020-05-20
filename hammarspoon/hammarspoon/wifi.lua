wifiWatcher = nil
homeSSID5G = "MySpectrumWiFi00-5G"
homeSSID2G = "MySpectrumWiFi00-2G"

function ssidConnected()
    connectedSSID = hs.wifi.currentNetwork()
    hs.notify.new({title="Hammerspoon", informativeText=connectedSSID}):send()
    if newSSID == homeSSID5G or newSSID == homeSSID2G then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    elseif newSSID ~= homeSSID5G and lastSSID ~= homeSSID2G then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    end

end

wifiWatcher = hs.wifi.watcher.new(ssidConnected)
wifiWatcher:start()
