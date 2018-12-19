object GridMenuViewsDemoMainForm: TGridMenuViewsDemoMainForm
  Left = 88
  Top = 63
  Width = 864
  Height = 608
  Caption = 'ExpressQuantumGrid GridMenuViews Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 856
    Height = 25
    Align = alTop
    AutoSize = False
    Caption = 
      'This demo shows use of popup menus with the grid. Click "About t' +
      'his demo" for more information.'
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
    Top = 535
    Width = 856
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
    Width = 856
    Height = 510
    Align = alClient
    TabOrder = 1
    object tvOrders: TcxGridDBTableView
      DataController.DataSource = GridMenuViewsDemoDataDM.dsOrders
      DataController.DetailKeyFieldNames = 'ProductID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
          Column = tvOrdersPaymentAmount
        end
        item
          Kind = skCount
          Column = tvOrdersDescription
        end
        item
          Format = 'Last purchase date: '
          Kind = skMax
          Column = tvOrdersPurchaseDate
        end
        item
          Kind = skCount
          Position = spFooter
          Column = tvOrdersProductID
        end
        item
          Format = 'Payment Amount = $,0.00'
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
        end
        item
          Kind = skCount
          Position = spFooter
          Column = tvOrdersDescription
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skMax
          Column = tvOrdersPaymentAmount
        end
        item
          Kind = skCount
          Column = tvOrdersCustomerID
        end
        item
          Kind = skCount
          Column = tvOrdersDescription
        end
        item
          Kind = skCount
          Column = tvOrdersProductID
        end
        item
          Kind = skMin
          Column = tvOrdersPurchaseDate
        end
        item
          Kind = skAverage
          Column = tvOrdersQuantity
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      Styles.StyleSheet = GridMenuViewsDemoDataDM.GridTableViewStyleSheetDevExpress
      object tvOrdersCustomerID: TcxGridDBColumn
        Caption = 'Company'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Company'
          end>
        Properties.ListSource = GridMenuViewsDemoDataDM.dsCustomers
        Visible = False
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
        Properties.ListSource = GridMenuViewsDemoDataDM.dsCars
        Visible = False
        GroupIndex = 0
        SortOrder = soAscending
        Width = 80
      end
      object tvOrdersPurchaseDate: TcxGridDBColumn
        DataBinding.FieldName = 'PurchaseDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 60
      end
      object tvOrdersPurchaseMonth: TcxGridDBColumn
        DataBinding.FieldName = 'PurchaseMonth'
      end
      object tvOrdersPaymentType: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentType'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.Images = GridMenuViewsDemoDataDM.PaymentTypeImages
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
        Width = 60
      end
      object tvOrdersPaymentAmount: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentAmount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Options.Grouping = False
      end
      object tvOrdersDescription: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Options.Grouping = False
      end
      object tvOrdersQuantity: TcxGridDBColumn
        DataBinding.FieldName = 'Quantity'
        PropertiesClassName = 'TcxSpinEditProperties'
        Options.Grouping = False
        Width = 40
      end
    end
    object lvOrders: TcxGridLevel
      GridView = tvOrders
      MaxDetailHeight = 200
    end
  end
  object mmMain: TMainMenu
    Left = 432
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
      Caption = '&Options'
      object CustomizePopupmenus1: TMenuItem
        Caption = 'Customize Popup menus'
        object miUseBuiltInPopupMenu: TMenuItem
          Caption = 'Use Built-In Popup Menu'
          Checked = True
          Hint = 'Use Built-In Popup menu '
          OnClick = miUseBuiltInPopupMenuClick
        end
        object miAddCopyToClipboard: TMenuItem
          Caption = 'Add '#39'Copy to clipboard'#39' '
          Checked = True
          Hint = 'Add '#39'Copy to clipboard'#39' menu item to summary footer popup menus'
          OnClick = miUseCopyClipboardItemClick
        end
        object miUseUserPopupMenu: TMenuItem
          Caption = 'Use Custom Popup Menu'
          Checked = True
          Hint = 'Use User Popup Menu on the records'
          OnClick = miUseCustomPopupMenuClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object GridPopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <
      item
        GridView = tvOrders
        HitTypes = [gvhtCell, gvhtRecord, gvhtRowIndicator]
        Index = 0
        OnPopup = GridMenuPopup
        PopupMenu = PopupMenu
      end>
    Left = 400
    Top = 24
  end
  object PopupMenu: TPopupMenu
    Left = 464
    Top = 24
    object miInsert: TMenuItem
      Caption = 'Insert'
      OnClick = miInsertClick
    end
    object miDelete: TMenuItem
      Caption = 'Delete'
      OnClick = miDeleteClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 368
    Top = 24
  end
end
