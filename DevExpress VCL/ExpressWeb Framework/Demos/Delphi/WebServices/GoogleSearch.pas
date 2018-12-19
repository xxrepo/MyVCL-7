// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://api.google.com/GoogleSearch.wsdl
// Version  : 1.0
// (4/19/2002 3:07:48 AM - $Revision:   1.9.1.0.1.0.1.9  $)
// ************************************************************************ //

unit GoogleSearch;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"

  DirectoryCategory    = class;                 { "urn:GoogleSearch" }
  ResultElement        = class;                 { "urn:GoogleSearch" }
  GoogleSearchResult   = class;                 { "urn:GoogleSearch" }



  // ************************************************************************ //
  // Namespace : urn:GoogleSearch
  // ************************************************************************ //
  DirectoryCategory = class(TRemotable)
  private
    FfullViewableName: String;
    FspecialEncoding: String;
  published
    property fullViewableName: String read FfullViewableName write FfullViewableName;
    property specialEncoding: String read FspecialEncoding write FspecialEncoding;
  end;



  // ************************************************************************ //
  // Namespace : urn:GoogleSearch
  // ************************************************************************ //
  ResultElement = class(TRemotable)
  private
    Fsummary: String;
    FURL: String;
    Fsnippet: String;
    Ftitle: String;
    FcachedSize: String;
    FrelatedInformationPresent: Boolean;
    FhostName: String;
    FdirectoryCategory: DirectoryCategory;
    FdirectoryTitle: String;
  public
    destructor Destroy; override;
  published
    property summary: String read Fsummary write Fsummary;
    property URL: String read FURL write FURL;
    property snippet: String read Fsnippet write Fsnippet;
    property title: String read Ftitle write Ftitle;
    property cachedSize: String read FcachedSize write FcachedSize;
    property relatedInformationPresent: Boolean read FrelatedInformationPresent write FrelatedInformationPresent;
    property hostName: String read FhostName write FhostName;
    property directoryCategory: DirectoryCategory read FdirectoryCategory write FdirectoryCategory;
    property directoryTitle: String read FdirectoryTitle write FdirectoryTitle;
  end;

  ResultElementArray = array of ResultElement;   { "urn:GoogleSearch" }
  DirectoryCategoryArray = array of DirectoryCategory;   { "urn:GoogleSearch" }


  // ************************************************************************ //
  // Namespace : urn:GoogleSearch
  // ************************************************************************ //
  GoogleSearchResult = class(TRemotable)
  private
    FdocumentFiltering: Boolean;
    FsearchComments: String;
    FestimatedTotalResultsCount: Integer;
    FestimateIsExact: Boolean;
    FresultElements: ResultElementArray;
    FsearchQuery: String;
    FstartIndex: Integer;
    FendIndex: Integer;
    FsearchTips: String;
    FdirectoryCategories: DirectoryCategoryArray;
    FsearchTime: Double;
  public
    destructor Destroy; override;
  published
    property documentFiltering: Boolean read FdocumentFiltering write FdocumentFiltering;
    property searchComments: String read FsearchComments write FsearchComments;
    property estimatedTotalResultsCount: Integer read FestimatedTotalResultsCount write FestimatedTotalResultsCount;
    property estimateIsExact: Boolean read FestimateIsExact write FestimateIsExact;
    property resultElements: ResultElementArray read FresultElements write FresultElements;
    property searchQuery: String read FsearchQuery write FsearchQuery;
    property startIndex: Integer read FstartIndex write FstartIndex;
    property endIndex: Integer read FendIndex write FendIndex;
    property searchTips: String read FsearchTips write FsearchTips;
    property directoryCategories: DirectoryCategoryArray read FdirectoryCategories write FdirectoryCategories;
    property searchTime: Double read FsearchTime write FsearchTime;
  end;


  // ************************************************************************ //
  // Namespace : urn:GoogleSearch
  // soapAction: urn:GoogleSearchAction
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : GoogleSearchBinding
  // service   : GoogleSearchService
  // port      : GoogleSearchPort
  // URL       : http://api.google.com/search/beta2
  // ************************************************************************ //
  GoogleSearchPort = interface(IInvokable)
  ['{0B396A82-A4DD-69A7-A771-6D80F8831A71}']
    function  doGetCachedPage(const key: String; const url: String): TByteDynArray; stdcall;
    function  doSpellingSuggestion(const key: String; const phrase: String): String; stdcall;
    function  doGoogleSearch(const key: String; const q: String; const start: Integer; const maxResults: Integer; const filter: Boolean; const restrict: String; const safeSearch: Boolean; const lr: String; const ie: String; const oe: String): GoogleSearchResult; stdcall;
  end;

function GetGoogleSearchPort(UseWSDL: Boolean=System.False; Addr: string=''): GoogleSearchPort;


implementation
  uses SOAPHTTPClient;

function GetGoogleSearchPort(UseWSDL: Boolean; Addr: string): GoogleSearchPort;
const
  defWSDL = 'http://api.google.com/GoogleSearch.wsdl';
  defURL  = 'http://api.google.com/search/beta2';
  defSvc  = 'GoogleSearchService';
  defPrt  = 'GoogleSearchPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  RIO := THTTPRIO.Create(nil);
  try
     if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
    Result := (RIO as GoogleSearchPort);
  finally
    if Result = nil then
      RIO.Free;
  end;
end;


destructor ResultElement.Destroy;
begin
  if Assigned(FdirectoryCategory) then
    FdirectoryCategory.Free;
  inherited Destroy;
end;

destructor GoogleSearchResult.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FresultElements)-1 do
    if Assigned(FresultElements[I]) then
      FresultElements[I].Free;
  SetLength(FresultElements, 0);
  for I := 0 to Length(FdirectoryCategories)-1 do
    if Assigned(FdirectoryCategories[I]) then
      FdirectoryCategories[I].Free;
  SetLength(FdirectoryCategories, 0);
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(GoogleSearchPort), 'urn:GoogleSearch', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(GoogleSearchPort), 'urn:GoogleSearchAction');
  RemClassRegistry.RegisterXSClass(DirectoryCategory, 'urn:GoogleSearch', 'DirectoryCategory');
  RemClassRegistry.RegisterXSClass(ResultElement, 'urn:GoogleSearch', 'ResultElement');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ResultElementArray), 'urn:GoogleSearch', 'ResultElementArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(DirectoryCategoryArray), 'urn:GoogleSearch', 'DirectoryCategoryArray');
  RemClassRegistry.RegisterXSClass(GoogleSearchResult, 'urn:GoogleSearch', 'GoogleSearchResult');

end. 
