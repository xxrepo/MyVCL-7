unit SipRequests;

{$INCLUDE sipcompilers.inc}

interface

uses SipInts, SysUtils, SipMessage;

function md(v: AnsiString): AnsiString;
function AutResponse (Const Method, Phone, Server, User, Realm,
  Password, Qop, nonce, Opaque, EntityBody: AnsiString): AnsiString;
function GetRegisterRequest (const Account: ISipAccount): AnsiString;
function GetUnRegisterRequest (const Account: ISipAccount): AnsiString;
function GetAutTextMessageRequest (const M: TSipMessage;
  const Account: ISipAccount; const PhoneNumber: AnsiString): AnsiString;
function GetTextMessageRequest (const Account: ISipAccount;
  const PhoneNumber, Text: AnsiString): AnsiString;
function GetAutRegisterRequest (const Account: ISipAccount): AnsiString;
function GetAutUnRegisterRequest (const Account: ISipAccount): AnsiString;
function GetInviteRequest (const Call: ISipCall;const Codecs: AnsiString): AnsiString;
function GetAutInviteRequest (const Call: ISipCall;const Codecs: AnsiString): AnsiString;
function GetStatusResponse (const M: TSipMessage;const Status: AnsiString): AnsiString;
function GetOkResponse (const M: TSipMessage): AnsiString;
function GetOptionsOkResponse (const M: TSipMessage): AnsiString;
function GetDtmfInfo (const Call: ISipCall;const Digit: AnsiString): AnsiString;
function GetInviteOkResponse (const Call: ISipCall): AnsiString;
function GetCancelRequest (const Call: ISipCall): AnsiString;
function GetTransferRequest (const Call: ISipCall;const PhoneNumber: AnsiString): AnsiString;
function GetAutTransferRequest (const Call: ISipCall;const PhoneNumber: AnsiString): AnsiString;
function GetByeRequest (const Call: ISipCall): AnsiString;
function GetRedirectResponse (const Call: ISipCall;const PhoneNumber: AnsiString): AnsiString;
function GetInviteErrorResponse (const Call: ISipCall;const Error: AnsiString): AnsiString;
function GetInviteOkAckResponse (const Call: ISipCall;const M: TSipMessage): AnsiString;
function GetAckResponse (const M: TSipMessage): AnsiString;
function GetNotAcceptableResponse (const M: TSipMessage): AnsiString;

implementation

uses GUIDs{$IFDEF MD5_UNIT},MD5{$ENDIF};

{$IFNDEF MD5_UNIT}
{$INCLUDE MD5.pas}
{$ENDIF}

const
  CRLF = #13#10;
  MaxForwards = '70';
  ClientVers = 'SipClient 2.99';
  AllowString = 'Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, NOTIFY, INFO, MESSAGE';

function GetRegisterRequest(const Account: ISipAccount): AnsiString;
begin
  Result :=
    'REGISTER sip:'+Account.Server+' SIP/2.0'+CRLF+
    'Via: SIP/2.0/UDP '+Account.LocalIP+':'+IntToStr(Account.LocalPort)+';rport;branch='+Account.Branch+CRLF+
    'From: '+Account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>;tag='+Account.Tag+CRLF+
    'To: '+Account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>'+CRLF+
    'Call-ID: '+Account.CallID+CRLF+
    'CSeq: '+IntToStr(Account.LocalSeqNum)+' REGISTER'+CRLF+
    'Contact: <'+Account.LocalURI+'>;expires='+IntToStr(Account.Expires)+';q=0.90'+CRLF+
    'User-Agent: '+ClientVers+CRLF+
    AllowString+CRLF+
    'Max-Forwards: '+MaxForwards+CRLF+
    'Expires: '+IntToStr(Account.Expires)+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetUnRegisterRequest(const Account: ISipAccount): AnsiString;
