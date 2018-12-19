unit WebsnapAdaptersMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TWebsnapAdaptersMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebsnapAdaptersMainForm: TWebsnapAdaptersMainForm;

const
  WebApplicationName = 'WebSnapAdapterDemo';


implementation

uses ComApp;

{$R *.DFM}

const
  CLASS_ComWebApp: TGUID = '{8D19B4C2-F017-4AC7-8102-762C42B97286}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    WebApplicationName, 'WebSnapAdapterDemo Object');

end.
 
