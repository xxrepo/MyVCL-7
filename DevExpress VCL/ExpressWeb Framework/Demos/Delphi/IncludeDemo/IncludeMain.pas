unit IncludeMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TIncludeMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IncludeMainForm: TIncludeMainForm;
 const 
    WebApplicationName = 'IncludeDemo';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{CC4E7526-D276-4389-8024-E57030D1D7FF}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'IncludeDemo Object');
end.
 
