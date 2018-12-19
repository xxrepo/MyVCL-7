//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("FlowChartDemo.res");
USEFORM("main.cpp", MaimForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TMaimForm), &MaimForm);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
