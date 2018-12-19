unit CustomAttrMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TCustomAttrMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomAttrMainForm: TCustomAttrMainForm;

const 
  WebApplicationName = 'CustomAttrDemo';

implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{997A9B9D-2CC0-4706-8BFA-488F62DA4421}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'CustomAttrDemo Object');

end.
 
