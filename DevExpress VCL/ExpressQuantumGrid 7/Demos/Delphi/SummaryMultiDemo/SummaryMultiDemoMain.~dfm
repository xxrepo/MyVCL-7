object SummaryMultiDemoMainForm: TSummaryMultiDemoMainForm
  Left = 300
  Top = 120
  Caption = 'ExpressQuantumGrid Summary Multi Demo'
  ClientHeight = 546
  ClientWidth = 792
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 792
    Height = 29
    Align = alTop
    AutoSize = False
    Caption = 
      '  This demo shows summaries at all locations available in the gr' +
      'id: footer, group and group footer'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 527
    Width = 792
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 29
    Width = 792
    Height = 498
    Align = alClient
    TabOrder = 1
    object tvOrders: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SummaryMultiDemoDataDM.dsOrders
      DataController.DetailKeyFieldNames = 'ProductID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems.OnSummary = tvOrdersDataControllerSummaryDefaultGroupSummaryItemsSummary
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0 orders'
          Kind = skCount
          Column = tvOrdersCustomerID
          DisplayText = 'Order Count'
        end
        item
          Format = 'Total paid = $,0'
          Kind = skSum
          Column = tvOrdersPaymentAmount
          DisplayText = 'Total Paid'
          Sorted = True
        end
        item
          Format = 'Count(Payment amount > '#39'$300,000'#39') = 0'
          Kind = skCount
          Column = tvOrdersProductID
          DisplayText = 'Order Count, Payment Amount > $300,000'
        end
        item
          Format = 'Last purchase date: '
          Kind = skMax
          Position = spFooter
          Column = tvOrdersPurchaseDate
          DisplayText = 'Last Purchase Date'
        end
        item
          Kind = skSum
          Position = spFooter
          Column = tvOrdersPaymentAmount
          VisibleForCustomization = False
        end
        item
          Format = '0'
          Kind = skSum
          Position = spFooter
          Column = tvOrdersQuantity
          DisplayText = 'Total Quantity'
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'From '
          Kind = skMin
          Column = tvOrdersPurchaseDate
        end
        item
          Format = '    To '
          Kind = skMax
          Column = tvOrdersPurchaseDate
        end
        item
          Format = 'Min: $,0'
          Kind = skMin
          Column = tvOrdersPaymentAmount
        end
        item
          Format = 'Max: $,0'
          Kind = skMax
          Column = tvOrdersPaymentAmount
        end
        item
          Format = 'Total: $,0'
          Kind = skSum
          Column = tvOrdersPaymentAmount
        end
        item
          Format = 'Min = 0'
          Kind = skMin
          Column = tvOrdersQuantity
        end
        item
          Format = 'Max = 0'
          Kind = skMax
          Column = tvOrdersQuantity
        end
        item
          Format = 'Average = 0.00'
          Kind = skAverage
          Column = tvOrdersQuantity
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
            end
            item
              Column = tvOrdersProductID
            end>
          SummaryItems = <
            item
              Format = 'Quantity: 0'
              Kind = skSum
              Column = tvOrdersQuantity
              DisplayText = 'Quantity'
            end
            item
              Format = 'First purchase date: '
              Kind = skMin
              Column = tvOrdersPurchaseDate
              DisplayText = 'First Purchase Date'
            end
            item
              Format = 'Average payment amount: $,0.00'
              Kind = skAverage
              Column = tvOrdersPaymentAmount
              DisplayText = 'Average Payment Amount'
            end
            item
              Kind = skSum
              Position = spFooter
              Column = tvOrdersPaymentAmount
              DisplayText = 'Total Payment Amount'
            end
            item
              Format = '0'
              Kind = skSum
              Position = spFooter
              Column = tvOrdersQuantity
              VisibleForCustomization = False
            end>
        end
        item
          Links = <
            item
              Column = tvOrdersPaymentType
            end>
          SummaryItems = <
            item
              Format = 'Orders: 0'
              Kind = skCount
            end
            item
              Format = 'Quantity: 0'
              Kind = skSum
              Column = tvOrdersQuantity
            end
            item
              Format = 'Average payment: $,0.00'
              Kind = skAverage
              Position = spFooter
              Column = tvOrdersPaymentAmount
            end>
        end>
      DataController.Summary.OnAfterSummary = tvOrdersDataControllerSummaryAfterSummary
      OptionsBehavior.FocusCellOnTab = True
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.Indicator = True
      Styles.Content = SummaryMultiDemoDataDM.styleYellowLight
      Styles.Footer = SummaryMultiDemoDataDM.styleBlueLight
      Styles.Group = SummaryMultiDemoDataDM.styleGold
      Styles.GroupFooterSortedSummary = SummaryMultiDemoDataDM.styleSortedSummary
      Styles.GroupSortedSummary = SummaryMultiDemoDataDM.styleSortedSummary
      Styles.GroupSummary = SummaryMultiDemoDataDM.styleNormal
      Styles.OnGetFooterSummaryStyle = tvOrdersStylesGetFooterSummaryStyle
      Styles.OnGetGroupSummaryStyle = tvOrdersStylesGetGroupSummaryStyle
      object tvOrdersCustomerID: TcxGridDBColumn
        Caption = 'Company'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Company'
          end>
        Properties.ListSource = SummaryMultiDemoDataDM.dsCustomers
        Visible = False
        GroupIndex = 0
        SortIndex = 0
        SortOrder = soDescending
        Width = 100
      end
      object tvOrdersProductID: TcxGridDBColumn
        Caption = 'Car'
        DataBinding.FieldName = 'ProductID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'CarName'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = SummaryMultiDemoDataDM.dsCars
        Visible = False
        GroupIndex = 1
        SortIndex = 1
        SortOrder = soAscending
        Width = 80
      end
      object tvOrdersPurchaseDate: TcxGridDBColumn
        Caption = 'Purchase Date'
        DataBinding.FieldName = 'PurchaseDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 162
      end
      object tvOrdersPaymentAmount: TcxGridDBColumn
        Caption = 'Payment Amount'
        DataBinding.FieldName = 'PaymentAmount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Options.Grouping = False
        Width = 156
      end
      object tvOrdersPaymentType: TcxGridDBColumn
        Caption = 'Payment Type'
        DataBinding.FieldName = 'PaymentType'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.Images = SummaryMultiDemoDataDM.PaymentTypeImages
        Properties.Items = <
          item
            Description = 'Am. Express'
            ImageIndex = 3
            Value = 'AmEx'
          end
          item
            Description = 'Cash'
            ImageIndex = 0
            Value = 'Cash'
          end
          item
            Description = 'Master'
            ImageIndex = 2
            Value = 'Master'
          end
          item
            Description = 'Visa'
            ImageIndex = 1
            Value = 'Visa'
          end>
        Width = 173
      end
      object tvOrdersQuantity: TcxGridDBColumn
        DataBinding.FieldName = 'Quantity'
        PropertiesClassName = 'TcxSpinEditProperties'
        Options.Grouping = False
        Width = 165
      end
    end
    object lvOrders: TcxGridLevel
      GridView = tvOrders
      MaxDetailHeight = 200
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 40
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = '&Options'
      object miSummaries: TMenuItem
        Caption = 'Su&mmary'
        object miSelectedRecordsOnly: TMenuItem
          Caption = 'Calculate on &selected records only'
          OnClick = miSelectedRecordsOnlyClick
        end
        object miIgnoreNullValues: TMenuItem
          Caption = '&Ignore Null values when calculating'
          OnClick = miIgnoreNullValuesClick
        end
        object miUseOnAfterSummaryEvent: TMenuItem
          Caption = 'Footer summary based on &group totals'
          OnClick = miUseOnAfterSummaryEventClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miGroupFooters: TMenuItem
        Caption = 'Group &Footers'
        object miGroupFooterNeverShow: TMenuItem
          Caption = 'gfInvisible'
          GroupIndex = 1
          RadioItem = True
          OnClick = miGroupFootersClick
        end
        object miGroupFooterShowWhenExpand: TMenuItem
          Caption = 'gfVisibleWhenExpanded'
          GroupIndex = 1
          RadioItem = True
          OnClick = miGroupFootersClick
        end
        object miGroupFooterAlwaysShow: TMenuItem
          Caption = 'gfAlwaysVisible'
          GroupIndex = 1
          RadioItem = True
          OnClick = miGroupFootersClick
        end
      end
      object miMultipleSummariesInFooter: TMenuItem
        Caption = 'Multiple Summaries in Footer'
        OnClick = miMultipleSummariesInFooterClick
      end
      object miMultipleSummariesInGroupFooters: TMenuItem
        Caption = 'Multiple Summaries in Group Footers'
        OnClick = miMultipleSummariesInGroupFootersClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miMultiSelect: TMenuItem
        Caption = '&Multi Select'
        OnClick = miMultiSelectClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      OnClick = miAboutClick
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <>
    Left = 440
    Top = 40
  end
  object LookAndFeelController: TcxLookAndFeelController
    Left = 472
    Top = 40
  end
end
