unit UnboundColumnsDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, ImgList,
  Controls, cxEdit, cxEditRepositoryItems, cxDBEditRepository, cxClasses,
  cxGridCardView, DBTables;

type
  TUnboundColumnsDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblCustomers: TTable;
    dsCustomers: TDataSource;
    tblCustomersID: TAutoIncField;
    tblCustomersFIRSTNAME: TStringField;
    tblCustomersLASTNAME: TStringField;
    tblCustomersCOMPANYNAME: TStringField;
    tblCustomersPAYMENTTYPE: TIntegerField;
    tblCustomersPRODUCTID: TIntegerField;
    tblCustomersCUSTOMER: TBooleanField;
    tblCustomersPURCHASEDATE: TDateTimeField;
    tblCustomersPAYMENTAMOUNT: TCurrencyField;
    tblCustomersCOPIES: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UnboundColumnsDemoDataDM: TUnboundColumnsDemoDataDM;

implementation

{$R *.dfm}

end.

