//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("FilterByCodeDemo.res");
USEFORM("FilterByCodeDemoMain.cpp", FilterByCodeDemoMainForm);
USEFORM("FilterByCodeDemoData.cpp", FilterByCodeDemoDataDM);
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid FilterByCode Demo";
     Application->CreateForm(__classid(TFilterByCodeDemoDataDM), &FilterByCodeDemoDataDM);
                 Application->CreateForm(__classid(TFilterByCodeDemoMainForm), &FilterByCodeDemoMainForm);
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
