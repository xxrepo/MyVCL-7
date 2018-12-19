//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("EditorsInPlaceDemo.res");
USEFORM("EditorsInPlaceDemoMain.cpp", EditorsInPlaceDemoMainForm);
USEFORM("EditorsInPlaceDemoData.cpp", EditorsInPlaceDemoDataDM); /* TDataModule: File Type */
USEFORM("..\Common\DemoRating.cpp", DemoRatingForm);
USEFORM("..\Common\AboutDemoForm.cpp", formAboutDemo);
USEFORM("..\Common\DemoBasicMain.cpp", DemoBasicMainForm);
USEFORM("EditorsInPlaceDemoCarInfo.cpp", EditorsInPlaceDemoCarInfoForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->HelpFile = "..\\..\\Help\\ExpressQuantumTreeList5.hlp";
     Application->Title = "ExpressQuantumTreeList5 EditorsInPlaceDemo Demo";
     Application->CreateForm(__classid(TEditorsInPlaceDemoDataDM), &EditorsInPlaceDemoDataDM);
     Application->CreateForm(__classid(TEditorsInPlaceDemoMainForm), &EditorsInPlaceDemoMainForm);
     Application->CreateForm(__classid(TEditorsInPlaceDemoCarInfoForm), &EditorsInPlaceDemoCarInfoForm);
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
