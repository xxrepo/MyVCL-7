unit SipMessage;

interface

uses SysUtils, Classes;

type

  TSipMessage = class
  private
    FRtpMaps: TList;
    FRouteSet: TStringList;
  public
    Signal: AnsiString;
    Sdp: AnsiString;
    CallID: AnsiString;
    Text: AnsiString;
    ViaAddress: AnsiString;
    RequestURI: AnsiString;
    InviteUser: AnsiString;
    ToURI: AnsiString;
    FromURI: AnsiString;
    ViaPort: AnsiString;
    RPort: AnsiString;
    Nonce: AnsiString;
    Res: AnsiString;
    Realm: AnsiString;
    Opaque: AnsiString;
    Qop: AnsiString;
    Method: AnsiString;
    FromAddr: AnsiString;
    ToAddr: AnsiString;
    Via: AnsiString;
    Contact: AnsiString;
    CSeq: AnsiString;
    FromTag: AnsiString;
    ToTag: AnsiString;
    RtpAddress: AnsiString;
    RtpPort: AnsiString;
    ContactServer: AnsiString;
    ContactPort: AnsiString;
    ToUser: AnsiString;
    ToServer: AnsiString;
    ToServerName: AnsiString;
    FromServerName: AnsiString;
    FromUser: AnsiString;
    FromServer: AnsiString;
    RecordRoute: AnsiString;
    function GetRtpMap (Index: Integer): Integer;
    function RouteSetCount: Integer;
    function GetRouteSet (Index: Integer): AnsiString;
    function GetRtpMapCount: Integer;
    constructor Create (const AText: AnsiString);
    destructor Destroy; override;
  end;

implementation

const
  CRLF = #13#10;

{ TSipMessage }

constructor TSipMessage.Create(const AText: AnsiString);
var
  i, j: Integer;
  sl, avp: TStringList;
  st, c: AnsiString;