begin
  Result :=
    'REGISTER sip:'+Account.Server+' SIP/2.0'+CRLF+
    'Via: SIP/2.0/UDP '+Account.LocalIP+':'+IntToStr(Account.LocalPort)+';rport;branch='+Account.Branch+CRLF+
    'From: '+Account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>;tag='+Account.Tag+CRLF+
    'To: '+Account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>'+CRLF+
    'Call-ID: '+Account.CallID+CRLF+
    'CSeq: '+IntToStr(Account.LocalSeqNum)+' REGISTER'+CRLF+
    'Contact: *'+CRLF+
    AllowString+CRLF+
    'Max-Forwards: '+MaxForwards+CRLF+
    'Expires: 0'+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetAutTextMessageRequest(const M: TSipMessage; const Account: ISipAccount;
  const PhoneNumber: AnsiString): AnsiString;
var
  Aut, op: AnsiString;
  t: AnsiString;
begin
  t := Account.IMText;
  if copy(t,Length(t)-1,2) = CRLF then
    t := copy(t,1,Length(t)-2);

  if (M.Res = '401') or (M.Res = '403') then Aut := 'Authorization'
    else Aut := 'Proxy-Authorization';

  if Length(M.Qop) > 0 then
    op := ',qop="'+M.Qop+'",cnonce="'+M.Opaque+'",nc=00000001,opaque="'+M.Opaque+'"'
  else
    op := '';

  Result := 'MESSAGE sip:'+PhoneNumber+'@'+Account.Server + ' SIP/2.0' + CRLF+
    M.Via+
    'From: '+Account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>;tag='+Account.Tag+CRLF+
    'To: <sip:'+PhoneNumber+'@'+Account.Server+'>'+CRLF+
    'Call-ID: '+Account.CallID+CRLF+
    M.RecordRoute +
    'CSeq: '+IntToStr(Account.LocalSeqNum)+' MESSAGE'+CRLF+
    'Call-ID: '+M.CallID+CRLF+
    AllowString+CRLF+
    'Contact: <'+Account.LocalURI+'>'+CRLF+
    'Max-Forwards: '+MaxForwards+CRLF+
    Aut+': Digest username="'+Account.User+'",realm="'+M.Realm+
    '",nonce="'+M.Nonce+'",uri="sip:'+Account.User+'@'+Account.Server+'"'+',response="'+
    AutResponse('MESSAGE', PhoneNumber, Account.Server, Account.User,
      M.Realm, Account.Password, M.Qop, M.Nonce, M.Opaque, '')+
    '"'+op+',algorithm=MD5'+CRLF+
    'Content-Type: text/plain'+CRLF+
    'Content-Length: '+IntToStr(Length(t))+CRLF+CRLF;
  Result := Result + t;
end;

function GetTextMessageRequest(const Account: ISipAccount; const PhoneNumber, Text: AnsiString): AnsiString;
var
  t: AnsiString;
begin
  t := Text;

  if copy(t,Length(t)-1,2) = CRLF then
    t := copy(t,1,Length(t)-2);

  Result :=
    'MESSAGE sip:'+PhoneNumber+'@'+Account.Server + ' SIP/2.0' + CRLF+
    'Via: SIP/2.0/UDP '+Account.LocalIP+':'+IntToStr(Account.LocalPort)+';rport;branch='+GenerateBranch+CRLF+
    'From: '+Account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>;tag='+Account.Tag+CRLF+
    'To: <sip:'+PhoneNumber+'@'+Account.Server+'>'+CRLF+
    'Call-ID: '+NewStrGuid+CRLF+
    'CSeq: '+IntToStr(Account.LocalSeqNum)+' MESSAGE'+CRLF+
    'Contact: <'+account.LocalURI+'>'+CRLF+
    AllowString+CRLF+
    'Max-Forwards: '+MaxForwards+CRLF+
    'Content-Type: text/plain'+CRLF+
    'Content-Length: '+IntToStr(Length(t))+CRLF+CRLF;
  Result := Result + t;
end;

function GetAutRegisterRequest(const Account: ISipAccount): AnsiString;
var
  Aut, op, cnt, al: AnsiString;
  autline, response: AnsiString;
