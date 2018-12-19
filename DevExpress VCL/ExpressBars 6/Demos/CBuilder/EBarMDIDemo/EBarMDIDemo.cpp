//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("EBarMDIDemo.res");
USEFORM("EBarMDIDemoAbout.cpp", EBarMDIDemoAboutForm);
USEFORM("EBarMDIDemoChild.cpp", EBarMDIDemoChildForm);
USEFORM("EBarMDIDemoMain.cpp", EBarMDIDemoMainForm);
USEFORM("..\Common\EBarsAbout.cpp", EBarsAboutForm);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressBars6 MDI Demo";
     Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
     Application->CreateForm(__classid(TEBarMDIDemoMainForm), &EBarMDIDemoMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
