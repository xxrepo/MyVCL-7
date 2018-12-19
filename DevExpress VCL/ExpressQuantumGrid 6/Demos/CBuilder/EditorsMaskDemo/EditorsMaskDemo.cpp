//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("EditorsMaskDemo.res");
USEFORM("EditorsMaskDemoMain.cpp", EditorsMaskDemoMainForm);
USEFORM("EditorsMaskDemoData.cpp", EditorsMaskDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid EditorsMaskDemo";
     Application->CreateForm(__classid(TEditorsMaskDemoDataDM), &EditorsMaskDemoDataDM);
     Application->CreateForm(__classid(TEditorsMaskDemoMainForm), &EditorsMaskDemoMainForm);
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
