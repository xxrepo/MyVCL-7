//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("StylesMultiDemo.res");
USEFORM("StylesMultiDemoMain.cpp", StylesMultiDemoMainForm);
USEFORM("StylesMultiDemoData.cpp", StylesMultiDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid StylesMulti Demo";
     Application->CreateForm(__classid(TStylesMultiDemoDataDM), &StylesMultiDemoDataDM);
     Application->CreateForm(__classid(TStylesMultiDemoMainForm), &StylesMultiDemoMainForm);
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


