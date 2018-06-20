TrayTip RPZ,RPZ is running,3
; Sleep 3000   ; Let it display for 3 seconds.
; HideTrayTip()

; ; Copy this function into your script to use it.
; HideTrayTip() {
;     TrayTip  ; Attempt to hide it the normal way.
;     if SubStr(A_OSVersion,1,3) = "10." {
;         Menu Tray, NoIcon
;         Sleep 200  ; It may be necessary to adjust this sleep.
;         Menu Tray, Icon
;     }
; }




#IfWinActive ahk_class ZBrush
3::RButton
return


pan(){
    SendEvent {Blind}{AltDown}
    SendEvent {Blind}{RButton down}
    KeyWait 1  
    SendEvent {Blind}{RButton up}
    KeyWait RButton
    SendEvent {Blind}{AltUp}
}
1:: pan()
return

2:: 
SendEvent {Blind}{CtrlDown}
SendEvent {Blind}{RButton down}
KeyWait 2  
SendEvent {Blind}{RButton up}
KeyWait RButton
SendEvent {Blind}{CtrlUp}
return
; brush size
f::
SendEvent {Blind}{f Down}
SendEvent {Blind}{LButton down}
KeyWait f
SendEvent {Blind}{f Up}
SendEvent {Blind}{LButton Up}
return


zoomIn(dir){
    MouseGetPos, xpos, ypos 
    SendEvent {Blind}{CtrlDown}
    SendEvent {Blind}{RButton down}

    MouseMove, 0, 50*dir,,R

    SendEvent {Blind}{RButton up}
    KeyWait RButton
    SendEvent {Blind}{CtrlUp}
    MouseMove, xpos,ypos
}
WheelDown::zoomIn(-1)
return
WheelUp::zoomIn(1)
return



#IfWinActive ahk_exe Paintstorm.exe
; a::
; Sleep 100
; Send {z up}
; KeyWait a
return


#IfWinActive ahk_class 3D-Coat
;set camera->custom navigation->Maya
;set                           start tweak brush radius ctrl+f
rot3dCoat(){
    SendEvent {Blind}{AltDown}
    SendEvent {Blind}{LButton down}
    KeyWait 3
    SendEvent {Blind}{LButton up}
    KeyWait LButton
    SendEvent {Blind}{AltUp}
}
pan3dCoat(){
    SendEvent {Blind}{AltDown}
    SendEvent {Blind}{MButton down}
    KeyWait 1
    SendEvent {Blind}{MButton up}
    KeyWait MButton
    SendEvent {Blind}{AltUp}
}
zoom3dCoat(){
    SendEvent {Blind}{AltDown}
    SendEvent {Blind}{RButton down}
    KeyWait 2
    SendEvent {Blind}{RButton up}
    KeyWait RButton
    SendEvent {Blind}{AltUp}
}


3::
rot3dCoat()
return

1::
pan3dCoat()
return
2::zoom3dCoat()
return

f::F1
return