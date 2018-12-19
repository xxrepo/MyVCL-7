unit FramesMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TFramesMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FramesMainForm: TFramesMainForm;

const 
  WebApplicationName = 'FramesDemo';

implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{B1E06CCC-3289-4B1A-BA81-3CB43A8DF31A}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'FramesDemo Object');

end.
 
