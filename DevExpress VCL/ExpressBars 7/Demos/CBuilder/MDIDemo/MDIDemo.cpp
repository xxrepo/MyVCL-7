//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USEFORM("MDIDemoChild.cpp", frmMDIChild);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("MDIDemoMain.cpp", frmMDIMain);
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData);
USEFORM("..\Common\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressBars MDI Demo";
     Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
		Application->CreateForm(__classid(TfrmMDIMain), &frmMDIMain);
		Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
