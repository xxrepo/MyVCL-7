//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("RibbonNotepadDemo.res");
USEFORM("RibbonDemoAbout.cpp", RibbonDemoAboutForm);
USEFORM("RibbonNotepadDemoMain.cpp", RibbonDemoMainForm);
USEFORM("..\Common\EBarsUtils.cpp", dmCommonData); /* TDataModule: File Type */
USEFORM("..\Common\EBarsAbout.cpp", EBarsAboutForm);
USEFORM("..\Common\EBarsDemoRating.cpp", EBarsDemoRatingForm);
USEFORM("RibbonNotepadDemoOptions.cpp", RibbonDemoOptionsForm);
USEFORM("RibbonNotepadDemoGallerySetup.cpp", ColorDialogSetupForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TdmCommonData), &dmCommonData);
                 Application->CreateForm(__classid(TRibbonDemoMainForm), &RibbonDemoMainForm);
                 Application->CreateForm(__classid(TRibbonDemoOptionsForm), &RibbonDemoOptionsForm);
                 Application->CreateForm(__classid(TColorDialogSetupForm), &ColorDialogSetupForm);
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