begin
  if Account.Res = '401' then Aut := 'Authorization'
    else Aut := 'Proxy-Authorization';

  if Length(Account.Qop) > 0 then
  begin
    if Account.Opaque<>'' then
      op := ',qop='+Account.Qop+',cnonce="'+Account.Opaque+'",nc=00000001,opaque="'+Account.Opaque+'"'
    else
    Begin
      Account.Opaque:=md(NewStrGuid);
      op:=',cnonce="'+Account.Opaque+'",nc=00000001,qop='+Account.Qop+'';
    end;
  End
  else op := ',opaque=""';

  response:=AutResponse('REGISTER','',Account.Server,Account.User,Account.Realm,Account.Password,
    Account.Qop,Account.Nonce,Account.Opaque,'');
  autline:= Aut+': Digest username="'+Account.User+'",realm="'+Account.Realm+
    '",nonce="'+Account.Nonce+'",uri="sip:'+Account.Server+'"'+',response="'+response+'"'+
    op+',algorithm=MD5';
  al := AllowString+CRLF;
  cnt := '<'+Account.LocalURI+'>'+';expires='+IntToStr(Account.Expires)+';q=0.90';

  Result :=
    'REGISTER sip:'+Account.Server+' SIP/2.0'+CRLF+
    'Via: SIP/2.0/UDP '+Account.LocalIP+':'+IntToStr(Account.LocalPort)+';rport;branch='+Account.Branch+CRLF+
    'From: '+account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>;tag='+Account.Tag+CRLF+
    'To: '+account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>'+CRLF+
    'Call-ID: '+Account.CallID+CRLF+
    'User-Agent: '+clientVers+CRLF+
    'CSeq: '+IntToStr(Account.LocalSeqNum)+' REGISTER'+CRLF+
    'Contact: '+cnt+CRLF+
    autline+CRLF+
    al+
    'Max-Forwards: '+MaxForwards+CRLF+
    'Expires: '+IntToStr(Account.Expires)+CRLF +
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetAutUnRegisterRequest(const Account: ISipAccount): AnsiString;
var
  Aut, op, cnt: AnsiString;
begin
  if Account.Res = '401' then Aut := 'Authorization'
    else Aut := 'Proxy-Authorization';

  if Length(Account.Qop) > 0 then
    op := ',qop="'+Account.Qop+'",cnonce="'+Account.Opaque+'",nc=00000001,opaque="'+Account.Opaque+'"'
  else
    op := ',opaque=""';

  cnt := '<'+Account.LocalURI+'>'+';expires=0;q=0.90'; // unused

  Result :=
    'REGISTER sip:'+Account.Server+' SIP/2.0'+CRLF+
    'Via: SIP/2.0/UDP '+Account.LocalIP+':'+IntToStr(Account.LocalPort)+';rport;branch='+Account.Branch+CRLF+
    'From: '+account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>;tag='+Account.Tag+CRLF+
    'To: '+account.FormattedName+'<sip:'+Account.User+'@'+Account.Server+'>'+CRLF+
    'Call-ID: '+Account.CallID+CRLF+
    'CSeq: '+IntToStr(Account.LocalSeqNum)+' REGISTER'+CRLF+
    'Contact: *'+CRLF+
    Aut+': Digest username="'+Account.User+'",realm="'+Account.Realm+
    '",nonce="'+Account.Nonce+'",uri="sip:'+Account.Server+'"'+
    ',response="'+AutResponse('REGISTER', '', Account.Server, Account.User,
    Account.Realm, Account.Password, Account.Qop, Account.Nonce, Account.Opaque, '')+'"'+
    op+',algorithm=MD5'+CRLF+
    'Max-Forwards: '+MaxForwards+CRLF+
    'Expires: 0'+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetInviteRequest(const Call: ISipCall;const Codecs: AnsiString): AnsiString;
var
  content, toline, lip: AnsiString;
