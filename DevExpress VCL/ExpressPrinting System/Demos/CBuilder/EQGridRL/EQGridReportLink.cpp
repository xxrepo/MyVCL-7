//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("EQGridReportLink.res");
USEFORM("main.cpp", MainForm);
USEFORM("preview.cpp", previewForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
        Application->Initialize();
        Application->CreateForm(__classid(TMainForm), &MainForm);
        Application->CreateForm(__classid(TpreviewForm), &previewForm);
        Application->Run();
    }
    catch (Exception &exception)
    {
        Application->ShowException(&exception);
    }
    return 0;
}
//---------------------------------------------------------------------------
