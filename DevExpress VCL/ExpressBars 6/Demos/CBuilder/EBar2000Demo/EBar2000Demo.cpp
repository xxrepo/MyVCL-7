//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("EBar2000Demo.res");
USEFORM("EBar2000DemoAbout.cpp", EBar2000DemoAboutForm);
USEFORM("EBar2000DemoMain.cpp", EBar2000DemoMainForm);
USEFORM("..\Common\EBarsAbout.cpp", EBarsAboutForm);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressBar Demo (Enchanced Style)";
     Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
     Application->CreateForm(__classid(TEBar2000DemoMainForm), &EBar2000DemoMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
