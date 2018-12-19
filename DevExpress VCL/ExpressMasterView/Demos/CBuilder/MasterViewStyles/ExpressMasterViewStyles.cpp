//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("ExpressMasterViewStyles.res");
USEFORM("main.cpp", fmMain);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
        Application->Initialize();
        Application->Title = "ExpressMasterView - Styles Demo";
        Application->CreateForm(__classid(TfmMain), &fmMain);
        Application->Run();
    }
    catch (Exception &exception)
    {
        Application->ShowException(&exception);
    }
    return 0;
}
//---------------------------------------------------------------------------
