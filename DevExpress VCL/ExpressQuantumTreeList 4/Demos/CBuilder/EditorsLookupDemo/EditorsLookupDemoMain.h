//---------------------------------------------------------------------------

#ifndef EditorsLookupDemoMainH
#define EditorsLookupDemoMainH
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
#include "cxCalendar.hpp"
#include "cxCheckBox.hpp"
#include "cxContainer.hpp"
#include "cxDBEdit.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxDBLookupEdit.hpp"
#include "cxDBNavigator.hpp"
#include "cxDropDownEdit.hpp"
#include "cxImageComboBox.hpp"
#include "cxLookupEdit.hpp"
#include "cxMaskEdit.hpp"
#include "cxMemo.hpp"
#include "cxNavigator.hpp"
#include "cxPropertiesStore.hpp"
#include "cxTextEdit.hpp"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TEditorsLookupDemoMainForm : public TDemoBasicMainForm
{
__published:	// IDE-managed Components
  TMenuItem *miFlat;
  TMenuItem *miUltraFlat;
  TMenuItem *miStandard;
  TMenuItem *miNativeStyle;
  TMenuItem *LookupOptions1;
  TMenuItem *miEditMode;
  TMenuItem *miPickMode;
  TMenuItem *miStandardMode;
  TMenuItem *N1;
  TMenuItem *miStorage;
  TMenuItem *miStorageActive;
  TMenuItem *miStoringGridLookFeel;
  TMenuItem *miStorageType;
  TMenuItem *miIniStoreType;
  TMenuItem *miRegistryStoreType;
  TMenuItem *miMemoryStoreType;
  TMenuItem *miStore;
  TMenuItem *miRestore;
  TPanel *pnlEditors;
  TGroupBox *gbIssue;
  TLabel *Label1;
  TLabel *Label2;
  TLabel *Label9;
  TcxDBTextEdit *edName;
  TcxDBMemo *meDescription;
  TcxDBLookupComboBox *lcbCreator;
  TGroupBox *gbInfo;
  TLabel *Label3;
  TLabel *Label4;
  TcxDBImageComboBox *cbPriority;
  TcxDBDateEdit *deCreateDate;
  TcxDBCheckBox *chbRequest;
  TGroupBox *gbStatus;
  TLabel *Label5;
  TLabel *Label6;
  TLabel *Label7;
  TcxDBImageComboBox *cbStatus;
  TcxDBDateEdit *deLastModifiedDate;
  TcxDBDateEdit *deFixedDate;
  TcxDBNavigator *DBNavigator;
  TGroupBox *gbProject;
  TLabel *Label8;
  TLabel *Label10;
  TcxDBLookupComboBox *lcbProject;
  TcxDBLookupComboBox *lcbOwner;
  TcxPropertiesStore *cxPropertiesStore;
  TcxPropertiesStore *cxStorageActiveStore;
  TMenuItem *miOffice11;
  void __fastcall FormShow(TObject *Sender);
  void __fastcall LookAndFeelChange(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall ChangeLookupModeClick(TObject *Sender);
  void __fastcall lcbCreatorNewLookupDisplayText(TObject *Sender,
      const TCaption AText);
  void __fastcall StorageTypeClick(TObject *Sender);
  void __fastcall miStoreClick(TObject *Sender);
  void __fastcall miRestoreClick(TObject *Sender);
  void __fastcall miStoringGridLookFeelClick(TObject *Sender);
  void __fastcall miStorageActiveClick(TObject *Sender);
private:	// User declarations
  TMemoryStream *FStream;
  int IndexOfPropertiesStoreComponent(TComponent *AComponent);
  void AddMenuItemStoreComponent(TComponent *AItem);
  void SetPickLookupMode();
  void SetStandardLookupMode();
  void SetEditLookupMode();
public:		// User declarations
  __fastcall TEditorsLookupDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsLookupDemoMainForm *EditorsLookupDemoMainForm;
//---------------------------------------------------------------------------
#endif
