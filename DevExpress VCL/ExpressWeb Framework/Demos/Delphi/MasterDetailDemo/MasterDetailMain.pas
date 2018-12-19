unit MasterDetailMain;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TMasterDetailMainForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MasterDetailMainForm: TMasterDetailMainForm;
 const 
    WebApplicationName = 'MasterDetailDemo';
implementation

{$R *.DFM}

uses
  ComApp;

const
  CLASS_ComWebApp: TGUID = '{A7FE4A93-B849-4BB8-8FBA-0B955D5E4C1D}';
initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
  WebApplicationName, 'MasterDetailDemo Object');
end.
 
