//---------------------------------------------------------------------------
#ifndef TreeEditmainH
#define TreeEditmainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <DBCtrls.hpp>
#include <Buttons.hpp>
#include <DBGrids.hpp>
#include "Grids.hpp"
#include <DBTables.hpp>
#include <DB.hpp>
#include "dxdbtrel.hpp"
#include <Db.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TLabel *Label1;
        TdxDBTreeViewEdit *DBTreeViewEdit1;
	TDBNavigator *DBNavigator1;
	TBitBtn *BitBtn1;
	TPanel *Panel2;
	TDBGrid *DBGrid1;
	TTable *Table1;
	TDataSource *DataSource1;
	void __fastcall DBTreeViewEdit1CloseUp(TObject *Sender, bool Accept);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
