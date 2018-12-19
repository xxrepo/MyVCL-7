//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("EditorsMaskDemo.res");
USEFORM("EditorsMaskDemoMain.cpp", EditorsMaskDemoMainForm);
USEFORM("EditorsMaskDemoData.cpp", EditorsMaskDemoDataDM); /* TDataModule: File Type */
USEFORM("..\Common\DemoRating.cpp", DemoRatingForm);
USEFORM("..\Common\AboutDemoForm.cpp", formAboutDemo);
USEFORM("..\Common\DemoBasicMain.cpp", DemoBasicMainForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->HelpFile = "..\\..\\Help\\ExpressQuantumTreeList5.hlp";
     Application->Title = "ExpressQuantumTreeList5 EditorsMaskDemo";
     Application->CreateForm(__classid(TEditorsMaskDemoDataDM), &EditorsMaskDemoDataDM);
     Application->CreateForm(__classid(TEditorsMaskDemoMainForm), &EditorsMaskDemoMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  catch (...)
  {
     try
     {
       throw Exception("");
     }
     catch (Exception &exception)
     {
       Application->ShowException(&exception);
     }
  }
  return 0;
}
//---------------------------------------------------------------------------
