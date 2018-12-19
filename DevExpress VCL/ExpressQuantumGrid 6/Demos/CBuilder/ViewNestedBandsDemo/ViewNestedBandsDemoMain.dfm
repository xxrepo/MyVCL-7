object ViewNestedBandsDemoMainForm: TViewNestedBandsDemoMainForm
  Left = 34
  Top = 41
  Width = 964
  Height = 633
  Caption = 'ExpressQuantumGrid ViewNestedBandsDemo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 956
    Height = 25
    Align = alTop
    AutoSize = False
    Caption = 
      'Use Nested Bands with the BandedView. Experiment by changing the' +
      ' Options. Click on '#39'About this demo'#39' for more information.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 560
    Width = 956
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 25
    Width = 956
    Height = 535
    Align = alClient
    TabOrder = 1
    object bvOrders: TcxGridDBBandedTableView
      DataController.DataSource = ViewNestedBandsDemoDataDM.dsOrders
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.BandsQuickCustomization = True
      OptionsView.FocusRect = False
      Styles.BandHeader = ViewNestedBandsDemoDataDM.cxStyle31
      Bands = <
        item
          Caption = 'Order'
          Styles.Header = ViewNestedBandsDemoDataDM.cxStyle35
        end
        item
          Caption = 'Car'
          Styles.Header = ViewNestedBandsDemoDataDM.cxStyle35
          Width = 605
        end
        item
          Caption = 'Customer'
          Styles.Header = ViewNestedBandsDemoDataDM.cxStyle35
          Width = 774
        end
        item
          Caption = 'MPG'
          Position.BandIndex = 1
          Position.ColIndex = 3
          Width = 108
        end
        item
          Caption = 'Transmission'
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 138
        end
        item
          Caption = 'Engine'
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 137
        end
        item
          Caption = 'Model'
          Position.BandIndex = 1
          Position.ColIndex = 0
          Width = 222
        end
        item
          Caption = 'Contact'
          Position.BandIndex = 2
          Position.ColIndex = 1
          Width = 377
        end
        item
          Caption = 'Primary Info'
          Position.BandIndex = 2
          Position.ColIndex = 0
          Width = 397
        end>
      object clnCustomerID: TcxGridDBBandedColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCustomers
        Options.CellMerging = True
        Options.SortByDisplayText = isbtOn
        SortIndex = 2
        SortOrder = soAscending
        Width = 173
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object clnCustomerCompany: TcxGridDBBandedColumn
        Caption = 'Company'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Company'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCustomers
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Width = 124
        Position.BandIndex = 8
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object clnCustomerAddres: TcxGridDBBandedColumn
        Caption = 'Address'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Address'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCustomers
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Width = 160
        Position.BandIndex = 7
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object clnCustomerFax: TcxGridDBBandedColumn
        Caption = 'Fax'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'FaxPhone'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCustomers
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Width = 96
        Position.BandIndex = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object clnCustomerPhone: TcxGridDBBandedColumn
        Caption = 'Phone'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'HomePhone'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCustomers
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Width = 89
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object clnCustomerOccupation: TcxGridDBBandedColumn
        Caption = 'Occupation'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Occupation'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCustomers
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Width = 100
        Position.BandIndex = 8
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object clnCustomerZipCode: TcxGridDBBandedColumn
        Caption = 'ZipCode'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'ZipCode'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCustomers
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Width = 77
        Position.BandIndex = 7
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object clnOrdersProductID: TcxGridDBBandedColumn
        Caption = 'Car'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Car'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCars
        Options.CellMerging = True
        Options.SortByDisplayText = isbtOn
        SortIndex = 1
        SortOrder = soAscending
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object clnCarLiter: TcxGridDBBandedColumn
        Caption = 'Liter'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Liter'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCars
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object clnCarCyl: TcxGridDBBandedColumn
        Caption = 'Cyl'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Cyl'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCars
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object clnCarHP: TcxGridDBBandedColumn
        Caption = 'HP'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'HP'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCars
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Position.BandIndex = 5
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object clnCarMPG_City: TcxGridDBBandedColumn
        Caption = 'City'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'MPG_City'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCars
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Width = 44
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object clnCarMPG_Highway: TcxGridDBBandedColumn
        Caption = 'Highway'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'MPG_Highway'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCars
        Properties.ReadOnly = True
        Options.Editing = False
        Options.CellMerging = True
        Width = 64
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object clnCarTransmissSpeedCount: TcxGridDBBandedColumn
        Caption = 'Speed Count'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'TransmissSpeedCount'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCars
        Properties.ReadOnly = True
        Options.Filtering = False
        Options.CellMerging = True
        Width = 76
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object clnCarTransMissAuto: TcxGridDBBandedColumn
        Caption = 'Automatic'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'TransmissAutomatic'
          end>
        Properties.ListSource = ViewNestedBandsDemoDataDM.dsCars
        Properties.ReadOnly = True
        Options.Filtering = False
        Options.CellMerging = True
        Width = 80
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object clnPurchaseDate: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PurchaseDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Vert = taVCenter
        Options.CellMerging = True
        SortIndex = 0
        SortOrder = soAscending
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object clnPaymentType: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PaymentType'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.Images = ViewNestedBandsDemoDataDM.PaymentTypeImages
        Properties.Items = <
          item
            Description = 'Cash'
            ImageIndex = 0
            Value = 'Cash'
          end
          item
            Description = 'Visa'
            ImageIndex = 1
            Value = 'Visa'
          end
          item
            Description = 'Master'
            ImageIndex = 2
            Value = 'Master'
          end
          item
            Description = 'American Express'
            ImageIndex = 3
            Value = 'AmEx'
          end>
        Options.CellMerging = True
        SortIndex = 3
        SortOrder = soAscending
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object clnQuantity: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Quantity'
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object clnPaymentAmount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PaymentAmount'
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
    end
    object lvOrders: TcxGridLevel
      GridView = bvOrders
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 24
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = 'Options'
      object miNestedBands: TMenuItem
        Caption = '&Nested Bands'
        Checked = True
        Hint = 'Enables nested bands'
        OnClick = miNestedBandsClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miBandsQuickCustomization: TMenuItem
        Caption = '&Bands quick customization'
        Checked = True
        Hint = 
          'Enables  bands to be shown or hidden in the grid by clicking on ' +
          'items in the list (click the indicator located to the left of th' +
          'e band headers area)'
        OnClick = miBandsQuickCustomizationClick
      end
      object miColumnsQuickCustomization: TMenuItem
        Caption = '&Columns quick customization'
        Checked = True
        Hint = 
          'Enables  columns to be shown or hidden in the grid by clicking o' +
          'n items in the list (click the indicator located to the left of ' +
          'the column headers area)'
        OnClick = miColumnsQuickCustomizationClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miCellMerging: TMenuItem
        Caption = 'Cell &merging'
        Checked = True
        Hint = 'Merges cells with the same data'
        OnClick = miCellMergingClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 536
    Top = 24
  end
end
