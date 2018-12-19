//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxCntner.hpp"
#include "dxDBInRw.hpp"
#include "dxDBInsp.hpp"
#include "dxInspct.hpp"
#include "dxInspRw.hpp"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include "dxPSCore.hpp"
#include "dxPSdxDBInsLnk.hpp"
#include "dxPSdxInsLnk.hpp"
#include "dxCore.hpp"
#include "cxDrawTextUtils.hpp"
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
    TSplitter *Splitter1;
    TPanel *Panel1;
    TPanel *Panel4;
    TDBNavigator *DBNavigator1;
    TPanel *Panel2;
    TDBGrid *DBGrid1;
    TPanel *Panel3;
    TLabel *Label1;
    TImage *Image1;
    TGroupBox *GroupBox1;
    TCheckBox *cbColumnSizing;
    TCheckBox *cbEditing;
    TCheckBox *cbTabs;
    TCheckBox *cbTabThrough;
    TCheckBox *cbAutoWidth;
    TCheckBox *cbCancelOnExit;
    TCheckBox *cbEnterThrough;
    TCheckBox *cbNoCancel;
    TCheckBox *cbDrawEndEllipsis;
    TEdit *edMinColumnWidth;
    TUpDown *UpDown1;
    TRadioGroup *rgPaintStyle;
    TButton *BColor;
    TButton *BFont;
    TButton *BGridColor;
    TCheckBox *cbDragDrop;
    TCheckBox *cbCustomDraw;
    TCheckBox *cbFlat;
    TCheckBox *cbShowRowHint;
    TdxDBInspector *dxDBInspector;
    TdxInspectorDBMaskRow *dxDBInspectorFirstName;
    TdxInspectorDBMaskRow *dxDBInspectorLastName;
    TdxInspectorDBMaskRow *dxDBInspectorCompany;
    TdxInspectorDBMaskRow *dxDBInspectorPrefix;
    TdxInspectorDBMaskRow *dxDBInspectorTitle;
    TdxInspectorDBMaskRow *dxDBInspectorAddress;
    TdxInspectorDBMaskRow *dxDBInspectorCity;
    TdxInspectorDBMaskRow *dxDBInspectorZipCode;
    TdxInspectorDBMaskRow *dxDBInspectorSource;
    TdxInspectorDBDateRow *dxDBInspectorPurchaseDate;
    TdxInspectorDBMaskRow *dxDBInspectorHomePhone;
    TdxInspectorDBMaskRow *dxDBInspectorFaxPhone;
    TdxInspectorDBMaskRow *dxDBInspectorSpouse;
    TdxInspectorDBMaskRow *dxDBInspectorOccupation;
    TdxInspectorBlobRow *dxDBInspectorDescription;
    TdxInspectorLookupRow *dxDBInspectorproduct;
    TdxInspectorDBRow *dxDBInspectorCustName;
    TdxInspectorBlobRow *dxDBInspectorImage;
    TdxInspectorDBButtonRow *dxDBInspectorRow23;
    TdxInspectorDBCheckRow *dxDBInspectorCustomer;
    TdxInspectorDBImageRow *dxDBInspectorPaymentType;
    TdxInspectorDBCalcRow *dxDBInspectorPaymentAmount;
    TdxInspectorDBPickRow *dxDBInspectorState;
    TImageList *ImageList;
    TFontDialog *FontDialog;
    TColorDialog *ColorDialog;
    TDataSource *dsContacts;
    TTable *tProducts;
    TIntegerField *tProductsID;
    TStringField *tProductsNAME;
    TStringField *tProductsDescription;
    TTable *tContacts;
    TAutoIncField *tContactsID;
    TIntegerField *tContactsProductID;
    TStringField *tContactsFirstName;
    TStringField *tContactsLastName;
    TStringField *tContactsCompany;
    TStringField *tContactsPrefix;
    TStringField *tContactsTitle;
    TStringField *tContactsAddress;
    TStringField *tContactsCity;
    TStringField *tContactsState;
    TStringField *tContactsZipCode;
    TStringField *tContactsSource;
    TStringField *tContactsCustomer;
    TDateField *tContactsPurchaseDate;
    TStringField *tContactsHomePhone;
    TStringField *tContactsFaxPhone;
    TStringField *tContactsPaymentType;
    TStringField *tContactsSpouse;
    TStringField *tContactsOccupation;
    TBCDField *tContactsPaymentAmount;
    TMemoField *tContactsDescription;
    TStringField *tContactsproduct;
    TStringField *tContactsCustName;
    TGraphicField *tContactsPicture;
    TCurrencyField *tContactsCurrency;
    TTimeField *tContactsTime;
    TStringField *tContactsHyperLink;
    TdxComponentPrinter *dxComponentPrinter1;
    TSpeedButton *BDesign;
    TSpeedButton *BPreview;
    TSpeedButton *BPrint;
    TdxDBInspectorReportLink *dxComponentPrinter1Link1;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall dxDBInspectorRow23EditButtonClick(TObject *Sender);
    void __fastcall cbColumnSizingClick(TObject *Sender);
    void __fastcall edMinColumnWidthKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall rgPaintStyleClick(TObject *Sender);
    void __fastcall UpDown1Changing(TObject *Sender, bool &AllowChange);
    void __fastcall BColorClick(TObject *Sender);
    void __fastcall BFontClick(TObject *Sender);
    void __fastcall BGridColorClick(TObject *Sender);
    void __fastcall dxDBInspectorDragOver(TObject *Sender, TObject *Source,
          int X, int Y, TDragState State, bool &Accept);
    void __fastcall dxDBInspectorDragDrop(TObject *Sender, TObject *Source,
          int X, int Y);
    void __fastcall cbDragDropClick(TObject *Sender);
    void __fastcall Image1DragOver(TObject *Sender, TObject *Source, int X,
          int Y, TDragState State, bool &Accept);
    void __fastcall Image1DragDrop(TObject *Sender, TObject *Source, int X,
          int Y);
    void __fastcall dxDBInspectorDrawCaption(TdxInspectorRow *Sender,
          TCanvas *ACanvas, TRect &ARect, AnsiString &AText, TFont *AFont,
          TColor &AColor, bool &ADone);
    void __fastcall cbCustomDrawClick(TObject *Sender);
    void __fastcall DBGrid1ColEnter(TObject *Sender);
    void __fastcall cbFlatClick(TObject *Sender);
    void __fastcall cbShowRowHintClick(TObject *Sender);
    void __fastcall tContactsCalcFields(TDataSet *DataSet);
    void __fastcall BDesignClick(TObject *Sender);
    void __fastcall BPreviewClick(TObject *Sender);
    void __fastcall BPrintClick(TObject *Sender);

    void __fastcall dxComponentPrinter1Link1CustomDrawCaption(
          TBasedxReportLink *Sender, TdxInspectorRow *ARow,
          TCanvas *ACanvas, TRect &ABoundsRect, TRect &AClientRect,
          AnsiString &AText, TColor &AColor, TFont *AFont,
          TcxTextAlignX &ATextAlignX, TcxTextAlignY &ATextAlignY,
          bool &ADone);
private:	// User declarations
    bool FlagLoading;
    void __fastcall CustomDraw(TdxInspectorRow *Sender, TColor &AColor,
          TFont *AFont);

public:		// User declarations
    __fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
 