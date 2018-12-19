unit EBarsAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TEBarsAboutForm = class(TForm)
    lbCopyright: TLabel;
    bvBottom: TBevel;
    lbCompanyName: TLabel;
    lbDemoName: TLabel;
    imgIcon: TImage;
    reDemoInfo: TRichEdit;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TEBarsAboutFormClass = class of TEBarsAboutForm;

implementation

{$R *.dfm}

end.
