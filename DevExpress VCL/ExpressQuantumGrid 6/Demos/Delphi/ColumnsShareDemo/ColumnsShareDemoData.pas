unit ColumnsShareDemoData;

interface

uses
  SysUtils, Classes, DB, cxStyles, cxClasses, cxGridTableView, Forms,
  cxGridCardView, ImgList, Controls, DBTables;

type
  TColumnsShareDemoMainDM = class(TDataModule)
    tblProjects: TTable;
    dsProjects: TDataSource;
    dsItems: TDataSource;
    tblItems: TTable;
    tblUsers: TTable;
    dsUsers: TDataSource;
    dsProjectTeam: TDataSource;
    tblProjectTeam: TTable;
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
    tblProjectTeamID: TAutoIncField;
    tblProjectTeamPROJECTID: TIntegerField;
    tblProjectTeamUSERID: TIntegerField;
    tblProjectTeamFUNCTION: TStringField;
    tblProjectsID: TAutoIncField;
    tblProjectsNAME: TStringField;
    tblProjectsMANAGERID: TIntegerField;
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
    procedure tblUsersCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ColumnsShareDemoMainDM: TColumnsShareDemoMainDM;

implementation

{$R *.dfm}

procedure TColumnsShareDemoMainDM.tblUsersCalcFields(DataSet: TDataSet);
begin
  tblUsersUserName.AsString := tblUsersFNAME.AsString + ' ' +
    tblUsersLNAME.AsString;
end;

end.
