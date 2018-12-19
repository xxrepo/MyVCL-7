unit ClientEventsMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TClientEventsMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientEventsMainForm: TClientEventsMainForm;
 const 
    WebApplicationName = 'ClientEventsDemo';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{6720D795-3D99-477B-AD0B-488C3BB8EEA9}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'ClientEventsDemo Object');
end.
 
