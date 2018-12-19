unit EditorsLookupDemoData;

interface

{$I ..\cxVer.inc}

uses
  {$IFNDEF DELPHI6}
  Forms,
  {$ENDIF}
  SysUtils, Classes, DB, cxStyles, cxClasses,
  cxContainer, cxEdit, ImgList, Controls, DBTables;

type
  TEditorsLookupDemoDataDM = class(TDataModule)
    dsProjects: TDataSource;
    dsItems: TDataSource;
    tblItems: TTable;
    tblUsers: TTable;
    dsUsers: TDataSource;
    DataBase: TDataBase;
    dsDepartments: TDataSource;
    tblDepartments: TTable;
    tblUsersID: TAutoIncField;
    tblUsersFNAME: TStringField;
    tblUsersMNAME: TStringField;
    tblUsersLNAME: TStringField;
    tblUsersCOUNTRY: TStringField;
    tblUsersPOSTALCODE: TStringField;
    tblUsersCITY: TStringField;
    tblUsersADDRESS: TStringField;
    tblUsersPHONE: TStringField;
    tblUsersFAX: TStringField;
    tblUsersEMAIL: TStringField;
    tblUsersHOMEPAGE: TStringField;
    tblUsersDEPARTMENTID: TIntegerField;
    tblUsersUserName: TStringField;
    imStat: TImageList;
    tblUsersDepartment: TStringField;
    tblItemsID: TAutoIncField;
    tblItemsNAME: TStringField;
    tblItemsTYPE: TBooleanField;
    tblItemsPROJECTID: TIntegerField;
    tblItemsPRIORITY: TSmallintField;
    tblItemsSTATUS: TSmallintField;
    tblItemsCREATORID: TIntegerField;
    tblItemsCREATEDDATE: TDateTimeField;
    tblItemsOWNERID: TIntegerField;
    tblItemsLASTMODIFIEDDATE: TDateTimeField;
    tblItemsFIXEDDATE: TDateTimeField;
    tblItemsDESCRIPTION: TMemoField;
    tblItemsRESOLUTION: TMemoField;
    qryProjects: TQuery;
    qryProjectsID: TAutoIncField;
    qryProjectsNAME: TStringField;
    qryProjectsMANAGERID: TIntegerField;
    qryProjectsManager: TStringField;
    StyleController: TcxEditStyleController;
    procedure tblUsersCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorsLookupDemoDataDM: TEditorsLookupDemoDataDM;

implementation

{$R *.dfm}

procedure TEditorsLookupDemoDataDM.tblUsersCalcFields(DataSet: TDataSet);
begin
  tblUsersUserName.AsString := tblUsersFNAME.AsString + ' ' +
    tblUsersLNAME.AsString;
end;

end.
