#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

;Start Intercept
;With Run
Process, Exist, intercept.exe
    Run, cmd.exe,,,myCMD
WinWaitActive, ahk_pid %myCMD%
Send, cd /d "C:\Program Files (x86)\Intercept" {Return}
Send, "intercept.exe" {Return}
Send, y
;WinHide remark out for testing purposes
WinHide,
Return





#if (getKeyState("F23", "P"))
F23::Return


;---Key Change Template
;Key
;New Hotkey Description
;Actual Shortcut or Method
;Code For New Function
;---Standard Dx Script
;Key::msgbox, you pressed %A_thishotkey% on the extra keyboard




;Row 1 Function Keys
;------------
;F1
;Open Old Control Panel
;With AutoHotkey Run Control
F1::
Run, control
Return

;F2
;Open Settings Menu
;With AutoHotkey Send Win + I
F2::
Send, #i
Return

;F3
;Open System, About
;With AutoHotkey Send Win + Pause
F3::
Send, #{Pause}
Return

;F4
;Wi-Fi start switch
;With AutoHotkey Run and Windows Netsh
F4::
Run, *RunAs %comspec% /c netsh interface set interface name="Wi-Fi" admin=enabled,,hide
Return

;F5
;Wi-Fi kill-switch
;With AutoHotkey Run and Windows Netsh
F5::
Run, *RunAs %comspec% /c netsh interface set interface name="Wi-Fi" admin=disabled,,hide 
Return

;F6
;Hibernate computer
;With AutoHotkey and Dll Call
F6::
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 1, "int", 1)
Return


;Row 2 Number Keys
;------------
;1
;Open Task Manager
;With AutoHotkey Send and Ctrl + Shift + Esc
1::
Send, ^+{Esc}
Return

;2
;Open Run window
;With AutoHotkey Send and Win + R
2::
Send, #r
Return

;3
;Start Windows Terminal
;Run wt.exe
;With AutoHotkey Run
3::
Run, wt.exe
Return

;4
;Start Windows Terminal As Admin
;With AutoHotkey Run
4::
Run, *RunAs wt.exe
Return

;5
;Open Clipboard Bin
;With AutoHotkey Send and Win + V
5::
Send, #v
Return

;6
;Open Windows File Explorer
;With AutoHotkey Send and Win + E
6::
Send, #e
Return


;Row 3
;------------
;Tab
;Hide or Show the Desktop
;With AutoHotkey Send and Win + D
Tab::
Send, #d
Return

;Q
;Refresh
;With F5
q::F5
Return
;------------
    ;Up Arrow
    ;Delete object
    ;With AutoHotkey Send and Delete
    Up::
    Send, {Delete}
    Return

    ;W
    ;Delete object
    ;With AutoHotkey Send and Delete
    w::
    Send, {Delete}
    Return

;E
;Share X - Capture Region
;With AutoHotkey Send and Ctrl + Shift + R (ShareX defined hotkeys)
e::
Send, ^+{r}
Return

;R
;Share X - Capture entire screen
;With AutoHotkey Send and Ctrl + Shift + E (ShareX defined hotkeys)
r::
Send, ^+{e}
Return

;O
;Share X - Capture Window
;With AutoHotkey Send and Ctrl + W (ShareX defined hotkeys)
o::
Send, ^{w}
Return


;Row 3.5A
;------------
;Esc
;Toggle Autohotkey Script to turn keyboard on and off
;With AutoHotkey Suspend and Pause
Esc::
Suspend, 
Pause,,1
Return



;Row 4
;------------
;Left Shift
;Edit
;With F2
LShift::F2
Return
;------------
    ;Left Arrow
    ;Cut Object
    ;With AutoHotkey Send and Ctrl + X
    Left::
    Send, ^{x}
    Return

    ;A
    ;Cut Object
    ;With AutoHotkey Send and Ctrl + X
    a::
    Send, ^{x}
    Return
