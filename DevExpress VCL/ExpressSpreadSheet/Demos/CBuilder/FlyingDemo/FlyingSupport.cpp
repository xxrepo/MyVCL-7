//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "FlyingSupport.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)

int __fastcall Round(double const AVal)
{
  int res;
  if (AVal > 0)
    res = AVal + 0.5;
  else
    res = AVal - 0.5;
  return res;
}

