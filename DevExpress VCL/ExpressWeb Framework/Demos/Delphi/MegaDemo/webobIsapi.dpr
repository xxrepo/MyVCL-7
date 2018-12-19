library webobIsapi;

uses
  Forms,
  WebBroker,
  ISAPIApp,
  uMainPage in 'uMainPage.pas' {MainPage: TWebAppPageModule},
  uHome in 'uHome.pas' {Home: TcxWebModule} {*.html},
  uDemos in 'uDemos.pas' {Demos: TcxWebModule} {*.html},
  uOrder in 'uOrder.pas' {Order: TcxWebModule} {*.html},
  uLinks in 'uLinks.pas' {Links: TcxWebModule} {*.html},
  uContact in 'uContact.pas' {Contact: TcxWebModule} {*.html},
  uTreeDemo1 in 'utreedemo1.pas' {TreeDemo1: TcxWebModule} {*.html},
  ugriddemo1 in 'ugriddemo1.pas' {GridDemo1: TcxWebModule} {*.html},
  uDataCtrlsDemo1 in 'uDataCtrlsDemo1.pas' {DataCtrlsDemo1: TcxWebModule} {*.html},
  uB2Csd in 'uB2Csd.pas' {b2csd: TcxWebModule} {*.html},
  uMyFavor in 'uMyFavor.pas' {myfavor: TcxWebModule} {*.html},
  uOrDemo in 'uOrDemo.pas' {OrderDemo: TcxWebModule} {*.html},
  uCalendarDemo in 'uCalendarDemo.pas' {CalendarDemo: TcxWebModule} {*.html},
  uMenuDemo in 'uMenuDemo.pas' {MenuDemo1: TcxWebPageModule} {*.html},
  uDataSourceDemo in 'uDataSourceDemo.pas' {DataSourceDemo: TcxWebPageModule} {*.html};  

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;


begin
  Application.Initialize;
  Application.Run;
end.
