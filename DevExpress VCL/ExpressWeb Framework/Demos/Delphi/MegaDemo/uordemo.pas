unit uordemo;

interface

uses
  Windows, SysUtils, Classes, HTTPApp,
  cxWebModule, cxWebTypes, cxWebColors, cxWebClasses, cxWebStdCtrls,
  cxWebControls, cxWebData, cxWebExtData, cxWebGrids, cxWebDataCtrls;

type
  TOrderDemo = class(TcxWebPageModule)
    wedFirstName: TcxWebEdit;
    StyleController: TcxWebStyleController;
    stButtonDef: TcxWebStyleItem;
    stButtonHover: TcxWebStyleItem;
    stTips: TcxWebStyleItem;
    stLabel: TcxWebStyleItem;
    stReqFields: TcxWebStyleItem;
    stDefFields: TcxWebStyleItem;
    wlblFirstName: TcxWebLabel;
    wedLastName: TcxWebEdit;
    wlblLastName: TcxWebLabel;
    wlblAbout: TcxWebLabel;
    wedMail: TcxWebEdit;
    wlblMail: TcxWebLabel;
    wedVMail: TcxWebEdit;
    wlblVMail: TcxWebLabel;
    wlblPhone: TcxWebLabel;
    wedPhone: TcxWebEdit;
    wlblFax: TcxWebLabel;
    wedFax: TcxWebEdit;
    wlblCompany: TcxWebLabel;
    wbBuy: TcxWebButton;
    wbReset: TcxWebButton;
    wlblError: TcxWebLabel;
    wlblBAdress: TcxWebLabel;
    wlblAdress: TcxWebLabel;
    wedAdress: TcxWebEdit;
    wlblSuite: TcxWebLabel;
    wedSuite: TcxWebEdit;
    wlblCity: TcxWebLabel;
    wedCity: TcxWebEdit;
    wlblState: TcxWebLabel;
    wlblZip: TcxWebLabel;
    wedZip: TcxWebEdit;
    wlblCountry: TcxWebLabel;
    wedCountry: TcxWebEdit;
    wlblPayment: TcxWebLabel;
    wlblType: TcxWebLabel;
    wcbType: TcxWebComboBox;
    wlblNumber: TcxWebLabel;
    wedNumber: TcxWebEdit;
    wlblExpDate: TcxWebLabel;
    wcbExpMonth: TcxWebComboBox;
    wcbExpYear: TcxWebComboBox;
    wlblComments: TcxWebLabel;
    wcbState: TcxWebComboBox;
    weCompany: TcxWebEdit;
    wmComments: TcxWebMemo;
    wrbPayMethod: TcxWebRadioGroup;
    stDescription: TcxWebStyleItem;
    procedure wbBuyClick(Sender: TObject);
    procedure wbResetClick(Sender: TObject);
    procedure cxWebModuleActivate(Sender: TObject);
    procedure wbCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function OrderDemo: TOrderDemo;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, StrUtils;

function OrderDemo: TOrderDemo;
begin
  Result := TOrderDemo(WebContext.FindModuleClass(TOrderDemo));
end;

procedure TOrderDemo.wbBuyClick(Sender: TObject);
var
  TotalPriceLabel: TcxWebLabel;
begin
  wbCalcClick(Sender);

  TotalPriceLabel := TcxWebLabel(FindComponent('TotalPrice'));
  if TotalPriceLabel = nil then exit;

  if TotalPriceLabel.Caption = '$0' then
  begin
    wlblError.Caption := '&nbsp;<b>ERROR:</b>&nbsp;You have chosen no product. Please specify the number of copies in the Quantity field of the desired product.';
    wlblError.Visible := True;
    exit;
  end;
  if (wedFirstName.Text = '') or (wedLastName.Text = '') or
     (wedMail.Text = '') or (wedVMail.Text = '') or (wedAdress.Text = '') or
     (wedCity.Text = '') or (wedZip.Text = '') or (wedCountry.Text = '') or
     ((wrbPayMethod.ItemIndex = 0) and
     ((wedNumber.Text = '') or (wcbExpMonth.ItemIndex = 0) or (wcbExpYear.ItemIndex = 0))) then
  begin
    wlblError.Caption := '&nbsp;<b>ERROR:</b>&nbsp;You missed one or several required fields. Please complete this information accurately.';
    wlblError.Visible := True;
    exit;
  end;

  wbBuy.Tag := 1;
end;

procedure TOrderDemo.wbResetClick(Sender: TObject);
var
  I: Integer;
  PriceLabel, TotalPriceLabel: TcxWebLabel;
  QuantityEdit: TcxWebEdit;
begin
  I := 0;
  while true do
  begin
    PriceLabel := TcxWebLabel(FindComponent('TotalPrice' + IntToStr(I)));
    if PriceLabel = nil then break;
    PriceLabel.Caption := '$0';

    QuantityEdit := TcxWebEdit(FindComponent('Quantity' + IntToStr(I)));
    if QuantityEdit = nil then break;
    QuantityEdit.Text := '0';
    QuantityEdit.Tag := 0;

    Inc(I);
  end;
  TotalPriceLabel := TcxWebLabel(FindComponent('TotalPrice'));
  if TotalPriceLabel <> nil then
    TotalPriceLabel.Caption := '$0';

  wedFirstName.Text := '';
  wedMail.Text := '';
  wedPhone.Text := '';
  wedLastName.Text := '';
  wedVMail.Text := '';
  wedFax.Text := '';
  weCompany.Text := '';
  wedAdress.Text := '';
  wedSuite.Text := '';
  wedCity.Text := '';
  wcbState.ItemIndex := 0;
  wedZip.Text := '';
  wedCountry.Text := '';
  wrbPayMethod.ItemIndex := 0;
  wedNumber.Text := '';
  wcbType.ItemIndex := 0;
  wcbExpMonth.ItemIndex := 0;
  wcbExpYear.ItemIndex := 0;
  wmComments.Lines.Clear;
  wlblError.Visible := False;
end;

procedure TOrderDemo.cxWebModuleActivate(Sender: TObject);
begin
  wlblError.Visible := False;
end;

procedure TOrderDemo.wbCalcClick(Sender: TObject);
var
  I: Integer;
  S: string;
  Price, TotalPrice: Extended;
  PriceLabel, TotalPriceLabel: TcxWebLabel;
  QuantityEdit: TcxWebEdit;
begin
  I := 0;
  TotalPrice := 0;
  while true do
  begin
    PriceLabel := TcxWebLabel(FindComponent('Price' + IntToStr(I)));
    if PriceLabel = nil then break;
    TotalPriceLabel := TcxWebLabel(FindComponent('TotalPrice' + IntToStr(I)));
    if TotalPriceLabel = nil then break;
    QuantityEdit := TcxWebEdit(FindComponent('Quantity' + IntToStr(I)));
    if QuantityEdit = nil then break;

    try
      S := RightStr(PriceLabel.Caption, Length(PriceLabel.Caption) - 1);
      Price := StrToFloat(S) * StrToFloat(QuantityEdit.Text);
    except
      Price := 0;
    end;
    if Price > 0 then
      QuantityEdit.Tag := 1;
    TotalPriceLabel.Caption := '$' + FloatToStr(Price);

    TotalPrice := TotalPrice + Price;
    Inc(I);
  end;
  TotalPriceLabel := TcxWebLabel(FindComponent('TotalPrice'));
  if TotalPriceLabel <> nil then
    TotalPriceLabel.Caption := '$' + FloatToStr(TotalPrice);

  wlblError.Visible := False;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TOrderDemo, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
