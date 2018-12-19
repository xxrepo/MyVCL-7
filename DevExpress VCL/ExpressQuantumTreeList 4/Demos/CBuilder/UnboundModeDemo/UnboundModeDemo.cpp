//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("UnboundModeDemo.res");
USEFORM("UnboundModeDemoMain.cpp", UnboundModeDemoMainForm);
USEFORM("UnboundModeDemoData.cpp", UnboundModeDemoDataDM); /* TDataModule: File Type */
USEFORM("..\Common\DemoRating.cpp", DemoRatingForm);
USEFORM("..\Common\DemoBasicAbout.cpp", DemoBasicAboutForm);
USEFORM("..\Common\DemoBasicMain.cpp", DemoBasicMainForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->HelpFile = "..\\..\\Help\\EQTreeList4.hlp";
     Application->Title = "ExpressQuantumTreeList4 UnboundModeDemo";
     Application->CreateForm(__classid(TUnboundModeDemoDataDM), &UnboundModeDemoDataDM);
     Application->CreateForm(__classid(TUnboundModeDemoMainForm), &UnboundModeDemoMainForm);
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