;------------
    ;Down Arrow
    ;Copy
    ;With AutoHotkey Send and Ctrl + C
    Down::
    Send, ^{c}
    Return

    ;S
    ;Copy
    ;With AutoHotkey Send and Ctrl + C
    s::
    Send, ^{c}
    Return
;------------
    ;Right Arrow
    ;Paste
    ;With AutoHotkey Send and Ctrl + V
    Right::
    Send, ^{v}
    Return

    ;D
    ;Paste
    ;With AutoHotkey Send and Ctrl + V
    d::
    Send, ^{v}
    Return

;F
;Open Find dialog 
;With AutoHotkey Send and Ctrl + F
f::
Send, ^f
Return

;G
;MusicBee - "Love"
;With AutoHotkey Send and Alt + L (MusicBee defined hotkey)
g::
Send, !{l}
Return


;Row 3.5B
;------------
;Mute
;Maintain default function
;

;Row 4.5A
;------------
;DeLUX T9 Keyboard back light toggle
;Maintain default function
;



;Row 5
;------------
;Ctrl
;Maintain "Find My Mouse" function in Windows PowerToys
;Ctrl
;LCtrl::
;Return

;Z
;Start Windows Magnifier
;With AutoHotkey Run
z::
Process, Exist, Magnify.exe
	if (ErrorLevel = 0)
	{
		Run, %A_WinDir%\System32\Magnify.exe,,, PID
	}
	else
	{
	oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
    Name := "Magnify.exe"
    for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" Name "'")
	MsgBox, % proc.terminate(),,Magnifier Closed,0.001
    }
Return

;x
;
;
x::
Return

;C
;Toggle Window transparency
;Using AutoHotkey Winget and Winset
c::
WinGet, currentTransparency, Transparent, A
if (currentTransparency = OFF)
{
    WinSet, Transparent, 200, A
}
else
{
    WinSet, Transparent, OFF, A
}
Return

;T
;Make a Window stay on top
;With AutoHotkey Send and Windows PowerToys "Always On Top"
;t::  
;Send, #^t
;Return

;T
;Make a Window stay on top
;With AutoHotkey Winset
t::
Winset, Alwaysontop, , A
Return

;,<
;Back
;With AutoHotkey Send and XButton1 = Browser Back
,::
Send, {XButton1}
Return


;Row 4.5B
;------------
;Sound Volume Down
;Maintain default function
;



;Row 5.5A
;------------
;Home = Starts default web browser
;Maintain default function
;



;Row 6
;------------
;Alt
;Mouse Crosshairs
;With AutoHotkey Send and Ctrl + Alt + P and Windows PowerToys "Mouse Pointer Crosshairs"
LAlt::
Send, ^!{p}
Return

;K
;
;
k::
Return

;N
;New object
;With AutoHotkey Send and Ctrl + Shift + N
n::
Send, ^+n
Return

;M
;Open Context Menu "Show More Options"
;With Shift + F10
m::
+F10
Return

;B
;Open Object Propeties
;With AutoHotkey Send and Alt + Enter
b::
Send, !{Enter}
Return

;.>
;Forward
;With AutoHotkey Send and XButton2 = Browser Forward
.::
Send, {XButton2}
Return


;Row 5.5B
;------------
;Sound Volume Up
;Maintain default function
;



;Row 7
;------------
;Space Bar Left Red Unlabeled
;Cycle through open windows
;With AutoHotkey Send and Alt + Esc
Space::
Send, !{Esc}
Return

;H
;Open Widgets Pane
;With AutoHotkey Send and Win + W
h::
Send, #w
Return

;V
;Open Action Center
;With AutoHotkey Send and Win + A
v::
Send, #a
Return

;Mode
;Does not generate a scan code
;Maintain default function 
;Toggles WASD to directional arrows

;Right Red (Unlabeled) extra
;Same as left Red above
;Cycle through open windows



#if
;Done with F23
