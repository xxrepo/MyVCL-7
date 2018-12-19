//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("ColumnsSimpleDemo.res");
USEFORM("ColumnsSimpleDemoMain.cpp", ColumnsSimpleDemoMainForm);
USEFORM("ColumnsSimpleDemoData.cpp", ColumnsSimpleDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
USEFORM("ColumnsSimpleDemoCars.cpp", ColumnSimpleDemoCarsForm);
USEFORM("ColumnsSimpleDemoCities.cpp", ColumnsSimpleDemoCitiesForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid ColumnsSimple Demo";
     Application->CreateForm(__classid(TColumnsSimpleDemoDataDM), &ColumnsSimpleDemoDataDM);
     Application->CreateForm(__classid(TColumnsSimpleDemoMainForm), &ColumnsSimpleDemoMainForm);
     Application->CreateForm(__classid(TColumnSimpleDemoCarsForm), &ColumnSimpleDemoCarsForm);
     Application->CreateForm(__classid(TColumnsSimpleDemoCitiesForm), &ColumnsSimpleDemoCitiesForm);
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
