unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ColorGrd, StdCtrls, dxMasterView, ExtCtrls, Buttons, Db, DBTables;

type
  TfmMain = class(TForm)
    pnBottom: TPanel;
    MasterView: TdxMasterView;
    ColorDialog: TColorDialog;
    FontDialog: TFontDialog;
    tbCustomer: TTable;
    dsCustomer: TDataSource;
    tbOrders: TTable;
    dsOrders: TDataSource;
    Level1: TdxMasterViewLevel;
    CustNo: TdxMasterViewColumn;
    Company: TdxMasterViewColumn;
    Addr1: TdxMasterViewColumn;
    Addr2: TdxMasterViewColumn;
    City: TdxMasterViewColumn;
    State: TdxMasterViewColumn;
    Zip: TdxMasterViewColumn;
    Country: TdxMasterViewColumn;
    Phone: TdxMasterViewColumn;
    FAX: TdxMasterViewColumn;
    TaxRate: TdxMasterViewColumn;
    Contact: TdxMasterViewColumn;
    LastInvoiceDate: TdxMasterViewColumn;
    Level2: TdxMasterViewLevel;
    OrderNo: TdxMasterViewColumn;
    CustNoL2: TdxMasterViewColumn;
    SaleDate: TdxMasterViewColumn;
    ShipDate: TdxMasterViewColumn;
    EmpNo: TdxMasterViewColumn;
    ShipToContact: TdxMasterViewColumn;
    ShipToAddr1: TdxMasterViewColumn;
    ShipToAddr2: TdxMasterViewColumn;
    ShipToCity: TdxMasterViewColumn;
    ShipToState: TdxMasterViewColumn;
    ShipToZip: TdxMasterViewColumn;
    ShipToCountry: TdxMasterViewColumn;
    ShipToPhone: TdxMasterViewColumn;
    ShipVIA: TdxMasterViewColumn;
    PO: TdxMasterViewColumn;
    Terms: TdxMasterViewColumn;
    PaymentMethod: TdxMasterViewColumn;
    ItemsTotal: TdxMasterViewColumn;
    TaxRateL2: TdxMasterViewColumn;
    Freight: TdxMasterViewColumn;
    AmountPaid: TdxMasterViewColumn;
    Style1: TdxMasterViewStyle;
    Style2: TdxMasterViewStyle;
    pnLeft: TPanel;
    GroupBox1: TGroupBox;
    btnNew: TButton;
    btnDelete: TButton;
    btnColor: TButton;
    plColor: TPanel;
    plAnotherColor: TPanel;
    btnAnotherColor: TButton;
    btnFont: TButton;
    cmbLevels: TComboBox;
    cmbLevelElements: TComboBox;
    cmbLevelStyle: TComboBox;
    cmbColumns: TComboBox;
    cmbColumnElements: TComboBox;
    cmbColumnStyle: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnCustomize: TButton;
    cmbStyles: TListBox;
    procedure btnColorClick(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbStylesChange(Sender: TObject);
    procedure btnAnotherColorClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure cmbLevelsChange(Sender: TObject);
    procedure cmbColumnsChange(Sender: TObject);
    procedure cmbLevelElementsChange(Sender: TObject);
    procedure cmbColumnElementsChange(Sender: TObject);
    procedure cmbLevelStyleChange(Sender: TObject);
    procedure cmbColumnStyleChange(Sender: TObject);
    procedure btnCustomizeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    procedure StyleControlsUpdate;
    procedure FillColumnsCombos(Level: TdxMasterViewLevel);
    procedure AssignStyles;
  public
    CurrentStyle: TdxMasterViewStyle;
    CurrentLevel: TdxMasterViewLevel;
    CurrentColumn: TdxMasterViewColumn;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.DFM}

//set color for style
procedure TfmMain.btnColorClick(Sender: TObject);
begin
  if CurrentStyle <> nil then
  begin
    ColorDialog.Color := CurrentStyle.Color;
    if ColorDialog.Execute then
    begin
      CurrentStyle.Color := ColorDialog.Color;
      StyleControlsUpdate;
    end;
  end;  
end;

//set font for style
procedure TfmMain.btnFontClick(Sender: TObject);
begin
  if CurrentStyle <> nil then
  begin
    FontDialog.Font := CurrentStyle.Font;
    if FontDialog.Execute then
    begin
      CurrentStyle.Font := FontDialog.Font;
      StyleControlsUpdate;
    end;
  end;  
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  i: Integer;
  S: TdxMasterViewStyle;
begin
  //fill the cmbStyle
  for i := 0 to MasterView.StyleCount - 1 do
  begin
    S := MasterView.Styles[i];
    cmbStyles.Items.addObject(S.Name, S);
  end;
  cmbStyles.ItemIndex := 0;
  cmbStylesChange(nil);
  //assign cmbStyles with 
  AssignStyles;

  //Set the current level
  cmbLevels.ItemIndex := 0;
  cmbLevelsChange(cmbLevels);

end;

