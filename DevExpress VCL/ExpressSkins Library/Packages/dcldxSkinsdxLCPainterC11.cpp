//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("dxSkinsdxLCPainterC11.res");
USEPACKAGE("dxLayoutControlC11.bpi");
USEPACKAGE("dxCoreC11.bpi");
USEPACKAGE("dxSkinsdxLCPainterC11.bpi");
USEPACKAGE("dcldxSkinsCoreC11.bpi");
USEPACKAGE("dcldxSkinsDesignHelperC11.bpi");
USEUNIT("dxSkinsdxLCPainterReg.pas");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
