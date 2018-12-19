unit pmNewQuest;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls, HomeDM, DB, ADODB;


type
  TNewquest = class(TcxWebPageModule)
    weSubject: TcxWebEdit;
    win95: TcxWebCheckBox;
    win98: TcxWebCheckBox;
    winnt: TcxWebCheckBox;
    winme: TcxWebCheckBox;
    w2000: TcxWebCheckBox;
    winxp: TcxWebCheckBox;
    d1: TcxWebCheckBox;
    d2: TcxWebCheckBox;
    d3: TcxWebCheckBox;
    d4: TcxWebCheckBox;
    d5: TcxWebCheckBox;
    d6: TcxWebCheckBox;
    cb1: TcxWebCheckBox;
    cb3: TcxWebCheckBox;
    cb4: TcxWebCheckBox;
    cb5: TcxWebCheckBox;
    cb6: TcxWebCheckBox;
    cppnet: TcxWebCheckBox;
    csnet: TcxWebCheckBox;
    vbnet: TcxWebCheckBox;
    jsnet: TcxWebCheckBox;
    fpnet: TcxWebCheckBox;
    aspnet: TcxWebCheckBox;
    vb5: TcxWebCheckBox;
    vb6: TcxWebCheckBox;
    vc5: TcxWebCheckBox;
    vc6: TcxWebCheckBox;
    vid6: TcxWebCheckBox;
    IE: TcxWebCheckBox;
    ACC97: TcxWebCheckBox;
    ACC2000: TcxWebCheckBox;
    ACC2002: TcxWebCheckBox;
    Body: TcxWebMemo;
    wbAsk: TcxWebButton;
    wbReset: TcxWebButton;
    Query: TADOQuery;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure wbAskClick(Sender: TObject);
  private
    { Private declarations }
    procedure InsertQuest(ANewId: Integer);
  public
    { Public declarations }
  end;

function Newquest: TNewquest;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, Math, UQuestion, UUtil,
  ActiveX, ComObj;

function Newquest: TNewquest;
begin
  Result := TNewquest(WebContext.FindModuleClass(TNewquest));
end;

procedure TNewquest.cxWebPageModuleActivate(Sender: TObject);
begin
  Body.Text := '';
end;

procedure TNewquest.InsertQuest(ANewId: Integer);
const
  arVersions: array[0..25] of string = ('d1', 'd2', 'd3', 'd4', 'cb1', 'cb3', 'cb4', 'd5',
    'cb5', 'vb5', 'vb6', 'vc5', 'vc6', 'vid6', 'IE', 'ACC97', 'ACC2000', 'd6', 'ACC2002',
    'cppnet', 'csnet', 'vbnet', 'jsnet', 'fpnet', 'aspnet', 'cb6');
  arPlatforms: array[0..5] of string = ('win95', 'win98', 'winnt', 'w2000', 'winme', 'winxp');
var
  I, Vers, Plts: Integer;
  CheckBox: TcxWebCheckBox;
begin
  Query.Parameters.ParamByName('QUESTIONID').Value := ANewId;
  Query.Parameters.ParamByName('USERID').Value := DM.UserId;
  Query.Parameters.ParamByName('BODY_Q').Value := FormatHTML(Body.Text);
  Query.Parameters.ParamByName('SUBJECT').Value := FormatHTML(weSubject.Text);
  Query.Parameters.ParamByName('DATE').Value := Now;
  Vers := 0;
  for I := 0 to High(arVersions) do
  begin
    CheckBox := TcxWebCheckBox(FindComponent(arVersions[I]));
    if CheckBox.Checked then
      Vers := Vers + Trunc(Power(2, I));
  end;
  Plts := 0;
  for I := 0 to High(arPlatforms) do
  begin
    CheckBox := TcxWebCheckBox(FindComponent(arPlatforms[I]));
    if CheckBox.Checked then
      Plts := Plts + Trunc(Power(2, I));
  end;
  Query.Parameters.ParamByName('PRODUCTS').Value := Vers;
  Query.Parameters.ParamByName('PLATFORM').Value := Plts;
  Query.ExecSQL;
end;

procedure TNewquest.wbAskClick(Sender: TObject);
var
  Question: TQuestion;
begin
  Question := TQuestion.Create;
  try
    Question.Connection := DM.Connection;
    InsertQuest(Question.GetMaxId + 1);
  finally
    Question.Free;
  end;
  RedirectToPage('Questions', '');
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TNewquest, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
