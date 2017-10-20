Set ua = CreateObject("UA.Api2")
WScript.Sleep(100)
ua.UpdateDatabase()
ErrorMessage = ua.ErrorMessage
ua.HoldUAOpenOnClose = 0
x=ua.ReleaseConnection()
Set ua = Nothing
if ErrorMessage <> "" then
  ErrorMessage = "Error Message:" & vbLF & ErrorMessage
  MsgBox ErrorMessage
end if

