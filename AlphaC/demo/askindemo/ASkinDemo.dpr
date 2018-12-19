program ASkinDemo;

uses
  Forms,
  SysUtils,
  MainUnit in 'MainUnit.pas' {MainForm},
  UnitFrameDemo in 'UnitFrameDemo.pas' {FrameDemo: TFrame},
  UnitInherited1 in 'UnitInherited1.pas' {FrameInherited1: TFrame},
  UnitPanels in 'UnitPanels.pas' {FramePanels: TFrame},
  UnitCheckBoxes in 'UnitCheckBoxes.pas' {FrameCheckBoxes: TFrame},
  UnitScrolls in 'UnitScrolls.pas' {FrameScrolls: TFrame},
  UnitButtons in 'UnitButtons.pas' {FrameButtons: TFrame},
  UnitForms in 'UnitForms.pas' {FrameForms: TFrame},
  UnitScrollBoxes in 'UnitScrollBoxes.pas' {FrameScrollBoxes: TFrame},
  UnitTabControls in 'UnitTabControls.pas' {FrameTabControls: TFrame},
  UnitListViews in 'UnitListViews.pas' {FrameListViews: TFrame},
  UnitFrames in 'UnitFrames.pas' {FrameFrames: TFrame},
  UnitFrameTest in 'UnitFrameTest.pas' {FrameTest: TFrame},
  UnitFrameDialogs in 'UnitFrameDialogs.pas' {FrameDialogs: TFrame},
  UnitBarControls in 'UnitBarControls.pas' {FrameBarControls: TFrame},
  UnitEditorsAdd in 'UnitEditorsAdd.pas' {FrameEditorsAdd: TFrame},
  FrameFrameBar in 'FrameFrameBar.pas' {FrameBar: TFrame},
  UnitOtherAdd in 'UnitOtherAdd.pas' {FrameOtherAdd: TFrame},
  UnitInvisible in 'UnitInvisible.pas' {FrameInvisible: TFrame},
  UnitContact in 'UnitContact.pas' {FrameContact: TFrame},
  UnitHints in 'UnitHints.pas' {FrameHints: TFrame},
  UnitShellCtrls in 'UnitShellCtrls.pas' {FrameShellControls: TFrame},
  UnitSkinManager in 'UnitSkinManager.pas' {FrameSkinManager: TFrame},
  UnitMultiSkin in 'UnitMultiSkin.pas' {FormMultiSkin},
  FrameAbout in 'FrameAbout.pas' {FrameAbout: TFrame},
  UnitStdVCL in 'UnitStdVCL.pas' {FrameStdVCL: TFrame},
  Classes in '..\..\..\..\Source\Rtl\Common\Classes.pas';

{$R *.RES}

begin
  Application.Initialize;
//  SysUtils.SysLocale.MiddleEast := True;
//  Application.HelpFile := 'e:\Help\Winhelp\ahelp.hlp';
  Application.Title := 'AlphaControls 2010 demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
