unit EditorsMaskDemoMain;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxLookAndFeels, ActnList, ImgList, Menus, cxButtonEdit, cxDBEdit,
  cxNavigator, cxDBNavigator, cxContainer, cxEdit, cxTextEdit,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, ExtCtrls, ComCtrls,
  StdCtrls, DemoBasicMain;

type
  TEditorsMaskDemoMainForm = class(TDemoBasicMainForm)
    miSeparator1: TMenuItem;
    miLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    Panel1: TPanel;
    Panel3: TPanel;
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
    tlDepartments: TcxDBTreeList;
    tlDepartmentsNAME: TcxDBTreeListColumn;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure edtEmailPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtFaxPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtHomePagePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtPhonePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtPostalCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure LookAndFeelChange(Sender: TObject);
    procedure miDefaultMaskExecute(Sender: TObject);
    procedure miShowEditMaskButtonsExecute(Sender: TObject);
  private
    procedure ChangeLabel(ALabel: TLabel; AProperties: TcxCustomMaskEditProperties);
    function GetMaskKindLabel(AMaskKind: TcxEditMaskKind): string;
    procedure ShowEditMaskDialog(AProperties: TcxCustomEditProperties);
  end;

var
  EditorsMaskDemoMainForm: TEditorsMaskDemoMainForm;

implementation

uses
  cxEditMaskEditor;

{$R *.dfm}
type
  TcxCustomMaskEditPropertiesAccessor = class(TcxCustomMaskEditProperties);

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

procedure TEditorsMaskDemoMainForm.FormShow(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the EditorsMaskDemo.doc file');

//}
end;

procedure TEditorsMaskDemoMainForm.edtEmailPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoEmail, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.edtFaxPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoFax, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.edtHomePagePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoHomePage, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.edtPhonePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoPhone, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.edtPostalCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowEditMaskDialog((Sender as TcxDBButtonEdit).Properties);
  ChangeLabel(lbInfoPostalCode, (Sender as TcxDBButtonEdit).Properties as TcxCustomMaskEditProperties);
end;

procedure TEditorsMaskDemoMainForm.LookAndFeelChange(Sender: TObject);
begin
  if TMenuItem(Sender).Tag > 3 then
  begin
    cxLookAndFeelController.NativeStyle :=
      not cxLookAndFeelController.NativeStyle;
    TMenuItem(Sender).Checked := cxLookAndFeelController.NativeStyle;
  end
  else
  begin
    TMenuItem(Sender).Checked := True;
    cxLookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).Tag);
    cxLookAndFeelController.NativeStyle := False;
    miNativeStyle.Checked := False;
  end;
end;

procedure TEditorsMaskDemoMainForm.miDefaultMaskExecute(Sender: TObject);
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

procedure TEditorsMaskDemoMainForm.miShowEditMaskButtonsExecute(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  edtPostalCode.Properties.Buttons.Items[0].Visible := TMenuItem(Sender).Checked;
  edtPhone.Properties.Buttons.Items[0].Visible := TMenuItem(Sender).Checked;
  edtFax.Properties.Buttons.Items[0].Visible := TMenuItem(Sender).Checked;
  edtHomePage.Properties.Buttons.Items[0].Visible := TMenuItem(Sender).Checked;
  edtEmail.Properties.Buttons.Items[0].Visible := TMenuItem(Sender).Checked;
end;

procedure TEditorsMaskDemoMainForm.ChangeLabel(ALabel: TLabel; AProperties: TcxCustomMaskEditProperties);
var
  AText: string;
begin
  with TcxCustomMaskEditPropertiesAccessor(AProperties) do
  begin
    if EmptyMask(EditMask) then
      AText := 'No mask'
    else
      AText := GetMaskKindLabel(MaskKind);
  end;
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

end.

