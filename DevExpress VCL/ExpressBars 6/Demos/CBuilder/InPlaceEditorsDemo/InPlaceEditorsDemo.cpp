//---------------------------------------------------------------------------

#include <vcl.h>
#include "InPlaceEditorsDemoSplash.h"
#pragma hdrstop
USERES("InPlaceEditorsDemo.res");
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData); /* TDataModule: File Type */
USEFORM("..\Common\EBarsAbout.cpp", EBarsAboutForm);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("InPlaceEditorsDemoValue.cpp", frmValueEditors);
USEFORM("InPlaceEditorsDemoAbout.cpp", frmAbout);
USEFORM("InPlaceEditorsDemoCheckBoxes.cpp", frmCheckBoxes);
USEFORM("InPlaceEditorsDemoComboBoxes.cpp", frmComboBoxes);
USEFORM("InPlaceEditorsDemoImage.cpp", frmImageEditors);
USEFORM("InPlaceEditorsDemoMain.cpp", frmMain);
USEFORM("InPlaceEditorsDemoMultiLineText.cpp", frmMultiLineTextEditors);
USEFORM("InPlaceEditorsDemoText.cpp", frmTextEditors);
USEFORM("InPlaceEditorsDemoSplash.cpp", frmLoading);
USEFORM("InPlaceEditorsDemoFrameManager.cpp", EditorDemoBaseFrame);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
    Application->Initialize();
    Application->Title = "ExpressBars6 InPlaceEditorsDemo";
    frmLoading = new TfrmLoading(NULL);
    frmLoading->Show();
    frmLoading->Update();
    Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
    Application->CreateForm(__classid(TfrmMain), &frmMain);
    delete frmLoading;
    Application->Run();
  }
  catch (Exception &exception)
  {
    Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
