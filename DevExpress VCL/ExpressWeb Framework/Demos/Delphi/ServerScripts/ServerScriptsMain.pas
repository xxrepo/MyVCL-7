unit ServerScriptsMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TServerScriptsMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerScriptsMainForm: TServerScriptsMainForm;
 const 
    WebApplicationName = 'ServerScriptDemo';
implementation

{$R *.DFM}

uses
  ComApp, cxScriptDBImpl;

const
  CLASS_ComWebApp: TGUID = '{1A8A81F3-0753-4C9B-B8E6-7601C6EC76A3}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'ServerScriptDemo Object');
end.
 
