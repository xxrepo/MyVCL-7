unit EditorsMaskDemoMain;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxLookupGrid, cxLookupDBGrid, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxGridCardView, cxGridDBCardView, cxMaskEdit, StdCtrls, ExtCtrls,
  cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxDBEdit, cxStyles,
  Menus, ActnList, ImgList, ComCtrls, cxLookAndFeels,
  cxButtonEdit, DBCtrls, EditorsMaskDemoData,
  cxCustomData, cxGraphics, cxFilter, cxData, DB, cxDBData, cxClasses,
  cxEditMaskEditor, cxNavigator, cxDBNavigator, cxDataStorage,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter;

type
  TEditorsMaskDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridDBTableViewNAME: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    miShowMaskButtons: TMenuItem;
    miDefaultMaskSettings: TMenuItem;
    Panel2: TPanel;
    lbFirstName: TLabel;
    lbMiddleName: TLabel;
    lbLastName: TLabel;
    lbCountry: TLabel;
    lbPostalCode: TLabel;
    lbCity: TLabel;
    lbAddress: TLabel;
    lbPhone: TLabel;
    lbFax: TLabel;
    lbEmail: TLabel;
    lbHomePage: TLabel;
    lbInfoPhone: TLabel;
    lbInfoFax: TLabel;
    lbInfoHomePage: TLabel;
    lbInfoEmail: TLabel;
    lbInfoPostalCode: TLabel;
    lbInfoFirstName: TLabel;
    lbInfoMiddleName: TLabel;
    lbInfoLastName: TLabel;
    lbInfoCountry: TLabel;
    lbInfoCity: TLabel;
    lbInfoAddress: TLabel;
    Panel5: TPanel;
    edtFirstName: TcxDBTextEdit;
    edtMiddleName: TcxDBTextEdit;
    edtLastName: TcxDBTextEdit;
    edtCountry: TcxDBTextEdit;
    edtCity: TcxDBTextEdit;
    edtAddress: TcxDBTextEdit;
    DBNavigator1: TcxDBNavigator;
    edtPostalCode: TcxDBButtonEdit;
    edtPhone: TcxDBButtonEdit;
    edtFax: TcxDBButtonEdit;
    edtHomePage: TcxDBButtonEdit;
    edtEmail: TcxDBButtonEdit;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure edtPostalCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure miShowMaskButtonsClick(Sender: TObject);
    procedure miDefaultMaskSettingsClick(Sender: TObject);
  private
    procedure ChangeLabel(ALabel: TLabel; AProperties: TcxCustomMaskEditProperties);
    function GetMaskKindLabel(AMaskKind: TcxEditMaskKind): string;
    procedure ShowEditMaskDialog(AProperties: TcxCustomEditProperties);
  end;

var
  EditorsMaskDemoMainForm: TEditorsMaskDemoMainForm;

implementation

uses
{$IFDEF CLR}
  System.Reflection,
{$ENDIF}
  AboutDemoForm;

{$R *.dfm}

const
  cxDefaultPostalCodeMaskKind: TcxEditMaskKind = emkRegExprEx;
  cxDefaultPhoneMaskKind: TcxEditMaskKind = emkStandard;
  cxDefaultFaxMaskKind: TcxEditMaskKind = emkRegExprEx;
  cxDefaultHomePageMaskKind: TcxEditMaskKind = emkRegExprEx;
  cxDefaultEmailMaskKind: TcxEditMaskKind = emkRegExpr;
  cxDefaultPostalCodeEditMask: string = '\d\d\d\d\d? | \w\w\w'' ''\w\w\w';
  cxDefaultPhoneEditMask: string = '!\(999\) 000-0000;1;_';
  cxDefaultFaxEditMask: string = '(\(\d\d\d\)'' '')?\d\d\d-\d\d\d\d';
  cxDefaultHomePageEditMask: string = 'http\:\/\/(\w+(\.\w+)*@)?\w+\.\w+(\.\w+)*(/(\w+(/\w+)*/?)?)?';
  cxDefaultEmailEditMask: string = '\w+@\w+\.\w+(\.\w+)*';

type
{$IFNDEF CLR}
  TcxCustomMaskEditPropertiesAccess = class(TcxCustomMaskEditProperties);
{$ELSE}
  TcxCustomMaskEditPropertiesAccess = class(TcxCustomAccess)
  private
    class var EmptyMask_MethodInfo: MethodInfo;
  protected
    class function GetInstanceType: System.Type; override;
  public
    class function EmptyMask(AInstance: TcxCustomMaskEditProperties;
      const AMask: string): Boolean;
  end;

