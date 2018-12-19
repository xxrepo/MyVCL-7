unit WebDBTableMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TWebDBTableMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebDBTableMainForm: TWebDBTableMainForm;
 const 
    WebApplicationName = 'WebTableTest';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{FE5AD8B3-5818-407F-9650-44C415C1F5A7}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'WebTableTest Object');
end.
 
