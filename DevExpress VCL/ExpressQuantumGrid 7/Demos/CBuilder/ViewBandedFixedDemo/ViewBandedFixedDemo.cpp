//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("ViewBandedFixedDemo.res");
USEFORM("ViewBandedFixedDemoMain.cpp", ViewBandedFixedDemoMainForm);
USEFORM("ViewBandedFixedDemoData.cpp", ViewBandedFixedDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid ViewBandedFixed Demo";
     Application->CreateForm(__classid(TViewBandedFixedDemoDataDM), &ViewBandedFixedDemoDataDM);
     Application->CreateForm(__classid(TViewBandedFixedDemoMainForm), &ViewBandedFixedDemoMainForm);
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
