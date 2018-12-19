unit umyfavor;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule,
  cxWebControls, cxWebStdCtrls, cxWebData, cxWebExtData;

type
  Tmyfavor = class(TcxWebPageModule)
    cxWebTitleLabel: TcxWebLabel;
    wlMyFavor: TcxWebURLLabel;
    Line: TcxWebLabel;
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
    procedure wdDelFromFavor(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    function IsFavor(Id: string): boolean;
    procedure DelFromFavor(Id: string);
  end;

function myfavor: Tmyfavor;

implementation

{$R *.DFM}{*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, cxWebUtils, uMainPage;

function myfavor: Tmyfavor;
begin
  Result := Tmyfavor(WebContext.FindModuleClass(Tmyfavor));
end;

function Tmyfavor.IsFavor(Id: string): boolean;
begin
  Result := WebContext.Session.Values[Id];
end;

procedure Tmyfavor.DelFromFavor(Id: string);
begin
  WebContext.Session.Values[Id] := False;
end;

procedure Tmyfavor.wdDelFromFavor(Sender: TObject);
var
  I, ChildCount, CurImagePos: Integer;
  InFavor: Boolean;
  WebImage: TcxWebImage;
  WebLabel: TcxWebLabel;
  WebButton: TcxWebButton;
begin
  DelFromFavor(TcxWebButton(Sender).Name);

  ChildCount := cxWebDataSource1.RecordCount;
  CurImagePos := 120;

  for I := 0 to ChildCount - 1 do
  begin
    InFavor := IsFavor('cxWebButton' + IntToStr(I));

    WebImage := TcxWebImage(FindComponent('cxWebImage' + IntToStr(I)));
    if WebImage <> nil then
      with WebImage do
      begin
        Top := CurImagePos;
        Visible := InFavor;
        if not InFavor then
          Top := 1000;
      end;
    WebLabel := TcxWebLabel(FindComponent('cxWebLabel' + IntToStr(I)));
    if WebLabel <> nil then
      with WebLabel do
      begin
        Top := CurImagePos + 10;
        Visible := InFavor;
        if not InFavor then
          Top := 1000;
      end;
    WebButton := TcxWebButton(FindComponent('cxWebButton' + IntToStr(I)));
    if WebButton <> nil then
      with WebButton do
      begin
        Top := CurImagePos + 30;
        Visible := InFavor;
        if not InFavor then
          Top := 1000;
      end;

    if InFavor then
      Inc(CurImagePos, 100 + 10);
  end;
end;

procedure Tmyfavor.cxWebPageModuleActivate(Sender: TObject);
var
  Stream: TFileStream;
  I, ChildCount, CurImagePos: Integer;
  InFavor: Boolean;
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
    InFavor := IsFavor('cxWebButton' + IntToStr(I));
    if InFavor then
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
        Visible := InFavor;
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
        Visible := InFavor;
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
        if InFavor then
        begin
          Caption := 'Del. from Favorites';
          OnClick := wdDelFromFavor;
          Styles.Default := stButtonSelDef;
          Styles.Hover := stButtonSelHover;
        end;
        Visible := InFavor;
      end;
      Inc(CurImagePos, 100 + 10);
    end;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(Tmyfavor, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
