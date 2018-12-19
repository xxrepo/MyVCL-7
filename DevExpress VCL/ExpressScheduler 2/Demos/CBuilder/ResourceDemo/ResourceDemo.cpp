//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("..\DemoBasicMain.cpp", DemoBasicMainForm);
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
USEFORM("ResourceMainUnit.cpp", ResourceDemoMainForm);
USEFORM("CancelReservationUnit.cpp", frmCancelReservation);
USEFORM("RentUnit.cpp", frmRentCar);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->Title = "Exotic sport cars";
                 Application->CreateForm(__classid(TResourceDemoMainForm), &ResourceDemoMainForm);
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
