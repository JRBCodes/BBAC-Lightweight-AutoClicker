#Requires AutoHotkey v2.0
global click_toggle := false
global gui_toggle := false
global user_cps := 15 ; Default clicks per second of 15
global filePath := A_ScriptDir "\bbac-settings.txt"

; Checks if settings.txt exists and make default one if it dosen't. ------
checkFile(*) {
    global user_cps, filePath

    if FileExist(filePath) {
        user_cps := FileRead(filePath)
    }
    else {
        FileAppend("15", filePath)
    }
}
checkFile()
; Checks if settings.txt exists and make default one if it dosen't. ------


; Create GUI -------------------------------------------------------------
CpsGUI := Gui("+Resize -MaximizeBox -MinimizeBox", "Change CPS")
CpsGUI.Add("Text",,"Enter new default:")
global user_cps_control := CpsGUI.Add("Edit", "w85", user_cps) ; Var user_cps_control points to the edit control not the value inside

SubmitButton := CpsGUI.Add("Button", "x+10", "Save")
SubmitButton.OnEvent("Click", cpsToFile)
; Create GUI -------------------------------------------------------------

cpsToFile(*) {
    global user_cps, user_cps_control, filePath, gui_toggle,  CpsGUI

    if (user_cps_control.Value != 15) {
    user_cps := user_cps_control.Value
    FileDelete(filePath) ; No idea if there is a better solution, too bad
    FileAppend(user_cps, filePath)
    }

    gui_toggle := false
    CpsGUI.Hide()
}

clickMouse(*) { ; Not sure why I even created this function.
    Click
}

calcDuration(cps) {
    return 1000//cps ; Calculates the interval in ms between clicks for a given CPS, should return int because float will crash it
    ; TODO Make new loop algo because this one sucks and isn't accurate
}

!m:: { ; Alt+M to open GUI which enables user to change default CPS
    global gui_toggle, user_cps
    gui_toggle := !gui_toggle ; Neat toggle, ! inverses the boolean value of gui_toggle each time it is run.

    if (gui_toggle) {
        CpsGUI.Show("w150")
    }
    else {
        CpsGUI.Hide()
    }
}

^+C:: { ; Ctrl+Shift+C to toggle autoclick.
    global click_toggle
    global user_cps
    click_toggle := !click_toggle
    
    if (click_toggle) {
        SetTimer(clickMouse, calcDuration(user_cps)) ; SetTimer(function, interval in ms) is basically a loop
    }
    else {
        SetTimer(clickMouse, 0) ; Setting the interval to 0 erases the loop from memory
    }
}

!x:: {  ; Alt+X to exit
    result := MsgBox("Exit App?", "BBAC v1", "YesNo") ;MsgBox(text inside, title, has buttons Yes and No)
    if (result == "Yes")
        ExitApp()
}
