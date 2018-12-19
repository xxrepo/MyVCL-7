unit TabControlTestMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TTabControlTestMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabControlTestMainForm: TTabControlTestMainForm;
 const 
    WebApplicationName = 'JimmyFirstControlTest';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{40DECC1B-D19A-4C63-A2EF-662B2CAC2EE2}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'JimmyFirstControlTest Object');
end.
 
