unit CustomRowHeightDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, ImgList,
  Controls, cxEdit, cxEditRepositoryItems, cxDBEditRepository, cxClasses,
  cxGridCardView, DBTables;

type
  TCustomRowHeightDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblFilms: TTable;
    dsFilms: TDataSource;
    tblFilmsID: TAutoIncField;
    tblFilmsCAPTION: TStringField;
    tblFilmsYEAR: TIntegerField;
    tblFilmsTAGLINE: TStringField;
    tblFilmsPLOTOUTLINE: TStringField;
    tblFilmsRUNTIME: TIntegerField;
    tblFilmsCOLOR: TStringField;
    tblFilmsPHOTO: TBlobField;
    tblFilmsICON: TBlobField;
    tblFilmsWEBSITE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomRowHeightDemoDataDM: TCustomRowHeightDemoDataDM;

implementation

{$R *.dfm}

end.

