//---------------------------------------------------------------------------
#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxPSCore.hpp"
#include "dxPSEngn.hpp"
#include "dxPSFileBasedXplorer.hpp"
#include "dxBkgnd.hpp"
#include "dxPrnDev.hpp"
#include "dxPrnPg.hpp"
#include "dxPSCompsProvider.hpp"
#include "dxPSEdgePatterns.hpp"
#include "dxPSFillPatterns.hpp"
#include "dxPSGlbl.hpp"
#include "dxPSUtl.hpp"
#include "dxWrap.hpp"

//#include "dxPSPrVwAdv.hpp" //uncomment to use with dxBars

/*
 Follow header files must be added if you want to support all types of saved reports,
 i.e. reports that were created from all types of ReportLinks.
 These files contain registration information for all item types used to create them
*/

// cxSpreadSheet
//#include "dxPScxSSLnk.hpp"

// Generic Container
//#include "dxPSShapes.hpp"
//#include "dxPSContainerLnk.hpp"

// dxLayoutControl
//#include "dxPSdxLCLnk.hpp"

// cxGrid, cxTreeList, cxVerticalGrid and any others cx-family products
//#include "dxPScxGrid6Lnk.hpp"
//#include "dxPScxCommon.hpp"
//#include "dxPScxExtCommon.hpp"

const String cConfigFile = "ReportExplorer.config";
const String cFileName = "FileName";
const String cRootDirectory = "RootDirectory";
const String cRegistryPath = "Software\Developer Express\ReportExplorer 1.0";

//---------------------------------------------------------------------------
class TfmLauncher : public TForm
{
__published:  // IDE-managed Components
  TdxPSFileBasedExplorer *dxPSFileBasedExplorer1;
  TdxComponentPrinter *dxComponentPrinter1;
  TdxPSEngineController *dxPSEngineController1;
  void __fastcall dxPSFileBasedExplorer1ItemDataLoadError(
          TCustomdxPSExplorer *Sender, TdxPSExplorerItem *AnItem,
          bool &AShowErrorMessage, AnsiString &AText);
private:
  String FFileName;
  String FRootDirectory;
  String __fastcall GetConfigFileName();
  String __fastcall PreparedFileName(const String Source);
protected:
  void __fastcall ProcessCommandLine();
  void __fastcall ProcessConfigFile();
  void __fastcall ProcessStartupParams();

  void __fastcall InitializeExplorer();
  void __fastcall RunExplorer();

  void __fastcall SaveCustomSettings();

  __property String ConfigFileName = {read=GetConfigFileName};
  __property String FileName = {read=FFileName,write=FFileName};
  __property String RootDirectory = {read=FRootDirectory,write=FRootDirectory};
public:
  __fastcall TfmLauncher(TComponent* Owner);
  __fastcall ~TfmLauncher(void);
  void __fastcall AfterConstruction();

private:  // User declarations
public:   // User declarations
};
//---------------------------------------------------------------------------
extern PACKAGE TfmLauncher *fmLauncher;
//---------------------------------------------------------------------------
#endif
   