unit DragDropDemoMain;

interface

{$I ..\..\cxVer.inc}

uses
  Windows, Messages, SysUtils
  {$IFDEF DELPHI6}
  , Variants
  {$ENDIF}
  , Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxLookupGrid, cxLookupDBGrid, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxGridCardView, cxGridDBCardView, cxMaskEdit, StdCtrls, ExtCtrls,
  cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxDBEdit, cxStyles,
  Menus, ActnList, ImgList, ComCtrls, cxLookAndFeels, DB,
  DBTables, cxCustomData, cxGraphics, cxFilter, cxData, cxDBData, cxClasses,
  cxGridBandedTableView, cxGridDBBandedTableView, cxDataStorage,
  cxDBLookupComboBox, cxBlobEdit, cxImageComboBox, cxImage, cxMemo,
  cxHyperLinkEdit, cxCheckBox, Grids, DBGrids;

type
  TDragDropDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    miGenreTabPosition: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    Grid: TcxGrid;
    cvPersons: TcxGridDBCardView;
    cvPersonsName: TcxGridDBCardViewRow;
    cvPersonsPersonLineID: TcxGridDBCardViewRow;
    cvPersonsFIRSTNAME: TcxGridDBCardViewRow;
    cvPersonsSECONDNAME: TcxGridDBCardViewRow;
    cvPersonsNICKNAME: TcxGridDBCardViewRow;
    cvPersonsBIRTHNAME: TcxGridDBCardViewRow;
    cvPersonsDATEOFBIRTH: TcxGridDBCardViewRow;
    cvPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow;
    cvPersonsBIOGRAPHY: TcxGridDBCardViewRow;
    cvPersonsID: TcxGridDBCardViewRow;
    cvPersonsFilmID: TcxGridDBCardViewRow;
    cvPersonsBIRTHCOUNTRY: TcxGridDBCardViewRow;
    cvPersonsGender: TcxGridDBCardViewRow;
    tvCompanies: TcxGridDBTableView;
    cvPhotos: TcxGridDBCardView;
    cvPhotosID: TcxGridDBCardViewRow;
    cvPhotosFILMID: TcxGridDBCardViewRow;
    cvPhotosSCREEN: TcxGridDBCardViewRow;
    cvPhotosICON: TcxGridDBCardViewRow;
    bvFilms: TcxGridDBBandedTableView;
    bvFilmsCAPTION: TcxGridDBBandedColumn;
    bvFilmsYEAR: TcxGridDBBandedColumn;
    bvFilmsPLOTOUTLINE: TcxGridDBBandedColumn;
    bvFilmsRUNTIME: TcxGridDBBandedColumn;
    bvFilmsPHOTO: TcxGridDBBandedColumn;
    bvFilmsWEBSITE: TcxGridDBBandedColumn;
    miTabPositionLeft: TMenuItem;
    miTabPositionTop: TMenuItem;
    miTabPositionNone: TMenuItem;
    miShowDictionaries: TMenuItem;
    N1: TMenuItem;
    tvCompaniesID: TcxGridDBColumn;
    tvCompaniesFilmID: TcxGridDBColumn;
    tvCompaniesCompanyID: TcxGridDBColumn;
    tvCompaniesCompanyName: TcxGridDBColumn;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure GridRootLevelStylesGetTabStyle(Sender,
      ATabLevel: TcxGridLevel; out AStyle: TcxStyle);
    procedure miTabPositionClick(Sender: TObject);
    procedure cvPersonsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cvPersonsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure miShowDictionariesClick(Sender: TObject);
    procedure bvFilmsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvCompaniesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvCompaniesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure bvFilmsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    procedure MoveToNextRecord(Sender: TObject);
    procedure CreateLevels;
  end;

var
  DragDropDemoMainForm: TDragDropDemoMainForm;

implementation

{$R *.dfm}

uses
  DragDropDemoData, DragDropDemoDictionaries, AboutDemoForm;

procedure TDragDropDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TDragDropDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TDragDropDemoMainForm.FormShow(Sender: TObject);
begin
  CreateLevels;
  if Grid.Levels.Count > 0 then
    GridActiveTabChanged(Grid, Grid.Levels[0]);
  DragDropDemoDictionariesForm.Show;
end;

procedure TDragDropDemoMainForm.FormCreate(Sender: TObject);
begin
  DragDropDemoMainDM.OnNextRecord := MoveToNextRecord;
end;

procedure TDragDropDemoMainForm.MoveToNextRecord(Sender: TObject);
begin
  TcxCustomGridTableView(Grid.FocusedView).Controller.GoToNext(True);
end;

procedure TDragDropDemoMainForm.CreateLevels;
var
  AMasterLevel, APeopleLevel, ACompaniesLevel, APhotosLevel: TcxGridLevel;
