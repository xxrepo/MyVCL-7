//---------------------------------------------------------------------------

#ifndef ColumnsMultiEditorsDemoMainH
#define ColumnsMultiEditorsDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxEdit.hpp"
#include "cxEditRepositoryItems.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "ColumnsMultiEditorsDemoDS.h"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TColumnsMultiEditorsDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TStatusBar *sbMain;
  TcxGrid *Grid;
  TcxGridTableView *tvSkills;
  TcxGridColumn *clnName;
  TcxGridColumn *clnSkill;
  TcxGridColumn *clnGrade;
  TcxGridLevel *lvSkills;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miEditButtons;
  TMenuItem *Never1;
  TMenuItem *ForFocusedRecord1;
  TMenuItem *Always1;
  TMenuItem *miAbout;
  TcxEditRepository *EditRepository;
  TcxEditRepositoryImageComboBoxItem *ImageComboLanguages;
  TcxEditRepositoryImageComboBoxItem *ImageComboCommunication;
  TcxEditRepositorySpinItem *SpinItemYears;
  TcxEditRepositoryDateItem *DateItemStartWorkFrom;
  TcxStyleRepository *cxStyleRepository1;
  TcxStyle *cxStyle1;
  TcxStyle *cxStyle2;
  TcxStyle *cxStyle3;
  TcxStyle *cxStyle4;
  TcxStyle *cxStyle5;
  TcxStyle *cxStyle6;
  TcxStyle *cxStyle7;
  TcxStyle *cxStyle8;
  TcxStyle *cxStyle9;
  TcxStyle *cxStyle10;
  TcxStyle *cxStyle11;
  TcxStyle *cxStyle12;
  TcxStyle *cxStyle13;
  TcxStyle *cxStyle14;
  TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
        TcxLookAndFeelController *LookAndFeelController;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall clnGradeGetProperties(TcxCustomGridTableItem *Sender,
          TcxCustomGridRecord *ARecord,
          TcxCustomEditProperties *&AProperties);
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall miEditButtonsAlwaysClick(TObject *Sender);
  void __fastcall miEditButtonsFocusedRecordClick(TObject *Sender);
  void __fastcall miEditButtonsNeverClick(TObject *Sender);
private:  // User declarations
  TSkillDataSource* SkillDataSource;
public:   // User declarations
  __fastcall TColumnsMultiEditorsDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColumnsMultiEditorsDemoMainForm *ColumnsMultiEditorsDemoMainForm;
//---------------------------------------------------------------------------
#endif
