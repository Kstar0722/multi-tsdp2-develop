;Postamble logoff BBS
TRANSMIT "X^MX^MX^MX^MX^M"
TRANSMIT "X^M"
WAITFOR "ARE YOU SURE" 
PAUSE 3
TRANSMIT "Y^M"
PAUSE 3
HANGUP
