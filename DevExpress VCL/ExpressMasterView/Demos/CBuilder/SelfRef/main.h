//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxMasterView.hpp"
#include <Db.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
    TDataSource *DataSource1;
    TTable *Table1;
    TdxMasterView *MasterView;
    TdxMasterViewStyle *MasterViewStyle1;
    TdxMasterViewStyle *MasterViewStyle2;
    TdxMasterViewStyle *MasterViewStyle3;
    TdxMasterViewStyle *MasterViewStyle4;
    TdxMasterViewStyle *MasterViewStyle5;
    TdxMasterViewLevel *lvlProducts;
    TdxMasterViewColumn *lvlProductsPr_name;
    TdxMasterViewColumn *lvlProductsPr_info;
    TdxMasterViewLevel *lvlControls;
    TdxMasterViewColumn *lvlControlsPr_name;
    TdxMasterViewColumn *lvlControlsPr_info;
    TdxMasterViewLevel *lvlComponents;
    TdxMasterViewColumn *lvlComponentsPr_name;
    TdxMasterViewColumn *lvlComponentsPr_info;
    TPanel *plBottom;
    TButton *btnFullCollapse;
    TButton *btnFullExpand;
    TButton *Customize;
    void __fastcall lvlProductsFilterRecord(TdxMasterViewLevel *Sender,
          const Variant &AID, const Variant &AKeyValue, bool &Accept);
    void __fastcall btnFullCollapseClick(TObject *Sender);
    void __fastcall btnFullExpandClick(TObject *Sender);
    void __fastcall CustomizeClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
