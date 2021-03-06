;
;  COMMODITY SYSTEMS, INC BBS LOGON SCRIPT
;  
;SET PORT COM1
;SET BAUDRATE 2400
;SET DATABITS 8
;SET PARITY NONE
;SET STOPBITS 1
;SET FLOWCTRL ON
;SET DLDIR "\MQ\" @
SET DEBUG #DEBUG
SET DLDIR #DLDIR   
SET DLLOG #DLDIR DL$$LOG
TIMEOUT 7
CLEAR
MESSAGE "^M^J" 
MESSAGE "           >>>  Dialing Commodity Systems, Inc.  BBS <<<"
MESSAGE "^M^J^J^J"
TRANSMIT "#INIT"
PAUSE 3
TRANSMIT "AT^M"
WAITFOR "OK"
PAUSE 1
;dial the phone number
TIMEOUT 45
Message "Dialing......"
TRANSMIT "ATDT#BBSPHONE^M"
WAITFOR "CONNECT" "RETURN" RETRYON "NO CARR"
PAUSE 2
TRANSMIT "^M"
; attempt to log on
TIMEOUT 7
WAITFOR "USER-ID:" "PASSWORD:" "RETURN" CANCELON "NO CARR"
TRANSMIT "#BBSID^M"
WAITFOR "PASSWORD:" "RETURN" RETRYON "USER-ID:" CANCELON "NO CARR"
TRANSMIT "#BBSPASSWORD^M"
WAITFOR "RETURN" RETRYON "PASSWORD:" CANCELON "NO CARR"
