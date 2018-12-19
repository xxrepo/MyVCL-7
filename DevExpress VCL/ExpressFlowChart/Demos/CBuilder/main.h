//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxflchrt.hpp"
#include <Db.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "dxFcEdit.hpp"
#include "ShellAPI.hpp"
#include "cxControls.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class TMaimForm : public TForm
{
__published:	// IDE-managed Components
        TSplitter *Splitter;
        TdxFlowChart *dxFlowChart;
        TDBGrid *DBGrid;
        TTable *Table;
        TDataSource *DataSource;
        TOpenDialog *OpenDialog;
        TSaveDialog *SaveDialog;
        TMainMenu *MainMenu1;
        TMenuItem *File1;
        TMenuItem *miOpen;
        TMenuItem *miSaveAs;
        TMenuItem *N1;
        TMenuItem *Exit1;
        TMenuItem *Edit1;
        TMenuItem *EditChart1;
        TMenuItem *View1;
        TMenuItem *miZoomIn;
        TMenuItem *miZoomOut;
        TMenuItem *miFit;
        TMenuItem *N2;
        TMenuItem *miActualSize;
        TMenuItem *Help1;
        TMenuItem *DeveloperExpressontheWeb1;
		TMenuItem *N3;
		TMenuItem *miAntialiasing;
        TImageList *ImageList1;
        void __fastcall dxFlowChartDblClick(TObject *Sender);
        void __fastcall TableAfterScroll(TDataSet *DataSet);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Exit1Click(TObject *Sender);
        void __fastcall DeveloperExpressontheWeb1Click(TObject *Sender);
        void __fastcall miSaveAsClick(TObject *Sender);
        void __fastcall DataSourceDataChange(TObject *Sender,
          TField *Field);
		void __fastcall miAntialiasingClick(TObject *Sender);
        void __fastcall miOpenClick(TObject *Sender);
        void __fastcall miFitClick(TObject *Sender);
        void __fastcall miZoomInClick(TObject *Sender);
        void __fastcall miZoomOutClick(TObject *Sender);
        void __fastcall miActualSizeClick(TObject *Sender);
    void __fastcall TableAfterInsert(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
        __fastcall TMaimForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMaimForm *MaimForm;
//---------------------------------------------------------------------------
#endif
