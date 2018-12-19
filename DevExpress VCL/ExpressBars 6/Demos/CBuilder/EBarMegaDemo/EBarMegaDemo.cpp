//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("EBarMegaDemo.res");
USEFORM("EBarMegaDemoAbout.cpp", EBarMegaDemoAboutForm);
USEFORM("EBarMegaDemoData.cpp", EBarMegaDemoMainDM); /* TDataModule: DesignClass */
USEFORM("EBarMegaDemoOptions.cpp", EBarMegaDemoOptionsForm);
USEFORM("..\Common\EBarsAbout.cpp", EBarsAboutForm);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("EBarMegaDemoMain.cpp", EBarMegaDemoMainForm);
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressBars6 Mega Demo";
     Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
     Application->CreateForm(__classid(TEBarMegaDemoMainDM), &EBarMegaDemoMainDM);
     Application->CreateForm(__classid(TEBarMegaDemoMainForm), &EBarMegaDemoMainForm);
     Application->CreateForm(__classid(TEBarMegaDemoOptionsForm), &EBarMegaDemoOptionsForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
