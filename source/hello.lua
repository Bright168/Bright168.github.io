MacroState = false

EnablePrimaryMouseButtonEvents(false)
function OnEvent(event, arg)
    if 1 == 2 then
        OutputLogMessage("event %s. ", tostring(event))
        OutputLogMessage("arg %s.\n", tostring(arg))
    end
    -- 总开关
    if event == "MOUSE_BUTTON_PRESSED" and arg == 6 then
        MacroState = not MacroState
        OutputLogMessage("MacroState is pressed %s.\n", tostring(MacroState))
    end

    -- 三连发
    if event == "MOUSE_BUTTON_PRESSED" and arg == 8 and MacroState then
        GoFire = false
        PressMouseButton(1)
        OutputLogMessage("down\n")
        Sleep(math.random(85, 100))
        ReleaseMouseButton(1)
        OutputLogMessage("up\n")
        Sleep(math.random(105, 120))

        PressMouseButton(1)
        OutputLogMessage("down\n")
        Sleep(math.random(26, 46))
        ReleaseMouseButton(1)
        OutputLogMessage("up\n")
        Sleep(math.random(80, 95))

        if math.random(1, 2) == 1 then
            PressMouseButton(1)
            OutputLogMessage("down\n")
            Sleep(math.random(27, 47))
            ReleaseMouseButton(1)
            OutputLogMessage("up\n")
            Sleep(math.random(160, 180))
        end

        GoFire = true
    end

    -- 跳箱子
    if event == "MOUSE_BUTTON_PRESSED" and arg == 11 and MacroState then
        OutputLogMessage("jump\n")
        PressKey("spacebar")
        Sleep(math.random(267, 275))
        ReleaseKey("spacebar")
        Sleep(math.random(346, 354))
        PressKey("spacebar")
        Sleep(math.random(164, 172))
        ReleaseKey("spacebar")
        Sleep(math.random(96, 104))
        PressKey("lctrl")
        Sleep(math.random(140, 148))
        ReleaseKey("lctrl")
    end

    -- 鬼跳
    if event == "MOUSE_BUTTON_PRESSED" and arg == 10 and MacroState then
        Times = 0
        OutputLogMessage("jump\n")
        PressKey("spacebar")
        Sleep(math.random(15, 25))
        ReleaseKey("spacebar")
        Sleep(math.random(15, 25))
        PressKey("lctrl")
        Sleep(math.random(15, 25))
        while (Times < 33) do
            Times = Times + 1
            PressKey("spacebar")
            Sleep(math.random(15, 25))
            ReleaseKey("spacebar")
            Sleep(math.random(15, 25))
        end
        ReleaseKey("lctrl")
    end

    -- 瞬狙
    if event == "MOUSE_BUTTON_RELEASED" and arg == 2 and MacroState and 1 == 2 then
        PressMouseButton(1)
        Sleep(math.random(20, 30))
        ReleaseMouseButton(1)
        -- 切枪
        PressKey("q")
        Sleep(math.random(9, 14))
        ReleaseKey("q")
        Sleep(math.random(130, 160))
        PressKey("q")
        Sleep(math.random(9, 14))
        ReleaseKey("q")
        Sleep(math.random(9, 14))

    end

end
