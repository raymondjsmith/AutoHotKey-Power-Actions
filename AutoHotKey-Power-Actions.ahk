; -----------------------------------------------------
; Script created by Raymond Reddington
; Date: 8/30/2023
; Description: This script provides hotkeys to suspend, hibernate, shut down, and restart the computer using AutoHotKey.
; -----------------------------------------------------

#NoEnv ; Recommends not to check environment variables.
#SingleInstance Force  ; Ensures only one instance of the script runs.
#MaxThreadsPerHotkey 1  ; Limits simultaneous threads per hotkey to 1.

; DllCall Parameters:
; Parameter #1: Pass 1 for hibernate, 0 for suspend.
; Parameter #2: Pass 1 to suspend immediately, 0 to ask each application for permission.
; Parameter #3: Pass 1 to disable all wake events, 0 to enable.

; Ctrl + Alt + S: Suspend the computer
^!s::
    ; Calls the SetSuspendState function from PowrProf.dll to suspend the computer.
    DllCall("PowrProf.dll\SetSuspendState", "int", 0, "int", 1, "int", 1)
return

; Ctrl + Alt + H: Hibernate the computer
^!h::
    ; Calls the SetSuspendState function from PowrProf.dll to hibernate the computer.
    DllCall("PowrProf.dll\SetSuspendState", "int", 1, "int", 0, "int", 1)
return

; Ctrl + Alt + D: Shut down the computer
^!d::
    ; Executes the shutdown command to shut down the computer.
    shutdown, 0
return

; Ctrl + Alt + Shift + R: Restart the computer
^!+r::
    ; Executes the system's command processor to restart the computer immediately.
    Run, %COMSPEC% /c shutdown /r /t 0
return
