object fmMain: TfmMain
  Left = 212
  Top = 110
  Width = 698
  Height = 603
  Caption = 'ExpressMasterView - Query on expanding demo'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object RadioGroup1: TRadioGroup
      Left = 4
      Top = 4
      Width = 377
      Height = 41
      Caption = 'Behavior type'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'All nodes can be expanded'
        'Keep only one node expanded')
      TabOrder = 0
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 407
    Width = 690
    Height = 169
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnBottom'
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 690
      Height = 13
      Align = alTop
      Caption = 'Standard DBGrid (query result)'
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 13
      Width = 690
      Height = 156
      Align = alClient
      DataSource = DataSource2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object MasterView: TdxMasterView
    Left = 0
    Top = 53
    Width = 690
    Height = 354
    Align = alClient
    TabOrder = 2
    OptionsView = [movAnimation, movAutoColumnWidth, movHideFocusRect, movKeepColumnWidths, movTransparentDragAndDrop, movUseBitmapToDrawPreview]
    object lvlCustomers: TdxMasterViewLevel
      DataSource = DataSource1
      ID = 'CustNo'
      OnExpanding = lvlCustomersExpanding
      object lvlCustomersCustNo: TdxMasterViewColumn
        FieldName = 'CustNo'
        RowIndex = 0
        ColIndex = 0
        SortIndex = 0
        SortOrder = soAscending
      end
      object lvlCustomersCompany: TdxMasterViewColumn
        FieldName = 'Company'
        RowIndex = 0
        ColIndex = 1
      end
      object lvlCustomersAddr1: TdxMasterViewColumn
        FieldName = 'Addr1'
        RowIndex = 0
        ColIndex = 2
      end
      object lvlCustomersAddr2: TdxMasterViewColumn
        FieldName = 'Addr2'
        RowIndex = 0
        ColIndex = 3
        Visible = False
      end
      object lvlCustomersCity: TdxMasterViewColumn
        FieldName = 'City'
        RowIndex = 0
        ColIndex = 3
      end
      object lvlCustomersState: TdxMasterViewColumn
        FieldName = 'State'
        RowIndex = 0
        ColIndex = 4
      end
      object lvlCustomersZip: TdxMasterViewColumn
        FieldName = 'Zip'
        RowIndex = 0
        ColIndex = 5
      end
      object lvlCustomersCountry: TdxMasterViewColumn
        FieldName = 'Country'
        RowIndex = 0
        ColIndex = 6
      end
      object lvlCustomersPhone: TdxMasterViewColumn
        FieldName = 'Phone'
        RowIndex = 0
        ColIndex = 7
        Visible = False
      end
      object lvlCustomersFAX: TdxMasterViewColumn
        FieldName = 'FAX'
        RowIndex = 0
        ColIndex = 7
        Visible = False
      end
      object lvlCustomersTaxRate: TdxMasterViewColumn
        FieldName = 'TaxRate'
        RowIndex = 0
        ColIndex = 9
        Visible = False
      end
      object lvlCustomersContact: TdxMasterViewColumn
        FieldName = 'Contact'
        RowIndex = 0
        ColIndex = 7
      end
      object lvlCustomersLastInvoiceDate: TdxMasterViewColumn
        FieldName = 'LastInvoiceDate'
        RowIndex = 0
        ColIndex = 8
        Visible = False
      end
      object lvlOrders: TdxMasterViewLevel
        DataSource = DataSource2
        DetailKey = 'CustNo'
        ID = 'OrderNo'
        MasterKey = 'CustNo'
        object lvlOrdersOrderNo: TdxMasterViewColumn
          FieldName = 'OrderNo'
          RowIndex = 0
          ColIndex = 0
        end
        object lvlOrdersCustNo: TdxMasterViewColumn
          FieldName = 'CustNo'
          RowIndex = 0
          ColIndex = 1
        end
        object lvlOrdersSaleDate: TdxMasterViewColumn
          FieldName = 'SaleDate'
          RowIndex = 0
          ColIndex = 2
        end
        object lvlOrdersShipDate: TdxMasterViewColumn
          FieldName = 'ShipDate'
          RowIndex = 0
          ColIndex = 3
        end
        object lvlOrdersEmpNo: TdxMasterViewColumn
          FieldName = 'EmpNo'
          RowIndex = 0
          ColIndex = 4
        end
        object lvlOrdersShipToContact: TdxMasterViewColumn
          FieldName = 'ShipToContact'
          RowIndex = 0
          ColIndex = 5
          Visible = False
        end
        object lvlOrdersShipToAddr1: TdxMasterViewColumn
          FieldName = 'ShipToAddr1'
          RowIndex = 0
          ColIndex = 5
          Visible = False
        end
        object lvlOrdersShipToAddr2: TdxMasterViewColumn
          FieldName = 'ShipToAddr2'
          RowIndex = 0
          ColIndex = 5
          Visible = False
        end
        object lvlOrdersShipToCity: TdxMasterViewColumn
          FieldName = 'ShipToCity'
          RowIndex = 0
          ColIndex = 5
          Visible = False
        end
        object lvlOrdersShipToState: TdxMasterViewColumn
          FieldName = 'ShipToState'
          RowIndex = 0
          ColIndex = 5
          Visible = False
        end
        object lvlOrdersShipToZip: TdxMasterViewColumn
          FieldName = 'ShipToZip'
          RowIndex = 0
          ColIndex = 5
          Visible = False
        end
        object lvlOrdersShipToCountry: TdxMasterViewColumn
          FieldName = 'ShipToCountry'
          RowIndex = 0
          ColIndex = 5
          Visible = False
        end
        object lvlOrdersShipToPhone: TdxMasterViewColumn
          FieldName = 'ShipToPhone'
          RowIndex = 0
          ColIndex = 5
          Visible = False
        end
        object lvlOrdersShipVIA: TdxMasterViewColumn
          FieldName = 'ShipVIA'
          RowIndex = 0
          ColIndex = 5
        end
        object lvlOrdersPO: TdxMasterViewColumn
          FieldName = 'PO'
          RowIndex = 0
          ColIndex = 6
          Visible = False
        end
        object lvlOrdersTerms: TdxMasterViewColumn
          FieldName = 'Terms'
          RowIndex = 0
          ColIndex = 6
        end
        object lvlOrdersPaymentMethod: TdxMasterViewColumn
          FieldName = 'PaymentMethod'
          RowIndex = 0
          ColIndex = 7
        end
        object lvlOrdersItemsTotal: TdxMasterViewColumn
          FieldName = 'ItemsTotal'
          RowIndex = 0
          ColIndex = 8
        end
        object lvlOrdersTaxRate: TdxMasterViewColumn
          FieldName = 'TaxRate'
          RowIndex = 0
          ColIndex = 9
          Visible = False
        end
        object lvlOrdersFreight: TdxMasterViewColumn
          FieldName = 'Freight'
          RowIndex = 0
          ColIndex = 9
          Visible = False
        end
        object lvlOrdersAmountPaid: TdxMasterViewColumn
          FieldName = 'AmountPaid'
          RowIndex = 0
          ColIndex = 9
        end
      end
    end
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    FieldDefs = <
      item
        Name = 'CustNo'
        DataType = ftFloat
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Company'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 30
      end
      item
        Name = 'Addr1'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 30
      end
      item
        Name = 'Addr2'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 30
      end
      item
        Name = 'City'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 15
      end
      item
        Name = 'State'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 20
      end
      item
        Name = 'Zip'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 10
      end
      item
        Name = 'Country'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 20
      end
      item
        Name = 'Phone'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 15
      end
      item
        Name = 'TaxRate'
        DataType = ftFloat
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Contact'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 20
      end
      item
        Name = 'LastInvoiceDate'
        DataType = ftDateTime
        Precision = 0
        Required = False
        Size = 0
      end>
    StoreDefs = True
    TableName = 'customer.DB'
    Left = 64
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 36
    Top = 88
  end
  object Query1: TQuery
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      'select * from orders.db where CustNo = :CustNo')
    Params.Data = {0100010006437573744E6F00030400C50400000001}
    Left = 86
    Top = 128
  end
  object DataSource2: TDataSource
    DataSet = Query1
    Left = 52
    Top = 128
  end
end
