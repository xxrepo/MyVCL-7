//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("Flying.res");
USEFORM("FlyingMain.cpp", FlyingMainForm);
USEFORM("FlyingSeatCalc.cpp", FlyingSeatCalcForm);
USERC("Default.rc");
USEUNIT("FlyingSupport.cpp");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TFlyingMainForm), &FlyingMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
