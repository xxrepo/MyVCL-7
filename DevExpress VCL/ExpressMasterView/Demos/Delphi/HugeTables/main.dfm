object fmMain: TfmMain
  Left = 199
  Top = 130
  Width = 697
  Height = 494
  Caption = 
    'MasterView - HugeTablesDemo (Customers - 1 000 rec., Orders - 10' +
    ' 000 rec., Items - 100 000 rec.)'
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MasterView: TdxMasterView
    Left = 0
    Top = 0
    Width = 689
    Height = 391
    Align = alClient
    TabOrder = 0
    OptionsBehavior = [mobShowHourGlassCursor]
    object Level1: TdxMasterViewLevel
      Caption = 'Level1'
      DataSource = dsCustomers
      ID = 'ID'
      object Level1ID: TdxMasterViewColumn
        FieldName = 'ID'
        RowIndex = 0
        ColIndex = 0
      end
      object Level1CustomerName: TdxMasterViewColumn
        FieldName = 'CustomerName'
        RowIndex = 0
        ColIndex = 1
      end
      object Level1Company: TdxMasterViewColumn
        FieldName = 'Company'
        RowIndex = 0
        ColIndex = 2
      end
      object Level1PurchaseDate: TdxMasterViewColumn
        FieldName = 'PurchaseDate'
        RowIndex = 0
        ColIndex = 3
      end
      object Level1Address: TdxMasterViewColumn
        FieldName = 'Address'
        RowIndex = 0
        ColIndex = 4
      end
      object Level1Customer: TdxMasterViewColumn
        FieldName = 'Customer'
        RowIndex = 0
        ColIndex = 5
      end
      object Level1City: TdxMasterViewColumn
        FieldName = 'City'
        RowIndex = 0
        ColIndex = 6
      end
      object Level1State: TdxMasterViewColumn
        FieldName = 'State'
        RowIndex = 0
        ColIndex = 7
      end
      object Level1HomePhone: TdxMasterViewColumn
        FieldName = 'HomePhone'
        RowIndex = 0
        ColIndex = 8
      end
      object Level2: TdxMasterViewLevel
        Caption = 'Level2'
        DataSource = dsOrders
        DetailKey = 'CustomerNo'
        ID = 'OrderNo'
        MasterKey = 'ID'
        object Level2OrderNo: TdxMasterViewColumn
          FieldName = 'OrderNo'
          RowIndex = 0
          ColIndex = 0
        end
        object Level2CustomerNo: TdxMasterViewColumn
          FieldName = 'CustomerNo'
          RowIndex = 0
          ColIndex = 1
        end
        object Level2PaymentType: TdxMasterViewColumn
          FieldName = 'PaymentType'
          RowIndex = 0
          ColIndex = 2
        end
        object Level2PaymentAmount: TdxMasterViewColumn
          FieldName = 'PaymentAmount'
          RowIndex = 0
          ColIndex = 3
        end
        object Level3: TdxMasterViewLevel
          Caption = 'Level3'
          DataSource = dsItems
          DetailKey = 'OrderNo'
          ID = 'ItemNo'
          MasterKey = 'OrderNo'
          object Level3ItemNo: TdxMasterViewColumn
            FieldName = 'ItemNo'
            RowIndex = 0
            ColIndex = 0
          end
          object Level3OrderNo: TdxMasterViewColumn
            FieldName = 'OrderNo'
            RowIndex = 0
            ColIndex = 1
          end
          object Level3PartNo: TdxMasterViewColumn
            FieldName = 'PartNo'
            RowIndex = 0
            ColIndex = 2
          end
          object Level3Qty: TdxMasterViewColumn
            FieldName = 'Qty'
            RowIndex = 0
            ColIndex = 3
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 391
    Width = 689
    Height = 56
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnCustomize: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Customize'
      TabOrder = 0
      OnClick = btnCustomizeClick
    end
    object btnFullCollapse: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = 'FullCollapse'
      TabOrder = 1
      OnClick = btnFullCollapseClick
    end
    object btnFullExpand: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = 'FullExpand'
      TabOrder = 2
      OnClick = btnFullExpandClick
    end
    object chbSmartLoadLevel1: TCheckBox
      Left = 280
      Top = 8
      Width = 105
      Height = 13
      Caption = 'SmartLoadLevel1'
      TabOrder = 3
      OnClick = chbSmartLoadLevel1Click
    end
    object btnReloadDataset: TButton
      Left = 392
      Top = 8
      Width = 97
      Height = 25
      Caption = 'ReloadDatasets'
      TabOrder = 4
      OnClick = btnReloadDatasetClick
    end
    object chbSmartLoadLevel2: TCheckBox
      Tag = 1
      Left = 280
      Top = 24
      Width = 105
      Height = 13
      Caption = 'SmartLoadLevel2'
      TabOrder = 5
      OnClick = chbSmartLoadLevel2Click
    end
    object chbSmartLoadLevel3: TCheckBox
      Tag = 2
      Left = 280
      Top = 40
      Width = 105
      Height = 13
      Caption = 'SmartLoadLevel3'
      TabOrder = 6
      OnClick = chbSmartLoadLevel3Click
    end
  end
  object ProgressBar: TProgressBar
    Left = 426
    Top = 6
    Width = 150
    Height = 16
    Hint = '1212000'
    Min = 0
    Max = 100
    TabOrder = 2
    Visible = False
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 447
    Width = 689
    Height = 20
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object tbCustomers: TTable
    TableName = 'Customers'
    TableType = ttParadox
    Left = 308
    Top = 26
    object tbCustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object tbCustomersCustomerName: TStringField
      FieldName = 'CustomerName'
      Required = True
    end
    object tbCustomersCompany: TStringField
      FieldName = 'Company'
      Size = 30
    end
    object tbCustomersAddress: TStringField
      FieldName = 'Address'
      Size = 50
    end
    object tbCustomersCustomer: TBooleanField
      FieldName = 'Customer'
    end
    object tbCustomersCity: TStringField
      FieldName = 'City'
    end
    object tbCustomersState: TStringField
      FieldName = 'State'
      Size = 2
    end
    object tbCustomersHomePhone: TStringField
      FieldName = 'HomePhone'
      Size = 15
    end
    object tbCustomersPurchaseDate: TDateTimeField
      FieldName = 'PurchaseDate'
    end
  end
  object dsCustomers: TDataSource
    DataSet = tbCustomers
    Left = 344
    Top = 22
  end
  object tbOrders: TTable
    TableName = 'Orders'
    Left = 312
    Top = 56
    object tbOrdersOrderNo: TIntegerField
      FieldName = 'OrderNo'
      Required = True
    end
    object tbOrdersCustomerNo: TIntegerField
      FieldName = 'CustomerNo'
      Required = True
    end
    object tbOrdersPaymentType: TStringField
      FieldName = 'PaymentType'
    end
    object tbOrdersPaymentAmount: TCurrencyField
      FieldName = 'PaymentAmount'
    end
  end
  object dsOrders: TDataSource
    DataSet = tbOrders
    Left = 344
    Top = 56
  end
  object tbItems: TTable
    TableName = 'Items'
    Left = 312
    Top = 88
    object tbItemsItemNo: TIntegerField
      FieldName = 'ItemNo'
      Required = True
    end
    object tbItemsOrderNo: TIntegerField
      FieldName = 'OrderNo'
      Required = True
    end
    object tbItemsPartNo: TIntegerField
      FieldName = 'PartNo'
    end
    object tbItemsQty: TIntegerField
      FieldName = 'Qty'
    end
  end
  object dsItems: TDataSource
    DataSet = tbItems
    Left = 344
    Top = 88
  end
end
