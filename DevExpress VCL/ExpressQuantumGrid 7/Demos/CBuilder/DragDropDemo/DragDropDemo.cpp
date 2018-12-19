//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("DragDropDemo.res");
USEFORM("DragDropDemoMain.cpp", DragDropDemoMainForm);
USEFORM("DragDropDemoData.cpp", DragDropDemoMainDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
USEFORM("DragDropDemoDictionaries.cpp", DragDropDemoDictionariesForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid DragDropDemo";
     Application->CreateForm(__classid(TDragDropDemoMainDM), &DragDropDemoMainDM);
     Application->CreateForm(__classid(TDragDropDemoMainForm), &DragDropDemoMainForm);
     Application->CreateForm(__classid(TDragDropDemoDictionariesForm), &DragDropDemoDictionariesForm);
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
