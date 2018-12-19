//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Main.h"
#include "FileCtrl.hpp"
#include "dxPSUtl.hpp"
#include "Splash.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxPSCore"
#pragma link "dxPSEngn"
#pragma link "dxPSFileBasedXplorer"
#pragma link "dxBkgnd"
#pragma link "dxPrnDev"
#pragma link "dxPrnPg"
#pragma link "dxPSCompsProvider"
#pragma link "dxPSEdgePatterns"
#pragma link "dxPSFillPatterns"
#pragma link "dxPSGlbl"
#pragma link "dxPSUtl"
#pragma link "dxWrap"
#pragma resource "*.dfm"

//#pragma link "dxPSPrVwAdv" //uncomment to use with dxBars

/*
 Follow files must be linked if you want to support all types of saved reports,
 i.e. reports that were created from all types of ReportLinks.
 These files contain registration information for all item types used to create them
*/

// cxSpreadSheet
//#pragma link "dxPScxSSLnk"

// Generic Container
//#pragma link "dxPSShapes"
//#pragma link "dxPSContainerLnk"

// dxLayoutControl
//#pragma link "dxPSdxLCLnk"

// cxGrid, cxTreeList, cxVerticalGrid and any others cx-family products
//#pragma link "dxPScxGrid6Lnk"
//#pragma link "dxPScxCommon"
//#pragma link "dxPScxExtCommon"

TfmLauncher *fmLauncher;

// Helpers

String TrimChars(const String Source, Char ALeadingChar, Char ATrailingChar)
{
  String Result = Source;
  if ((Result != "") && (ALeadingChar != 0))
    while (Result[1] == ALeadingChar)
      Result.Delete(1, 1);

  if ((Result != "") && (ATrailingChar != 0))
    while (Result[Result.Length()] == ATrailingChar)
      Result.Delete(Result.Length(), 1);
  return Result;
}

String RemoveQuotes(const String Source)
{
  return TrimChars(Source, '"', '"');
}

String RemoveLeadingSlash(const String Source)
{
  return TrimChars(Source, '\\', 0);
}

String RemoveTrailingSlash(const String Source)
{
  return TrimChars(Source, 0, '\\');
}


//---------------------------------------------------------------------------
__fastcall TfmLauncher::TfmLauncher(TComponent* Owner)
  : TForm(Owner)
{
  TfmSplash *AfmSplash = new TfmSplash(this);
  try{
    AfmSplash->ShowModal();
  }
  __finally{
    delete AfmSplash;
  }

  dxComponentPrinter1->ExplorerStubLink =
    dxComponentPrinter1->AddEmptyLink(__classid(TBasedxReportLink));
}
//---------------------------------------------------------------------------
__fastcall TfmLauncher::~TfmLauncher(void)
{
  SaveCustomSettings();
}
//---------------------------------------------------------------------------

void __fastcall TfmLauncher::AfterConstruction()
{
  TForm::AfterConstruction();
  SetBounds(-100, -100, 50, 50); // move main window outside screen
  RunExplorer();
}
//---------------------------------------------------------------------------

void __fastcall TfmLauncher::ProcessCommandLine()
{
  if (ParamCount > 0){
    FileName = ParamStr(1);
    if (FileExists(FileName))
      RootDirectory = ExtractFileDrive(FileName);
  }
}
//---------------------------------------------------------------------------

void __fastcall TfmLauncher::ProcessConfigFile()
{
  if (FileExists(ConfigFileName)){
    TStringList *ConfigFile = new TStringList();
    __try{
      ConfigFile->LoadFromFile(ConfigFileName);

      RootDirectory = ConfigFile->Values[cRootDirectory];
      FileName = ConfigFile->Values[cFileName];

      FileName = RemoveTrailingSlash(RootDirectory) + '\\' + RemoveLeadingSlash(FileName);
    }
    __finally{
      delete ConfigFile;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TfmLauncher::ProcessStartupParams()
{
  ProcessCommandLine();
  if (!FileExists(FileName))
    ProcessConfigFile();

  if (!DirectoryExists(RootDirectory))
    RootDirectory = "..\\Data";
  if (!FileExists(FileName))
    FileName = "";
  if ((RootDirectory == "") && (FileName != ""))
    RootDirectory = ExtractFileDir(FileName);
}
//---------------------------------------------------------------------------

void __fastcall TfmLauncher::InitializeExplorer()
{
  ProcessStartupParams();
  
  dxPSFileBasedExplorer1->RootPath = RootDirectory;
  if (dxPSFileBasedExplorer1->RootPath == "")
    dxPSFileBasedExplorer1->RootPath = "C:\\";
  if (FileName != "")
    dxPSFileBasedExplorer1->LoadItemData(FileName,
      dxComponentPrinter1->ExplorerStubLink);

  dxComponentPrinter1->PreviewOptions->ShowExplorer = true;
  dxComponentPrinter1->PreviewOptions->VisibleOptions =
    dxComponentPrinter1->PreviewOptions->VisibleOptions -
      (TdxPreviewVisibleOptions()<<pvoReportDesign);

  dxPSEngineController1->LookAndFeel = pslfFlat;
  dxPSEngineController1->RegistryPath = cRegistryPath;
}
//---------------------------------------------------------------------------

void __fastcall TfmLauncher::RunExplorer()
{
  Hide();
  __try{
    __try{
      InitializeExplorer();
    }
    catch (Exception &E){
      Dxpsutl::MessageError(E.Message);
    }
    dxComponentPrinter1->Explore();
  }
  __finally{
    Application->Terminate();
  }
}
//---------------------------------------------------------------------------

String __fastcall TfmLauncher::PreparedFileName(const String Source)
{
  String Result = Source;
  int P = dxPSFileBasedExplorer1->RealRootPath.Pos(Result);
  if (P == 1)
    Result.Delete(1, P + dxPSFileBasedExplorer1->RealRootPath.Length());
  return Result;  
}

void __fastcall TfmLauncher::SaveCustomSettings()
{
  TStringList *ConfigFile = new TStringList();
  __try{
    String S = cFileName;
    if (dxPSFileBasedExplorer1->LoadedItem() != NULL)
    {
      TdxPSFileBasedExplorerItem *AItem =
        (TdxPSFileBasedExplorerItem*)dxPSFileBasedExplorer1->LoadedItem();
      S = S + "=" + PreparedFileName(AItem->FullQualifiedFileName);
    }
    ConfigFile->Add(S);
    ConfigFile->Add(cRootDirectory + "=" + dxPSFileBasedExplorer1->RealRootPath);

    ConfigFile->SaveToFile(ConfigFileName);
  }
  __finally{
    delete ConfigFile;
  }
}
//---------------------------------------------------------------------------

String __fastcall TfmLauncher::GetConfigFileName()
{
  return ExtractFilePath(Application->ExeName) + cConfigFile;
}
//---------------------------------------------------------------------------

void __fastcall TfmLauncher::dxPSFileBasedExplorer1ItemDataLoadError(
      TCustomdxPSExplorer *Sender, TdxPSExplorerItem *AnItem,
      bool &AShowErrorMessage, AnsiString &AText)
{
  const String CRLF = "\n";
  const String ErrorText = "Cannot Load Item %s." + CRLF +
    "You should uncomment appropriate directives in h/cpp files" + CRLF +
    CRLF +
    "Please read ReadMe.txt.";
  AShowErrorMessage = true;
  AText = Format(ErrorText, ARRAYOFCONST((((TdxPSFileBasedExplorerItem*)AnItem)->Name)));
}
//---------------------------------------------------------------------------
