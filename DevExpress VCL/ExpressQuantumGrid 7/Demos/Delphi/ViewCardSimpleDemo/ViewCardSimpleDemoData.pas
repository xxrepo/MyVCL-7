unit ViewCardSimpleDemoData;

interface

uses
  SysUtils, Classes, DB, cxStyles, cxGridCardView, cxClasses,
  cxGridTableView, Forms, DBTables;

type
  TViewCardSimpleDemoMainDM = class(TDataModule)
    DataBase: TDataBase;
    tlbDEPARTMENTS: TTable;
    dsDEPARTMENTS: TDataSource;
    dsUSERS: TDataSource;
    tlbUSERS: TTable;
    tlbDEPARTMENTSID: TAutoIncField;
    tlbDEPARTMENTSNAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCardSimpleDemoMainDM: TViewCardSimpleDemoMainDM;

implementation

{$R *.dfm}

end.
