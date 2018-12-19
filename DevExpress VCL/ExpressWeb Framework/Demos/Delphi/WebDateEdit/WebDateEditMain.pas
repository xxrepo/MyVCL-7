unit WebDateEditMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TWebDateEditMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebDateEditMainForm: TWebDateEditMainForm;
 const 
    WebApplicationName = 'WebDateEditDemo';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{DF78B23C-F2D8-4076-9414-855BD38599F5}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'WebDateEditDemo Object');
end.
 
