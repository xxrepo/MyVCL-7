//---------------------------------------------------------------------------

#ifndef CustomDrawCardViewDemoMainH
#define CustomDrawCardViewDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "cxGridCardView.hpp"
#include "cxGridDBCardView.hpp"
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include "CustomDrawCardViewDemoTypes.h"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TCustomDrawCardViewDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TSplitter *Splitter;
  TStatusBar *sbMain;
  TPanel *pnPersonLines;
  TPanel *pnPersonLinesCaption;
  TcxGrid *cxgPersonLine;
  TcxGridDBTableView *tvPersonLine;
  TcxGridDBColumn *tvPersonLineNAME;
  TcxGridLevel *lvPersonLine;
  TPanel *pnPersons;
  TcxGrid *cxgPersons;
  TcxGridDBCardView *cvPersons;
  TcxGridDBCardViewRow *cvPersonsFIRSTNAME;
  TcxGridDBCardViewRow *cvPersonsSECONDNAME;
  TcxGridDBCardViewRow *cvPersonsGENDER;
  TcxGridDBCardViewRow *cvPersonsBIRTHNAME;
  TcxGridDBCardViewRow *cvPersonsDATEOFBIRTH;
  TcxGridDBCardViewRow *cvPersonsLOCATIONOFBIRTH;
  TcxGridDBCardViewRow *cvPersonsBIRTHCOUNTRY;
  TcxGridDBCardViewRow *cvPersonsBIOGRAPHY;
  TcxGridDBCardViewRow *cvPersonsNICKNAME;
  TcxGridLevel *lvPersons;
  TPanel *pnPersonsCaption;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miFont;
  TMenuItem *miCustomDrawStyles;
  TMenuItem *miBackgroudImage;
  TMenuItem *miTile;
  TMenuItem *miSky;
  TMenuItem *miEgypt;
  TMenuItem *miMyFace;
  TMenuItem *miCar;
  TMenuItem *miLoadImage;
  TMenuItem *miGradient;
  TMenuItem *miGrey;
  TMenuItem *miGreen;
  TMenuItem *miGold;
  TMenuItem *miBlue;
  TMenuItem *miDependOnDataDrawing;
  TMenuItem *miDefaultDrawing;
  TMenuItem *miSeparator1;
  TMenuItem *miLookAndFeel;
  TMenuItem *miKind;
  TMenuItem *miFlat;
  TMenuItem *miStandard;
  TMenuItem *miUltraFlat;
  TMenuItem *miNativeStyle;
  TMenuItem *miAbout;
  TImageList *ilPics;
  TOpenDialog *OpenDialog;
  TFontDialog *FontDialog;
        TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall cvPersonsCustomDrawCell(TcxCustomGridTableView *Sender,
          TcxCanvas *ACanvas, TcxGridTableDataCellViewInfo *AViewInfo,
          bool &ADone);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall miFontClick(TObject *Sender);
  void __fastcall miTileClick(TObject *Sender);
  void __fastcall miSkyClick(TObject *Sender);
  void __fastcall miEgyptClick(TObject *Sender);
  void __fastcall miMyFaceClick(TObject *Sender);
  void __fastcall miCarClick(TObject *Sender);
  void __fastcall miLoadImageClick(TObject *Sender);
  void __fastcall miDependOnDataDrawingClick(TObject *Sender);
  void __fastcall miDefaultDrawingClick(TObject *Sender);
  void __fastcall miGreyClick(TObject *Sender);
  void __fastcall miGreenClick(TObject *Sender);
  void __fastcall miGoldClick(TObject *Sender);
  void __fastcall miBlueClick(TObject *Sender);
  void __fastcall miNativeStyleClick(TObject *Sender);
        void __fastcall miLookAndFeelKindClick(TObject *Sender);
private:  // User declarations
  TCustomDrawingStyle FCustomDrawingStyle;
  CustomDrawCardViewDemoTypesH::TColorScheme FColorScheme;
  TFont* FFont;
  TBrush* FGridBrush;
  Graphics::TBitmap* FCarBitmap;
  Graphics::TBitmap* FSkyBitmap;
  Graphics::TBitmap* FUserDefinedImage;
  Graphics::TBitmap* FCurrentBitmap;
  Graphics::TBitmap* FEgyptBitmap;
  Graphics::TBitmap* FMyFaceBitmap;
  Graphics::TBitmap* FTileBitmap; 
  String __fastcall TextToDraw(TcxGridTableDataCellViewInfo *AViewInfo);
  void __fastcall AssignBrush(TBrush* ABrush, Graphics::TBitmap* ABitMap);
  void __fastcall GridsStyles();
  void __fastcall AssignCustomDrawProc();
  void __fastcall UncheckMenuItem(TMenuItem* AMenuItem);
  void __fastcall SetBkImage(TMenuItem* AMenuItem, Graphics::TBitmap* ABitMap);
  void __fastcall SetGradientColor(TMenuItem* AMenuItem, CustomDrawCardViewDemoTypesH::TColorScheme AColorScheme,
    int ABackGroudStyleIndex);
public:   // User declarations
  __fastcall TCustomDrawCardViewDemoMainForm(TComponent* Owner);
private:
  bool __fastcall IsLookAndFeelMenuItem(TMenuItem* AMenuItem);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomDrawCardViewDemoMainForm *CustomDrawCardViewDemoMainForm;
//---------------------------------------------------------------------------
#endif
