unit LoginMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TLoginMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginMainForm: TLoginMainForm;

const 
  WebApplicationName = 'LoginDemo';

implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{1834F09A-F599-48BA-9254-886434F815BF}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'LoginDemo Object');

end.
 
