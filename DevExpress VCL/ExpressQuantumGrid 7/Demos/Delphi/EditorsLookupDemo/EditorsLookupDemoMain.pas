unit EditorsLookupDemoMain;

interface

{$I ..\..\cxVer.inc}


uses
  {$IFDEF DELPHI6}
  Variants,
  {$ENDIF}
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxLookupGrid, cxLookupDBGrid, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxGridCardView, cxGridDBCardView, cxMaskEdit, StdCtrls, ExtCtrls,
  cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxDBEdit, cxStyles,
  Menus, ActnList, ImgList, ComCtrls, cxLookAndFeels,
  cxLookupEdit, cxDBLookupComboBox, DBCtrls, cxCustomData, cxGraphics,
  cxFilter, cxData, DB, cxDBData, cxClasses, cxCalendar, cxImageComboBox,
  cxMemo, cxCheckBox, cxButtons, cxNavigator, cxDBLookupEdit,
  cxStorage, cxPropertiesStore, cxDBNavigator, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters;

type
  TEditorsLookupDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescription: TLabel;
    miLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miStorage: TMenuItem;
    miStorageType: TMenuItem;
    miStore: TMenuItem;
    miRestore: TMenuItem;
    miIniStoreType: TMenuItem;
    miRegistryStoreType: TMenuItem;
    miMemoryStoreType: TMenuItem;
    N5: TMenuItem;
    N3: TMenuItem;
    miStoringGridLookFeel: TMenuItem;
    N6: TMenuItem;
    miStorageActive: TMenuItem;
    N1: TMenuItem;
    LookupOptions1: TMenuItem;
    miPickMode: TMenuItem;
    miStandardMode: TMenuItem;
    miEditMode: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    cxPropertiesStore: TcxPropertiesStore;
    cxStorageActiveStore: TcxPropertiesStore;
    pnlEditors: TPanel;
    gbIssue: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    edName: TcxDBTextEdit;
    meDescription: TcxDBMemo;
    lcbCreator: TcxDBLookupComboBox;
    gbInfo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cbPriority: TcxDBImageComboBox;
    deCreateDate: TcxDBDateEdit;
    chbRequest: TcxDBCheckBox;
    gbStatus: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbStatus: TcxDBImageComboBox;
    deLastModifiedDate: TcxDBDateEdit;
    deFixedDate: TcxDBDateEdit;
    DBNavigator: TcxDBNavigator;
    gbProject: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    lcbProject: TcxDBLookupComboBox;
    lcbOwner: TcxDBLookupComboBox;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miNativeStyleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChangeLookupModeClick(Sender: TObject);
    procedure lcbCreatorNewLookupDisplayText(Sender: TObject;
      const AText: TCaption);
    procedure miStoreClick(Sender: TObject);
    procedure miRestoreClick(Sender: TObject);
    procedure miStoringGridLookFeelClick(Sender: TObject);
    procedure miStorageActiveClick(Sender: TObject);
    procedure StorageTypeClick(Sender: TObject);
    procedure miLookAndFeelKindClick(Sender: TObject);
    procedure miLookFeelClick(Sender: TObject);
    procedure miKindClick(Sender: TObject);
  private
    FStream: TMemoryStream;
    procedure SetPickLookupMode;
    procedure SetStandardLookupMode;
    procedure SetEditLookupMode;
  end;

var
  EditorsLookupDemoMainForm: TEditorsLookupDemoMainForm;

implementation

{$R *.dfm}

uses
  EditorsLookupDemoData, EditorsLookupDemoNewUser, SysUtils, AboutDemoForm;

procedure TEditorsLookupDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TEditorsLookupDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TEditorsLookupDemoMainForm.miNativeStyleClick(Sender: TObject);
begin
  with LookAndFeelController do
  begin
    NativeStyle := not NativeStyle;
    (Sender as TMenuItem).Checked := NativeStyle;
  end;  
end;

procedure TEditorsLookupDemoMainForm.miLookAndFeelKindClick(
  Sender: TObject);
begin
  LookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).MenuIndex);
  (Sender as TMenuItem).Checked := True;
end;

procedure TEditorsLookupDemoMainForm.FormCreate(Sender: TObject);
begin
  FStream := TMemoryStream.Create;
  cxPropertiesStore.StorageStream := FStream;
  if not miStoringGridLookFeel.Checked then
  begin
    miStoringGridLookFeel.Checked := True;
    miStoringGridLookFeelClick(miStoringGridLookFeel);
  end;
end;

procedure TEditorsLookupDemoMainForm.FormDestroy(Sender: TObject);
begin
  if cxPropertiesStore.StorageType = stStream then
    miIniStoreType.Click;
  FreeAndNil(FStream);
end;

