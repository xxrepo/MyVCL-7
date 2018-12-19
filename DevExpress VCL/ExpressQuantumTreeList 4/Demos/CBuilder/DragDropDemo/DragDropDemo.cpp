//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("DragDropDemo.res");
USEFORM("DragDropDemoMain.cpp", DragDropDemoMainForm);
USEFORM("DragDropDemoData.cpp", DragDropDemoDataDM); /* TDataModule: File Type */
USEFORM("..\Common\DemoRating.cpp", DemoRatingForm);
USEFORM("..\Common\DemoBasicAbout.cpp", DemoBasicAboutForm);
USEFORM("..\Common\DemoBasicMain.cpp", DemoBasicMainForm);
USEFORM("DragDropDemoDictionary.cpp", DragDropDemoDictionaryForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->HelpFile = "..\\..\\Help\\EQTreeList4.hlp";
     Application->Title = "ExpressQuantumTreeList4 DragDropDemo";
     Application->CreateForm(__classid(TDragDropDemoDataDM), &DragDropDemoDataDM);
     Application->CreateForm(__classid(TDragDropDemoMainForm), &DragDropDemoMainForm);
     Application->CreateForm(__classid(TDragDropDemoDictionaryForm), &DragDropDemoDictionaryForm);
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
