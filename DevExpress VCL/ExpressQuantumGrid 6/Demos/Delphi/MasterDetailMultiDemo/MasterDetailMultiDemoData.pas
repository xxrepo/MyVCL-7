unit MasterDetailMultiDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, cxClasses, cxGridTableView,
  cxGridCardView, cxGridBandedTableView, DBTables, DemoUtils;

type
  TMasterDetailMultiDemoMainDM = class(TDataModule)
    dsFilms: TDataSource;
    dsFilmsPersons: TDataSource;
    dsPersonsLine: TDataSource;
    tblPersonsLine: TTable;
    tblPersonsLineID: TAutoIncField;
    tblPersonsLineNAME: TStringField;
    DataBase: TDataBase;
    qryFilmsPersons: TQuery;
    qryFilmsPersonsName: TStringField;
    qryFilmsPersonsPersonLineID: TIntegerField;
    qryFilmsPersonsFIRSTNAME: TStringField;
    qryFilmsPersonsSECONDNAME: TStringField;
    qryFilmsPersonsNICKNAME: TStringField;
    qryFilmsPersonsBIRTHNAME: TStringField;
    qryFilmsPersonsDATEOFBIRTH: TDateTimeField;
    qryFilmsPersonsLOCATIONOFBIRTH: TStringField;
    qryFilmsPersonsBIOGRAPHY: TMemoField;
    qryFilmsPersonsHOMEPAGE: TStringField;
    qryFilmsPersonsID: TAutoIncField;
    qryFilmsPersonsFilmID: TIntegerField;
    qryFilmsPersonsBIRTHCOUNTRY: TIntegerField;
    qryFilmsPersonsGender: TBooleanField;
    tblPersonsHelper: TTable;
    tblPersonsHelperID: TAutoIncField;
    tblPersonsHelperFIRSTNAME: TStringField;
    tblPersonsHelperSECONDNAME: TStringField;
    tblPersonsHelperGENDER: TBooleanField;
    tblPersonsHelperBIRTHNAME: TStringField;
    tblPersonsHelperDATEOFBIRTH: TDateTimeField;
    tblPersonsHelperBIRTHCOUNTRY: TIntegerField;
    tblPersonsHelperLOCATIONOFBIRTH: TStringField;
    tblPersonsHelperBIOGRAPHY: TMemoField;
    tblPersonsHelperNICKNAME: TStringField;
    tblPersonsHelperHOMEPAGE: TStringField;
    tblPersonsStaffHelper: TTable;
    tblPersonsStaffHelperID: TAutoIncField;
    tblPersonsStaffHelperFILMID: TIntegerField;
    tblPersonsStaffHelperPERSONLINEID: TIntegerField;
    tblPersonsStaffHelperPERSONID: TIntegerField;
    tblPersonsStaffHelperDESCRIPTION: TStringField;
    dsFilmsCompanies: TDataSource;
    qryFilmsCompanies: TQuery;
    qryFilmsCompaniesName: TStringField;
    qryFilmsCompaniesType: TStringField;
    qryFilmsCompaniesCountry: TStringField;
    qryFilmsCompaniesWebSite: TStringField;
    qryFilmsCompaniesID: TIntegerField;
    qryFilmsCompaniesFILMID: TIntegerField;
    tblFilmsScreens: TTable;
    tblFilmsScreensID: TAutoIncField;
    tblFilmsScreensFILMID: TIntegerField;
    tblFilmsScreensSCREEN: TBlobField;
    tblFilmsScreensICON: TBlobField;
    dsFilmsScreens: TDataSource;
    qryFilms: TQuery;
    qryFilmsID: TAutoIncField;
    qryFilmsCAPTION: TStringField;
    qryFilmsYEAR: TIntegerField;
    qryFilmsTAGLINE: TStringField;
    qryFilmsPLOTOUTLINE: TStringField;
    qryFilmsRUNTIME: TIntegerField;
    qryFilmsCOLOR: TStringField;
    qryFilmsPHOTO: TBlobField;
    qryFilmsICON: TBlobField;
    qryFilmsWEBSITE: TStringField;
    tblGenres: TTable;
    tblGenresID: TAutoIncField;
    tblGenresNAME: TStringField;
    cxStyleRepository: TcxStyleRepository;
    styleBold: TcxStyle;
    procedure qryFilmsPersonsCalcFields(DataSet: TDataSet);
    procedure qryFilmsPersonsBeforePost(DataSet: TDataSet);
    procedure qryFilmsPersonsAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
    FIsInserting: Boolean;
  public
    { Public declarations }
  end;

var
  MasterDetailMultiDemoMainDM: TMasterDetailMultiDemoMainDM;

implementation

{$R *.dfm}

{$IFDEF CLR}
uses
  Variants;
{$ENDIF}

procedure TMasterDetailMultiDemoMainDM.qryFilmsPersonsCalcFields(
  DataSet: TDataSet);
begin
  SetStringFieldValue(qryFilmsPersonsName,
    qryFilmsPersonsFIRSTNAME.Value + ' ' + qryFilmsPersonsSECONDNAME.Value);
end;

procedure TMasterDetailMultiDemoMainDM.qryFilmsPersonsBeforePost(
  DataSet: TDataSet);
  procedure InsertNewPerson;
  begin
    tblPersonsHelper.Insert;

    tblPersonsHelperFIRSTNAME.AsString := qryFilmsPersonsFIRSTNAME.AsString;
    tblPersonsHelperSECONDNAME.Value := qryFilmsPersonsSECONDNAME.Value;
    tblPersonsHelperGENDER.AsBoolean := qryFilmsPersonsGender.AsBoolean;
    tblPersonsHelperBIRTHNAME.AsString := qryFilmsPersonsBIRTHNAME.AsString;
    tblPersonsHelperDATEOFBIRTH.AsDateTime := qryFilmsPersonsDATEOFBIRTH.AsDateTime;
    tblPersonsHelperBIRTHCOUNTRY.AsString := qryFilmsPersonsBIRTHCOUNTRY.AsString;
    tblPersonsHelperLOCATIONOFBIRTH.AsString :=
      qryFilmsPersonsLOCATIONOFBIRTH.AsString;
    tblPersonsHelperBIOGRAPHY.AsString := qryFilmsPersonsBIOGRAPHY.AsString;
    tblPersonsHelperNICKNAME.AsString := qryFilmsPersonsNICKNAME.AsString;
    tblPersonsHelperHOMEPAGE.AsString := qryFilmsPersonsHOMEPAGE.AsString;

    tblPersonsHelper.Post;
  end;
  procedure InsertNewPersonStaff;
  begin
    tblPersonsStaffHelper.Insert;
    tblPersonsStaffHelperPERSONID.AsInteger := tblPersonsHelperID.AsInteger;
    tblPersonsStaffHelperPERSONLINEID.AsInteger :=
      qryFilmsPersonsPersonLineID.AsInteger;
    tblPersonsStaffHelper.Post;
  end;
begin
  if FIsInserting then
  begin
    InsertNewPerson;
    InsertNewPersonStaff;
    DataSet.Cancel;
    DataSet.Close;
    DataSet.Open;
    DataSet.Locate('ID',tblPersonsStaffHelper.FieldByName('ID').AsInteger,[]);
    Abort;
    FIsInserting := False
  end;
end;

procedure TMasterDetailMultiDemoMainDM.qryFilmsPersonsAfterInsert(
  DataSet: TDataSet);
begin
  FIsInserting := True;
end;

end.
