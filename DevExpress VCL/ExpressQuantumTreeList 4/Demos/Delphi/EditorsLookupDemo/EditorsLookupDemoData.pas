unit EditorsLookupDemoData;

interface

uses
  
  Forms,
  
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
    StyleController: TcxEditStyleController;
    qryProjects: TQuery;
    qryProjectsID: TIntegerField;
    qryProjectsNAME: TStringField;
    qryProjectsMANAGERID: TIntegerField;
    qryProjectsManager: TStringField;
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
