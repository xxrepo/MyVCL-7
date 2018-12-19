//---------------------------------------------------------------------------

#ifndef CardLayoutDemoMainH
#define CardLayoutDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDataStorage.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxEditRepositoryItems.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCardView.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBCardView.hpp"
#include "cxGridLevel.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TcxGrid *Grid;
        TcxGridDBCardView *cvHorizontal;
        TcxGridDBCardViewRow *cvHorizontalTrademark;
        TcxGridDBCardViewRow *cvHorizontalModel;
        TcxGridDBCardViewRow *cvHorizontalPicture;
        TcxGridDBCardViewRow *cvHorizontalRow3;
        TcxGridDBCardViewRow *cvHorizontalHP;
        TcxGridDBCardViewRow *cvHorizontalLiter;
        TcxGridDBCardViewRow *cvHorizontalCyl;
        TcxGridDBCardViewRow *cvHorizontalRow4;
        TcxGridDBCardViewRow *cvHorizontalTransmissSpeedCount;
        TcxGridDBCardViewRow *cvHorizontalTransmissAutomatic;
        TcxGridDBCardViewRow *cvHorizontalRow2;
        TcxGridDBCardViewRow *cvHorizontalMPG_City;
        TcxGridDBCardViewRow *cvHorizontalMPG_Highway;
        TcxGridDBCardViewRow *cvHorizontalCategory;
        TcxGridDBCardViewRow *cvHorizontalRow1;
        TcxGridDBCardViewRow *cvHorizontalDescription;
        TcxGridDBCardViewRow *cvHorizontalHyperlink;
        TcxGridDBCardViewRow *cvHorizontalPrice;
        TcxGridDBCardView *cvVertical;
        TcxGridDBCardViewRow *cvVerticalTrademark;
        TcxGridDBCardViewRow *cvVerticalModel;
        TcxGridDBCardViewRow *cvVerticalPicture;
        TcxGridDBCardViewRow *cvVerticalHyperlink;
        TcxGridDBCardViewRow *cvVerticalPrice;
        TcxGridDBCardViewRow *cvVerticalRow1;
        TcxGridDBCardViewRow *cvVerticalHP;
        TcxGridDBCardViewRow *cvVerticalLiter;
        TcxGridDBCardViewRow *cvVerticalCyl;
        TcxGridDBCardViewRow *cvVerticalRow2;
        TcxGridDBCardViewRow *cvVerticalTransmissSpeedCount;
        TcxGridDBCardViewRow *cvVerticalTransmissAutomatic;
        TcxGridDBCardViewRow *cvVerticalCategory;
        TcxGridDBCardViewRow *cvVerticalFuelEconomy;
        TcxGridDBCardViewRow *cvVerticalMPG_City;
        TcxGridDBCardViewRow *cvVerticalMPG_Highway;
        TcxGridDBCardViewRow *cvVerticalRow3;
        TcxGridDBCardViewRow *cvVerticalDescription;
        TcxGridLevel *GridLevel1;
        TcxGridLevel *GridLevel2;
        TDatabase *dbMain;
        TDataSource *dsCars;
        TTable *tblCars;
        TAutoIncField *tblCarsID;
        TStringField *tblCarsTrademark;
        TStringField *tblCarsModel;
        TSmallintField *tblCarsHP;
        TFloatField *tblCarsLiter;
        TSmallintField *tblCarsCyl;
        TSmallintField *tblCarsTransmissSpeedCount;
        TStringField *tblCarsTransmissAutomatic;
        TSmallintField *tblCarsMPG_City;
        TSmallintField *tblCarsMPG_Highway;
        TStringField *tblCarsCategory;
        TMemoField *tblCarsDescription;
        TStringField *tblCarsHyperlink;
        TBlobField *tblCarsPicture;
        TFloatField *tblCarsPrice;
        TStringField *tblCarsFuelEconomy;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *miExit;
        TMenuItem *miView;
        TMenuItem *miCardAutoWidth;
        TMenuItem *miCellSelection;
        TMenuItem *N1;
        TMenuItem *miCustomize;
        TMenuItem *miAbout;
        TcxStyleRepository *StyleRepository;
        TcxStyle *styleSelection;
        TcxStyle *styleCardHeader;
        TcxStyle *styleCardBorder;
        TcxStyle *styleBackground;
        TcxStyle *styleCategoryRow;
        TcxStyle *stylePrice;
        TcxGridCardViewStyleSheet *CardsStyleSheet;
        TcxEditRepository *EditRepository;
        TcxEditRepositoryImageItem *EditRepositoryImage;
        TcxEditRepositoryMemoItem *EditRepositoryMemo;
        TcxEditRepositoryHyperLinkItem *EditRepositoryHyperLink;
        TcxEditRepositoryCurrencyItem *EditRepositoryPrice;
        TcxEditRepositoryTextItem *EditRepositoryFuelEconomy;
        TcxEditRepositoryCheckBoxItem *EditRepositoryAutomatic;
        void __fastcall miExitClick(TObject *Sender);
        void __fastcall miCardAutoWidthClick(TObject *Sender);
        void __fastcall miCellSelectionClick(TObject *Sender);
        void __fastcall miCustomizeClick(TObject *Sender);
        void __fastcall miAboutClick(TObject *Sender);
        void __fastcall GridActiveTabChanged(TcxCustomGrid *Sender,
          TcxGridLevel *ALevel);
        void __fastcall tblCarsCalcFields(TDataSet *DataSet);
private:	// User declarations
protected:
        void UpdateMenuValues();
public:		// User declarations
        __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
