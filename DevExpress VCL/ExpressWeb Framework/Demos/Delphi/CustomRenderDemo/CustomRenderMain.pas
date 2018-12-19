unit CustomRenderMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TCustomRenderMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomRenderMainForm: TCustomRenderMainForm;
 const 
    WebApplicationName = 'NewRenderDemo';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{B932493A-3866-4779-A2C2-39575B3D6F14}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'NewRenderDemo Object');
end.