begin
  if Call.SendRecv='sendonly' then lip:='0.0.0.0'
    Else lip:=Call.Account.MappedLocalIP;
  If Length(Call.RemoteTag)<>0 then toline:='To: <'+Call.RemoteURI+'>;tag='+call.RemoteTag
    Else toline:='To: <'+call.RemoteURI+'>';
  content :=
    'v=0'+CRLF+
    'o=- '+IntToStr(Call.SessionID)+' '+IntToStr(Call.SessionNo)+' IN IP4 '+Call.Account.MappedLocalIP+CRLF+
    's=Delphi SIP component' + CRLF +
    'c=IN IP4 '+lip+CRLF+
    't=0 0'+CRLF+
    'm=audio '+IntToStr(Call.LocalRtpPort)+' RTP/AVP '+codecs+' 101'+CRLF+
    'a=rtpmap:101 telephone-event/8000'+CRLF+
    'a=fmtp:101 0-15'+CRLF+
    'a=ptime:20'+CRLF+
    'a='+Call.SendRecv+CRLF;

  Result := 'INVITE '+Call.RemoteURI + ' SIP/2.0' + CRLF+
    'From: '+call.account.FormattedName+'<sip:'+Call.Account.User+'@'+Call.Account.Server
      + '>;tag=' + Call.LocalTag + CRLF+
    toline+CRLF+
    'Via: SIP/2.0/UDP '+Call.Account.LocalIP+':'+IntToStr(Call.Account.LocalPort)+';rport;branch='+Call.Branch+CRLF+
    'CSeq: '+IntToStr(Call.LocalSeqNum)+' INVITE'+CRLF+
    'Call-ID: '+Call.CallID+CRLF+
    AllowString+CRLF+
    'Contact: <sip:'+Call.Account.User+'@'+Call.Account.MappedLocalIP+':'+IntToStr(Call.Account.LocalPort)+'>'+CRLF+
    'Max-Forwards: '+MaxForwards +CRLF+
    'Content-Type: application/sdp'+CRLF+
    'Content-Length: '+IntToStr(Length(content))+CRLF+CRLF;
  Result := Result + content;
end;

function GetAutInviteRequest(const Call: ISipCall;const Codecs: AnsiString): AnsiString;
var
  Aut, op, toline, content, lip: AnsiString;
begin
  if (Call.AutResult = '401') or (Call.AutResult = '403') then
    Aut := 'Authorization'
  else
    Aut := 'Proxy-Authorization';

  if Length(Call.Qop) > 0 then
  begin
    if Call.Opaque<>'' then
      op := ',qop="'+Call.Qop+'",cnonce="'+Call.Opaque+'",nc=00000001,opaque="'+Call.Opaque+'"'
    else
    Begin
      Call.Opaque:=md(NewStrGuid);
      op:=',cnonce="'+Call.Opaque+'",nc=00000001,qop="'+Call.Qop+'"';
    end;
  end
  else op := '';

  if Call.SendRecv='sendonly' then lip:='0.0.0.0'
    Else lip:=Call.Account.MappedLocalIP;
  If Length(Call.RemoteTag)<>0 then toline:='To: <'+Call.RemoteURI+'>;tag='+call.RemoteTag
    Else toline:='To: <'+call.RemoteURI+'>';

  content :=
    'v=0'+CRLF+
    'o=- '+IntToStr(Call.SessionID)+' '+IntToStr(Call.SessionNo)+' IN IP4 '+Call.Account.MappedLocalIP+CRLF+
    's=Delphi SIP component' + CRLF +
    'c=IN IP4 '+lip+CRLF+
    't=0 0'+CRLF+
    'm=audio '+IntToStr(Call.LocalRtpPort)+' RTP/AVP '+codecs+' 101'+CRLF+
    'a=rtpmap:101 telephone-event/8000'+CRLF+
    'a=fmtp:101 0-15'+CRLF+
    'a=ptime:20'+CRLF+
    'a='+Call.SendRecv+CRLF;

  Call.AutLine:=Aut+': Digest username="'+call.Account.User+'",realm="'+Call.Realm+
    '",nonce="'+Call.Nonce+'",uri="'+call.RemoteURI+'"'+
    ',response="'+AutResponse('INVITE',Call.RemoteUser,Call.Account.Server,Call.Account.User,
    Call.Realm, Call.Account.Password,Call.Qop,Call.Nonce,Call.Opaque,content)+'"'
    +op+',algorithm=MD5'+CRLF;

  Result := 'INVITE '+ Call.RemoteURI + ' SIP/2.0' + CRLF+
    'From: '+call.Account.FormattedName+'<sip:'+Call.Account.User+'@'+Call.Account.Server +'>;tag=' + Call.LocalTag+ CRLF+
    toline+CRLF+
    'Via: SIP/2.0/UDP '+Call.Account.LocalIP+':'+IntToStr(Call.Account.LocalPort)+';rport;branch='+Call.Branch+CRLF+
    'CSeq: '+IntToStr(Call.LocalSeqNum)+' INVITE'+CRLF+
    'Call-ID: '+Call.CallID+CRLF+
    AllowString+CRLF+
    'Contact: <sip:'+Call.Account.User+'@'+Call.Account.MappedLocalIP+':'+IntToStr(Call.Account.LocalPort)+'>'+CRLF+
    'Max-Forwards: '+MaxForwards +CRLF+
    Call.AutLine+
    'Content-Type: application/sdp'+CRLF+
    'Content-Length: '+IntToStr(Length(content))+CRLF+CRLF;
  Result := Result + content;
