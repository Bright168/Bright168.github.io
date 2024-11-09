-- 总开关
MacroState = false

-- 模式切换
SwitchMode = false

-- 速点
GoFire = true

EnablePrimaryMouseButtonEvents(false)

function OnEvent(event, arg)

    if 1 == 2 then
        OutputLogMessage("event %s. ", tostring(event))
        OutputLogMessage("arg %s.\n", tostring(arg))
    end

    -- 总开关
    if event == "MOUSE_BUTTON_PRESSED" and arg == 6 then
        MacroState = not MacroState
        SwitchMode = false
        if MacroState then
            PressKey("q")
            Sleep(math.random(9, 14))
            ReleaseKey("q")
            Sleep(math.random(130, 160))
            PressKey("q")
            Sleep(math.random(9, 14))
            ReleaseKey("q")
        end
        -- EnablePrimaryMouseButtonEvents(MacroState)
        OutputLogMessage("MacroState is %s.\n", tostring(MacroState))
        OutputLogMessage("SwitchMode is %s.\n", tostring(SwitchMode))
    end

    -- 模式切换
    if event == "MOUSE_BUTTON_PRESSED" and arg == 7 then
        SwitchMode = not SwitchMode
        if MacroState and SwitchMode then
            PressKey("q")
            Sleep(math.random(9, 14))
            ReleaseKey("q")
            Sleep(math.random(130, 160))
            PressKey("q")
            Sleep(math.random(9, 14))
            ReleaseKey("q")
        end
        OutputLogMessage("SwitchMode is %s.\n", tostring(SwitchMode))
    end

    -- 速点
    if event == "MOUSE_BUTTON_PRESSED" and arg == 8 and MacroState and not SwitchMode and GoFire then
        GoFire = false
        Times = 0
        while (Times < 3) do
            Times = Times + 1
            PressMouseButton(1)
            Sleep(math.random(20, 40))
            ReleaseMouseButton(1)
            Sleep(math.random(80, 100))
        end
        GoFire = true
    end

    -- 瞬狙
    if event == "MOUSE_BUTTON_PRESSED" and arg == 8 and MacroState and SwitchMode then
        PressMouseButton(3)
        Sleep(math.random(35, 50))
        ReleaseMouseButton(3)
        Sleep(math.random(25, 40))
        PressMouseButton(1)
        Sleep(math.random(25, 40))
        ReleaseMouseButton(1)
        -- 切枪
        Sleep(math.random(10, 15))
        PressKey("q")
        Sleep(math.random(9, 14))
        ReleaseKey("q")
        Sleep(math.random(130, 160))
        PressKey("q")
        Sleep(math.random(9, 14))
        ReleaseKey("q")
        Sleep(math.random(9, 14))
    end
    -- 右键狙
    if event == "MOUSE_BUTTON_RELEASED" and arg == 2 and MacroState and SwitchMode then
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

    -- 跳箱子
    if event == "MOUSE_BUTTON_PRESSED" and arg == 11 and MacroState then
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

end
