//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxMasterView.hpp"
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <Dialogs.hpp>
#include <ExtDlgs.hpp>
#include <ImgList.hpp>
#include "dxMasterViewColumns.hpp"
#include "CSPIN.h"
#include "cspin.h"
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
        TPanel *pnlButtom;
        TPanel *Panel1;
        TLabel *Label1;
        TLabel *Label2;
        TComboBox *cmbLevels;
        TComboBox *cmbColumns;
        TPageControl *PageControl;
        TTabSheet *tsMasterView;
        TBevel *Bevel1;
        TLabel *Label25;
        TBevel *Bevel2;
        TLabel *Label26;
        TButton *btncustomize;
        TCheckBox *chbMultiSelect;
        TCheckBox *chbUseIndent;
        TCheckBox *chbDrawEndEllipsis;
        TCheckBox *chbHideFocusRect;
        TCheckBox *chbHideSelection;
        TCheckBox *chbKeepColumnWidths;
        TCheckBox *chbTransparentDragAndDrop;
        TCheckBox *chbAutoColumnWidth;
        TCheckBox *chbUseBitmap;
        TCheckBox *chbUseBitmapToDrawPreview;
        TCheckBox *chbAnimation;
        TButton *btnFullCollapse;
        TButton *btnFullExpand;
        TTabSheet *tsLevel1;
        TBevel *Bevel3;
        TLabel *Label27;
        TBevel *Bevel4;
        TLabel *Label28;
        TBevel *Bevel5;
        TLabel *Label29;
        TBevel *Bevel6;
        TLabel *Label30;
        TCheckBox *chbColumnMoving;
        TCheckBox *chbColumnHiding;
        TCheckBox *chbColumnHorSizing;
        TCheckBox *chbColumnVerSizing;
        TCheckBox *chbColumnSorting;
        TCheckBox *chbColumnGrouping;
        TCheckBox *chbHideColumnOnGrouping;
        TCheckBox *chbShowColumnOnUngrouping;
        TCheckBox *chbDblClkExpanding;
        TCheckBox *chbSmartLoad;
        TCheckBox *chbSmartRefresh;
        TCheckBox *chbSmartReload;
        TCheckBox *chbCaption;
        TCheckBox *chbFooter;
        TCheckBox *chbGrid;
        TCheckBox *chbGridWithPreview;
        TCheckBox *chbGroupByBox;
        TCheckBox *chbHeader;
        TCheckBox *chbOccupyRestSpace;
        TCheckBox *chbPreview;
        TTabSheet *tsStandartColumn;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label8;
        TLabel *Label9;
        TLabel *Label10;
        TLabel *Label11;
        TLabel *Label12;
        TLabel *Label13;
        TLabel *Label14;
        TComboBox *cmbAlignment;
        TEdit *edCaption;
        TComboBox *cmbFieldName;
        TComboBox *cmbHeaderAlignment;
        TButton *btnGlyph;
        TComboBox *cmbGlyphAlignment;
        TGroupBox *GroupBox1;
        TCheckBox *chbGrouping;
        TCheckBox *chbHidden;
        TCheckBox *chbHorSizing;
        TCheckBox *chbMoving;
        TCheckBox *chbSorting;
        TCheckBox *chbVerSizing;
        TCheckBox *chbMultiLine;
        TCheckBox *chbVisible;
        TTabSheet *tsGraphicColumn;
        TLabel *Label32;
        TCheckBox *chbBlendedSelection;
        TCheckBox *chbCustomGraphic;
        TCheckBox *chbStretch;
        TComboBox *cmbTransparency;
        TTabSheet *tsImageColumn;
        TCheckBox *chbShowDescription;
        TTabSheet *tsCheckColumn;
        TLabel *Label15;
        TLabel *Label16;
        TLabel *Label17;
        TLabel *Label18;
        TLabel *Label19;
        TLabel *Label20;
        TCheckBox *chbBorder3D;
        TEdit *edDisplayChecked;
        TEdit *edDisplayNull;
        TEdit *edDisplayUnchecked;
        TComboBox *cmbShowNullFieldStyle;
        TEdit *edValueChecked;
        TEdit *edValueUnchecked;
        TTabSheet *tsSummary;
        TLabel *Label21;
        TLabel *Label22;
        TLabel *Label23;
        TLabel *Label24;
        TLabel *Label31;
        TComboBox *cmbSummaryFieldName;
        TComboBox *cmbSummaryType;
        TComboBox *cmbFooterAlignment;
        TEdit *edSummaryFormat;
        TTable *tbEvents;
        TAutoIncField *tbEventsEventNo;
        TIntegerField *tbEventsVenueNo;
        TStringField *tbEventsEvent_Name;
        TDateField *tbEventsEvent_Date;
        TTimeField *tbEventsEvent_Time;
        TMemoField *tbEventsEvent_Description;
        TCurrencyField *tbEventsTicket_price;
        TGraphicField *tbEventsEvent_Photo;
        TSmallintField *tbEventsPriority;
        TStringField *tbEventsLow_Price;
        TDataSource *dsEvents;
        TImageList *ImageList;
        TTable *tbVenues;
        TDataSource *dsVenues;
        TOpenPictureDialog *odpOpenGlyph;
        TdxMasterView *MasterView;
        TdxMasterViewStyle *HeaderStyle;
        TdxMasterViewLevel *MasterViewLevel1;
        TdxMasterViewColumn *Level1EventNo;
        TdxMasterViewColumn *Level1VenueNo;
        TdxMasterViewColumn *Level1Event_Name;
        TdxMasterViewColumn *Level1Event_Date;
        TdxMasterViewColumn *Level1Event_Time;
        TdxMasterViewColumn *Level1Event_Description;
        TdxMasterViewColumn *Level1Ticket_price;
        TdxMasterViewGraphicColumn *Level1Event_Photo;
        TdxMasterViewImageColumn *Level1Priority;
        TdxMasterViewCheckColumn *Level1Low_Price;
        TdxMasterViewLevel *MasterViewLevel2;
        TdxMasterViewColumn *Level2VenueNo;
        TdxMasterViewColumn *Level2Venue;
        TdxMasterViewColumn *Level2Capacity;
        TdxMasterViewGraphicColumn *Level2Venue_Map;
        TdxMasterViewColumn *Level2Remarks;
        TCSpinEdit *sedColIndex;
        TCSpinEdit *sedMaxRowCount;
        TCSpinEdit *sedMinRowCount;
        TCSpinEdit *sedMaxWidth;
        TCSpinEdit *sedMinWidth;
        TCSpinEdit *sedRowCount;
        TCSpinEdit *sedRowIndex;
        void __fastcall btncustomizeClick(TObject *Sender);
        void __fastcall tbEventsCalcFields(TDataSet *DataSet);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall btnFullCollapseClick(TObject *Sender);
        void __fastcall btnFullExpandClick(TObject *Sender);
        void __fastcall chbDblClkExpandingClick(TObject *Sender);
    void __fastcall chbMultiSelectClick(TObject *Sender);
    void __fastcall cmbLevelsChange(TObject *Sender);
    void __fastcall cmbColumnsChange(TObject *Sender);
    void __fastcall btnGlyphClick(TObject *Sender);
    void __fastcall chbGroupingClick(TObject *Sender);
    void __fastcall cmbAlignmentChange(TObject *Sender);
    void __fastcall edCaptionChange(TObject *Sender);
    void __fastcall sedColIndexChange(TObject *Sender);
    void __fastcall cmbFieldNameChange(TObject *Sender);
    void __fastcall cmbHeaderAlignmentChange(TObject *Sender);
    void __fastcall cmbGlyphAlignmentChange(TObject *Sender);
    void __fastcall chbMultiLineClick(TObject *Sender);
    void __fastcall sedMaxRowCountChange(TObject *Sender);
    void __fastcall sedMinRowCountChange(TObject *Sender);
    void __fastcall sedMaxWidthChange(TObject *Sender);
    void __fastcall sedMinWidthChange(TObject *Sender);
    void __fastcall sedRowCountChange(TObject *Sender);
    void __fastcall sedRowIndexChange(TObject *Sender);
    void __fastcall chbVisibleClick(TObject *Sender);
    void __fastcall chbBlendedSelectionClick(TObject *Sender);
    void __fastcall chbShowDescriptionClick(TObject *Sender);
    void __fastcall chbBorder3DClick(TObject *Sender);
    void __fastcall edDisplayCheckedChange(TObject *Sender);
    void __fastcall edDisplayNullChange(TObject *Sender);
    void __fastcall edDisplayUncheckedChange(TObject *Sender);
    void __fastcall cmbShowNullFieldStyleChange(TObject *Sender);
    void __fastcall edValueCheckedChange(TObject *Sender);
    void __fastcall edValueUncheckedChange(TObject *Sender);
    void __fastcall cmbSummaryFieldNameChange(TObject *Sender);
    void __fastcall edSummaryFormatChange(TObject *Sender);
    void __fastcall cmbSummaryTypeChange(TObject *Sender);
    void __fastcall cmbFooterAlignmentChange(TObject *Sender);
    void __fastcall cmbTransparencyChange(TObject *Sender);
private:
    void __fastcall TfmMain::UpdateLevelOptions();
    void __fastcall TfmMain::UpdateColumnOptions();
    void __fastcall TfmMain::FillColumnsCombos(TdxMasterViewLevel *Level);
public:		// User declarations
        __fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
