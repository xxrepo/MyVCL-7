unit ub2csd;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule, cxWebControls,
  cxWebTV, cxWebStdCtrls, cxWebDataCtrls, cxWebGrids, cxWebData, cxWebExtData;

type
  Tb2csd = class(TcxWebPageModule)
    cxWebTitleLabel: TcxWebLabel;
    Line: TcxWebLabel;
    wlMyFavor: TcxWebURLLabel;
    cxWebDataSource1: TcxWebDataSource;
    cxWebStyleController1: TcxWebStyleController;
    stButtonSelDef: TcxWebStyleItem;
    stButtonSelHover: TcxWebStyleItem;
    scCommon: TcxWebStyleController;
    stHeader1: TcxWebStyleItem;
    stHeader2: TcxWebStyleItem;
    stPanel: TcxWebStyleItem;
    stButtonDef: TcxWebStyleItem;
    stButtonHover: TcxWebStyleItem;
    stEditorDef: TcxWebStyleItem;
    stEditorHover: TcxWebStyleItem;
    stLabelDef: TcxWebStyleItem;
    stLabelHover: TcxWebStyleItem;
    stTips: TcxWebStyleItem;
    stLine1: TcxWebStyleItem;
    stLine2: TcxWebStyleItem;
    procedure wdAddToFavor(Sender: TObject);
    procedure wdDelFromFavor(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    function IsFavor(Id: string): boolean;
    procedure DelFromFavor(Id: string);
    procedure AddToFavor(Id: string);
  end;

function b2csd: Tb2csd;

implementation

{$R *.DFM}{*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, cxWebUtils, uMainPage;

function b2csd: Tb2csd;
begin
  Result := Tb2csd(WebContext.FindModuleClass(Tb2csd));
end;

procedure Tb2csd.wdAddToFavor(Sender: TObject);
begin
  AddToFavor(TcxWebButton(Sender).Name);

  TcxWebButton(Sender).Caption := 'Del. from Favorites';
  TcxWebButton(Sender).OnClick := wdDelFromFavor;
  TcxWebButton(Sender).Styles.Default := stButtonSelDef;
  TcxWebButton(Sender).Styles.Hover := stButtonSelHover;
end;

procedure Tb2csd.wdDelFromFavor(Sender: TObject);
begin
  DelFromFavor(TcxWebButton(Sender).Name);

  TcxWebButton(Sender).Caption := 'Add to Favorites';
  TcxWebButton(Sender).OnClick := wdAddToFavor;
  TcxWebButton(Sender).Styles.Default := stButtonDef;
  TcxWebButton(Sender).Styles.Hover := stButtonHover;
end;

procedure Tb2csd.DelFromFavor(Id: string);
begin
  WebContext.Session.Values[Id] := False;
end;

procedure Tb2csd.AddToFavor(Id: string);
begin
  WebContext.Session.Values[Id] := True;
end;

function Tb2csd.IsFavor(Id: string): boolean;
begin
  Result := WebContext.Session.Values[Id];
end;

procedure Tb2csd.cxWebPageModuleActivate(Sender: TObject);
var
  Stream: TFileStream;
  I, ChildCount, CurImagePos: Integer;
  WebImage: TcxWebImage;
  WebLabel: TcxWebLabel;
  WebButton: TcxWebButton;
begin
  Stream := TFileStream.Create(QualifyFileName('books.dat'), fmOpenRead);
  cxWebDataSource1.LoadFromStream(Stream);
  Stream.Free;

  ChildCount := cxWebDataSource1.RecordCount;
  CurImagePos := 120;

  for I := 0 to ChildCount - 1 do
  begin
    WebImage := TcxWebImage(FindComponent('cxWebImage' + IntToStr(I)));
    if WebImage = nil then WebImage := TcxWebImage.Create(self);
    with WebImage do
    begin
      Parent := Self;
      Name := 'cxWebImage' + IntToStr(I);
      PictureURL := '../Images/' + cxWebDataSource1.DisplayTexts[I, 1];
      Top := CurImagePos;
      Left := 30;
    end;
    WebLabel := TcxWebLabel(FindComponent('cxWebLabel' + IntToStr(I)));
    if WebLabel = nil then WebLabel := TcxWebLabel.Create(self);
    with WebLabel do
    begin
      Parent := Self;
      Name := 'cxWebLabel' + IntToStr(I);
      Caption := cxWebDataSource1.DisplayTexts[I, 2];
      WordWrap := true;
      Top := CurImagePos + 10;
      Left := 120;
      AutoSize := false;
      Width := 500;
      Height := 80;
    end;
    WebButton := TcxWebButton(FindComponent('cxWebButton' + IntToStr(I)));
    if WebButton = nil then WebButton := TcxWebButton.Create(self);
    with WebButton do
    begin
      Parent := Self;
      Name := 'cxWebButton' + IntToStr(I);
      Top := CurImagePos + 30;
      Left := 650;
      Width := 120;
      if IsFavor(Name) then
      begin
        Caption := 'Del. from Favorites';
        OnClick := wdDelFromFavor;
        Styles.Default := stButtonSelDef;
        Styles.Hover := stButtonSelHover;
      end
      else
      begin
        Caption := 'Add to Favorites';
        OnClick := wdAddToFavor;
        Styles.Default := stButtonDef;
        Styles.Hover := stButtonHover;
      end;
    end;
    Inc(CurImagePos, 100 + 10);
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(Tb2csd, TcxWebPageInfo.Create('*.html'), caDestroy));

end.

