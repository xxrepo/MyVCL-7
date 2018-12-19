//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "AreaCustomFunc.h"

USERES("CustomFunction.res");
USEUNIT("AreaCustomFunc.cpp");
USEFORM("CustomFunctionFrm.cpp", CustomFunctionForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     RegisterCustomFunction();
     Application->CreateForm(__classid(TCustomFunctionForm), &CustomFunctionForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
