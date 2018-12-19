program SampleDocking;

uses
  Forms,
  SampleDockingMain in 'SampleDockingMain.pas' {SampleDockingMainForm},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  SampleDockingAbout in 'SampleDockingAbout.pas' {SampleDockingAboutForm},
  SampleDockingRichText in 'SampleDockingRichText.pas' {SampleDockingRichTextFrame: TForm},
  SampleDockingRadioGroup in 'SampleDockingRadioGroup.pas' {SampleDockingRadioGroupFrame: TForm},
  SampleDockingTreeView in 'SampleDockingTreeView.pas' {SampleDockingTreeViewFrame: TForm},
  SampleDockingListBox in 'SampleDockingListBox.pas' {SampleDockingListBoxFrame: TForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars6 SampleDocking Demo';
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TSampleDockingMainForm, SampleDockingMainForm);
  Application.Run;
end.
