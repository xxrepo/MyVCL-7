//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("GridMenuViewsDemo.res");
USEFORM("GridMenuViewsDemoMain.cpp", GridMenuViewsDemoMainForm);
USEFORM("GridMenuViewsDemoData.cpp", GridMenuViewsDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid GridMenuViews Demo";
     Application->CreateForm(__classid(TGridMenuViewsDemoDataDM), &GridMenuViewsDemoDataDM);
     Application->CreateForm(__classid(TGridMenuViewsDemoMainForm), &GridMenuViewsDemoMainForm);
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