begin
  inherited Create;
  FRtpMaps := nil;
  FRouteSet:=Nil;
  Text := AText;
  sl := TStringList.Create;
  avp := TStringList.Create;
  try
    sl.Text := AText;
    if sl.Count > 1 then
    begin
      if pos(CRLF+CRLF, AText) > 0 then
        Sdp := copy(AText, pos(CRLF+CRLF, AText)+Length(CRLF+CRLF), 100000);
    end;
    if sl.Count > 0 then
    begin
      RequestURI:=Trim(Copy(sl[0],Pos(' ',sl[0]),1000));
      RequestURI:=Trim(Copy(RequestURI,1,Pos('SIP/2.0',RequestURI)-1));
      if copy(sl[0],1,7) = 'INVITE ' then // should have UpperCase()
      begin
        InviteUser := Trim(copy(sl[0],12,1000));
        if pos('@', InviteUser) > 0 then
          InviteUser := Trim(copy(InviteUser, 1, pos('@', InviteUser)-1))
        else
          InviteUser := '';
      end
      else
      if copy(sl[0],1,8) = 'MESSAGE ' then // should have UpperCase()
      begin
        InviteUser := Trim(copy(sl[0],12,1000));
        if pos('@', InviteUser) > 0 then
          InviteUser := Trim(copy(InviteUser, 1, pos('@', InviteUser)-1))
        else
          InviteUser := '';
      end;
    end;
    for i := 0 to sl.Count - 1 do
      if UpperCase(copy(sl[i],1,7)) = 'SIP/2.0' then
      begin
        for j := 9 to 11 do
          Res := Res + sl[i][j];
      end
      else if UpperCase(Copy(sl[i],1,8)) = UpperCase('Call-ID:') then // should be CALL-ID:
      begin
        CallID := Trim(copy(sl[i],9,100));
      end
      else If UpperCase(Copy(sl[i],1,2)) = UpperCase('i:') Then // should be I:
      Begin
        CallID:=Trim(Copy(sl[i],3,100));
      end
      else if UpperCase(copy(sl[i],1,5)) = UpperCase('CSeq:') then // should be CSEQ:
      begin
        for j := Length(sl[i]) downto 1 do
        begin
          if sl[i][j] = ' ' then break;
          Method := sl[i][j] + Method;
        end;
        CSeq := copy(sl[i],6,100);
        while copy(CSeq,1,1) = ' ' do
          CSeq := copy(CSeq,2,100);
        CSeq := Trim(copy(CSeq,1,pos(' ',CSeq)-1));
      end
      else if (UpperCase(copy(sl[i],1,5)) = UpperCase('From:'))
        or (UpperCase(Copy(sl[i],1,2)) = UpperCase('f:')) then // should be FROM: and F:
      begin
        FromAddr := sl[i];
        if pos('tag=',sl[i]) > 0 then
        begin
          FromTag := copy(sl[i],pos('tag=',sl[i])+4,100);
        end;
        if pos('<',sl[i]) > 0 then
        Begin
          FromURI:=Copy(sl[i],Pos('<',sl[i])+1,1000);
          FromURI:=Copy(FromURI,1,Pos('>',FromURI)-1);
        end;
        if pos('sip:', sl[i]) > 0 then // should be UpperCase()
        begin
          st := copy(sl[i], pos('sip:', sl[i]) + 4, 1000);
          if pos('@', st) > 0 then
          begin
            FromUser := copy(st, 1, pos('@', st)-1);
            FromServer := '';
            for j := pos('@', st)+1 to Length(st) do
              if st[j] in ['>', ' '] then break
                else FromServer := FromServer + st[j];
            FromServerName := '';
            for j := pos('@', st)+1 to Length(st) do
              if st[j] in ['>', ' ', ':', ';'] then break
                else FromServerName := FromServerName + st[j];
          end;
        end;
      end
      else if (UpperCase(copy(sl[i],1,3)) = UpperCase('To:'))
        Or (UpperCase(copy(sl[i],1,2)) = UpperCase('t:')) then // should be TO: and T:
      begin
        ToAddr := sl[i];
        if pos('tag=',sl[i]) > 0 then
        begin
          ToTag := copy(sl[i],pos('tag=',sl[i])+4,100);
        end;
        if pos('<',sl[i]) > 0 then
        Begin
          ToURI:=Copy(sl[i],Pos('<',sl[i])+1,1000);
          ToURI:=Copy(ToURI,1,Pos('>',ToURI)-1);
        end;
        if pos('sip:', sl[i]) > 0 then // should be UpperCase()
        begin
          st := copy(sl[i], pos('sip:', sl[i]) + 4, 1000);
          if pos('@', st) > 0 then
          begin
            ToUser := copy(st, 1, pos('@', st)-1);
            ToServer := '';
            for j := pos('@', st)+1 to Length(st) do
              if st[j] in ['>', ' '] then break
                else ToServer := ToServer + st[j];
            ToServerName := '';
            for j := pos('@', st)+1 to Length(st) do
              if st[j] in ['>', ' ', ':', ';'] then break
                else ToServerName := ToServerName + st[j];
          end;
        end;
      end
      else if (UpperCase(copy(sl[i],1,4)) = UpperCase('Via:'))
        or (UpperCase(copy(sl[i],1,2)) = UpperCase('v:')) then // should be VIA: and V:
      begin
        Via := Via + sl[i]+CRLF;
        if pos('rport=', Via) > 0 then
        begin
          RPort := '';
          for j := pos('rport=', Via)+6 to Length(Via) do
          begin
            if Via[j] in ['0','1','2','3','4','5','6','7','8','9'] then RPort := RPort + Via[j]
              else break;
          end;
        end;
        if Length(ViaAddress)=0 then
        Begin
          ViaAddress:=sl[i];
          if pos('/UDP',ViaAddress)>0 then
          Begin
            ViaAddress:=Trim(Copy(ViaAddress,Pos('/UDP',ViaAddress)+5,1000));
            if Pos(';',ViaAddress)>0 then
              ViaAddress:=Copy(ViaAddress,1,Pos(';',ViaAddress)-1);
            ViaPort:='5060';
            if Pos(':',ViaAddress)>0 then
            begin
              ViaPort:=Copy(ViaAddress,Pos(':',ViaAddress)+1,1000);
              ViaAddress:=Copy(ViaAddress,1,Pos(':',ViaAddress)-1);
            End;
          end;
        end;
      end
      else if LowerCase(Copy(sl[i],1,2)) = LowerCase('m:') Then // no need for LowerCase()
      begin
        Contact := Trim(copy(sl[i],3,1000));
        if pos('<', Contact) > 0 then Contact := Trim(copy(Contact, pos('<', Contact)+1,1000));
        if pos('>', Contact) > 0 then Contact := Trim(copy(Contact, 1,pos('>', Contact)-1));
        if pos(';', Contact) > 0 then Contact := Trim(copy(Contact, 1,pos(';', Contact)-1));
        if pos('@', Contact) > 0 then
        begin
          ContactServer := copy(Contact, pos('@', Contact)+1, Length(Contact));
          if pos(':', ContactServer) > 0 then
          begin
            ContactPort := copy(ContactServer,pos(':', ContactServer)+1, 15);
            ContactServer := copy(ContactServer,1,pos(':', ContactServer)-1);
          end;
        end;
      end
      else if LowerCase(copy(sl[i],1,8)) = LowerCase('Contact:') then // should be CONTACT:
      begin
        Contact := Trim(copy(sl[i],9,1000));
        if pos('<', Contact) > 0 then Contact := Trim(copy(Contact, pos('<', Contact)+1,1000));
        if pos('>', Contact) > 0 then Contact := Trim(copy(Contact, 1,pos('>', Contact)-1));
        if pos(';', Contact) > 0 then Contact := Trim(copy(Contact, 1,pos(';', Contact)-1));
        if pos('@', Contact) > 0 then
        begin
          ContactServer := copy(Contact, pos('@', Contact)+1, Length(Contact));
          if pos(':', ContactServer) > 0 then
          begin
            ContactPort := copy(ContactServer,pos(':', ContactServer)+1, 15);
            ContactServer := copy(ContactServer,1,pos(':', ContactServer)-1);
          end;
        end;
      end
      else if UpperCase(copy(sl[i],1,13)) = UpperCase('Record-Route:') then // should be RECORD-ROUTE:
      begin
        if Not Assigned(FRouteSet) then FRouteSet:=TStringList.Create;
        st := Trim(copy(sl[i],14,1000));
        while pos(',', st) > 0 do
        begin
          FRouteSet.Add(Trim(copy(st,1,pos(',', st)-1)));
          st := copy(st,pos(',', st)+1,1000);
        end;
        FRouteSet.Add(Trim(st));
      end
      else if copy(sl[i],1,2) = 'c=' then
      begin
        if pos('IP4', sl[i]) > 0 then
          RtpAddress := Trim(copy(sl[i],pos('IP4', sl[i])+4,20));
      end
      else if UpperCase(copy(sl[i],1,7)) = UpperCase('Signal=') then // should be SIGNAL=
      begin
        Signal := copy(sl[i],8,1);
      end
      else if copy(sl[i],1,7) = 'm=audio' then
      begin
        st := Trim(copy(sl[i], 8, 1000));
        for j := 1 to 10 do
        begin
          if st[j] in ['0','1','2','3','4','5','6','7','8','9'] then RtpPort := RtpPort + st[j]
            else break;
        end;
        if pos('RTP/AVP', sl[i]) > 0 then
        begin
          st := Trim(copy(sl[i], pos('RTP/AVP', sl[i]) + 7, 1000));
          c := '';
          for j := 1 to Length(st) do
          begin
            if (st[j] = #32) and (Length(c) > 0) then
            begin
              avp.Add(c);
              c := '';
            end
            else c := c + st[j];
          end;
          if Length(c) > 0 then avp.Add(c);
        end;
      end
      else if (LowerCase(copy(sl[i],1,Length('WWW-Authenticate:'))) = LowerCase('WWW-Authenticate:'))
        or (LowerCase(copy(sl[i],1,Length('Proxy-Authenticate:'))) = LowerCase('Proxy-Authenticate:')) then
      begin
        st := copy(sl[i], pos('nonce="', sl[i])+7, Length(sl[i]));
        for j := 1 to Length(st) do
        begin
          if st[j] <> '"' then Nonce := Nonce + st[j]
            else break;
        end;
        st := copy(sl[i], pos('realm="', sl[i])+7, Length(sl[i]));
        for j := 1 to Length(st) do
        begin
          if st[j] <> '"' then Realm := Realm + st[j]
            else break;
        end;
        if pos('opaque="', sl[i]) > 0 then
        begin
          st := copy(sl[i], pos('opaque="', sl[i])+8, Length(sl[i]));
          for j := 1 to Length(st) do
          begin
            if st[j] <> '"' then Opaque := Opaque + st[j]
              else break;
          end;
        end;
        if pos('qop="', sl[i]) > 0 then
        begin
          st := copy(sl[i], pos('qop="', sl[i])+5, Length(sl[i]));
          for j := 1 to Length(st) do
          begin
            if st[j] <> '"' then Qop := Qop + st[j]
              else break;
          end;
        end;
        If Qop = 'auth,auth-int' then Qop:='auth-int';
      end;
      FRtpMaps := TList.Create;
      if avp.Count > 0 then
        for i := 0 to avp.Count - 1 do
          if avp[i] <> '101' then
            if StrToIntDef(avp[i],-1)<>-1 then
              FRtpMaps.Add(Pointer(StrToInt(avp[i])));
      if Assigned(FRouteSet) then
        for i:=0 to FRouteSet.Count-1 Do
          RecordRoute:=RecordRoute+'Record-Route: '+FRouteSet[i]+CRLF;
  finally
    avp.Free;
    sl.Free;
  end;
end;

destructor TSipMessage.Destroy;
begin
  if Assigned(FRtpMaps) then FRtpMaps.Free; // no need for Assigned
  If Assigned(FRouteSet) then FRouteSet.Free; // no need for Assigned
  inherited;
end;

Function TSipMessage.GetRtpMapCount:Integer;
Begin
  if not Assigned(FRtpMaps) then Result:=0
    else Result:=FRtpMaps.Count;
end;

Function TSipMessage.GetRtpMap(Index:Integer):Integer;
Begin
  Result:=Integer(FRtpMaps[Index]);
end;

Function TSipMessage.GetRouteSet(Index:Integer):AnsiString;
Begin
  If Assigned(FRouteSet) then Result:=FRouteSet[Index]
    else Result:='';
end;

Function TSipMessage.RouteSetCount:Integer;
Begin
  if Assigned(FRouteSet) Then Result:=FRouteSet.Count
    else Result:=0;
end;

end.