procedure TfmMain.cmbStylesChange(Sender: TObject);
begin
  if cmbStyles.Items.Count > 0 then
    CurrentStyle :=   TdxMasterviewStyle(cmbStyles.Items.Objects[cmbStyles.ItemIndex])
  else
    CurrentStyle := nil;
  StyleControlsUpdate;
end;

//update visual controls tied to the current style
procedure TfmMain.StyleControlsUpdate;
begin
  plColor.Color := clBtnFace;
  plAnotherColor.Color := clBtnFace;
  plColor.Caption := '';
  plAnotherColor.Caption := '';

  if CurrentStyle <> nil then
  begin
    //set another color, if it was assigned
    if svAnotherColor in  CurrentStyle.AssignedValues then
      plAnotherColor.Color := CurrentStyle.AnotherColor;
    //set a color, if it was assigned
    if svColor in  CurrentStyle.AssignedValues then
    begin
      plColor.Color := CurrentStyle.Color;
    end;
    //set a font, if it was assigned
    if svFont in  CurrentStyle.AssignedValues then
    begin
      plColor.Font := CurrentStyle.Font;
      plColor.Caption := 'Font';
      plAnotherColor.Font := CurrentStyle.Font;
      plAnotherColor.Caption := 'Font';
    end;
  end
  else
    cmbStyles.Items.Clear;
end;

procedure TfmMain.btnAnotherColorClick(Sender: TObject);
begin
  if CurrentStyle <> nil then
  begin
    ColorDialog.Color := CurrentStyle.AnotherColor;
    if ColorDialog.Execute then
    begin
      CurrentStyle.AnotherColor := ColorDialog.Color;
      StyleControlsUpdate;
    end;
  end;  
end;

//create a new style
procedure TfmMain.btnNewClick(Sender: TObject);
var
  LevelItemIndex, ColumnItemIndex: Integer;
begin
  CurrentStyle := TdxMasterViewStyle.Create(MasterView);
  CurrentStyle.Name := 'Style'+IntToStr(cmbStyles.Items.Count + 1);
  cmbStyles.Items.AddObject(CurrentStyle.Name,CurrentStyle);
  cmbStyles.ItemIndex := cmbStyles.Items.Count - 1;
  cmbStylesChange(nil);

  if cmbLevelStyle.Items.Strings[cmbLevelStyle.ItemIndex] <> 'None' then
    LevelItemIndex := cmbLevelStyle.ItemIndex
  else
    LevelItemIndex := cmbLevelStyle.ItemIndex + 1;
  if cmbColumnStyle.Items.Strings[cmbColumnStyle.ItemIndex] <> 'None' then
    ColumnItemIndex := cmbColumnStyle.ItemIndex
  else
    ColumnItemIndex := cmbColumnStyle.ItemIndex + 1;
  AssignStyles;
  cmbLevelStyle.ItemIndex := LevelItemIndex;
  cmbColumnStyle.ItemIndex := ColumnItemIndex;
end;

//delete the current style
procedure TfmMain.btnDeleteClick(Sender: TObject);
var
  LevelItemIndex, ColumnItemIndex: Integer;
begin
  cmbStyles.Items.Delete(cmbStyles.ItemIndex);
  CurrentStyle.Free;
  CurrentStyle := nil;
  cmbStyles.ItemIndex := cmbStyles.Items.Count - 1;
  cmbStylesChange(cmbStyles);

  if cmbLevelStyle.Items.Strings[cmbLevelStyle.ItemIndex] <> 'None' then
    LevelItemIndex := cmbLevelStyle.ItemIndex
  else
    LevelItemIndex := cmbLevelStyle.ItemIndex - 1;
  if cmbColumnStyle.Items.Strings[cmbColumnStyle.ItemIndex] <> 'None' then
    ColumnItemIndex := cmbColumnStyle.ItemIndex
  else
    ColumnItemIndex := cmbColumnStyle.ItemIndex - 1;
  AssignStyles;
  cmbLevelStyle.ItemIndex := LevelItemIndex;
  cmbColumnStyle.ItemIndex := ColumnItemIndex;
end;


procedure TfmMain.cmbLevelsChange(Sender: TObject);
begin
  case TComboBox(Sender).ItemIndex of
    0 : CurrentLevel := Level1;
    1 : CurrentLevel := Level2;
  end;

  //fill cmbColumns
  FillColumnsCombos(CurrentLevel);
  cmbColumnsChange(cmbColumns);

  //set the cmbLevelElements value
  cmbLevelElements.ItemIndex := 0;
  cmbLevelElementsChange(cmbLevelElements);
end;

procedure TfmMain.FillColumnsCombos(Level: TdxMasterViewLevel);
var
  i: Integer;
begin
  if Level <> nil then
  begin
    //Fill the cmbColumns
    cmbColumns.Clear;
    for i := 0 to Level.ColumnCount - 1 do
      cmbColumns.Items.AddObject(Level.Columns[i].Name,Level.Columns[i]);
    cmbColumns.ItemIndex := 0;
  end;
end;


procedure TfmMain.cmbColumnsChange(Sender: TObject);
var
  Index: Integer;
  ComboBox: TComboBox;
