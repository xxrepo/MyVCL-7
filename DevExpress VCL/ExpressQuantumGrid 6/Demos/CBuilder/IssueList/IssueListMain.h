//---------------------------------------------------------------------------

#ifndef IssueListMainH
#define IssueListMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include "cxGridDBTableView.hpp"
#include "cxLookAndFeels.hpp"
#include "IssueListGrid.h"


//---------------------------------------------------------------------------
class TIssueListMainForm : public TForm
{
__published:  // IDE-managed Components
        TStatusBar *StatusBar1;
        TControlBar *ControlBar1;
        TToolBar *tbView1;
        TToolButton *ToolButton1;
        TToolButton *ToolButton2;
        TToolButton *ToolButton3;
        TToolButton *ToolButton4;
        TToolBar *tbView;
        TToolButton *ToolButton9;
        TToolButton *ToolButton10;
        TToolButton *ToolButton12;
        TToolButton *ToolButton11;
        TToolButton *ToolButton7;
        TToolBar *tbOperat;
        TToolButton *ToolButton6;
        TToolButton *ToolButton8;
        TToolButton *ToolButton13;
        TActionList *alMain;
        TAction *actColumnsCustomize;
        TAction *actExit;
        TAction *actShowPictures;
        TAction *actGrouping;
        TAction *actIndicator;
        TAction *actSummaryFooter;
        TAction *actHeader;
        TAction *actAutoWidth;
        TAction *actInvertSelected;
        TAction *actFullExpand;
        TAction *actFullCollapse;
        TAction *actBestFit;
        TAction *actShowEditButtons;
        TAction *actAbout;
        TAction *actGridLines;
        TAction *actAutoPreview;
        TAction *actShowDependsOnData;
        TAction *actNewItemRow;
        TAction *actSelectStyleSheet;
        TAction *actEditorsShadow;
        TMainMenu *MainMenu1;
        TMenuItem *miFile;
        TMenuItem *actExit1;
        TMenuItem *miView;
        TMenuItem *miGridPictures;
        TMenuItem *miShowDepentOnData;
        TMenuItem *miEditorsShadow;
        TMenuItem *miSeparator1;
        TMenuItem *miGoProjects;
        TMenuItem *miGoProjectItems;
        TMenuItem *miGoDepartments;
        TMenuItem *miGoTeams;
        TMenuItem *miGoUsers;
        TMenuItem *miGoSchedule;
        TMenuItem *miGridOptions;
        TMenuItem *miGridView;
        TMenuItem *miGrouping;
        TMenuItem *miacIndicator;
        TMenuItem *miHeaders;
        TMenuItem *miSummaryFooter;
        TMenuItem *miShowGrid;
        TMenuItem *mitAutoWidth;
        TMenuItem *miAlwaysDisplayButtons;
        TMenuItem *miInvertSelected;
        TMenuItem *actNewItemRow1;
        TMenuItem *miGridStyle;
        TMenuItem *miStandard;
        TMenuItem *miFlat;
        TMenuItem *miStyleUltraFlat;
        TMenuItem *miSeparator6;
        TMenuItem *miNativeStyle;
        TMenuItem *miSeparator8;
        TMenuItem *actSelectStyleSheet1;
        TMenuItem *miGridActions;
        TMenuItem *miFullExpand;
        TMenuItem *miFullCollapse;
        TMenuItem *miSeparator2;
        TMenuItem *miColumnCustomization;
        TMenuItem *miBestFitallcolumns;
        TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
        void __fastcall actExitExecute(TObject *Sender);
        void __fastcall actGoProjectExecute(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall actShowPicturesExecute(TObject *Sender);
        void __fastcall actGroupingExecute(TObject *Sender);
        void __fastcall miNativeStyleClick(TObject *Sender);
        void __fastcall actIndicatorExecute(TObject *Sender);
        void __fastcall actAboutExecute(TObject *Sender);
        void __fastcall actHeaderExecute(TObject *Sender);
        void __fastcall actSummaryFooterExecute(TObject *Sender);
        void __fastcall actAutoWidthExecute(TObject *Sender);
        void __fastcall actInvertSelectedExecute(TObject *Sender);
        void __fastcall actIndicatorUpdate(TObject *Sender);
        void __fastcall actGroupingUpdate(TObject *Sender);
        void __fastcall actSummaryFooterUpdate(TObject *Sender);
        void __fastcall actHeaderUpdate(TObject *Sender);
        void __fastcall actAutoWidthUpdate(TObject *Sender);
        void __fastcall actInvertSelectedUpdate(TObject *Sender);
        void __fastcall actFullCollapseExecute(TObject *Sender);
        void __fastcall actFullExpandExecute(TObject *Sender);
        void __fastcall actShowEditButtonsExecute(TObject *Sender);
        void __fastcall actGridLinesExecute(TObject *Sender);
        void __fastcall actShowEditButtonsUpdate(TObject *Sender);
        void __fastcall actGridLinesUpdate(TObject *Sender);
        void __fastcall actAutoPreviewUpdate(TObject *Sender);
        void __fastcall actAutoPreviewExecute(TObject *Sender);
        void __fastcall actBestFitExecute(TObject *Sender);
        void __fastcall actColumnsCustomizeExecute(TObject *Sender);
        void __fastcall actShowDependsOnDataExecute(TObject *Sender);
        void __fastcall actNewItemRowExecute(TObject *Sender);
        void __fastcall actNewItemRowUpdate(TObject *Sender);
        void __fastcall actSelectStyleSheetExecute(TObject *Sender);
        void __fastcall actEditorsShadowExecute(TObject *Sender);
  void __fastcall miOffice11Click(TObject *Sender);
private:
        TIssueListGridForm* FGridForm;
        TcxGridDBTableView* GetFocusedView(void);

public:
        __fastcall TIssueListMainForm(TComponent* Owner);
        __property TIssueListGridForm* GridForm = {read = FGridForm};
        __property TcxGridDBTableView* FocusedView = {read = GetFocusedView};


};
//---------------------------------------------------------------------------
extern PACKAGE TIssueListMainForm *IssueListMainForm;
//---------------------------------------------------------------------------
#endif
