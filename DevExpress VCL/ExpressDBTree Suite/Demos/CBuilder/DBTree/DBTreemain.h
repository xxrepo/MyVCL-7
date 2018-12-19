//---------------------------------------------------------------------------
#ifndef DBTreemainH
#define DBTreemainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include "Grids.hpp"
#include <Mask.hpp>
#include <ComCtrls.hpp>
#include <Buttons.hpp>
#include <DBTables.hpp>
#include <DB.hpp>
#include "dxdbtrel.hpp"
#include "dxdbtree.hpp"
#include "dxtree.hpp"
#include <Db.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TDBMemo *DBMemo1;
        TdxDBLookupTreeView *DBLookUpTreeView1;
	TDBEdit *DBEdit1;
	TPanel *Panel2;
        TdxDBTreeView *DBTreeView1;
	TPanel *Panel3;
	TBitBtn *BitBtn1;
	TCheckBox *CheckBox1;
	TCheckBox *CheckBox2;
	TBitBtn *BitBtnAdd;
	TBitBtn *BitBtnAddChild;
	TBitBtn *BitBtnEdit;
	TBitBtn *BitBtnDel;
	TBitBtn *BitBtn2;
	TBitBtn *BitBtn3;
	TCheckBox *CheckBox3;
	TCheckBox *CheckBox4;
	TButton *Button2;
	TTable *T1;
	TIntegerField *T1Pr_id;
	TIntegerField *T1Pr_parent;
	TStringField *T1Pr_name;
	TDateField *T1Pr_bdate;
	TDateField *T1Pr_edate;
	TMemoField *T1Pr_info;
	TDataSource *DS1;
	TDataSource *DS2;
	TTable *T2;
	TImageList *ImageList1;
	TCheckBox *CheckBox5;
	void __fastcall CheckBox1Click(TObject *Sender);
	
	
	void __fastcall BitBtnDelClick(TObject *Sender);
	void __fastcall BitBtnAddClick(TObject *Sender);
	void __fastcall BitBtnAddChildClick(TObject *Sender);
	void __fastcall BitBtnEditClick(TObject *Sender);
	void __fastcall BitBtn2Click(TObject *Sender);
	
	void __fastcall BitBtn3Click(TObject *Sender);
	void __fastcall CheckBox2Click(TObject *Sender);

	void __fastcall DBTreeView1DragDropTreeNode(TTreeNode *Destination,
	TTreeNode *Source, bool &Accept);

	void __fastcall Button2Click(TObject *Sender);
	void __fastcall DBTreeView1CustomDraw(TObject *Sender, TTreeNode *TreeNode,
	TFont *AFont, TColor &AColor, TColor &ABkColor);
	void __fastcall CheckBox5Click(TObject *Sender);
        void __fastcall DBTreeView1AddNewItem(TObject *Sender,
        TdxDBTreeNode *&DBTreeNode);
        void __fastcall DBLookUpTreeView1AddNewItem(TObject *Sender,
        TdxDBTreeNode *&DBTreeNode);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
