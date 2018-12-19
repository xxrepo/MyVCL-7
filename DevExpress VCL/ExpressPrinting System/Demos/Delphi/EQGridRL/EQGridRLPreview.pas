unit EQGridRLPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls;

type
  TEQGridRLPreviewForm = class(TForm)
    DBImage: TDBImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EQGridRLPreviewForm: TEQGridRLPreviewForm;

implementation

uses EQGridRLMain;

{$R *.DFM}

end.
