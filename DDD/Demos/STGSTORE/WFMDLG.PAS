unit wfmdlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TWfModelDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    ModelNameEdit: TEdit;
    procedure SetActiveCtrl(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WfModelDlg: TWfModelDlg;

implementation

{$R *.DFM}

procedure TWfModelDlg.SetActiveCtrl(Sender: TObject);
begin
  ActiveControl:=ModelNameEdit;
  ModelNameEdit.text:='';
end;

end.
