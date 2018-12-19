unit pmRegister;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls, HomeDM, DB, ADODB, cxWebDataCtrls,
  cxWebData, cxWebExtData;
  

type
  TRegister = class(TcxWebPageModule)
    weFName: TcxWebEdit;
    weMName: TcxWebEdit;
    weLName: TcxWebEdit;
    weNick: TcxWebEdit;
    weLogin: TcxWebEdit;
    wePass: TcxWebEdit;
    weRePass: TcxWebEdit;
    weQuest: TcxWebEdit;
    weAnswer: TcxWebEdit;
    weCompany: TcxWebEdit;
    weWww: TcxWebEdit;
    weAddress1: TcxWebEdit;
    weAddress2: TcxWebEdit;
    weEmail: TcxWebEdit;
    weCity: TcxWebEdit;
    weState: TcxWebEdit;
    weZip: TcxWebEdit;
    cbCountry: TcxWebComboBox;
    Query: TADOQuery;
    QueryTOOLID: TIntegerField;
    QueryNAME: TMemoField;
    DataSource: TcxWebDBDataSource;
    lbTools: TcxWebListBox;
    weOther: TcxWebEdit;
    wbRegister: TcxWebButton;
    wbClear: TcxWebButton;
    wbCancel: TcxWebButton;
    wlMailWrong: TcxWebLabel;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure wbRegisterClick(Sender: TObject);
  private
    { Private declarations }
    procedure FillToolsListBox;
    function AddNewUser: Integer;
    procedure AddTools;
    function AddTool: Integer;
    function CheckMail(AMail: string): Boolean;
  public
    { Public declarations }
  end;

function Register: TRegister;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, UUserOnTool, UUser, UTools,
  ActiveX, ComObj{, AMV TODO e-mail checking};

function Register: TRegister;
begin
  Result := TRegister(WebContext.FindModuleClass(TRegister));
end;

function TRegister.AddNewUser: Integer;
var
  AMail: string;
begin
  AMail := weEmail.Text;
  Result := 0;
  if CheckMail(AMail) then
  begin
    DM.User.NewRow;
    DM.User.First := weFName.Text;
    DM.User.MidName := weMName.Text;
    DM.User.Last := weLName.Text;
    DM.User.Nick := weNick.Text;
    DM.User.Login := weLogin.Text;
    DM.User.Pass := wePass.Text;
    DM.User.Quest := weQuest.Text;
    DM.User.Answer := weAnswer.Text;
    DM.User.Company := weCompany.Text;
    DM.User.EMail := AMail;
    DM.User.WWW := weWww.Text;
    DM.User.Address1 := weAddress1.Text;
    DM.User.Address2 := weAddress2.Text;
    DM.User.City := weCity.Text;
    DM.User.State := weState.Text;
    DM.User.Zip := weZip.Text;
    DM.User.Country := cbCountry.Items[cbCountry.ItemIndex].Text;
    DM.User.Id := DM.User.MaxId + 1;
    Result := DM.User.NewUser;
  end
  else
    wlMailWrong.Visible := True;
end;

function TRegister.AddTool: Integer;
var
  ATools: TTools;
begin
  ATools := TTools.Create;
  try
    ATools.Connection := DM.Connection;
    ATools.NewRow;
    ATools.Id := ATools.MaxId + 1;
    ATools.Name := weOther.Text;
    ATools.NewTool;
    Result := ATools.Id;
  finally
    ATools.Free;
  end;
end;

procedure TRegister.AddTools;
var
  AUserOnTool: TUserOnTool;
  I: Integer;
begin
  AUserOnTool := TUserOnTool.Create;
  try
    AUserOnTool.Connection := DM.Connection;
    for I := 0 to lbTools.Items.Count - 1 do
    begin
      if lbTools.Items[I].Selected then
      begin
        AUserOnTool.NewRow;
        AUserOnTool.UserId := DM.User.Id;
        AUserOnTool.ToolId := StrToInt(lbTools.Items[I].Value);
        AUserOnTool.Id := AUserOnTool.MaxId + 1;
        AUserOnTool.NewUserOnTool;
      end;
    end;
    if weOther.Text <> '' then
    begin
      AUserOnTool.NewRow;
      AUserOnTool.UserId := DM.User.Id;
      AUserOnTool.ToolId := AddTool;
      AUserOnTool.Id := AUserOnTool.MaxId + 1;
      AUserOnTool.NewUserOnTool;
    end;
  finally
    AUserOnTool.Free;
  end;
end;

procedure TRegister.cxWebPageModuleActivate(Sender: TObject);
begin
  if IsFirstRequest then
    FillToolsListBox;
end;

procedure TRegister.FillToolsListBox;
var
  AItem: TcxWebListItem;
begin
  Query.Active := True;
  while not Query.Eof do
  begin
    AItem := lbTools.Items.Add();
    AItem.Text := Query.FieldByName('NAME').AsString;
    AItem.Value := Query.FieldByName('TOOLID').AsString;
    Query.Next;
  end;
end;

procedure TRegister.wbRegisterClick(Sender: TObject);
var
  ARes: Integer;
begin
  ARes := AddNewUser;
  if ARes <> 0 then
  begin
    AddTools;
    Session.Values['UserId'] := DM.UserId;
    RedirectToPage('Frames', '');
  end;
end;

function TRegister.CheckMail(AMail: string): Boolean;
{
var
  MV: IEmailVerifier;
  MC: IAmvConfigure;
  s: string;
  b: Boolean;
}
begin
  Result := True;
{
  MV := CoAdvanced_Maillist_Verify_Component.Create;
  if Supports(MV, IAmvConfigure, MC) then
  begin
    s := MC.Get_PrimaryDNS;
    b := MC.Get_UseProxy;
  end;
  try
    MV.Email := AMail;
    while (MV.Status <> CME_COMPLETE) and (MV.Status <> CME_READY) do;
  finally
    Result := MV.Result = CMR_OK;
  end;
}  
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TRegister, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
