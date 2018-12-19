unit FilterByCodeDemoData;

interface

uses
  Forms, Classes, SysUtils, DB, ImgList, Controls, cxDBEditRepository,
  cxEditRepositoryItems, cxClasses, cxStyles, cxGridTableView, cxEdit, DBTables;

type
  TFilterByCodeDemoMainDM = class(TDataModule)
    DataBase: TDataBase;
    tblCustomers: TTable;
    dsCustomers: TDataSource;
    StyleRepository: TcxStyleRepository;
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
    tblProducts: TTable;
    edrepMain: TcxEditRepository;
    edrepDXPaymentTypeImageCombo: TcxEditRepositoryImageComboBoxItem;
    imPaytTypes: TImageList;
    dsProducts: TDataSource;
    edrepDXLookupProducts: TcxEditRepositoryLookupComboBoxItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FilterByCodeDemoMainDM: TFilterByCodeDemoMainDM;

implementation

{$R *.dfm}

end.
