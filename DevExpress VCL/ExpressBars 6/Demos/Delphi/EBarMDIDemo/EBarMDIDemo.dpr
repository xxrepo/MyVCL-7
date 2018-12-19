program EBarMDIDemo;

uses
  Forms,
  EBarMDIDemoMain in 'EBarMDIDemoMain.pas' {EBarMDIDemoMainForm},
  EBarMDIDemoChild in 'EBarMDIDemoChild.pas' {EBarMDIDemoChildForm},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  EBarMDIDemoAbout in 'EBarMDIDemoAbout.pas' {EBarMDIDemoAboutForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule};

{$R *.RES}

begin
  Application.Title := 'ExpressBars6 MDI Demo';
  Application.Initialize;
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TEBarMDIDemoMainForm, EBarMDIDemoMainForm);
  Application.CreateForm(TEBarsDemoRatingForm, EBarsDemoRatingForm);
  Application.CreateForm(TEBarMDIDemoAboutForm, EBarMDIDemoAboutForm);
  Application.Run;
end.
