//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("CustomDrawCardViewDemo.res");
USEFORM("CustomDrawCardViewDemoMain.cpp", CustomDrawCardViewDemoMainForm);
USEFORM("CustomDrawCardViewDemoData.cpp", CustomDrawCardViewDemoMainDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
USEUNIT("CustomDrawCardViewDemoTypes.cpp");
USERC("CustomDrawCardViewDemoImages.rc"); 
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid CustomDrawCardView Demo";
     Application->CreateForm(__classid(TCustomDrawCardViewDemoMainDM), &CustomDrawCardViewDemoMainDM);
     Application->CreateForm(__classid(TCustomDrawCardViewDemoMainForm), &CustomDrawCardViewDemoMainForm);
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
