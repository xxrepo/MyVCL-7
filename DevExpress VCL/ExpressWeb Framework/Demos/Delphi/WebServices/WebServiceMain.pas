unit WebServiceMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Rio,
  SOAPHTTPClient, StdCtrls;

type
  TWebServiceMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebServiceMainForm: TWebServiceMainForm;
 const
    WebApplicationName = 'GoogleSearchSample';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{FD095C09-6ECE-40C4-B65E-DC1A65957446}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'GoogleSearchSample Object');

end.