procedure TEditorsLookupDemoMainForm.lcbCreatorNewLookupDisplayText(
  Sender: TObject; const AText: TCaption);
var
  ALookupControl: TcxDBLookupComboBox;
begin
  ALookupControl := TcxDBLookupComboBox(Sender);
  ALookupControl.Reset;
  if (EditorsLookupDemoNewUserForm.ShowEX(AText) = mrOK) then
  begin
    ALookupControl.Text := EditorsLookupDemoDataDM.tblUsersUserName.AsString;
    ALookupControl.DataBinding.Field.Value :=
      EditorsLookupDemoDataDM.tblUsersID.Value;
  end;
  Abort;
end;

procedure TEditorsLookupDemoMainForm.ChangeLookupModeClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  case TMenuItem(Sender).Tag of
    1: SetPickLookupMode;
    2: SetStandardLookupMode;
    3: SetEditLookupMode;
  end
end;

procedure TEditorsLookupDemoMainForm.SetPickLookupMode;
begin
  with lcbCreator.Properties do
  begin
    DropDownListStyle := lsEditFixedList;
    ImmediateDropDown := True;
  end;
  with lcbOwner.Properties do
  begin
    DropDownListStyle := lsEditFixedList;
    ImmediateDropDown := True;
  end;
  lcbProject.Properties.DropDownListStyle := lsEditFixedList;
end;

procedure TEditorsLookupDemoMainForm.SetStandardLookupMode;
begin
  with lcbCreator.Properties do
  begin
    DropDownListStyle := lsFixedList;
    ImmediateDropDown := True;
  end;
  with lcbOwner.Properties do
  begin
    DropDownListStyle := lsFixedList;
    ImmediateDropDown := True;
  end;
  lcbProject.Properties.DropDownListStyle := lsFixedList;
end;

procedure TEditorsLookupDemoMainForm.SetEditLookupMode;
begin
  with lcbCreator.Properties do
  begin
    DropDownListStyle := lsEditList;
    ImmediateDropDown := False;
  end;
  with lcbOwner.Properties do
  begin
    DropDownListStyle := lsEditList;
    ImmediateDropDown := False;
  end;
  lcbProject.Properties.DropDownListStyle := lsEditFixedList;
end;

procedure TEditorsLookupDemoMainForm.StorageTypeClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  TMenuItem(Sender).Parent.Tag := TMenuItem(Sender).Tag;
  cxPropertiesStore.StorageType := TcxStorageType(TMenuItem(Sender).Tag);
  if TMenuItem(Sender).Tag = 0 then
    cxPropertiesStore.StorageName := cxPropertiesStore.Name + '.ini'
  else
    cxPropertiesStore.StorageName := cxPropertiesStore.Name;
end;

procedure TEditorsLookupDemoMainForm.miStoreClick(Sender: TObject);
begin
  cxPropertiesStore.StoreTo;
end;

procedure TEditorsLookupDemoMainForm.miRestoreClick(Sender: TObject);
begin
  FStream.Position := 0;
  cxPropertiesStore.RestoreFrom;
end;

procedure TEditorsLookupDemoMainForm.miStoringGridLookFeelClick(
  Sender: TObject);
var
 AIndex: Integer;

  function IndexOfPropertiesStoreComponent(AComponent: TComponent): Integer;
  begin
    for Result := 0 to cxPropertiesStore.Components.Count - 1 do
      if cxPropertiesStore.Components[Result].Component = AComponent then
        Exit;
    Result := -1;
  end;

begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  AIndex := IndexOfPropertiesStoreComponent(LookAndFeelController);
  if TMenuItem(Sender).Checked then
  begin
    if AIndex > -1 then
    begin
      cxPropertiesStore.Components[AIndex].Properties.Add('NativeStyle');
      cxPropertiesStore.Components[AIndex].Properties.Add('Kind');
    end
    else
      with TcxPropertiesStoreComponent(cxPropertiesStore.Components.Add) do
      begin
        Component := LookAndFeelController;
        Properties.Add('NativeStyle');
        Properties.Add('Kind');
      end;
  end
  else
    if AIndex > -1 then
      cxPropertiesStore.Components[AIndex].Free;
end;

procedure TEditorsLookupDemoMainForm.miStorageActiveClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxPropertiesStore.Active := TMenuItem(Sender).Checked;
  miStoringGridLookFeel.Enabled := TMenuItem(Sender).Checked;
end;

procedure TEditorsLookupDemoMainForm.miLookFeelClick(Sender: TObject);
begin
  miNativeStyle.Checked := LookAndFeelController.NativeStyle;
end;

procedure TEditorsLookupDemoMainForm.miKindClick(Sender: TObject);
begin
  miKind.Items[Ord(LookAndFeelController.Kind)].Checked := True;
end;

end.
