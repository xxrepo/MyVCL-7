//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USEFORM("Unit1.cpp", fmMain);
USERES("MasterViewColumnsDemo.res");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
        Application->Initialize();
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
