unit EBarMegaDemoData;

interface

uses
  SysUtils, Classes, DB, DBTables, Forms;

type
  TEBarMegaDemoMainDM = class(TDataModule)
    tblContacts: TTable;
    tblContactsID: TAutoIncField;
    tblContactsProductID: TIntegerField;
    tblContactsFirstName: TStringField;
    tblContactsLastName: TStringField;
    tblContactsCompany: TStringField;
    tblContactsAddress: TStringField;
    tblContactsCity: TStringField;
    tblContactsState: TStringField;
    tblContactsPurchaseDate: TDateField;
    tblContactsPaymentType: TStringField;
    tblContactsPaymentAmount: TBCDField;
    tblContactsproduct: TStringField;
    tblContactsCustName: TStringField;
    tblProducts: TTable;
    tblProductsID: TIntegerField;
    tblProductsNAME: TStringField;
    tblProductsDescription: TStringField;
    Database: TDatabase;
    dsProducts: TDataSource;
    dsContacts: TDataSource;
    procedure tblContactsCalcFields(DataSet: TDataSet);
  end;

var
  EBarMegaDemoMainDM: TEBarMegaDemoMainDM;

implementation

{$R *.dfm}

procedure TEBarMegaDemoMainDM.tblContactsCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByname('CustName').AsString := FieldByname('FirstName').AsString + ' ' + FieldByname('LastName').AsString;
end;

end.
