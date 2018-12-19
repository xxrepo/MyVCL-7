unit RibbonDemoAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, EBarsAbout;

type
  TRibbonDemoAboutForm = class(TEBarsAboutForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RibbonDemoAboutForm: TRibbonDemoAboutForm;

implementation

{$R *.dfm}

end.