end;

Function GetStatusResponse (Const M: TSipMessage;Const Status: AnsiString): AnsiString;
Begin
  Result:=
    'SIP/2.0 '+Status+CRLF+
    M.Via+
    M.ToAddr+CRLF+
    M.FromAddr+CRLF+
    M.RecordRoute+
    'Call-ID: '+M.CallID+CRLF+
    'CSeq: '+M.CSeq+' '+M.Method+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

Function GetOkResponse (Const M: TSipMessage): AnsiString;
Begin
  Result:=
    'SIP/2.0 200 OK'+CRLF+
    M.Via+
    M.FromAddr+CRLF+
    M.ToAddr+CRLF+
    M.RecordRoute+
    'Call-ID: '+M.CallID+CRLF+
    'CSeq: '+M.CSeq+' '+M.Method+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetOptionsOkResponse(const M: TSipMessage): AnsiString;
begin
  Result :=
    'SIP/2.0 200 OK'+CRLF+
    M.Via +
    M.ToAddr + CRLF +
    M.FromAddr + CRLF +
    M.RecordRoute+
    'CSeq: ' + M.CSeq + ' ' +M.Method+CRLF +
    'Accept: application/sdp' + CRLF +
    AllowString+CRLF+
    'Call-ID: ' + M.CallID + CRLF +
    'Content-Length: 0'+CRLF+CRLF;
end;

Function GetDtmfInfo (Const Call: ISipCall;Const Digit: AnsiString): AnsiString;
var
  content: AnsiString;
Begin
  content:=
    'Signal= '+digit+CRLF+
    'Duration= 160'+CRLF;

  Result:=
    'INFO '+Call.RemoteTarget+' SIP/2.0'+CRLF+
    'Via: SIP/2.0/UDP '+Call.Account.LocalIP+':'+IntToStr(Call.Account.LocalPort)+';branch='+GenerateBranch+CRLF+
    Call.RecordRoute+
    'From: '+call.account.FormattedName+'<'+Call.LocalURI+ '>;tag=' + Call.LocalTag + CRLF+
    'To: <'+Call.RemoteURI+'>;tag='+call.RemoteTag+CRLF+
    'Call-ID: '+Call.CallID+CRLF+
    'CSeq: '+IntToStr(Call.LocalSeqNum)+' INFO'+CRLF+
    'Max-Forwards: '+MaxForwards +CRLF+
    'Contact: <sip:'+Call.Account.User+'@'+Call.Account.MappedLocalIP+':'+IntToStr(Call.Account.LocalPort)+'>'+CRLF+
    'Content-Type: application/dtmf-relay'+CRLF+
    'Content-Length: '+IntToStr(Length(content))+CRLF+CRLF+content;
