//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USEFORM("..\Common\DemoBasicDM.cpp", dmOrders);
USEFORM("..\Common\DemoBasicMain.cpp", frmDemoBaisicMain);
USEFORM("..\Common\AboutDemoForm.cpp", formAboutDemo);
USEFORM("PrefilterByCodeDemoMain.cpp", fmPrefilterByCode);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
		Application->Initialize();
                Application->CreateForm(__classid(TdmOrders), &dmOrders);
		Application->CreateForm(__classid(TfmPrefilterByCode), &fmPrefilterByCode);
		Application->Run();
        }
        catch (Exception &exception)
        {
		Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
