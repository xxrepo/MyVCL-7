//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("BandedFixedDemo.res");
USEFORM("BandedFixedDemoMain.cpp", BandedFixedDemoMainForm);
USEFORM("BandedFixedDemoData.cpp", BandedFixedDemoDataDM); /* TDataModule: File Type */
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
     Application->Title = "ExpressQuantumTreeList5 BandedFixedDemo";
     Application->CreateForm(__classid(TBandedFixedDemoDataDM), &BandedFixedDemoDataDM);
     Application->CreateForm(__classid(TBandedFixedDemoMainForm), &BandedFixedDemoMainForm);
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