end;

function GetInviteOkResponse(const Call: ISipCall): AnsiString;
var
  content: AnsiString;
begin
  content :=
    'v=0'+CRLF+
    'o=- '+IntToStr(Call.SessionID)+' '+IntToStr(Call.SessionNo)+' IN IP4 '+Call.Account.MappedLocalIP+CRLF+
    's=Delphi SIP component' + CRLF +
    'c=IN IP4 '+Call.Account.MappedLocalIP+CRLF+
    't=0 0'+CRLF+
    'm=audio '+IntToStr(Call.LocalRtpPort)+' RTP/AVP '+IntToStr(Call.AudioCodec.GetId)+' 101'+CRLF+
    'a=rtpmap:101 telephone-event/8000'+CRLF+
    'a=fmtp:101 0-16'+CRLF+
    'a=sendrecv'+CRLF;

  Result :=
    'SIP/2.0 200 OK'+CRLF+
    Call.Via +
    Call.ToAddr+';tag='+Call.LocalTag + CRLF +
    Call.FromAddr+CRLF+
    Call.RecordRoute +
    'Call-ID: '+Call.CallID+CRLF+
    'CSeq: ' + IntToStr(Call.RemoteSeqNum) +' INVITE'+CRLF+
    'Contact: <sip:'+Call.Account.User+'@'+Call.Account.MappedLocalIP+':'+IntToStr(Call.Account.LocalPort)+'>' + CRLF +
    AllowString+CRLF+
    'Content-Type: application/sdp' + CRLF +
    'Content-Length: '+IntToStr(Length(content))+CRLF+CRLF;

  Result := Result + content;
end;

function GetCancelRequest(const Call: ISipCall): AnsiString;
var
  Aut, op, via: AnsiString;
begin
  if (Call.AutResult = '401') or (Call.AutResult = '403') then
    Aut := 'Authorization'
  else
    Aut := 'Proxy-Authorization';

  if Length(Call.Qop) > 0 then
    op := ',qop="'+Call.Qop+'",cnonce="'+Call.Opaque+'",nc=00000001,opaque="'+Call.Opaque+'"'
  else
    op := '';

  if Call.Via = '' then
    via := 'Via: SIP/2.0/UDP '+Call.Account.LocalIP+':'+IntToStr(Call.Account.LocalPort)+';branch='+Call.Branch+';rport'+CRLF
  else
    via := Call.Via;

  Result :=
    'CANCEL '+Call.RemoteURI+' SIP/2.0'+CRLF+
    via +
    'From: '+Call.Account.FormattedName+'<'+Call.LocalURI+'>;tag='+Call.LocalTag + CRLF+
    'To: <'+Call.RemoteURI+'>' + CRLF +
    'Call-ID: '+Call.CallID+CRLF+
    'CSeq: ' + IntToStr(Call.LocalSeqNum) +' CANCEL'+CRLF+
    Aut+': Digest username="'+Call.Account.User+'",realm="'+Call.Realm+
    '",nonce="'+Call.Nonce+'",uri="'+Call.RemoteURI+'"'+
    ',response="'+AutResponse('CANCEL', Call.RemoteUser, Call.Account.Server, Call.Account.User,
      Call.Realm, Call.Account.Password, Call.Qop, Call.Nonce, Call.Opaque, '')+
    '"'+op+',algorithm=MD5'+CRLF+
    'Max-Forwards: '+MaxForwards+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetTransferRequest(const Call: ISipCall;const PhoneNumber: AnsiString): AnsiString;
var
  via: AnsiString;
