//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("CustomRowHeightDemo.res");
USEFORM("CustomRowHeightDemoMain.cpp", CustomRowHeightDemoMainForm);
USEFORM("CustomRowHeightDemoData.cpp", CustomRowHeightDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid CustomRowHeight Demo";
     Application->CreateForm(__classid(TCustomRowHeightDemoDataDM), &CustomRowHeightDemoDataDM);
     Application->CreateForm(__classid(TCustomRowHeightDemoMainForm), &CustomRowHeightDemoMainForm);
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



