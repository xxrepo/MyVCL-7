unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, dxLayoutLookAndFeels, dxLayoutControl, jpeg, ExtCtrls,
  cxControls, ComCtrls, Buttons, dxPSCore, dxPSContainerLnk, dxPSdxLC2Lnk;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    lcMain: TdxLayoutControl;
    Image1: TImage;
    lcMain___Root: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup20: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    lcMainItem5: TdxLayoutItem;
    lcMainItem9: TdxLayoutItem;
    lcMainItem11: TdxLayoutItem;
    lcMainItem13: TdxLayoutItem;
    lcMainGroup25: TdxLayoutGroup;
    lcMainGroup22: TdxLayoutGroup;
    lcMainItem3: TdxLayoutItem;
    lcMainGroup23: TdxLayoutGroup;
    lcMainItem7: TdxLayoutItem;
    lcMainItem27: TdxLayoutItem;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup17: TdxLayoutGroup;
    lcMainGroup10: TdxLayoutGroup;
    lcMainItem15: TdxLayoutItem;
    lcMainItem16: TdxLayoutItem;
    lcMainGroup13: TdxLayoutGroup;
    lcMainItem17: TdxLayoutItem;
    lcMainItem18: TdxLayoutItem;
    lcMainGroup15: TdxLayoutGroup;
    lcMainItem19: TdxLayoutItem;
    lcMainItem20: TdxLayoutItem;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup21: TdxLayoutGroup;
    lcMainGroup16: TdxLayoutGroup;
    lcMainItem21: TdxLayoutItem;
    lcMainItem22: TdxLayoutItem;
    lcMainGroup18: TdxLayoutGroup;
    lcMainItem23: TdxLayoutItem;
    lcMainItem24: TdxLayoutItem;
    lcMainGroup19: TdxLayoutGroup;
    lcMainItem25: TdxLayoutItem;
    lcMainItem26: TdxLayoutItem;
    lcMainItem2: TdxLayoutItem;
    lcMainItem6: TdxLayoutItem;
    lcMainItem10: TdxLayoutItem;
    lcMainItem12: TdxLayoutItem;
    lcMainItem14: TdxLayoutItem;
    lcMainItem4: TdxLayoutItem;
    lcMainItem8: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    lfMain: TdxLayoutWebLookAndFeel;
    lfVCLProducts: TdxLayoutWebLookAndFeel;
    lfActiveXProducts: TdxLayoutWebLookAndFeel;
    lfNETProducts: TdxLayoutWebLookAndFeel;
    lfVCLProductsGroups: TdxLayoutWebLookAndFeel;
    dxLayoutLookAndFeelList2: TdxLayoutLookAndFeelList;
    lfProducts: TdxLayoutWebLookAndFeel;
    lfProductsLink: TdxLayoutWebLookAndFeel;
    lcVCL: TdxLayoutControl;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    lcActiveX: TdxLayoutControl;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    lcNET: TdxLayoutControl;
    Image18: TImage;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    lcMainItem1: TdxLayoutItem;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutItem21: TdxLayoutItem;
    lcMainGroup5: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutItem23: TdxLayoutItem;
    lcMainGroup6: TdxLayoutGroup;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutItem25: TdxLayoutItem;
    lcMainGroup7: TdxLayoutGroup;
    dxLayoutItem26: TdxLayoutItem;
    dxLayoutItem27: TdxLayoutItem;
    lcMainGroup8: TdxLayoutGroup;
    dxLayoutItem28: TdxLayoutItem;
    dxLayoutItem29: TdxLayoutItem;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutItem30: TdxLayoutItem;
    dxLayoutItem31: TdxLayoutItem;
    lcBackgroundGroup_Root: TdxLayoutGroup;
    lcBackground: TdxLayoutControl;
    lcBackgroundSiteItem: TdxLayoutItem;
    lcBackgroundItem1: TdxLayoutItem;
    sbGoBack: TSpeedButton;
    lcBackgroundItem2: TdxLayoutItem;
    sbGoForward: TSpeedButton;
    lcBackgroundGroup1: TdxLayoutGroup;
    lfBackground: TdxLayoutWebLookAndFeel;
    lcBackgroundItem3: TdxLayoutItem;
    Bevel1: TBevel;
    dxComponentPrinter1: TdxComponentPrinter;
    lcBackgroundItem4: TdxLayoutItem;
    sbPreview: TSpeedButton;
    lcBackgroundItem5: TdxLayoutItem;
    dxComponentPrinter1Link2: TdxLayoutControlReportLink;
    dxComponentPrinter1Link3: TdxLayoutControlReportLink;
    dxComponentPrinter1Link4: TdxLayoutControlReportLink;
    dxComponentPrinter1Link5: TdxLayoutControlReportLink;
    procedure FormCreate(Sender: TObject);
    procedure lcMainGroupCaptionClick(Sender: TObject);
    procedure sbGoBackClick(Sender: TObject);
    procedure sbGoForwardClick(Sender: TObject);
    procedure sbPreviewClick(Sender: TObject);
  private
    FActiveScreen: Integer;
    FLastActiveScreen: Integer;
    procedure SetActiveScreen(Value: Integer);
  protected
    procedure GoBack;
    procedure GoForward;
    procedure RefreshEnableds;
    property ActiveScreen: Integer read FActiveScreen write SetActiveScreen;
    property LastActiveScreen: Integer read FLastActiveScreen;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

constructor TForm1.Create(AOwner: TComponent);
begin
  FActiveScreen := -1;
  FLastActiveScreen := -1;
  inherited;
end;

procedure TForm1.SetActiveScreen(Value: Integer);

  function GetLayoutControl(AIndex: Integer): TdxLayoutControl;
  begin
    case AIndex of
      0: Result := lcMain;
      1: Result := lcVCL;
      2: Result := lcActiveX;
      3: Result := lcNET;
    else
      Result := nil;
    end;
  end;

begin
  if FActiveScreen <> Value then
  begin
    if GetLayoutControl(FActiveScreen) <> nil then
      GetLayoutControl(FActiveScreen).Visible := False;
    FLastActiveScreen := FActiveScreen;
    FActiveScreen := Value;
    lcBackgroundSiteItem.Control := GetLayoutControl(FActiveScreen);
    RefreshEnableds;
  end;
end;

procedure TForm1.GoBack;
begin
  ActiveScreen := 0;
end;

procedure TForm1.GoForward;
begin
  ActiveScreen := LastActiveScreen;
end;

procedure TForm1.RefreshEnableds;
begin
  sbGoBack.Enabled := ActiveScreen > 0;
  sbGoForward.Enabled := LastActiveScreen > 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ActiveScreen := 0;
end;

procedure TForm1.lcMainGroupCaptionClick(Sender: TObject);
begin
  ActiveScreen := TdxLayoutGroup(Sender).Tag;
end;

procedure TForm1.sbGoBackClick(Sender: TObject);
begin
  GoBack;
end;

procedure TForm1.sbGoForwardClick(Sender: TObject);
begin
  GoForward;
end;

procedure TForm1.sbPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1[ActiveScreen].Preview;
end;

end.