begin
  if Call.Via = '' then
    via := 'Via: SIP/2.0/UDP '+Call.Account.LocalIP+':'+IntToStr(Call.Account.LocalPort)+';branch='+Call.Branch+';rport'+CRLF
  else
    via := Call.Via;

  Result :=
    'REFER '+Call.RemoteURI+' SIP/2.0'+CRLF+
    via +
    'From: <'+Call.LocalURI+'>;tag='+Call.LocalTag + CRLF+
    'To: <sip:'+Call.RemoteURI+'>;tag='+Call.RemoteTag + CRLF + // BUG - sip: should be removed ?!?
    'Call-ID: '+Call.CallID+CRLF+
    'Refer-To: <sip:'+PhoneNumber+'@'+Call.Account.Server+'>' + CRLF +
    'Referred-By: <'+Call.LocalURI+'>' + CRLF +
    'Contact: <sip:'+Call.Account.User+'@'+Call.Account.MappedLocalIP+':'+IntToStr(Call.Account.LocalPort)+'>'+CRLF+
    'CSeq: '+IntToStr(Call.LocalSeqNum)+' REFER'+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

Function GetAutTransferRequest (Const Call: ISipCall;Const PhoneNumber: AnsiString): AnsiString;
var
  Aut, op, ct, via: AnsiString;
Begin
  if Length(Call.RemoteTarget)=0 then ct:=Call.RemoteURI
    else ct:=Call.RemoteTarget;
  if (Call.AutResult = '401') or (Call.AutResult = '403') then
    Aut := 'Authorization'
  else
    Aut := 'Proxy-Authorization';
  if Length(Call.Qop) > 0 then
    op := ',qop="'+Call.Qop+'",cnonce="'+Call.Opaque+'",nc=00000001,opaque="'+Call.Opaque+'"'
  else op := '';
  if Call.Via = '' then
    via := 'Via: SIP/2.0/UDP '+Call.Account.LocalIP+':'+IntToStr(Call.Account.LocalPort)+';branch='+Call.Branch+';rport'+CRLF
  else
    via := Call.Via;

  Result :=
    'REFER '+Call.RemoteURI+' SIP/2.0'+CRLF+
    via +
    'From: <'+Call.LocalURI+'>;tag='+Call.LocalTag + CRLF+
    'To: <'+Call.RemoteURI+'>;tag='+Call.RemoteTag + CRLF +
    'Call-ID: '+Call.CallID+CRLF+
    Aut+': Digest username="'+Call.Account.User+'",realm="'+Call.Realm+
    '",nonce="'+Call.Nonce+'",uri="'+Call.RemoteURI+'"'+
    ',response="'+AutResponse('REFER', Call.RemoteUser, Call.Account.Server, Call.Account.User,
      Call.Realm, Call.Account.Password, Call.Qop, Call.Nonce, Call.Opaque, '')+
    '"'+op+',algorithm=MD5'+CRLF+
    'Refer-To: <sip:'+PhoneNumber+'@'+Call.Account.Server+'>' + CRLF +
    'Referred-By: <'+Call.LocalURI+'>' + CRLF +
    'Contact: <sip:'+Call.Account.User+'@'+Call.Account.MappedLocalIP+':'+IntToStr(Call.Account.LocalPort)+'>'+CRLF+
    'CSeq: '+IntToStr(Call.LocalSeqNum)+' REFER'+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetByeRequest(const Call: ISipCall): AnsiString;
begin
  Result :=
    'BYE '+Call.RemoteTarget+' SIP/2.0'+CRLF+
    'Via: SIP/2.0/UDP '+Call.Account.LocalIP+':'+IntToStr(Call.Account.LocalPort)+';rport;branch='+Call.Branch+CRLF +
    Call.RouteRecord +
    'To: <'+Call.RemoteURI+'>;tag='+Call.RemoteTag + CRLF +
    'From: <'+Call.LocalURI+'>;tag='+Call.LocalTag + CRLF+
    'Call-ID: '+Call.CallID+CRLF+
    'Max-Forwards: '+MaxForwards+CRLF+
    'CSeq: ' + IntToStr(Call.LocalSeqNum) +' BYE'+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

