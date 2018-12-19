object SummaryGroupDemoMainForm: TSummaryGroupDemoMainForm
  Left = 300
  Top = 120
  Width = 800
  Height = 600
  Caption = 'ExpressQuantumGrid SummaryGroup Demo'
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
      '  This demo shows summaries calculated for groups and presents d' +
      'ifferent ways to organize them visually.'
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
  object Grid: TcxGrid
    Left = 0
    Top = 29
    Width = 792
    Height = 517
    Align = alClient
    TabOrder = 0
    object tvOrders: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SummaryGroupDemoDataDM.dsOrders
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
              Column = tvOrdersCustomerID
            end>
          SummaryItems = <
            item
              Kind = skSum
              Position = spFooter
              Column = tvOrdersPaymentAmount
            end
            item
              Format = '0'
              Kind = skCount
            end
            item
              Format = 'Last order: '
              Kind = skMax
              Column = tvOrdersPurchaseDate
            end
            item
              Kind = skCount
              Position = spFooter
              Column = tvOrdersProductID
            end
            item
              Format = '$,0.00'
              Kind = skSum
              Column = tvOrdersPaymentAmount
            end
            item
              Kind = skSum
              Position = spFooter
              Column = tvOrdersQuantity
            end
            item
              Kind = skMax
              Position = spFooter
              Column = tvOrdersPurchaseDate
            end>
        end
        item
          Links = <
            item
              Column = tvOrdersProductID
            end>
          SummaryItems = <
            item
              Format = 'Quantity: 0'
              Kind = skSum
              Column = tvOrdersQuantity
            end
            item
              Format = 'First: '
              Kind = skMin
              Column = tvOrdersPurchaseDate
            end
            item
              Format = 'Last: '
              Kind = skMax
              Column = tvOrdersPurchaseDate
            end
            item
              Kind = skSum
              Position = spFooter
              Column = tvOrdersPaymentAmount
            end
            item
              Format = '0'
              Kind = skSum
              Position = spFooter
              Column = tvOrdersQuantity
            end
            item
              Format = 'Average: $,0.00'
              Kind = skAverage
              Column = tvOrdersPaymentAmount
            end>
        end
        item
          Links = <
            item
              Column = tvOrdersPurchaseDate
            end
            item
              Column = tvOrdersPaymentType
            end>
          SummaryItems = <
            item
              Kind = skCount
            end
            item
              Format = 'Quantity: 0'
              Kind = skSum
              Column = tvOrdersQuantity
            end
            item
              Kind = skAverage
              Position = spFooter
              Column = tvOrdersPaymentAmount
            end>
        end>
      OptionsBehavior.FocusCellOnTab = True
      OptionsSelection.MultiSelect = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      OptionsView.Indicator = True
      Styles.Footer = SummaryGroupDemoDataDM.stGreyLight
      Styles.Group = SummaryGroupDemoDataDM.stBlueLight
      Styles.GroupByBox = SummaryGroupDemoDataDM.stBlueSky
      Styles.GroupSummary = SummaryGroupDemoDataDM.stClear
      object tvOrdersCustomerID: TcxGridDBColumn
        Caption = 'Company'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Company'
          end>
        Properties.ListSource = SummaryGroupDemoDataDM.dsCustomers
        Visible = False
        GroupIndex = 1
        SortIndex = 0
        SortOrder = soAscending
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
        Properties.ListSource = SummaryGroupDemoDataDM.dsCars
        Visible = False
        GroupIndex = 0
        SortIndex = 1
        SortOrder = soAscending
        Width = 80
      end
      object tvOrdersDescription: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Options.Grouping = False
        Width = 214
      end
      object tvOrdersPurchaseDate: TcxGridDBColumn
        DataBinding.FieldName = 'PurchaseDate'
        PropertiesClassName = 'TcxDateEditProperties'
        DateTimeGrouping = dtgByMonth
        Width = 225
      end
      object tvOrdersPaymentAmount: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentAmount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Options.Grouping = False
        Styles.GroupSummary = SummaryGroupDemoDataDM.stRed
        Width = 165
      end
      object tvOrdersPaymentType: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentType'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.Images = SummaryGroupDemoDataDM.PaymentTypeImages
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
        Width = 93
      end
      object tvOrdersQuantity: TcxGridDBColumn
        DataBinding.FieldName = 'Quantity'
        PropertiesClassName = 'TcxSpinEditProperties'
        Options.Grouping = False
        Width = 98
      end
    end
    object lvOrders: TcxGridLevel
      GridView = tvOrders
      MaxDetailHeight = 200
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 8
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
          Caption = '&Ignore Null Values when calculating'
          OnClick = miIgnoreNullValuesClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miGroupSummaryLayout: TMenuItem
        Caption = 'Group Summary Layout'
        object miGroupSummaryLayoutStandard: TMenuItem
          Caption = 'gslStandard'
          GroupIndex = 2
          RadioItem = True
          OnClick = miGroupSummaryLayoutClick
        end
        object miGroupSummaryLayoutAlignWithColumns: TMenuItem
          Caption = 'gslAlignWithColumns'
          GroupIndex = 2
          RadioItem = True
          OnClick = miGroupSummaryLayoutClick
        end
        object miGroupSummaryLayoutAlignWithColumnsAndDistribute: TMenuItem
          Caption = 'gslAlignWithColumnsAndDistribute'
          GroupIndex = 2
          RadioItem = True
          OnClick = miGroupSummaryLayoutClick
        end
      end
      object miGroupFooter: TMenuItem
        Caption = 'Group Footers'
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
        object N3: TMenuItem
          Caption = '-'
          GroupIndex = 1
        end
        object miGroupFootersAtCarLevel: TMenuItem
          Tag = 1
          Caption = 'At Car Level'
          GroupIndex = 1
          OnClick = miGroupFootersAtLevelClick
        end
        object miGroupFootersAtCompanyLevel: TMenuItem
          Tag = 2
          Caption = 'At Company level'
          GroupIndex = 1
          OnClick = miGroupFootersAtLevelClick
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miMultiSelect: TMenuItem
        Caption = '&Multi Select'
        Checked = True
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
    Top = 8
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 472
    Top = 8
  end
end
