#SingleInstance, Force
#Include %A_ScriptDir%\chrome.ahk
SetWorkingDir, %A_ScriptDir%

inif := StrReplace(StrReplace(A_ScriptName,".ahk"),".exe") . ".ini"
if fileexist(inif)
	IniRead, pageid, % inif, chrome, pageid

chport := "55555"
chpath := "D:\PortableApps\Brave\app\brave.exe"
weburl := "https://chat.openai.com/chat"

Inst := new Chrome(,weburl,, chpath, chport)
IniWrite, % Inst.pid, % inif, chrome, pid
IniWrite, % Inst.pageid, % inif, chrome, pageid

MsgBox % Inst.page.Evaluate("window.location.href").value
MsgBox % Inst.page.Evaluate("document.body.innerText").value
MsgBox % Inst.page.Evaluate("document.body.innerHTML").value

;Inst.page.Evaluate("$x('//*[contains(text(),\'Verify you are human\')]')[0].click()")

;Sleep 5000

Esc::ExitApp
Return
