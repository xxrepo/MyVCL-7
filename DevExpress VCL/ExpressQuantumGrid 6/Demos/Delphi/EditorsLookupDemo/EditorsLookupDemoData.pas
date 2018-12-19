unit EditorsLookupDemoData;

interface

uses
  
  Forms,
  
  SysUtils, Classes, DB, cxStyles, cxClasses, cxGridTableView,
  cxContainer, cxEdit, ImgList, Controls, cxGridCardView, DBTables;

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
    cxStyleRepository: TcxStyleRepository;
    imStat: TImageList;
    tblUsersDepartment: TStringField;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
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
