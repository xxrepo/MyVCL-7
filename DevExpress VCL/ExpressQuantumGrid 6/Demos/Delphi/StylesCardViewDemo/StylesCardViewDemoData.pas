unit StylesCardViewDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, ImgList,
  Controls, cxEdit, cxEditRepositoryItems, cxDBEditRepository, cxClasses,
  cxGridCardView, DBTables, DemoUtils;

type
  TStylesCardViewDemoMainDM = class(TDataModule)
    DataBase: TDataBase;
    tblPersons: TTable;
    dsPersons: TDataSource;
    StyleRepository: TcxStyleRepository;
    stBlueDark: TcxStyle;
    stGold: TcxStyle;
    stBlueLight: TcxStyle;
    stBlueBright: TcxStyle;
    stYellowLight: TcxStyle;
    stGreyLight: TcxStyle;
    stBlueSky: TcxStyle;
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
    tblCountries: TTable;
    dsCountries: TDataSource;
    tblPersonsFullName: TStringField;
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
    cvssDevExpress: TcxGridCardViewStyleSheet;
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
    cvssSlate: TcxGridCardViewStyleSheet;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cvssHighContrast: TcxGridCardViewStyleSheet;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cvssUserDefined: TcxGridCardViewStyleSheet;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    EditRepository: TcxEditRepository;
    edrepGender: TcxEditRepositoryImageComboBoxItem;
    ilPics: TImageList;
    edrepCountry: TcxEditRepositoryLookupComboBoxItem;
    procedure tblPersonsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StylesCardViewDemoMainDM: TStylesCardViewDemoMainDM;

implementation

{$R *.dfm}

procedure TStylesCardViewDemoMainDM.tblPersonsCalcFields(
  DataSet: TDataSet);
begin
  SetStringFieldValue(tblPersonsFullName, Format('%s %s (%d)',[tblPersonsFirstName.Value,
    tblPersonsSecondName.Value, tblPersonsID.Value]));
end;

end.

