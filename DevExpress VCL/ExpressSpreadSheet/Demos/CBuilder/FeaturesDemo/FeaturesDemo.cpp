//---------------------------------------------------------------------------

#include <vcl.h>
#include "FeaturesDemoMain.h"
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("FeaturesDemoMain.cpp", FeaturesMainForm);
USEFORM("FeatureChild.cpp", FeatureChildForm);
USEFORM("FeatureModify.cpp", FeatureModifyForm);
USERES("FeaturesDemo.res");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ESS Features Demo";
     Application->CreateForm(__classid(TFeaturesMainForm), &FeaturesMainForm);
     FeaturesMainForm->NewSheet("");
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

