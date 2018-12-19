//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include <cxSSFormulas.hpp>
#include <cxExcelConst.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)

void __fastcall AreaFuncCallBack(TcxSSFunctionHandler *Sender, const double Value)
{
  if (Sender->CallBackIndex == 0)
    Sender->FloatValue = Value;
  else
    Sender->FloatValue = Sender->FloatValue * Value;
}

void __fastcall AreaFunc(TcxSSFunctionHandler *Sender)
{
  Sender->EnumParamValues(AreaFuncCallBack, TcxValueTypes() << vtFloat);
  Sender->SetFloatResult(Sender->FloatValue);
}

void RegisterCustomFunction()
{
  Cxssformulas::TcxFuncDefinition cxFuncDefinition[1];
  cxFuncDefinition[0].Token =  0xFFFF-2;
  cxFuncDefinition[0].Name = "Area";
  cxFuncDefinition[0].Definition = AreaFunc;
  cxFuncDefinition[0].Params = Cxexcelconst::fpFixed;
  cxFuncDefinition[0].ParamsCount = 2;
  #if (__BORLANDC__ < 0x610)
	TcxSSFunctionHandler::RegisterFunctions(NULL, cxFuncDefinition, 0);
  #else
	TcxSSFunctionHandler::RegisterFunctions(cxFuncDefinition, 0);
  #endif
}

