program MDIDemo;

uses
  Forms,
  MDIDemoMain in 'MDIDemoMain.pas' {frmMDIMain},
  MDIDemoChild in 'MDIDemoChild.pas' {frmMDIChild},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo};

{$R *.RES}

begin
  Application.Title := 'ExpressBars MDI Demo';
  Application.Initialize;
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TfrmMDIMain, frmMDIMain);
  Application.CreateForm(TEBarsDemoRatingForm, EBarsDemoRatingForm);
  Application.Run;
end.
