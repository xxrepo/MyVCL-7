//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("SpreadSheetRL.res");
USEFORM("SpreadSheetRLMain.cpp", SpreadSheetRLMainForm);
USEFORM("SpreadSheetRLModify.cpp", SpreadSheetRLModifyForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TSpreadSheetRLMainForm), &SpreadSheetRLMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
