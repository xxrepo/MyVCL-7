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
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "cxCalendar.hpp"
#include "cxCheckBox.hpp"
#include "cxContainer.hpp"
#include "cxDBEdit.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxDropDownEdit.hpp"
#include "cxImageComboBox.hpp"
#include "cxLookupEdit.hpp"
#include "cxMaskEdit.hpp"
#include "cxMemo.hpp"
#include "cxTextEdit.hpp"
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include "cxDBLookupEdit.hpp"
#include "cxLookAndFeels.hpp"
#include "cxNavigator.hpp"
#include "cxDBNavigator.hpp"
#include "cxPropertiesStore.hpp"
//---------------------------------------------------------------------------
class TEditorsLookupDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TStatusBar *sbMain;
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
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *LookupOptions1;
  TMenuItem *miEditMode;
  TMenuItem *miPickMode;
  TMenuItem *miStandardMode;
  TMenuItem *N1;
  TMenuItem *miLookFeel;
  TMenuItem *miKind;
  TMenuItem *miFlat;
  TMenuItem *miStandard;
  TMenuItem *miUltraFlat;
  TMenuItem *miNativeStyle;
  TMenuItem *miStorage;
  TMenuItem *miStorageActive;
  TMenuItem *N6;
  TMenuItem *miStoringGridLookFeel;
  TMenuItem *N3;
  TMenuItem *miStorageType;
  TMenuItem *miIniStoreType;
  TMenuItem *miRegistryStoreType;
  TMenuItem *miMemoryStoreType;
  TMenuItem *N5;
  TMenuItem *miStore;
  TMenuItem *miRestore;
  TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
  TcxPropertiesStore *cxPropertiesStore;
  TcxPropertiesStore *cxStorageActiveStore;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
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
  void __fastcall miNativeStyleClick(TObject *Sender);
  void __fastcall miLookAndFeelKindClick(TObject *Sender);
  void __fastcall miLookFeelClick(TObject *Sender);
  void __fastcall miKindClick(TObject *Sender);
private:  // User declarations
  TMemoryStream *FStream;
  int IndexOfPropertiesStoreComponent(TComponent *AComponent);
  void SetPickLookupMode();
  void SetStandardLookupMode();
  void SetEditLookupMode();
public:   // User declarations
  __fastcall TEditorsLookupDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsLookupDemoMainForm *EditorsLookupDemoMainForm;
//---------------------------------------------------------------------------
#endif
