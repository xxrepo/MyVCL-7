unit WebServiceHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebTable,
  cxWebStdCtrls, cxWebClasses, cxWebControls, GoogleSearch, Rio,
  SOAPHTTPClient, InvokeRegistry;
  

type
  TWebServiceHomePage = class(TcxWebPageModule)
    weSearch: TcxWebEdit;
    wbtnSearch: TcxWebButton;
    WebTable: TcxWebTable;
    HTTPRIO: THTTPRIO;
    StyleController: TcxWebStyleController;
    TablePaging: TcxWebStyleItem;
    TablePagingHover: TcxWebStyleItem;
    TableAlter: TcxWebStyleItem;
    TableItems: TcxWebStyleItem;
    cxWebImage1: TcxWebImage;
    TablePagingSelected: TcxWebStyleItem;
    procedure wbtnSearchClick(Sender: TObject);
    procedure WebTableGetDisplayText(Sender: TObject;
      AColumn: TcxWebTableColumn; ARecIndex: Integer; var AText: String);
    procedure WebTableBeforeRender(Sender: TObject);
  private
    FGoogleSearchResult: GoogleSearchResult;

    procedure DoSearch(AStartIndex: Integer);
  public
    { Public declarations }
  end;

function WebServiceHomePage: TWebServiceHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, cxWebRender;

const
  GoogleResultCount = 10;

function WebServiceHomePage: TWebServiceHomePage;
begin
  Result := TWebServiceHomePage(WebContext.FindModuleClass(TWebServiceHomePage));
end;

procedure TWebServiceHomePage.DoSearch(AStartIndex: Integer);
begin
  FGoogleSearchResult := (HTTPRIO as GoogleSearchPort).doGoogleSearch('FKCgD7VRUSY2su7sPbAcDMUoOwII3aNf',
        weSearch.Text, AStartIndex * GoogleResultCount, GoogleResultCount,
        True, '', False, '', '', '');
  if FGoogleSearchResult <> nil then
  begin
    if FGoogleSearchResult.endIndex - FGoogleSearchResult.startIndex < GoogleResultCount - 1 then
      WebTable.RecordCount := FGoogleSearchResult.endIndex
    else WebTable.RecordCount := FGoogleSearchResult.estimatedTotalResultsCount;
    WebTable.PageIndex := (FGoogleSearchResult.startIndex - 1) div GoogleResultCount;
  end else WebTable.RecordCount := 0;
end;

procedure TWebServiceHomePage.wbtnSearchClick(Sender: TObject);
begin
  DoSearch(0);
end;

procedure TWebServiceHomePage.WebTableGetDisplayText(Sender: TObject;
  AColumn: TcxWebTableColumn; ARecIndex: Integer; var AText: String);
var
  AHTMLTextBuilder: TcxHTMLTextBuilder;
  AGoogleIndex: Integer;

  procedure WriteRowStyle;
  begin
    if (WebTable.AlternatingItemsStyles.Default <> nil) and (ARecIndex mod 2 = 1) then
      AHTMLTextBuilder.WriteAttribute(aClass, WebTable.AlternatingItemsStyles.Default.FullName)
    else
      if WebTable.ItemsStyles.Default <> nil then
        AHTMLTextBuilder.WriteAttribute(aClass, WebTable.ItemsStyles.Default.FullName);
  end;

begin
  AGoogleIndex := ARecIndex mod GoogleResultCount;
  if AColumn.Index = 0 then
  begin
    AHTMLTextBuilder := TcxHTMLTextBuilder.Create(GetBrowser);
    try
      AHTMLTextBuilder.WriteBeginTag(TcxHTMLTagTable);
      AHTMLTextBuilder.WriteAttribute(aRules, 'all');
      AHTMLTextBuilder.WriteAttribute(aBorder, 0);
      AHTMLTextBuilder.WriteAttribute(aCellspacing, 0);
      AHTMLTextBuilder.WriteStyleAttribute(saWidth, '100%');

      AHTMLTextBuilder.WriteBeginTag(TcxHTMLTagTr, True, False);
      //Write title
      WriteRowStyle;
      AHTMLTextBuilder.WriteBeginTag(TcxHTMLTagTd, True, False);
      AHTMLTextBuilder.WriteAttribute(aAlign, cxWebHorzAlignment[AColumn.Alignment]);
      AHTMLTextBuilder.WriteBeginTag(TcxHTMLTagA, False, False);
      AHTMLTextBuilder.WriteAttribute(aHref, FGoogleSearchResult.resultElements[AGoogleIndex].URL);
      AHTMLTextBuilder.WriteText(FGoogleSearchResult.resultElements[AGoogleIndex].title, False, False);
      AHTMLTextBuilder.WriteEndTag(TcxHTMLTagA, False, False);
      AHTMLTextBuilder.WriteEndTag(TcxHTMLTagTd, False, False);

      AHTMLTextBuilder.WriteEndTag(TcxHTMLTagTr, True, False);

      //Write Text
      AHTMLTextBuilder.WriteBeginTag(TcxHTMLTagTr, True, False);
      WriteRowStyle;
      AHTMLTextBuilder.WriteBeginTag(TcxHTMLTagTd, True, False);
      AHTMLTextBuilder.WriteText(FGoogleSearchResult.resultElements[AGoogleIndex].snippet, False, False);
      AHTMLTextBuilder.WriteEndTag(TcxHTMLTagTd, False, False);
      AHTMLTextBuilder.WriteEndTag(TcxHTMLTagTr, True, False);

      AHTMLTextBuilder.WriteEndTag(TcxHTMLTagTable);
      AText := AHTMLTextBuilder.Text;
    finally
      AHTMLTextBuilder.Free;
    end;
  end else
  begin
      AText := Format('Cache size is %s', [FGoogleSearchResult.resultElements[AGoogleIndex].cachedSize]);
  end;
end;

procedure TWebServiceHomePage.WebTableBeforeRender(Sender: TObject);
begin
  if (FGoogleSearchResult = nil) and (weSearch.Text <> '') then
    DoSearch(WebTable.PageIndex);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TWebServiceHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
