--- A closure function
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- quick open applications
hs.hotkey.bind(push, "E", open("Finder") )
hs.hotkey.bind(push, "T", open("Terminal") )
hs.hotkey.bind(push, "S", open("Safari"))
hs.hotkey.bind(push, "C", open("Google Chrome"))
