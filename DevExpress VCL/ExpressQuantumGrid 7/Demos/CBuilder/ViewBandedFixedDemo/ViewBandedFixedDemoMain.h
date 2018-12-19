//---------------------------------------------------------------------------

#ifndef ViewBandedFixedDemoMainH
#define ViewBandedFixedDemoMainH
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
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridBandedTableView.hpp"
#include "cxGridCustomPopupMenu.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBBandedTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridPopupMenu.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TViewBandedFixedDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TcxGrid *cxGrid;
  TcxGridDBBandedTableView *btvUsersSchedule;
  TcxGridDBBandedColumn *btvUsersScheduleUserName;
  TcxGridDBBandedColumn *btvUsersScheduleSUNDAY;
  TcxGridDBBandedColumn *btvUsersScheduleMONDAY;
  TcxGridDBBandedColumn *btvUsersScheduleTUESDAY;
  TcxGridDBBandedColumn *btvUsersScheduleWEDNESDAY;
  TcxGridDBBandedColumn *btvUsersScheduleTHURSDAY;
  TcxGridDBBandedColumn *btvUsersScheduleFRIDAY;
  TcxGridDBBandedColumn *btvUsersScheduleSATURDAY;
  TcxGridDBBandedColumn *btvUsersScheduleRowSum;
  TcxGridDBBandedColumn *btvUsersScheduleRowAvg;
  TcxGridDBBandedColumn *btvUsersScheduleProjectName;
  TcxGridLevel *glUserslSchedule;
  TStatusBar *sbMain;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *Exit1;
  TMenuItem *miOptions;
  TMenuItem *miShowBandsHeaders;
  TMenuItem *miShowIndicator;
  TMenuItem *miShowColumnsHeaders;
  TMenuItem *miMultiSelect;
  TMenuItem *miAbout;
  TcxGridPopupMenu *cxGridPopupMenu;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall miShowBandsHeadersClick(TObject *Sender);
  void __fastcall miShowIndicatorClick(TObject *Sender);
  void __fastcall miMultiSelectClick(TObject *Sender);
  void __fastcall miShowColumnsHeadersClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
private:  // User declarations
public:   // User declarations
  __fastcall TViewBandedFixedDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TViewBandedFixedDemoMainForm *ViewBandedFixedDemoMainForm;
//---------------------------------------------------------------------------
#endif
