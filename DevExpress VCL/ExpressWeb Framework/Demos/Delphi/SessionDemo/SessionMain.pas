unit SessionMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TSessionMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SessionMainForm: TSessionMainForm;

const 
  WebApplicationName = 'SessionDemo';

implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{07294F6B-48A4-4E1C-8D0A-903BEE84EDD1}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'SessionDemo Object');

end.
 
