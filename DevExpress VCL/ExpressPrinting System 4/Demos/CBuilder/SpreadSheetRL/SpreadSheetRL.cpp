//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USEFORM("SpreadSheetRLModify.cpp", SpreadSheetRLModifyForm);
USEFORM("..\Common\DemoBasicMain.cpp", DemoBasicMainForm);
USEFORM("..\Common\AboutDemoForm.cpp", formAboutDemo);
USEFORM("SpreadSheetRLMain.cpp", SpreadSheetRLForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TSpreadSheetRLForm), &SpreadSheetRLForm);
		Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
