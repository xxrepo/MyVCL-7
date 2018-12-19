//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("ESBarDemo.res");
USEFORM("ESBarDemoAbout.cpp", ESBarDemoAboutForm);
USEFORM("ESBarDemoMain.cpp", ESBarDemoMainForm);
USEFORM("..\Common\EBarsAbout.cpp", EBarsAboutForm);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressBars6 SideBar Demo";
     Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
     Application->CreateForm(__classid(TESBarDemoMainForm), &ESBarDemoMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
