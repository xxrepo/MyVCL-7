//---------------------------------------------------------------------------

#ifndef LayoutViewDemoMainH
#define LayoutViewDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxButtons.hpp"
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
#include "cxGridCustomLayoutView.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBLayoutView.hpp"
#include "cxGridLayoutView.hpp"
#include "cxGridLevel.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxLookAndFeels.hpp"
#include "cxStyles.hpp"
#include "dxLayoutContainer.hpp"
#include "dxmdaset.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
#include <Menus.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
	TMainMenu *mmMain;
	TMenuItem *miFile;
	TMenuItem *miExit;
	TMenuItem *miView;
	TMenuItem *miCustomize;
	TMenuItem *miAbout;
	TCheckBox *cbShowOnlyEntireRecords;
	TLabel *Label2;
	TLabel *Label1;
	TcxEditRepository *EditRepository;
	TcxEditRepositoryImageItem *EditRepositoryImage;
	TcxEditRepositoryMemoItem *EditRepositoryMemo;
	TcxEditRepositoryHyperLinkItem *EditRepositoryHyperLink;
	TcxEditRepositoryCurrencyItem *EditRepositoryPrice;
	TcxEditRepositoryCheckBoxItem *EditRepositoryAutomatic;
	TcxStyleRepository *cxStyleRepository1;
	TcxStyle *stValues;
	TcxStyle *stItems;
	TcxStyle *stHeader;
	TcxStyle *stRecordCaption;
	TCheckBox *cbRecordCaptions;
	TCheckBox *cbMultiSelectRecords;
	TCheckBox *cbExpandableRecords;
	TCheckBox *cbCenterRecords;
	TcxButton *btnCustomize;
	TcxGrid *Grid;
	TcxGridDBLayoutView *LayoutView;
	TcxGridDBLayoutViewItem *LayoutViewRecId;
	TcxGridDBLayoutViewItem *LayoutViewID;
	TcxGridDBLayoutViewItem *LayoutViewTrademark;
	TcxGridDBLayoutViewItem *LayoutViewModel;
	TcxGridDBLayoutViewItem *LayoutViewHP;
	TcxGridDBLayoutViewItem *LayoutViewLiter;
	TcxGridDBLayoutViewItem *LayoutViewCyl;
	TcxGridDBLayoutViewItem *LayoutViewTransmissSpeedCount;
	TcxGridDBLayoutViewItem *LayoutViewTransmissAutomatic;
	TcxGridDBLayoutViewItem *LayoutViewMPG_City;
	TcxGridDBLayoutViewItem *LayoutViewMPG_Highway;
	TcxGridDBLayoutViewItem *LayoutViewCategory;
	TcxGridDBLayoutViewItem *LayoutViewDescription;
	TcxGridDBLayoutViewItem *LayoutViewHyperlink;
	TcxGridDBLayoutViewItem *LayoutViewPicture;
	TcxGridDBLayoutViewItem *LayoutViewPrice;
	TdxLayoutGroup *LayoutViewGroup2;
	TdxLayoutGroup *LayoutViewGroup3;
	TcxGridLayoutItem *LayoutViewLayoutItem2;
	TcxGridLayoutItem *LayoutViewLayoutItem3;
	TcxGridLayoutItem *LayoutViewLayoutItem4;
	TcxGridLayoutItem *LayoutViewLayoutItem5;
	TcxGridLayoutItem *LayoutViewLayoutItem6;
	TcxGridLayoutItem *LayoutViewLayoutItem7;
	TcxGridLayoutItem *LayoutViewLayoutItem8;
	TcxGridLayoutItem *LayoutViewLayoutItem9;
	TcxGridLayoutItem *LayoutViewLayoutItem10;
	TcxGridLayoutItem *LayoutViewLayoutItem11;
	TcxGridLayoutItem *LayoutViewLayoutItem12;
	TcxGridLayoutItem *LayoutViewLayoutItem13;
	TcxGridLayoutItem *LayoutViewLayoutItem14;
	TcxGridLayoutItem *LayoutViewLayoutItem15;
	TcxGridLayoutItem *LayoutViewLayoutItem16;
	TdxLayoutGroup *LayoutViewGroup4;
	TdxLayoutGroup *LayoutViewGroup5;
	TdxLayoutGroup *LayoutViewGroup6;
	TdxLayoutGroup *LayoutViewGroup7;
	TdxLayoutGroup *LayoutViewGroup8;
	TdxLayoutGroup *LayoutViewGroup10;
	TdxLayoutGroup *LayoutViewGroup9;
	TdxLayoutEmptySpaceItem *LayoutViewSpaceItem2;
	TdxLayoutEmptySpaceItem *LayoutViewSpaceItem3;
	TdxLayoutEmptySpaceItem *LayoutViewSpaceItem4;
	TdxLayoutEmptySpaceItem *LayoutViewSpaceItem5;
	TdxLayoutGroup *LayoutViewGroup11;
	TcxGridLevel *GridLevel1;
	TRadioGroup *rgViewMode;
	TdxMemData *mdCars;
	TAutoIncField *mdCarsID;
	TStringField *mdCarsTrademark;
	TStringField *mdCarsModel;
	TSmallintField *mdCarsHP;
	TFloatField *mdCarsLiter;
	TSmallintField *mdCarsCyl;
	TSmallintField *mdCarsTransmissSpeedCount;
	TStringField *mdCarsTransmissAutomatic;
	TSmallintField *mdCarsMPG_City;
	TSmallintField *mdCarsMPG_Highway;
	TStringField *mdCarsCategory;
	TMemoField *mdCarsDescription;
	TStringField *mdCarsHyperlink;
	TBlobField *mdCarsPicture;
	TFloatField *mdCarsPrice;
	TDataSource *dsCars;
	void __fastcall rgViewModeClick(TObject *Sender);
	void __fastcall miExitClick(TObject *Sender);
	void __fastcall miCustomizeClick(TObject *Sender);
	void __fastcall miAboutClick(TObject *Sender);
	void __fastcall cbCenterRecordsClick(TObject *Sender);
	void __fastcall cbShowOnlyEntireRecordsClick(TObject *Sender);
	void __fastcall cbMultiSelectRecordsClick(TObject *Sender);
	void __fastcall cbRecordCaptionsClick(TObject *Sender);
	void __fastcall cbExpandableRecordsClick(TObject *Sender);
	void __fastcall btnCustomizeClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
