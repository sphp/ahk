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
;MsgBox % Inst.page.Evaluate("document.body.innerHTML").value

script =
( LTrim join
	e1=$x("//*[contains(text(),'Verify you are human')]");
	e2=$x("//input[@value='Verify you are human']");
	if(e1.length)e1[0].click();
	if(e2.length)e2[0].click();
)
Inst.page.Evaluate(script)
Esc::ExitApp
Return