Function GetRedirectResponse (Const Call: ISipCall;Const PhoneNumber: AnsiString): AnsiString;
Begin
  Result:=
    'SIP/2.0 320 Moved Temporarily'+CRLF+
    Call.Via+
    'To: <'+Call.LocalURI+'>;tag='+Call.LocalTag+CRLF+
    'From: <'+Call.RemoteURI+'>;tag='+Call.RemoteTag + CRLF+
    Call.RecordRoute+
    'Call-ID: '+Call.CallID+CRLF+
    'CSeq: ' + IntToStr(Call.RemoteSeqNum) +' INVITE'+CRLF+
    'Contact: <sip:'+PhoneNumber+'@'+Call.Account.Server+'>'+CRLF+
    AllowString+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

Function GetInviteErrorResponse (Const Call: ISipCall;Const Error: AnsiString): AnsiString;
Begin
  Result:=
    'SIP/2.0 '+Error+CRLF+
    Call.Via+
    'To: <'+Call.LocalURI+'>;tag='+Call.LocalTag+CRLF+
    'From: <'+Call.RemoteURI+'>;tag='+Call.RemoteTag+CRLF+
    Call.RecordRoute+
    'Call-ID: '+Call.CallID+CRLF+
    'CSeq: ' + IntToStr(Call.RemoteSeqNum) +' INVITE'+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetInviteOkAckResponse(const Call: ISipCall;const M: TSipMessage): AnsiString;
Var
  cnt, AutLine, Aut, op: AnsiString;
begin
  cnt:=M.Contact;
  if cnt='' then cnt:='sip:'+M.ToUser+'@'+M.ToServer;
  if (Call.AutResult = '401') or (Call.AutResult = '403') then
    Aut := 'Authorization'
  else
    Aut := 'Proxy-Authorization';
  if Length(Call.Qop) > 0 then
  begin
    if Call.Opaque<>'' then
      op := ',qop="'+Call.Qop+'",cnonce="'+Call.Opaque+'",nc=00000001,opaque="'+Call.Opaque+'"'
    else
    Begin
      Call.Opaque:=md(NewStrGuid);
      op:=',cnonce="'+Call.Opaque+'",nc=00000001,qop="'+Call.Qop+'"';
    end;
  end
  else op := '';
  autline:= Aut+': Digest username="'+Call.Account.User+'",realm="'+Call.Realm+
    '",nonce="'+Call.Nonce+'",uri="'+Call.RemoteURI+'"'+',response="'+
    AutResponse('ACK',Call.RemoteUser,Call.Account.Server,Call.Account.User,Call.Realm,
      Call.Account.Password, Call.Qop,Call.Nonce,Call.Opaque,'')+'"'+
    op+',algorithm=MD5'+CRLF;
  Result :=
    'ACK ' + cnt + ' SIP/2.0'+CRLF+
    M.Via +
    'Max-Forwards: '+MaxForwards+CRLF+
    M.FromAddr+CRLF+
    M.ToAddr+CRLF+
    Call.RouteRecord +
    'Call-ID: '+M.CallID+CRLF+
    'Contact: <'+Call.Account.LocalURI+'>'+CRLF+
    'CSeq: ' + M.CSeq +' ACK'+CRLF+
    AutLine+
    'Content-Length: 0'+CRLF+CRLF;
end;

function GetAckResponse(const M: TSipMessage): AnsiString;
var
  cnt: AnsiString;
begin
  cnt:=M.Contact;
  if cnt='' then cnt:='sip:'+M.ToUser+'@'+M.ToServer;

  Result :=
    'ACK ' + cnt + ' SIP/2.0'+CRLF+
    M.Via+
    'Max-Forwards: '+MaxForwards+CRLF+
    M.FromAddr + CRLF +
    M.ToAddr + CRLF+
    'Call-ID: '+M.CallID+CRLF+
    'CSeq: '+M.CSeq+' ACK'+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

Function GetNotAcceptableResponse (Const M: TSipMessage): AnsiString;
Begin
  Result:=
    'SIP/2.0 488 Not Acceptable Here'+CRLF+
    M.Via+
    M.FromAddr+CRLF+
    M.ToAddr + CRLF+
    'Call-ID: '+M.CallID+CRLF+
    'CSeq: '+M.CSeq+' '+M.Method+CRLF+
    'Content-Length: 0'+CRLF+CRLF;
end;

end.
