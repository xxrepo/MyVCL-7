unit cMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons,
  ExtCtrls, DBCtrls, DB, DBTables, Mask, ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  WebApplicationName = 'WebMegaDemo';

implementation

uses ComApp;

{$R *.DFM}

const
  CLASS_ComWebApp: TGUID = '{7F8954EF-A551-4CDB-8760-1DD8532CF59B}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    WebApplicationName, 'WebMegaDemo Object');

end.
