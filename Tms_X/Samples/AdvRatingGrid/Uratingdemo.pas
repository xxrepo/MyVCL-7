unit Uratingdemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvRatingGrid, StdCtrls, pngimage;

type
  TForm1 = class(TForm)
    AdvRatingGrid1: TAdvRatingGrid;
    AdvRatingGrid2: TAdvRatingGrid;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
