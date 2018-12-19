unit uDataCtrlsDemo1;
   
interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, Graphics,
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule, cxWebControls,
  cxWebStdCtrls, DB, DBTables, cxWebGrids, cxDataStorage, cxCustomData,
  cxWebDataCtrls, cxWebData, cxWebExtData, cxWebDataNavigator, cxWebDBGrid;

type
  TDataCtrlsDemo1 = class(TcxWebPageModule)
    cxWebLabel2: TcxWebLabel;
    cbLoadAllRecords: TcxWebCheckBox;
    Table1: TTable;
    dsBiolife: TcxWebDBDataSource;
    cxWebDBDataNavigator1: TcxWebDBDataNavigator;
    cxWebDBGrid1: TcxWebDBGrid;
    cxWebDBGrid1Column1: TcxWebDBColumn;
    cxWebDBGrid1Column2: TcxWebDBColumn;
    cxWebDBGrid1Column3: TcxWebDBColumn;
    cxWebDBGrid1Column4: TcxWebDBColumn;
    cxWebDBLabel1: TcxWebDBLabel;
    cxWebDBEdit1: TcxWebDBEdit;
    cxWebDBMemo1: TcxWebDBMemo;
    cxWebDBImage1: TcxWebDBImage;
    cxWebDBEdit2: TcxWebDBEdit;
    cxWebDBEdit3: TcxWebDBEdit;
    cxWebDBComboBox1: TcxWebDBComboBox;
    cxWebLabel1: TcxWebLabel;
    cxWebLabel3: TcxWebLabel;
    cxWebLabel4: TcxWebLabel;
    cxWebLabel5: TcxWebLabel;
    cxWebLabel6: TcxWebLabel;
    cxWebLabel7: TcxWebLabel;
    cxWebLabel8: TcxWebLabel;
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
    Table1SpeciesNo: TFloatField;
    Table1Category: TStringField;
    Table1Common_Name: TStringField;
    Table1SpeciesName: TStringField;
    Table1Lengthcm: TFloatField;
    Table1Length_In: TFloatField;
    Table1Notes: TMemoField;
    Table1Graphic: TGraphicField;
    procedure cbLoadAllRecordsClick(Sender: TObject);
  end;

function DataCtrlsDemo1: TDataCtrlsDemo1;

implementation

{$R *.DFM}{*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, uMainPage;

function DataCtrlsDemo1: TDataCtrlsDemo1;
begin
  Result := TDataCtrlsDemo1(WebContext.FindModuleClass(TDataCtrlsDemo1));
end;

procedure TDataCtrlsDemo1.cbLoadAllRecordsClick(Sender: TObject);
begin
  dsBiolife.LoadAllRecords := cbLoadAllRecords.Checked;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TDataCtrlsDemo1, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
