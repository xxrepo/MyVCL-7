//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "dxLayoutControl.hpp"
#include "dxLayoutLookAndFeels.hpp"
#include <Buttons.hpp>
#include <Db.hpp>
#include <DBCtrls.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Mask.hpp>
#include <DB.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TdxLayoutControl *lcMain;
        TSpeedButton *SpeedButton1;
        TSpeedButton *SpeedButton2;
        TSpeedButton *SpeedButton3;
        TSpeedButton *SpeedButton4;
        TBevel *Bevel1;
        TDBEdit *DBEdit1;
        TDBEdit *DBEdit4;
        TDBEdit *DBEdit2;
        TDBMemo *DBMemo1;
        TDBEdit *DBEdit5;
        TDBImage *DBImage1;
        TDBLookupComboBox *dxDBLookupEdit1;
        TDBEdit *DBEdit3;
        TDBImage *DBImage2;
        TDBMemo *DBMemo2;
        TDBNavigator *DBNavigator1;
        TdxLayoutGroup *lcMain_Root;
        TdxLayoutGroup *dxLayoutGroup1;
        TdxLayoutItem *dxLayoutItem1;
        TdxLayoutItem *lcMainItem8;
        TdxLayoutItem *lcMainItem13;
        TdxLayoutItem *lcMainItem14;
        TdxLayoutItem *lcMainItem15;
        TdxLayoutGroup *lcMainGroup7;
        TdxLayoutGroup *dxLayoutGroup2;
        TdxLayoutItem *lcMainItem7;
        TdxLayoutGroup *lcMainGroup4;
        TdxLayoutItem *lcMainItem2;
        TdxLayoutGroup *lcMainGroup2;
        TdxLayoutGroup *lcMainGroup8;
        TdxLayoutItem *lcMainItem3;
        TdxLayoutItem *lcMainItem4;
        TdxLayoutItem *lcMainItem6;
        TdxLayoutItem *lcMainItem5;
        TdxLayoutGroup *lcMainGroup5;
        TdxLayoutGroup *lcMainGroup6;
        TdxLayoutItem *lcMainItem9;
        TdxLayoutItem *lcMainItem10;
        TdxLayoutItem *lcMainItem12;
        TdxLayoutItem *lcMainItem11;
        TdxLayoutItem *dxLayoutItem2;
        TDataSource *DataSource1;
        TTable *Table1;
        TDataSource *DataSource2;
        TTable *Table2;
        TDataSource *DataSource3;
        TTable *Table3;
        TdxLayoutLookAndFeelList *dxLayoutLookAndFeelList1;
        TdxLayoutStandardLookAndFeel *lfStandard;
        TdxLayoutOfficeLookAndFeel *lfOffice;
        TdxLayoutWebLookAndFeel *lfWeb;
        void __fastcall SpeedButton4Click(TObject *Sender);
        void __fastcall lcMainCustomization(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
private:	// User declarations
        TdxCustomLayoutLookAndFeel* __fastcall TForm1::GetLookAndFeel(int AIndex);
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
