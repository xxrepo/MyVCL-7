//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("BackgroundDemo.res");
USEFORM("BackgroundDemoAbout.cpp", BackgroundDemoAboutForm);
USEFORM("BackgroundDemoMain.cpp", BackgroundDemoMainForm);
USEFORM("..\Common\EBarsAbout.cpp", EBarsAboutForm);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressBars6 Background Demo";
     Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
     Application->CreateForm(__classid(TBackgroundDemoMainForm), &BackgroundDemoMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
