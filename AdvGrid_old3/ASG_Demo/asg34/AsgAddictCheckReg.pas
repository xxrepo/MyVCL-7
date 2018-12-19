{*********************************************************************}
{ TADVSTRINGGRID Check interface for Addict Spell Checker component   }
{ for Delphi 3.0,4.0,5.0,6.0 & C++Builder 3.0, 4.0, 5.0               }
{ version 1.93 : release July 2001                                    }
{                                                                     }
{ written by TMS Software                                             }
{            copyright © 1996-2001                                    }
{            Email : info@tmssoftware.com                             }
{            Web : http://www.tmssoftware.com                         }
{*********************************************************************}

unit AsgAddictCheckReg;

interface

uses
  Classes, AsgAddictCheck;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TMS Grids', [TAddictCheck]);
end;

end.

