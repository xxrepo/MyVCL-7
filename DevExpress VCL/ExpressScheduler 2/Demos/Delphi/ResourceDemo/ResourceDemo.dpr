program ResourceDemo;

uses
  Forms,
  DemoBasicMain in '..\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  ResourceMainUnit in 'ResourceMainUnit.pas' {ResourceDemoMainForm},
  RentUnit in 'RentUnit.pas' {frmRentCar},
  CancelReservationUnit in 'CancelReservationUnit.pas' {frmCancelReservation};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exotic sport cars';
  Application.CreateForm(TResourceDemoMainForm, ResourceDemoMainForm);
  Application.Run;
end.
