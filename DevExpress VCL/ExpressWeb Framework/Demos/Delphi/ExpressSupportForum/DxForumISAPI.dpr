library DxForumISAPI;

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeDM in 'HomeDM.pas' {DM: TcxWebHomeDataModule} {*.html},
  DBPersistent in 'DBPersistent.pas',
  UDataField in 'UDataField.pas',
  UUtil in 'UUtil.pas',
  UUser in 'UUser.pas',
  pmIndex in 'pmIndex.pas' {Index: TcxWebPageModule} {*.html},
  pmRegister in 'pmRegister.pas' {Register: TcxWebPageModule} {*.html},
  pmFrames in 'pmFrames.pas' {Frames: TcxWebPageModule} {*.html},
  UUserOnTool in 'UUserOnTool.pas',
  UTools in 'UTools.pas',
  pmTree in 'pmTree.pas' {Tree: TcxWebPageModule} {*.html},
  UCategory in 'UCategory.pas',
  pmSearch in 'pmSearch.pas' {Search: TcxWebPageModule} {*.html},
  pmMenu in 'pmMenu.pas' {Menu: TcxWebPageModule} {*.html},
  pmIntro in 'pmIntro.pas' {Intro: TcxWebPageModule} {*.html},
  UUserVisit in 'UUserVisit.pas',
  UArticle in 'UArticle.pas',
  UQuestion in 'UQuestion.pas',
  pmList in 'pmList.pas' {IntroList: TcxWebPageModule} {*.html},
  pmView in 'pmView.pas' {View: TcxWebPageModule} {*.html},
  pmQuestions in 'pmQuestions.pas' {Questions: TcxWebPageModule} {*.html},
  pmViewQuest in 'pmViewQuest.pas' {Viewquest: TcxWebPageModule} {*.html},
  pmNewQuest in 'pmNewQuest.pas' {Newquest: TcxWebPageModule} {*.html},
  pmMyQuest in 'pmMyQuest.pas' {MyQuest: TcxWebPageModule} {*.html},
  pmBookmarks in 'pmBookmarks.pas' {Bookmarks: TcxWebPageModule} {*.html},
  pmAddBookmark in 'pmAddBookmark.pas' {AddBookmark: TcxWebPageModule} {*.html},
  pmViewReject in 'pmViewReject.pas' {ViewReject: TcxWebPageModule} {*.html},
  pmASearch in 'pmASearch.pas' {ASearch: TcxWebPageModule} {*.html},
  pmSearchRes in 'pmSearchRes.pas' {Searchres: TcxWebPageModule} {*.html},
  pmForgot in 'pmForgot.pas' {Forgot: TcxWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
