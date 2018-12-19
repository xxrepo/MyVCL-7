//---------------------------------------------------------------------------
#ifndef ESBarDemoMainH
#define ESBarDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxsbar.hpp"
#include <ExtCtrls.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>
#include "dxBar.hpp"
#include <ActnList.hpp>
#include <ImgList.hpp>
#include "EBarsUtils.h"
#include "cxClasses.hpp"
//---------------------------------------------------------------------------
class TESBarDemoMainForm : public TForm
{
__published:	// IDE-managed Components
  TLabel *Label1;
  TLabel *Label2;
  TLabel *Label3;
  TdxSideBar *SideBar;
  TEdit *Edit1;
  TCheckBox *CheckBox1;
  TButton *Button1;
  TButton *Button2;
  TButton *Button3;
  TCheckBox *CheckBox3;
  TEdit *Edit2;
  TTreeView *TreeView;
  TRadioGroup *rgSBPaintingStyles;
  TdxSideBarPopupMenu *dxSideBarPopupMenu1;
  TdxSideBarStore *SideBarStore;
  TdxStoredSideItem *SideBarStoreItem2;
  TdxStoredSideItem *SideBarStoreItem1;
  TdxStoredSideItem *SideBarStoreItem3;
  TdxStoredSideItem *SideBarStoreItem4;
  TdxStoredSideItem *SideBarStoreItem5;
  TdxStoredSideItem *SideBarStoreItem6;
  TdxStoredSideItem *SideBarStoreItem7;
  TdxStoredSideItem *SideBarStoreItem8;
  TdxStoredSideItem *SideBarStoreItem9;
  TdxStoredSideItem *SideBarStoreItem10;
  TImageList *imgSmall;
  TImageList *imgLarge;
  TImageList *ilHelpImages;
  TdxBarManager *dxBarManager1;
  TdxBarButton *dxBarButton1;
  TdxBarButton *dxBarButton2;
  TdxBarButton *dxBarButton3;
  TdxBarButton *dxBarButton4;
  TdxBarButton *dxBarButton5;
  TdxBarButton *dxBarButton6;
  TdxBarButton *dxBarButton7;
  TdxBarSubItem *BarSubItemHelp;
  TdxBarSubItem *BarSubItemFile;
  TdxBarButton *dxBarButton8;
  TdxBarButton *dxBarButton9;
  TdxBarButton *dxBarButton10;
  TdxBarButton *dxBarButton11;
	void __fastcall SideBarItemClick(TObject *Sender, TdxSideBarItem *Item);
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall SideBarChangeActiveGroup(TObject *Sender);
	void __fastcall SideBarChangeGroupCaption(TObject *Sender, TdxSideGroup *Group);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall CheckBox3Click(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall TreeViewStartDrag(TObject *Sender, TDragObject *&DragObject);
  void __fastcall rgSBPaintingStylesClick(TObject *Sender);
  void __fastcall actExitExecute(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TESBarDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TESBarDemoMainForm *ESBarDemoMainForm;
//---------------------------------------------------------------------------
#endif
 