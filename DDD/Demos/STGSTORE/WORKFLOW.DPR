program workflow;

uses
  Forms,
  wfMain in 'wfMain.pas' {WfModelForm},
  WfSub in 'WfSub.pas' {WfSubClassForm},
  E_StgStr in 'E_StgStr.pas',
  wfmdlg in 'wfmdlg.pas' {WfModelDlg},
  wfstep in 'wfstep.pas' {WorkFlowStepDlg};

{$R *.RES}

begin
  Application.Title := 'Work Flow Builder';
  Application.CreateForm(TWfModelForm, WfModelForm);
  Application.CreateForm(TWfSubClassForm, WfSubClassForm);
  Application.CreateForm(TWfModelDlg, WfModelDlg);
  Application.CreateForm(TWorkFlowStepDlg, WorkFlowStepDlg);
  Application.Run;
end.
