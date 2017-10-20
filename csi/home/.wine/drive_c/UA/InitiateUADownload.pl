use Win32::OLE;
Win32::OLE::CreateObject("UA.Api2", $ua) || die "unable to create UA.Api2 object: $!";
sleep(1);
$ua->UpdateDatabase();
my($ErrorMessage) = $ua->ErrorMessage;
$ua->{HoldUAOpenOnClose} = 0;
$ua->ReleaseConnection();
undef($ua);
if($ErrorMessage) {
  print <<"EOM";

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ErrorMessage to follow
${ErrorMessage}

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Press enter to close this window
EOM
  my($t); $t = <>;
}

