unit SampleDockingAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, EBarsAbout;

type
  TSampleDockingAboutForm = class(TEBarsAboutForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SampleDockingAboutForm: TSampleDockingAboutForm;

implementation

{$R *.dfm}

end.
