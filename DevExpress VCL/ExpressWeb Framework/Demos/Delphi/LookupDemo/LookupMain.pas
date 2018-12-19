unit LookupMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TLookupMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LookupMainForm: TLookupMainForm;
 const 
    WebApplicationName = 'LookupDemo';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{C4931405-90A2-490E-B220-273B0C397CDA}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'LookupDemo Object');
end.
 
