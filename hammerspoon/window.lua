-- half of screen
hs.hotkey.bind(push, 'left', function() hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 1}) end)
hs.hotkey.bind(push, 'right', function() hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 1}) end)
hs.hotkey.bind(push, 'up', function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 0.5}) end)
hs.hotkey.bind(push, 'down', function() hs.window.focusedWindow():moveToUnit({0, 0.5, 1, 0.5}) end)

-- quarter of screen
hs.hotkey.bind(push, 'h', function() hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 0.5}) end)
hs.hotkey.bind(push, 'l', function() hs.window.focusedWindow():moveToUnit({0.5, 0.5, 0.5, 0.5}) end)
hs.hotkey.bind(push, 'k', function() hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 0.5}) end)
hs.hotkey.bind(push, 'j', function() hs.window.focusedWindow():moveToUnit({0, 0.5, 0.5, 0.5}) end)

-- full screen
hs.hotkey.bind(push, 'f', function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 1}) end)

-- center screen
hs.hotkey.bind(push, 'c', function() hs.window.focusedWindow():centerOnScreen() end)



hs.grid.setGrid'3x3'
hs.grid.setMargins("0,0")
hs.window.animationDuration = 0

function getWin()
  return hs.window.focusedWindow()
end

--- 234: resize grid
hs.hotkey.bind(push, "2", function() hs.grid.setGrid('2x2'); hs.alert.show('Grid set to 2x2'); end)
hs.hotkey.bind(push, "3", function() hs.grid.setGrid('3x3'); hs.alert.show('Grid set to 3x3'); end)
hs.hotkey.bind(push, "4", function() hs.grid.setGrid('4x4'); hs.alert.show('Grid set to 4x4'); end)


--- ,: snap window to grid
hs.hotkey.bind(push, "g", function() hs.grid.snap(getWin()) end)

--- space: maximize window
hs.hotkey.bind(push, "space", function() hs.grid.maximizeWindow() end)

--- .: minimize window
hs.hotkey.bind(push, "m", function() hs.grid.set(getWin(), '0,0 1x1'); end)
--/: snap window to gird
--- ,: snap window to grid
hs.hotkey.bind(push, ",", function() hs.grid.snap(getWin()) end)

