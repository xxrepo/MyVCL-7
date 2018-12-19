unit cxWebLabelCustomRender;

interface

uses
  cxWebRender, cxWebControls, cxWebStdCtrls;

type
  TcxWebLabelNewRenderer = class(TcxCustomWebLabelRenderer)
  public
    class function IsBrowserSupported(AWebBrowser: TcxWebBrowserClass): Boolean; override;
    procedure WriteHTML; override;
  end;

  TcxWebURLLabelNewRenderer = class(TcxWebControlRenderer)
  public
    class function IsBrowserSupported(AWebBrowser: TcxWebBrowserClass): Boolean; override;
    procedure WriteHTML; override;
  end;

implementation

{ TcxWebLabelNewRenderer }

class function TcxWebLabelNewRenderer.IsBrowserSupported(AWebBrowser: TcxWebBrowserClass): Boolean;
begin
  Result := AWebBrowser = TcxWebBrowserIE;
end;

procedure TcxWebLabelNewRenderer.WriteHTML;
begin
  HTMLTextBuilder.WriteBeginTag(TcxHTMLTagDiv, True, False);
  WriteID;
  WriteDefaultStyle;
  WriteTextAlignment;
  WriteAttributes;
  WriteStyleAttributes;
  WriteSize;
  WritePosition;
  WriteZIndex;
  WriteEvents;
  WriteHint;
  if WebLabel.Caption = '' then
    HTMLTextBuilder.WriteStyleAttribute(saOverflow, 'hidden');
  HTMLTextBuilder.WriteStyleAttribute(saBackgroundColor, 'yellow');
  WriteCaption;
  HTMLTextBuilder.WriteEndTag(TcxHTMLTagDiv, False, True);
end;

{ TcxWebURLLabelNewRenderer }

class function TcxWebURLLabelNewRenderer.IsBrowserSupported(AWebBrowser: TcxWebBrowserClass): Boolean;
begin
  Result := True;
end;

procedure TcxWebURLLabelNewRenderer.WriteHTML;
begin
  HTMLTextBuilder.WriteBeginTag(TcxHTMLTagDiv);
  WriteID;
//  WriteAttributes;
//  WriteStyleAttributes;
  WriteSize;
  WritePosition;
  WriteZIndex;
  HTMLTextBuilder.WriteStyleAttribute(saBorderWidth, 1, 'px');
  HTMLTextBuilder.WriteStyleAttribute(saBorderColor, 'red');
  HTMLTextBuilder.WriteStyleAttribute(saBorderStyle, 'solid');
  HTMLTextBuilder.WriteBeginTag(TcxHTMLTagA, True, False);
  (WebControl as TcxWebURLLabel).URL.Write(HTMLTextBuilder);
//  WriteDefaultStyle;
//  WriteEvents;
  WriteHint;
  HTMLTextBuilder.WriteText((WebControl as TcxWebURLLabel).Caption, False, False);
  HTMLTextBuilder.WriteEndTag(TcxHTMLTagA, False, True);
  HTMLTextBuilder.WriteEndTag(TcxHTMLTagDiv);
end;

initialization
  WebRendererFactory.RegisterRenderer(TcxWebLabel, TcxWebLabelNewRenderer);
  WebRendererFactory.RegisterRenderer(TcxWebURLLabel, TcxWebURLLabelNewRenderer);  
  
end.
