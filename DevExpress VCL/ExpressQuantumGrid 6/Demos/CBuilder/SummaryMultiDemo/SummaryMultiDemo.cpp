//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("SummaryMultiDemo.res");
USEFORM("SummaryMultiDemoMain.cpp", SummaryMultiDemoMainForm);
USEFORM("SummaryMultiDemoData.cpp", SummaryMultiDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid SummaryMultiDemo";
     Application->CreateForm(__classid(TSummaryMultiDemoDataDM), &SummaryMultiDemoDataDM);
     Application->CreateForm(__classid(TSummaryMultiDemoMainForm), &SummaryMultiDemoMainForm);
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
