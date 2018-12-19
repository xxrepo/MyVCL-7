unit ViewCardDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, ImgList,
  Controls, cxEdit, cxEditRepositoryItems, cxDBEditRepository, cxClasses,
  cxGridCardView, DBTables;

type
  TViewCardDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblPersons: TTable;
    dsPersons: TDataSource;
    tblPersonsID: TAutoIncField;
    tblPersonsFIRSTNAME: TStringField;
    tblPersonsSECONDNAME: TStringField;
    tblPersonsGENDER: TBooleanField;
    tblPersonsBIRTHNAME: TStringField;
    tblPersonsDATEOFBIRTH: TDateTimeField;
    tblPersonsBIRTHCOUNTRY: TIntegerField;
    tblPersonsLOCATIONOFBIRTH: TStringField;
    tblPersonsBIOGRAPHY: TMemoField;
    tblPersonsNICKNAME: TStringField;
    tblPersonsFullName: TStringField;
    ilPics: TImageList;
    tblPersonsHOMEPAGE: TStringField;
    tblCountries: TTable;
    dsCountries: TDataSource;
    procedure tblPersonsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCardDemoDataDM: TViewCardDemoDataDM;

implementation

{$R *.dfm}

procedure TViewCardDemoDataDM.tblPersonsCalcFields(
  DataSet: TDataSet);
begin
  with DataSet do
    tblPersonsFullName.AsString := Format('%s %s (%d)',[tblPersonsFirstName.AsString,
      tblPersonsSecondName.AsString, tblPersonsID.AsInteger]);
end;

end.

