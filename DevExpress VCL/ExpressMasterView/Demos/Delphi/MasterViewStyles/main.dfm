object fmMain: TfmMain
  Left = 216
  Top = 110
  Width = 696
  Height = 487
  Caption = 'ExpressMasterView - Styles Demo'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnBottom: TPanel
    Left = 0
    Top = 392
    Width = 688
    Height = 68
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Level'
    end
    object Label2: TLabel
      Left = 160
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Element'
    end
    object Label3: TLabel
      Left = 320
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Style'
    end
    object Label4: TLabel
      Left = 4
      Top = 46
      Width = 35
      Height = 13
      Caption = 'Column'
    end
    object Label5: TLabel
      Left = 160
      Top = 46
      Width = 38
      Height = 13
      Caption = 'Element'
    end
    object Label6: TLabel
      Left = 320
      Top = 46
      Width = 23
      Height = 13
      Caption = 'Style'
    end
    object cmbLevels: TComboBox
      Left = 48
      Top = 8
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Items.Strings = (
        'Level1'
        'Level2')
      TabOrder = 0
      OnChange = cmbLevelsChange
    end
    object cmbLevelElements: TComboBox
      Left = 208
      Top = 8
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Items.Strings = (
        'Caption'
        'Content'
        'Footer'
        'GroupByBox'
        'Group'
        'Header'
        'Preview')
      TabOrder = 1
      OnChange = cmbLevelElementsChange
    end
    object cmbLevelStyle: TComboBox
      Left = 352
      Top = 8
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = cmbLevelStyleChange
    end
    object cmbColumns: TComboBox
      Left = 48
      Top = 38
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = cmbColumnsChange
    end
    object cmbColumnElements: TComboBox
      Left = 208
      Top = 38
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Items.Strings = (
        'Content'
        'Footer'
        'Header')
      TabOrder = 4
      OnChange = cmbColumnElementsChange
    end
    object cmbColumnStyle: TComboBox
      Left = 352
      Top = 38
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnChange = cmbColumnStyleChange
    end
  end
  object MasterView: TdxMasterView
    Left = 0
    Top = 0
    Width = 503
    Height = 392
    Align = alClient
    TabOrder = 1
    object Style1: TdxMasterViewStyle
      AnotherColor = clInfoBk
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      AssignedValues = [svAnotherColor, svColor, svFont]
    end
    object Style2: TdxMasterViewStyle
      Color = 11041630
      AssignedValues = [svColor]
    end
    object Level1: TdxMasterViewLevel
      Caption = 'Level1'
      ContentStyle = Style1
      DataSource = dsCustomer
      HeaderStyle = Style2
      ID = 'CustNo'
      OptionsCustomizeBox = [loxCaption, loxColumns, loxFooter, loxGrid, loxGroupByBox, loxHeader, loxPreview, loxViewMode]
      OptionsView = [lovFooter, lovGrid, lovGridWithPreview, lovGroupByBox, lovHeader, lovOccupyRestSpace]
      PreviewFieldName = 'Company'
      object CustNo: TdxMasterViewColumn
        FieldName = 'CustNo'
        RowIndex = 0
        ColIndex = 0
        SummaryType = stCount
      end
      object Company: TdxMasterViewColumn
        FieldName = 'Company'
        RowIndex = 0
        ColIndex = 1
      end
      object Addr1: TdxMasterViewColumn
        FieldName = 'Addr1'
        RowIndex = 0
        ColIndex = 2
      end
      object Addr2: TdxMasterViewColumn
        FieldName = 'Addr2'
        RowIndex = 0
        ColIndex = 3
      end
      object City: TdxMasterViewColumn
        FieldName = 'City'
        RowIndex = 0
        ColIndex = 4
      end
      object State: TdxMasterViewColumn
        FieldName = 'State'
        RowIndex = 0
        ColIndex = 5
      end
      object Zip: TdxMasterViewColumn
        FieldName = 'Zip'
        RowIndex = 0
        ColIndex = 6
      end
      object Country: TdxMasterViewColumn
        FieldName = 'Country'
        RowIndex = 0
        ColIndex = 7
      end
      object Phone: TdxMasterViewColumn
        FieldName = 'Phone'
        RowIndex = 0
        ColIndex = 8
      end
      object FAX: TdxMasterViewColumn
        FieldName = 'FAX'
        RowIndex = 0
        ColIndex = 9
      end
      object TaxRate: TdxMasterViewColumn
        FieldName = 'TaxRate'
        RowIndex = 0
        ColIndex = 10
      end
      object Contact: TdxMasterViewColumn
        FieldName = 'Contact'
        RowIndex = 0
        ColIndex = 11
      end
      object LastInvoiceDate: TdxMasterViewColumn
        Caption = 'LastInvoice Date'
        FieldName = 'LastInvoiceDate'
        RowIndex = 0
        ColIndex = 12
      end
      object Level2: TdxMasterViewLevel
        Caption = 'Level2'
        DataSource = dsOrders
        DetailKey = 'CustNo'
        ID = 'OrderNo'
        MasterKey = 'CustNo'
        OptionsCustomizeBox = [loxCaption, loxColumns, loxFooter, loxGrid, loxGroupByBox, loxHeader, loxPreview, loxViewMode]
        object OrderNo: TdxMasterViewColumn
          FieldName = 'OrderNo'
          RowIndex = 0
          ColIndex = 0
        end
        object CustNoL2: TdxMasterViewColumn
          FieldName = 'CustNo'
          RowIndex = 0
          ColIndex = 1
        end
        object SaleDate: TdxMasterViewColumn
          FieldName = 'SaleDate'
          RowIndex = 0
          ColIndex = 2
        end
        object ShipDate: TdxMasterViewColumn
          FieldName = 'ShipDate'
          RowIndex = 0
          ColIndex = 3
        end
        object EmpNo: TdxMasterViewColumn
          FieldName = 'EmpNo'
          RowIndex = 0
          ColIndex = 4
        end
        object ShipToContact: TdxMasterViewColumn
          FieldName = 'ShipToContact'
          RowIndex = 0
          ColIndex = 5
        end
        object ShipToAddr1: TdxMasterViewColumn
          FieldName = 'ShipToAddr1'
          RowIndex = 0
          ColIndex = 6
        end
        object ShipToAddr2: TdxMasterViewColumn
          FieldName = 'ShipToAddr2'
          RowIndex = 0
          ColIndex = 7
        end
        object ShipToCity: TdxMasterViewColumn
          FieldName = 'ShipToCity'
          RowIndex = 0
          ColIndex = 8
        end
        object ShipToState: TdxMasterViewColumn
          FieldName = 'ShipToState'
          RowIndex = 0
          ColIndex = 9
        end
        object ShipToZip: TdxMasterViewColumn
          FieldName = 'ShipToZip'
          RowIndex = 0
          ColIndex = 10
        end
        object ShipToCountry: TdxMasterViewColumn
          FieldName = 'ShipToCountry'
          RowIndex = 0
          ColIndex = 11
        end
        object ShipToPhone: TdxMasterViewColumn
          FieldName = 'ShipToPhone'
          RowIndex = 0
          ColIndex = 12
        end
        object ShipVIA: TdxMasterViewColumn
          FieldName = 'ShipVIA'
          RowIndex = 0
          ColIndex = 13
        end
        object PO: TdxMasterViewColumn
          FieldName = 'PO'
          RowIndex = 0
          ColIndex = 14
        end
        object Terms: TdxMasterViewColumn
          FieldName = 'Terms'
          RowIndex = 0
          ColIndex = 15
        end
        object PaymentMethod: TdxMasterViewColumn
          FieldName = 'PaymentMethod'
          RowIndex = 0
          ColIndex = 16
        end
        object ItemsTotal: TdxMasterViewColumn
          FieldName = 'ItemsTotal'
          RowIndex = 0
          ColIndex = 17
        end
        object TaxRateL2: TdxMasterViewColumn
          FieldName = 'TaxRate'
          RowIndex = 0
          ColIndex = 18
        end
        object Freight: TdxMasterViewColumn
          FieldName = 'Freight'
          RowIndex = 0
          ColIndex = 19
        end
        object AmountPaid: TdxMasterViewColumn
          FieldName = 'AmountPaid'
          RowIndex = 0
          ColIndex = 20
        end
      end
    end
  end
  object pnLeft: TPanel
    Left = 503
    Top = 0
    Width = 185
    Height = 392
    Align = alRight
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 174
      Height = 323
      Caption = 'Style'
      TabOrder = 0
      object btnNew: TButton
        Left = 8
        Top = 280
        Width = 75
        Height = 25
        Caption = 'New'
        TabOrder = 0
        OnClick = btnNewClick
      end
      object btnDelete: TButton
        Left = 96
        Top = 280
        Width = 75
        Height = 25
        Caption = 'Delete'
        TabOrder = 1
        OnClick = btnDeleteClick
      end
      object btnColor: TButton
        Left = 8
        Top = 184
        Width = 75
        Height = 25
        Caption = 'Color'
        TabOrder = 2
        OnClick = btnColorClick
      end
      object plColor: TPanel
        Left = 8
        Top = 152
        Width = 75
        Height = 25
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'plColor'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
      end
      object plAnotherColor: TPanel
        Left = 91
        Top = 152
        Width = 75
        Height = 25
        BevelOuter = bvLowered
        Caption = 'plAnotherColor'
        TabOrder = 4
      end
      object btnAnotherColor: TButton
        Left = 91
        Top = 184
        Width = 75
        Height = 25
        Caption = 'AnotherColor'
        TabOrder = 5
        OnClick = btnAnotherColorClick
      end
      object btnFont: TButton
        Left = 8
        Top = 216
        Width = 75
        Height = 25
        Caption = 'Font'
        TabOrder = 6
        OnClick = btnFontClick
      end
      object cmbStyles: TListBox
        Left = 8
        Top = 16
        Width = 153
        Height = 129
        ItemHeight = 13
        TabOrder = 7
        OnClick = cmbStylesChange
      end
    end
    object btnCustomize: TButton
      Left = 16
      Top = 360
      Width = 75
      Height = 25
      Caption = 'Customize'
      TabOrder = 1
      OnClick = btnCustomizeClick
    end
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Options = [cdFullOpen]
    Left = 16
    Top = 168
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 48
    Top = 168
  end
  object tbCustomer: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 16
    Top = 104
  end
  object dsCustomer: TDataSource
    DataSet = tbCustomer
    Left = 48
    Top = 104
  end
  object tbOrders: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    IndexFieldNames = 'CustNo'
    TableName = 'orders.db'
    Left = 16
    Top = 136
  end
  object dsOrders: TDataSource
    DataSet = tbOrders
    Left = 48
    Top = 136
  end
end
