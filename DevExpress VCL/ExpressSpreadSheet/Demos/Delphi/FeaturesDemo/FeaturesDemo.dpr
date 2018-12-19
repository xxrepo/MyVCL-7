program FeaturesDemo;

uses
  Forms,
  FeatureChild in 'FeatureChild.pas' {FeatureChildForm},
  FeaturesMain in 'FeaturesMain.pas' {FeaturesMainForm},
  FeatureModify in 'FeatureModify.pas' {FeatureModifyForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ESS FeaturesDemo';
  Application.CreateForm(TFeaturesMainForm, FeaturesMainForm);
  FeaturesMainForm.NewSheet;
  Application.Run;
end.
