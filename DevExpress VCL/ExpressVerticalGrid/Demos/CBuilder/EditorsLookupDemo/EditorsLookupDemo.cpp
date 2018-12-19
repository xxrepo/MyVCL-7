//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("EditorsLookupDemo.res");
USEFORM("EditorsLookupDemoMain.cpp", EditorsLookupDemoMainForm);
USEFORM("EditorsLookupDemoData.cpp", EditorsLookupDemoDataDM); /* TDataModule: File Type */
USEFORM("..\Common\DemoRating.cpp", DemoRatingForm);
USEFORM("..\Common\DemoBasicAbout.cpp", DemoBasicAboutForm);
USEFORM("..\Common\DemoBasicMain.cpp", DemoBasicMainForm);
USEFORM("EditorsLookupDemoNewUser.cpp", EditorsLookupDemoNewUserForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->HelpFile = "..\\..\\Help\\EQVerticalGrid.hlp";
     Application->Title = "ExpressQuantumVerticalGrid4 EditorsLookupDemo";
     Application->CreateForm(__classid(TEditorsLookupDemoDataDM), &EditorsLookupDemoDataDM);
     Application->CreateForm(__classid(TEditorsLookupDemoMainForm), &EditorsLookupDemoMainForm);
     Application->CreateForm(__classid(TEditorsLookupDemoNewUserForm), &EditorsLookupDemoNewUserForm);
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
