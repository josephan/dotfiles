#Requires AutoHotkey v2.0

; Previous Track
^F7::SendInput "{Media_Prev}"

; Play/Pause
^F8::SendInput "{Media_Play_Pause}"

; Next Track
^F9::SendInput "{Media_Next}"

; Volume Down
^F11::SendInput "{Volume_Down}"

; Volume Up
^F12::SendInput "{Volume_Up}"

!q::SendInput("{Alt down}{F4}{Alt up}")

SetCapsLockState "AlwaysOff"

CapsLock::
{
    Send "{LCtrl down}"
    KeyWait "CapsLock"
    Send "{LCtrl Up}"
    If (A_PriorKey = "CapsLock")
    {
        Send "{Esc}"
    }
}