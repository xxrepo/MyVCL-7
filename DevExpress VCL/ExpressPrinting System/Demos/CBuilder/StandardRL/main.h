//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Graphics.hpp>
#include <Forms.hpp>
#include <checklst.hpp>
#include <ComCtrls.hpp>
#include <Grids.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include "dxPSChLbxLnk.hpp"
#include "dxPSCore.hpp"
#include "dxPSGrLnks.hpp"
#include "dxPSLbxLnk.hpp"
#include "dxPSStdGrLnk.hpp"
#include <ExtCtrls.hpp>
#include "dxPSRELnk.hpp"
#include "dxPSTVLnk.hpp"
#include "dxBkgnd.hpp"
#include "dxPrnDev.hpp"
#include "dxPrnPg.hpp"
#include "dxPSBaseGridLnk.hpp"
#include "dxPSCompsProvider.hpp"
#include "dxPSEdgePatterns.hpp"
#include "dxPSEngn.hpp"
#include "dxPSFillPatterns.hpp"
#include "dxPSGlbl.hpp"
#include "dxPSUtl.hpp"
#include "dxWrap.hpp"
#include <CheckLst.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------

#undef HDC

class TMainForm : public TForm
{
__published:  // IDE-managed Components
    TImageList *ilFlags;
    TImageList *ilFontImages;
    TMainMenu *MainMenu;
    TMenuItem *miFile;
    TMenuItem *miPageSetup;
    TMenuItem *miPrintPreview;
    TMenuItem *miPrint;
    TMenuItem *N1;
    TMenuItem *miExit;
    TMenuItem *miDesigner;
    TMenuItem *miHelp;
    TMenuItem *miDX;
    TImageList *ilButtons;
    TPageControl *PageControl;
    TTabSheet *tsStringGrid;
    TStringGrid *StringGrid;
    TTabSheet *tsDrawGrid;
    TDrawGrid *DrawGrid;
    TTabSheet *tsListBox;
    TListBox *FontsList;
    TTabSheet *tsCkeckListBox;
    TCheckListBox *CountryCodeList;
    TTabSheet *tsTreeView;
    TPanel *Panel1;
    TLabel *Label1;
    TComboBox *cbDrives;
    TButton *Button1;
    TButton *Button2;
    TPanel *Panel2;
    TTreeView *TreeView;
    TTabSheet *tsRichEdit;
    TRichEdit *Editor;
    TToolBar *ToolBar1;
    TToolButton *tbSetup;
    TToolButton *tbPreview;
    TToolButton *tbPrint;
    TToolButton *tbDevider;
    TToolButton *tbDesigner;
    TToolButton *tbSeparator;
    TToolButton *tbDX;
    TToolButton *tbExit;
    TdxComponentPrinter *dxComponentPrinter1;
    TdxStringGridReportLink *dxComponentPrinter1Link1;
    TdxDrawGridReportLink *dxComponentPrinter1Link2;
    TdxListBoxReportLink *dxComponentPrinter1Link3;
    TdxCheckListBoxReportLink *dxComponentPrinter1Link4;
    TdxTreeViewReportLink *dxComponentPrinter1Link5;
    TdxRichEditReportLink *dxComponentPrinter1Link6;
    void __fastcall DrawGridDrawCell(TObject *Sender, int Col, int Row,
          TRect &Rect, TGridDrawState State);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall tbDXClick(TObject *Sender);
    void __fastcall tbSetupClick(TObject *Sender);
    void __fastcall tbPreviewClick(TObject *Sender);
    void __fastcall tbPrintClick(TObject *Sender);
    void __fastcall tbDesignerClick(TObject *Sender);
    void __fastcall tbExitClick(TObject *Sender);
    void __fastcall PageControlChange(TObject *Sender);
    void __fastcall FontsListDrawItem(TWinControl *Control, int Index,
          TRect &Rect, TOwnerDrawState State);

    void __fastcall dxComponentPrinter1Link2CustomDrawCell(
          TBasedxReportLink *Sender, int ACol, int ARow, TCanvas *ACanvas,
          TRect &ABoundsRect, TRect &AClientRect);
    void __fastcall Button1Click(TObject *Sender);
    void __fastcall Button2Click(TObject *Sender);
    void __fastcall TreeViewExpanded(TObject *Sender, TTreeNode *Node);
    void __fastcall TreeViewCollapsed(TObject *Sender, TTreeNode *Node);
    void __fastcall cbDrivesChange(TObject *Sender);
    void __fastcall TreeViewExpanding(TObject *Sender, TTreeNode *Node,
          bool &AllowExpansion);
private:  // User declarations
    void __fastcall DrawFlag(int Row, int Col, TRect &Rect, TCanvas *ACanvas);
    void __fastcall BuildDriverList();
    String __fastcall GetNodeFullPath(TTreeNode *Node);
    void __fastcall BuildTree(String APath, TTreeNode *AItem);
public:   // User declarations
    Graphics::TBitmap *TtfBitmap,*DevBitmap,*SysBitmap;
    __fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
