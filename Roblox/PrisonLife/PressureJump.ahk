; To use crouch and put head under a part then press keybind to glitch

#SingleInstance Force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetBatchLines, -1
Process Priority,, High

DllCall("Winmm\timeBeginPeriod", "UInt", 1)

; this is for the spin, ONLY CHANGE IT IF ITS TOO SLOW OR FAST!
Spin := 4000

; do not change this, this is for the base which the spin was orginally set for
BaseDPI := 800
BaseCS := 0.36

; settings for prefrence (change to your setup)
DPI := 850
CS := 5 ; camera sensitivity

X := Round((Spin * BaseDPI * BaseCS) / (DPI * CS))

; keybind for glitch (default is Q)
Q::
    SendInput, c

    DllCall("Sleep", "UInt", 6)

    SendInput, {Space down}
    DllCall("Sleep", "UInt", 50)
    SendInput, {Space up}

    DllCall("Sleep", "UInt", 4)

    start := A_TickCount

    Loop
    {
        if (A_TickCount - start > 200)
            break

        DllCall("mouse_event", "UInt", 0x0001, "Int", X, "Int", 0, "UInt", 0, "UPtr", 0)

        DllCall("Sleep", "UInt", 4)
    }
return

; exit keybind (default is F3)
F3::
    DllCall("Winmm\timeEndPeriod", "UInt", 1)
ExitApp