begin
  ComboBox := TCombobox(Sender);
  Index := Combobox.ItemIndex;
  //Set current column
  CurrentColumn := Combobox.Items.Objects[Index] as TdxMasterViewColumn;
  //set the cmbColumnElements value
  cmbColumnElements.ItemIndex := 0;
  cmbColumnElementsChange(cmbColumnElements);
end;

procedure TfmMain.cmbLevelElementsChange(Sender: TObject);
begin
    case cmbLevelElements.ItemIndex of
    0 : if CurrentLevel.CaptionStyle <> nil then
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf(CurrentLevel.CaptionStyle.Name)
        else
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf('None');
    1 : if CurrentLevel.ContentStyle <> nil then
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf(CurrentLevel.ContentStyle.Name)
        else
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf('None');
    2 : if CurrentLevel.FooterStyle <> nil then
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf(CurrentLevel.FooterStyle.Name)
        else
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf('None');
    3 : if CurrentLevel.GroupByBoxStyle <> nil then
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf(CurrentLevel.GroupByBoxStyle.Name)
        else
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf('None');
    4 : if CurrentLevel.GroupStyle <> nil then
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf(CurrentLevel.GroupStyle.Name)
        else
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf('None');
    5 : if CurrentLevel.HeaderStyle <> nil then
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf(CurrentLevel.HeaderStyle.Name)
        else
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf('None');
    6 : if CurrentLevel.PreviewStyle <> nil then
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf(CurrentLevel.PreviewStyle.Name)
        else
          cmbLevelStyle.ItemIndex := cmbLevelStyle.Items.IndexOf('None');
    end;
end;

procedure TfmMain.cmbColumnElementsChange(Sender: TObject);
begin
  case cmbColumnElements.ItemIndex of
    0 : if CurrentColumn.ContentStyle <> nil then
          cmbColumnStyle.ItemIndex := cmbColumnStyle.Items.IndexOf(CurrentColumn.ContentStyle.Name)
        else
          cmbColumnStyle.ItemIndex := cmbColumnStyle.Items.IndexOf('None');
    1 : if CurrentColumn.FooterStyle <> nil then
          cmbColumnStyle.ItemIndex := cmbColumnStyle.Items.IndexOf(CurrentColumn.FooterStyle.Name)
        else
          cmbColumnStyle.ItemIndex := cmbColumnStyle.Items.IndexOf('None');
    2 : if CurrentColumn.HeaderStyle <> nil then
          cmbColumnStyle.ItemIndex := cmbColumnStyle.Items.IndexOf(CurrentColumn.HeaderStyle.Name)
        else
          cmbColumnStyle.ItemIndex := cmbColumnStyle.Items.IndexOf('None');
    end;
end;

procedure TfmMain.cmbLevelStyleChange(Sender: TObject);
begin
   case cmbLevelElements.ItemIndex of
     0 : CurrentLevel.CaptionStyle := TdxMasterViewStyle(cmbLevelStyle.Items.Objects[cmbLevelStyle.ItemIndex]);
     1 : CurrentLevel.ContentStyle := TdxMasterViewStyle(cmbLevelStyle.Items.Objects[cmbLevelStyle.ItemIndex]);
     2 : CurrentLevel.FooterStyle := TdxMasterViewStyle(cmbLevelStyle.Items.Objects[cmbLevelStyle.ItemIndex]);
     3 : CurrentLevel.GroupByBoxStyle := TdxMasterViewStyle(cmbLevelStyle.Items.Objects[cmbLevelStyle.ItemIndex]);
     4 : CurrentLevel.GroupStyle := TdxMasterViewStyle(cmbLevelStyle.Items.Objects[cmbLevelStyle.ItemIndex]);
     5 : CurrentLevel.HeaderStyle := TdxMasterViewStyle(cmbLevelStyle.Items.Objects[cmbLevelStyle.ItemIndex]);
     6 : CurrentLevel.PreviewStyle := TdxMasterViewStyle(cmbLevelStyle.Items.Objects[cmbLevelStyle.ItemIndex]);
   end;
end;

procedure TfmMain.cmbColumnStyleChange(Sender: TObject);
begin
  case cmbColumnElements.ItemIndex of
    0 : CurrentColumn.ContentStyle := TdxMasterViewStyle(cmbColumnStyle.Items.Objects[cmbColumnStyle.ItemIndex]);
    1 : CurrentColumn.FooterStyle := TdxMasterViewStyle(cmbColumnStyle.Items.Objects[cmbColumnStyle.ItemIndex]);
    2 : CurrentColumn.HeaderStyle := TdxMasterViewStyle(cmbColumnStyle.Items.Objects[cmbColumnStyle.ItemIndex]);
  end;
end;

procedure TfmMain.btnCustomizeClick(Sender: TObject);
begin
  MasterView.Customizing := not MasterView.Customizing;
end;

procedure TfmMain.AssignStyles;
begin
  cmbLevelStyle.Items.Assign(cmbStyles.Items);
  cmbLevelStyle.Items.Add('None');
  cmbColumnStyle.Items.Assign(cmbStyles.Items);
  cmbColumnStyle.Items.Add('None');
end;

end.
