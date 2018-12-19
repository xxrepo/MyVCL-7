//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("UnboundExternalDataDemo.res");
USEFORM("UnboundExternalDataDemoMain.cpp", UnboundExternalDataDemoMainForm);
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
USEUNIT("UnboundExternalDataDemoClasses.cpp");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid UnboundExternalData Demo";
     Application->CreateForm(__classid(TUnboundExternalDataDemoMainForm), &UnboundExternalDataDemoMainForm);
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
