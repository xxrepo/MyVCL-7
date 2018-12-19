//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("InspectorReportLink.res");
USEFORM("Unit1.cpp", fmMain);
USEFORM("Unit2.cpp", fmDialog);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
        Application->Initialize();
        Application->CreateForm(__classid(TfmMain), &fmMain);
        Application->CreateForm(__classid(TfmDialog), &fmDialog);
        Application->Run();
    }
    catch (Exception &exception)
    {
        Application->ShowException(&exception);
    }
    return 0;
}
//---------------------------------------------------------------------------
