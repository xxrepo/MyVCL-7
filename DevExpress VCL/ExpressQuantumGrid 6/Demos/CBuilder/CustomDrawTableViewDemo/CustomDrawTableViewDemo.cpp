//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("CustomDrawTableViewDemo.res");
USEFORM("CustomDrawTableViewDemoMain.cpp", CustomDrawTableViewDemoMainForm);
USEFORM("CustomDrawTableViewDemoMainData.cpp", CustomDrawTableViewDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
USEFORM("CustomDrawTableViewDemoStylesEditor.cpp", CustomDrawTableViewDemoStylesEditorForm);
USEUNIT("CustomDrawTableViewDemoTypes.cpp");
USERC("CustomDrawTableViewDemoImages.rc"); 
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid CustomDrawTableView Demo";
     Application->CreateForm(__classid(TCustomDrawTableViewDemoMainForm), &CustomDrawTableViewDemoMainForm);
     Application->CreateForm(__classid(TCustomDrawTableViewDemoDataDM), &CustomDrawTableViewDemoDataDM);
     Application->CreateForm(__classid(TCustomDrawTableViewDemoStylesEditorForm), &CustomDrawTableViewDemoStylesEditorForm);
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
