//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("Stocks.res");
USEFORM("StocksMain.cpp", StocksMainForm);
USEFORM("StocksModify.cpp", StocksModifyForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TStocksMainForm), &StocksMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
