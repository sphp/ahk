#SingleInstance, Force
#Include %A_ScriptDir%\chrome.ahk
SetWorkingDir, %A_ScriptDir%
inif := StrReplace(StrReplace(A_ScriptName,".ahk"),".exe") . ".ini"

chport := "9222" 
userdr := "C:\Users\Shamim\Desktop\ahk\userdata"
chpath := "C:\Users\Shamim\Desktop\ahk\chromium\app\chrome.exe"
weburl := "https://chat.openai.com/chat"
flags  := " --no-first-run"
	. " --disable-default-apps"
	. " --disable-component-extensions-with-background-pages"
	. " --no-default-browser-check"
	. " --hide-crash-restore-bubble"
	. " --window-position=-7,0"
	. " --window-size=700,745"
	. " --disable-gpu"
	. " --disable-extensions"
	. " --disable-plugins"

Inst:= new Chrome(userdr, weburl, flags, chpath, chport)
Sleep 2000
askfor = what is command line flag to disable chrome-extension?
script = e1=$x("//textarea");e2=$x("//button[contains(@class,'absolute')]");if(e1.length)e1[0].value='%askfor%';if(e2.length)e2[0].click();
Inst.page.Evaluate(script)

Esc::ExitApp
Return

/*
script = 
( LTrim join
	e1=$x("//*[contains(text(),'Verify you are human')]");
	e2=$x("//input[@value='Verify you are human']");
	if(e1.length)e1[0].click();
	if(e2.length)e2[0].click();
)
Inst.page.Evaluate(script)
*/
;localhost:{chport}/devtools/inspector.html?ws=localhost:{chport}/devtools/page/{targetId}
;localhost:{chport}/json/protocol/
;localhost:{chport}/json/new?{url}
;localhost:{chport}/json/activate?{targetId}
;http://127.0.0.1:9222/json
