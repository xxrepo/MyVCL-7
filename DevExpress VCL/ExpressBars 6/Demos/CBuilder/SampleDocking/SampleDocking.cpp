//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("SampleDocking.res");
USEFORM("SampleDockingAbout.cpp", SampleDockingAboutForm);
USEFORM("SampleDockingListBox.cpp", SampleDockingListBoxFrame);
USEFORM("SampleDockingMain.cpp", SampleDockingMainForm);
USEFORM("SampleDockingRadioGroup.cpp", SampleDockingRadioGroupFrame);
USEFORM("SampleDockingRichText.cpp", SampleDockingRichTextFrame);
USEFORM("SampleDockingTreeView.cpp", SampleDockingTreeViewFrame);
USEFORM("..\Common\EBarsAbout.cpp", EBarsAboutForm);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressBars6 SampleDocking Demo";
     Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
     Application->CreateForm(__classid(TSampleDockingMainForm), &SampleDockingMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
