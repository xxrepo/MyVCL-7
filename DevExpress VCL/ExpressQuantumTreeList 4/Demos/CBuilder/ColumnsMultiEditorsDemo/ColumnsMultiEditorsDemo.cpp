//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("ColumnsMultiEditorsDemo.res");
USEFORM("ColumnsMultiEditorsDemoMain.cpp", ColumnsMultiEditorsDemoMainForm);
USEFORM("ColumnsMultiEditorsDemoData.cpp", ColumnsMultiEditorsDemoDataDM); /* TDataModule: File Type */
USEFORM("..\Common\DemoRating.cpp", DemoRatingForm);
USEFORM("..\Common\DemoBasicAbout.cpp", DemoBasicAboutForm);
USEFORM("..\Common\DemoBasicMain.cpp", DemoBasicMainForm);
USEFORM("ColumnsMultiEditorsDemoPopup.cpp", ColumnsMultiEditorsDemoPopupForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->HelpFile = "..\\..\\Help\\EQTreeList4.hlp";
     Application->Title = "ExpressQuantumTreeList4 ColumnsMultiEditorsDemo";
     Application->CreateForm(__classid(TColumnsMultiEditorsDemoDataDM), &ColumnsMultiEditorsDemoDataDM);
     Application->CreateForm(__classid(TColumnsMultiEditorsDemoMainForm), &ColumnsMultiEditorsDemoMainForm);
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
