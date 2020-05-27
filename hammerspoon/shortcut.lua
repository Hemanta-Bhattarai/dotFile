function systemKey(key)
  hs.eventtap.event.newSystemKeyEvent(key, true):post()
  hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

-- lock screen by starting screensaver
hs.hotkey.bind(push, 'delete', function() hs.caffeinate.startScreensaver() end)

-- simulate media keys for external keyboard
hs.hotkey.bind(push, 'pad5', function() systemKey('PLAY') end)
hs.hotkey.bind(push, 'pad4', function() systemKey('PREVIOUS') end)
hs.hotkey.bind(push, 'pad6', function() systemKey('NEXT') end)
hs.hotkey.bind(push, 'u', function() systemKey('SOUND_UP') end)
hs.hotkey.bind(push, 'd', function() systemKey('SOUND_DOWN') end)
hs.hotkey.bind(push, 'q', function() systemKey('MUTE') end)
