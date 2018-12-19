//---------------------------------------------------------------------------

#ifndef FeatureChildH
#define FeatureChildH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxSSheet.hpp"
//---------------------------------------------------------------------------
class TFeatureChildForm : public TForm
{
__published:	// IDE-managed Components
  TcxSpreadSheetBook *cxSpreadSheetBook;
  void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
  void __fastcall FormActivate(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall cxSpreadSheetBookSheetPopupMenu(TObject *Sender, int X,
          int Y);
  void __fastcall cxSpreadSheetBookEditing(TcxSSBookSheet *Sender,
          const int ACol, const int ARow, bool &CanEdit);
  void __fastcall cxSpreadSheetBookEndEdit(TObject *Sender);
        void __fastcall cxSpreadSheetBookContextPopup(TObject *Sender,
          TPoint &MousePos, bool &Handled);
private:	// User declarations
  bool FIsEditorMode;
public:		// User declarations
  __fastcall TFeatureChildForm(TComponent* Owner);
  void __fastcall SetSelection();
  __property bool IsEditorMode = {read = FIsEditorMode};
};
//---------------------------------------------------------------------------
extern PACKAGE TFeatureChildForm *FeatureChildForm;
//---------------------------------------------------------------------------
#endif
