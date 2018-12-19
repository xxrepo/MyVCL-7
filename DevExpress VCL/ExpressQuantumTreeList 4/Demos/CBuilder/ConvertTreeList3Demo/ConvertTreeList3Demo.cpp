//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("ConvertTreeList3Demo.res");
USEFORM("ConvertTreeList3DemoMain.cpp", ConvertTreeList3DemoMainForm);
USEFORM("ConvertTreeList3DemoData.cpp", ConvertTreeList3DemoDataDM); /* TDataModule: File Type */
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
     Application->Title = "ExpressQuantumTreeList4 ConvertTreeList3Demo";
     Application->CreateForm(__classid(TConvertTreeList3DemoDataDM), &ConvertTreeList3DemoDataDM);
     Application->CreateForm(__classid(TConvertTreeList3DemoMainForm), &ConvertTreeList3DemoMainForm);
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
