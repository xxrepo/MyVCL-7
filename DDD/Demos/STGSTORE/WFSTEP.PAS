unit wfstep;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TWorkFlowStepDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    WfStepEdit: TEdit;
    procedure SetStepFld(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WorkFlowStepDlg: TWorkFlowStepDlg;

implementation

{$R *.DFM}

procedure TWorkFlowStepDlg.SetStepFld(Sender: TObject);
begin
  ActiveControl:=WfStepEdit;
  WfStepEdit.Text:='';
end;

end.