class function TcxCustomMaskEditPropertiesAccess.EmptyMask(
  AInstance: TcxCustomMaskEditProperties; const AMask: string): Boolean;
begin
  CheckMethodInfo('EmptyMask', EmptyMask_MethodInfo);
  Result := Boolean(EmptyMask_MethodInfo.Invoke(AInstance, [AMask]));
end;

class function TcxCustomMaskEditPropertiesAccess.GetInstanceType: System.Type;
begin
  Result := TypeOf(TcxCustomMaskEditProperties);
end;
{$ENDIF}

procedure TEditorsMaskDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TEditorsMaskDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TEditorsMaskDemoMainForm.ChangeLabel(ALabel: TLabel; AProperties: TcxCustomMaskEditProperties);
var
  AText: string;
begin
{$IFNDEF CLR}
  if TcxCustomMaskEditPropertiesAccess(AProperties).EmptyMask(AProperties.EditMask) then
{$ELSE}
  if TcxCustomMaskEditPropertiesAccess.EmptyMask(AProperties, AProperties.EditMask) then
{$ENDIF}
    AText := 'No mask'
  else
    AText := GetMaskKindLabel(AProperties.MaskKind);
  ALabel.Caption := AText;
end;

function TEditorsMaskDemoMainForm.GetMaskKindLabel(AMaskKind: TcxEditMaskKind): string;
begin
  case AMaskKind of
    emkStandard:
      Result := 'Delphi Standard Mask';
    emkRegExpr:
      Result := 'Regular Expression';
    emkRegExprEx:
      Result := 'Regular Expression with Auto Complete Function';
    else
      Result := 'Unknown';
  end;
end;

procedure TEditorsMaskDemoMainForm.ShowEditMaskDialog(AProperties: TcxCustomEditProperties);
var
  ADialog: TcxEditMaskEditorDlg;
begin
  if AProperties.InheritsFrom(TcxCustomMaskEditProperties) then
  begin
    ADialog := TcxEditMaskEditorDlg.Create(nil);
    try
      ADialog.MaskEditProperties := AProperties as TcxCustomMaskEditProperties;
      ADialog.ShowModal;
    finally
      ADialog.Free;
    end;
  end;
end;

procedure TEditorsMaskDemoMainForm.edtPostalCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoPostalCode, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoPhone, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.cxDBButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoFax, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.cxDBButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoHomePage, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.cxDBButtonEdit4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoEmail, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.miShowMaskButtonsClick(Sender: TObject);
var
  AButtonVisible: Boolean;
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    AButtonVisible := Checked;
  end;
  edtPostalCode.Properties.Buttons.Items[0].Visible := AButtonVisible;
  edtPhone.Properties.Buttons.Items[0].Visible := AButtonVisible;
  edtFax.Properties.Buttons.Items[0].Visible := AButtonVisible;
  edtHomePage.Properties.Buttons.Items[0].Visible := AButtonVisible;
  edtEmail.Properties.Buttons.Items[0].Visible := AButtonVisible;
end;

procedure TEditorsMaskDemoMainForm.miDefaultMaskSettingsClick(Sender: TObject);
begin
  edtPostalCode.Properties.MaskKind := cxDefaultPostalCodeMaskKind;
  edtPostalCode.Properties.EditMask := cxDefaultPostalCodeEditMask;
  ChangeLabel(lbInfoPostalCode, edtPostalCode.Properties);
  edtPhone.Properties.MaskKind := cxDefaultPhoneMaskKind;
  edtPhone.Properties.EditMask := cxDefaultPhoneEditMask;
  ChangeLabel(lbInfoPhone, edtPhone.Properties);
  edtFax.Properties.MaskKind := cxDefaultFaxMaskKind;
  edtFax.Properties.EditMask := cxDefaultFaxEditMask;
  ChangeLabel(lbInfoFax, edtFax.Properties);
  edtHomePage.Properties.MaskKind := cxDefaultHomePageMaskKind;
  edtHomePage.Properties.EditMask := cxDefaultHomePageEditMask;
  ChangeLabel(lbInfoHomePage, edtHomePage.Properties);
  edtEmail.Properties.MaskKind := cxDefaultEmailMaskKind;
  edtEmail.Properties.EditMask := cxDefaultEmailEditMask;
  ChangeLabel(lbInfoEmail, edtEmail.Properties);
end;

end.

