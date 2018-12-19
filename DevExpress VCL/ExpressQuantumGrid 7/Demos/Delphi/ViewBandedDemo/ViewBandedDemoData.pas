unit ViewBandedDemoData;

interface

uses
  SysUtils, Classes, DB, cxStyles, cxClasses, cxGridBandedTableView, Forms, DBTables,
  DemoUtils;

type
  TViewBandedDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblUSERS: TTable;
    dsUSERS: TDataSource;
    dsPROJECTS: TDataSource;
    tblPROJECTS: TTable;
    tlbITEMS: TTable;
    dsITEMS: TDataSource;
    tblPROJECTSID: TAutoIncField;
    tblPROJECTSNAME: TStringField;
    tblPROJECTSMANAGERID: TIntegerField;
    tlbITEMSID: TAutoIncField;
    tlbITEMSNAME: TStringField;
    tlbITEMSTYPE: TBooleanField;
    tlbITEMSPROJECTID: TIntegerField;
    tlbITEMSPRIORITY: TSmallintField;
    tlbITEMSSTATUS: TSmallintField;
    tlbITEMSCREATORID: TIntegerField;
    tlbITEMSCREATEDDATE: TDateTimeField;
    tlbITEMSOWNERID: TIntegerField;
    tlbITEMSLASTMODIFIEDDATE: TDateTimeField;
    tlbITEMSFIXEDDATE: TDateTimeField;
    tlbITEMSDESCRIPTION: TMemoField;
    tlbITEMSRESOLUTION: TMemoField;
    tblUSERSID: TAutoIncField;
    tblUSERSFNAME: TStringField;
    tblUSERSLNAME: TStringField;
    tblUSERSPHONE: TStringField;
    tblUSERSName: TStringField;
    procedure tblUSERSCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewBandedDemoDataDM: TViewBandedDemoDataDM;

implementation

{$R *.dfm}

procedure TViewBandedDemoDataDM.tblUSERSCalcFields(DataSet: TDataSet);
begin
  SetStringFieldValue(tblUSERSName, tblUSERSFNAME.Value + ' ' + tblUSERSLNAME.Value);
end;

end.
