//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("CustomDrawDemo.res");
USEFORM("CustomDrawDemoMain.cpp", CustomDrawDemoMainForm);
USEFORM("CustomDrawDemoData.cpp", CustomDrawDemoDataDM); /* TDataModule: File Type */
USEFORM("..\Common\DemoRating.cpp", DemoRatingForm);
USEFORM("..\Common\DemoBasicAbout.cpp", DemoBasicAboutForm);
USEFORM("..\Common\DemoBasicMain.cpp", DemoBasicMainForm);
USEFORM("CustomDrawDemoEditor.cpp", CustomDrawDemoEditorForm);
USEUNIT("CustomDrawDemoTypes.cpp");
USERC("CustomDrawDemoImages.rc"); 
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->HelpFile = "..\\..\\Help\\EQTreeList4.hlp";
     Application->Title = "ExpressQuantumTreeList4 CustomDrawDemo";
     Application->CreateForm(__classid(TCustomDrawDemoDataDM), &CustomDrawDemoDataDM);
     Application->CreateForm(__classid(TCustomDrawDemoMainForm), &CustomDrawDemoMainForm);
     Application->CreateForm(__classid(TCustomDrawDemoEditorForm), &CustomDrawDemoEditorForm);
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
