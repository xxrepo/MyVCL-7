program TextEdit;

uses
  Forms, //sConst,
  MDIFrame in 'MDIFrame.pas' {FrameForm},
  MDIEdit in 'MDIEdit.pas' {EditForm};

{$R *.RES}

begin
  Application.CreateForm(TFrameForm, FrameForm);
//  DrawSkinnedMDIWall := False;
//  Application.MainFormOnTaskBar := True;
  Application.Run;
end.
