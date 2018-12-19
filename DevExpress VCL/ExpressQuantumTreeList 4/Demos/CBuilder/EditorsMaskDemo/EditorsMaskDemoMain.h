//---------------------------------------------------------------------------

#ifndef EditorsMaskDemoMainH
#define EditorsMaskDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "cxLookAndFeels.hpp"
#include "DemoBasicMain.h"
#include "cxButtonEdit.hpp"
#include "cxContainer.hpp"
#include "cxDBEdit.hpp"
#include "cxDBNavigator.hpp"
#include "cxDBTL.hpp"
#include "cxInplaceContainer.hpp"
#include "cxMaskEdit.hpp"
#include "cxNavigator.hpp"
#include "cxTextEdit.hpp"
#include "cxTL.hpp"
#include "cxTLData.hpp"
#include <ExtCtrls.hpp>
#include "cxEditMaskEditor.hpp"
//---------------------------------------------------------------------------
class TEditorsMaskDemoMainForm : public TDemoBasicMainForm
{
__published:	// IDE-managed Components
  TMenuItem *miFlat;
  TMenuItem *miUltraFlat;
  TMenuItem *miStandard;
  TMenuItem *miNativeStyle;
  TPanel *Panel1;
  TPanel *Panel3;
  TcxDBTreeList *tlDepartments;
  TcxDBTreeListColumn *tlDepartmentsNAME;
  TPanel *Panel2;
  TLabel *lbFirstName;
  TLabel *lbMiddleName;
  TLabel *lbLastName;
  TLabel *lbCountry;
  TLabel *lbPostalCode;
  TLabel *lbCity;
  TLabel *lbAddress;
  TLabel *lbPhone;
  TLabel *lbFax;
  TLabel *lbEmail;
  TLabel *lbHomePage;
  TLabel *lbInfoPhone;
  TLabel *lbInfoFax;
  TLabel *lbInfoHomePage;
  TLabel *lbInfoEmail;
  TLabel *lbInfoPostalCode;
  TLabel *lbInfoFirstName;
  TLabel *lbInfoMiddleName;
  TLabel *lbInfoLastName;
  TLabel *lbInfoCountry;
  TLabel *lbInfoCity;
  TLabel *lbInfoAddress;
  TPanel *Panel5;
  TcxDBTextEdit *edtFirstName;
  TcxDBTextEdit *edtMiddleName;
  TcxDBTextEdit *edtLastName;
  TcxDBTextEdit *edtCountry;
  TcxDBTextEdit *edtCity;
  TcxDBTextEdit *edtAddress;
  TcxDBNavigator *DBNavigator1;
  TcxDBButtonEdit *edtPostalCode;
  TcxDBButtonEdit *edtPhone;
  TcxDBButtonEdit *edtFax;
  TcxDBButtonEdit *edtHomePage;
  TcxDBButtonEdit *edtEmail;
  TMenuItem *miOffice11;
  void __fastcall FormShow(TObject *Sender);
  void __fastcall LookAndFeelChange(TObject *Sender);
  void __fastcall edtEmailPropertiesButtonClick(TObject *Sender,
    int AButtonIndex);
  void __fastcall edtFaxPropertiesButtonClick(TObject *Sender,
    int AButtonIndex);
  void __fastcall edtHomePagePropertiesButtonClick(TObject *Sender,
    int AButtonIndex);
  void __fastcall edtPhonePropertiesButtonClick(TObject *Sender,
    int AButtonIndex);
  void __fastcall edtPostalCodePropertiesButtonClick(TObject *Sender,
    int AButtonIndex);
  void __fastcall miDefaultMaskExecute(TObject *Sender);
  void __fastcall miShowEditMaskButtonsExecute(TObject *Sender);
private:
  static const TcxEditMaskKind cxDefaultPostalCodeMaskKind = emkRegExprEx;
  static const TcxEditMaskKind cxDefaultPhoneMaskKind = emkStandard;
  static const TcxEditMaskKind cxDefaultFaxMaskKind = emkRegExprEx;
  static const TcxEditMaskKind cxDefaultHomePageMaskKind = emkRegExprEx;
  static const TcxEditMaskKind cxDefaultEmailMaskKind = emkRegExpr;
  static AnsiString cxDefaultPostalCodeEditMask;
  static AnsiString cxDefaultPhoneEditMask;
  static AnsiString cxDefaultFaxEditMask;
  static AnsiString cxDefaultHomePageEditMask;
  static AnsiString cxDefaultEmailEditMask;
  class TcxCustomMaskEditPropertiesAccessor: public TcxCustomMaskEditProperties

  {
  public:
        bool EmptyMaskAccess(AnsiString AEditMask)
          { return TcxCustomMaskEditProperties::EmptyMask(AEditMask); }
        AnsiString EditMaskAccess()
          { return TcxCustomMaskEditProperties::EditMask; }
        TcxEditMaskKind MaskKindAccess()
          { return TcxCustomMaskEditProperties::MaskKind; }
  };

  void ChangeLabel(TLabel *ALabel, TcxCustomMaskEditProperties *AProperties);
  String GetMaskKindLabel(TcxEditMaskKind AMaskKind);
  void ShowEditMaskDialog(TcxCustomEditProperties *AProperties);
public:		// User declarations
  __fastcall TEditorsMaskDemoMainForm(TComponent* Owner);
};

AnsiString TEditorsMaskDemoMainForm::cxDefaultPostalCodeEditMask =
  "\\d\\d\\d\\d\\d? | \\w\\w\\w' '\\w\\w\\w";
AnsiString TEditorsMaskDemoMainForm::cxDefaultPhoneEditMask =
  "!\\(999\\) 000-0000;1;_";
AnsiString TEditorsMaskDemoMainForm::cxDefaultFaxEditMask =
  "(\\(\\d\\d\\d\\)' ')?\\d\\d\\d-\\d\\d\\d\\d";
AnsiString TEditorsMaskDemoMainForm::cxDefaultHomePageEditMask =
  "http\\:\\/\\/(\\w+(\\.\\w+)*@)?\\w+\\.\\w+(\\.\\w+)*(\\/(\\w+(\\/\\w+)*\\/?)?)?";
AnsiString TEditorsMaskDemoMainForm::cxDefaultEmailEditMask =
  "\\w+@\\w+\\.\\w+(\\.\\w+)*";

//---------------------------------------------------------------------------
extern PACKAGE TEditorsMaskDemoMainForm *EditorsMaskDemoMainForm;
//---------------------------------------------------------------------------
#endif
