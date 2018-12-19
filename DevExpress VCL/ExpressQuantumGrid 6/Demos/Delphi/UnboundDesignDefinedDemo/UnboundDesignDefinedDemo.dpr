program UnboundDesignDefinedDemo;

uses
  Forms,
  UnboundDesignDefinedDemoMain in 'UnboundDesignDefinedDemoMain.pas' {UnboundDesignDefinedDemoMainForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid UnboundDesignDefined Demo';
  Application.CreateForm(TUnboundDesignDefinedDemoMainForm, UnboundDesignDefinedDemoMainForm);
  Application.Run;
end.
