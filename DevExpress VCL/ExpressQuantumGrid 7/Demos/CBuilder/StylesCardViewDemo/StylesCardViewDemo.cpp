//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("StylesCardViewDemo.res");
USEFORM("StylesCardViewDemoMain.cpp", StylesCardViewDemoMainForm);
USEFORM("StylesCardViewDemoData.cpp", StylesCardViewDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid StylesCardView Demo";
     Application->CreateForm(__classid(TStylesCardViewDemoDataDM), &StylesCardViewDemoDataDM);
     Application->CreateForm(__classid(TStylesCardViewDemoMainForm), &StylesCardViewDemoMainForm);
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



