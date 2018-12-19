unit form;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
 const 
    WebApplicationName = 'DxForum';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{233ABF6E-72B2-4A59-AE4D-A996BFA265F7}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'DxForum Object');
end.
