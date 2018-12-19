unit WebChartMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TWebChartMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebChartMainForm: TWebChartMainForm;
 const 
    WebApplicationName = 'WebChartDemo';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{A3296E9B-7FD1-43FF-A59C-2B8B90FEC85A}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'WebChartDemo Object');
end.
 