begin
  if not DragDropDemoMainDM.tblGenres.Active then
    DragDropDemoMainDM.tblGenres.Open;
  DragDropDemoMainDM.tblGenres.First;
  while not DragDropDemoMainDM.tblGenres.Eof do
  begin
    AMasterLevel := Grid.Levels.Add;
    AMasterLevel.MaxDetailHeight := 600;
    AMasterLevel.Caption := DragDropDemoMainDM.tblGenresName.AsString;
    AMasterLevel.Options.DetailTabsPosition := dtpTop;
    AMasterLevel.Styles.Tab := DragDropDemoMainDM.cxStyle1;
    AMasterLevel.Styles.TabsBackground := DragDropDemoMainDM.cxStyle39;
    AMasterLevel.Tag := DragDropDemoMainDM.tblGenresID.AsInteger;

    APeopleLevel := AMasterLevel.Add;
    APeopleLevel.Caption := 'People';
    ACompaniesLevel := AMasterLevel.Add;
    ACompaniesLevel.Caption := 'Companies';
    APhotosLevel := AMasterLevel.Add;
    APhotosLevel.Caption := 'Photos';
    DragDropDemoMainDM.tblGenres.Next;
  end;
  if not DragDropDemoMainDM.tblPersonsLine.Active then
    DragDropDemoMainDM.tblPersonsLine.Open;
end;

procedure TDragDropDemoMainForm.GridActiveTabChanged(
  Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin
  if ALevel.IsMaster then
    try
      Grid.BeginUpdate;
      ALevel.GridView := bvFilms;
      ALevel[0].GridView := cvPersons;
      ALevel[1].GridView := tvCompanies;
      ALevel[2].GridView := cvPhotos;
      with DragDropDemoMainDM do
      begin
        qryFilms.Params[0].Value := ALevel.Tag;
        qryFilms.Close;
        qryFilms.Open;
      end;
      bvFilms.DataController.ClearDetails;
    finally
      Grid.EndUpdate;
    end;
end;

procedure TDragDropDemoMainForm.GridRootLevelStylesGetTabStyle(
  Sender, ATabLevel: TcxGridLevel; out AStyle: TcxStyle);
begin
  if Grid.ActiveLevel = ATabLevel then
    AStyle := DragDropDemoMainDM.cxStyle9;
end;

procedure TDragDropDemoMainForm.miTabPositionClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  Grid.RootLevelOptions.DetailTabsPosition :=
    TcxGridDetailTabsPosition(Integer(TMenuItem(Sender).Tag));
end;

procedure TDragDropDemoMainForm.miShowDictionariesClick(
  Sender: TObject);
begin
  DragDropDemoDictionariesForm.Show;
end;

function GetDragSourceGridView(Source: TObject): TcxCustomGridView;
begin
  if (TDragControlObject(Source).Control is TcxGridSite) then
    Result := TcxGridSite(TDragControlObject(Source).Control).GridView
  else
    Result := nil;
end;

function GetMasterRecordFilmID(AView: TcxCustomGridView): Integer;
begin
  Result := TcxDBDataRelation(AView.DataController.GetMasterRelation).GetMasterRecordID(AView.MasterGridRecordIndex);
end;

procedure TDragDropDemoMainForm.bvFilmsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  with TcxGridSite(TDragControlObject(Source).Control) do
    Accept := GridView = DragDropDemoDictionariesForm.tvFilmsList;
end;

procedure TDragDropDemoMainForm.cvPersonsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  with TcxGridSite(TDragControlObject(Source).Control) do
    Accept := GridView = DragDropDemoDictionariesForm.cvPersonsList;
end;

procedure TDragDropDemoMainForm.tvCompaniesDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  with TcxGridSite(TDragControlObject(Source).Control) do
    Accept := GridView = DragDropDemoDictionariesForm.tvCompaniesList;
end;

procedure TDragDropDemoMainForm.bvFilmsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  FilmID: Integer;
  AGridView: TcxCustomGridView;
begin
  AGridView := GetDragSourceGridView(Source);
  if AGridView = nil then Exit;
  FilmID := AGridView.DataController.Values[AGridView.DataController.FocusedRecordIndex,
    DragDropDemoDictionariesForm.tvFilmsListID.Index];
  if DragDropDemoMainDM.InsertFilm(FilmID, Grid.ActiveLevel.Tag) then
    SetFocus
  else
    MessageDlg('This film already exists in this category', mtInformation, [mbOk], 0);
end;

procedure TDragDropDemoMainForm.tvCompaniesDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  AGridView: TcxCustomGridView;
  CompanyID, FilmID: Integer;
begin
  AGridView := GetDragSourceGridView(Source);
  if AGridView = nil then Exit;
  FilmID := GetMasterRecordFilmID(TcxGridSite(Sender).GridView);
  CompanyID := AGridView.DataController.Values[AGridView.DataController.FocusedRecordIndex,
    DragDropDemoDictionariesForm.tvCompaniesListID.Index];
  if DragDropDemoMainDM.InsertCompany(FilmID, CompanyID) then
    SetFocus
  else
    MessageDlg('This company is already assigned to this film', mtInformation, [mbOk], 0);
end;

procedure TDragDropDemoMainForm.cvPersonsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  AGridView: TcxCustomGridView;
  FilmID, PersonID: Integer;
begin
  AGridView := GetDragSourceGridView(Source);
  if AGridView = nil then Exit;
  FilmID := GetMasterRecordFilmID(TcxGridSite(Sender).GridView);
  PersonID := AGridView.DataController.Values[AGridView.DataController.FocusedRecordIndex,
    DragDropDemoDictionariesForm.cvPersonsListID.Index];
  if DragDropDemoMainDM.InsertPerson(FilmID, PersonID, 2) then
    SetFocus
  else
    MessageDlg('This person is already assigned to this film', mtInformation, [mbOk], 0);
end;

end.
