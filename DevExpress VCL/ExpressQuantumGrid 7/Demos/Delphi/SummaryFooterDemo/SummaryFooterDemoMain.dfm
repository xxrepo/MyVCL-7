object SummaryFooterDemoMainForm: TSummaryFooterDemoMainForm
  Left = 188
  Top = 70
  Width = 872
  Height = 587
  Caption = 'ExpressQuantumGrid Summary Footer Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 864
    Height = 25
    Align = alTop
    AutoSize = False
    Caption = 
      'Options/Summary above provides runtime summary facilities. Click' +
      ' '#39'About this demo'#39' for more information.'
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
    Top = 517
    Width = 864
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
    Width = 864
    Height = 492
    Align = alClient
    TabOrder = 1
    OnFocusedViewChanged = GridFocusedViewChanged
    object tvCars: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SummaryFooterDemoDataDM.dsCars
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsSelection.MultiSelect = True
      OptionsView.CellAutoHeight = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      Preview.MaxLineCount = 1
      Preview.RightIndent = 10
      Styles.StyleSheet = SummaryFooterDemoDataDM.GridTableViewStyleSheetDevExpress
      object tvCarsTrademark: TcxGridDBColumn
        DataBinding.FieldName = 'Trademark'
        Width = 100
      end
      object tvCarsModel: TcxGridDBColumn
        DataBinding.FieldName = 'Model'
        Width = 180
      end
      object tvCarsPicture: TcxGridDBColumn
        DataBinding.FieldName = 'Picture'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekPict
        Properties.PictureGraphicClassName = 'TJPEGImage'
      end
      object tvCarshp: TcxGridDBColumn
        DataBinding.FieldName = 'hp'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Increment = 10.000000000000000000
      end
      object tvCarsliter: TcxGridDBColumn
        DataBinding.FieldName = 'liter'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Increment = 0.100000000000000000
      end
      object tvCarscyl: TcxGridDBColumn
        DataBinding.FieldName = 'cyl'
        PropertiesClassName = 'TcxSpinEditProperties'
      end
      object tvCarsTransmissSpeedCount: TcxGridDBColumn
        DataBinding.FieldName = 'TransmissSpeedCount'
        PropertiesClassName = 'TcxSpinEditProperties'
        Width = 130
      end
      object tvCarsTransmissAutomatic: TcxGridDBColumn
        Caption = 'Automatic Transmission'
        DataBinding.FieldName = 'TransmissAutomatic'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Yes'
        Properties.ValueUnchecked = 'No'
        Width = 135
      end
      object tvCarsMPG_City: TcxGridDBColumn
        DataBinding.FieldName = 'MPG_City'
        Width = 70
      end
      object tvCarsMPG_Highway: TcxGridDBColumn
        DataBinding.FieldName = 'MPG_Highway'
        Width = 100
      end
      object tvCarsCategory: TcxGridDBColumn
        DataBinding.FieldName = 'Category'
        Width = 70
      end
      object tvCarsDescription: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.MemoScrollBars = ssVertical
      end
      object tvCarsHyperlink: TcxGridDBColumn
        DataBinding.FieldName = 'Hyperlink'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
        Width = 150
      end
      object tvCarsPrice: TcxGridDBColumn
        DataBinding.FieldName = 'Price'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Width = 80
      end
    end
    object tvOrders: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = SummaryFooterDemoDataDM.dsOrders
      DataController.DetailKeyFieldNames = 'ProductID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'CustomerID'
          Column = tvOrdersCustomerID
        end
        item
          Kind = skSum
          FieldName = 'PaymentAmount'
          Column = tvOrdersPaymentAmount
        end
        item
          Kind = skSum
          FieldName = 'Quantity'
          Column = tvOrdersQuantity
        end
        item
          Kind = skMax
          FieldName = 'PurchaseDate'
          Column = tvOrdersPurchaseDate
        end
        item
          Kind = skMin
          FieldName = 'Time'
          Column = tvOrdersTime
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      Styles.StyleSheet = SummaryFooterDemoDataDM.GridTableViewStyleSheetDevExpress
      object tvOrdersCustomerID: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'CustomerID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end>
        Properties.ListSource = SummaryFooterDemoDataDM.dsCustomers
        Width = 100
      end
      object tvOrdersPurchaseDate: TcxGridDBColumn
        DataBinding.FieldName = 'PurchaseDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 60
      end
      object tvOrdersTime: TcxGridDBColumn
        DataBinding.FieldName = 'Time'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        Width = 50
      end
      object tvOrdersPaymentType: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentType'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.Images = SummaryFooterDemoDataDM.PaymentTypeImages
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
      end
      object tvOrdersPaymentAmount: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentAmount'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
      end
      object tvOrdersDescription: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
      end
      object tvOrdersQuantity: TcxGridDBColumn
        DataBinding.FieldName = 'Quantity'
        PropertiesClassName = 'TcxSpinEditProperties'
        Width = 30
      end
    end
    object lvCars: TcxGridLevel
      GridView = tvCars
      MaxDetailHeight = 200
      object lvOrders: TcxGridLevel
        GridView = tvOrders
      end
    end
  end
  object mmMain: TMainMenu
    Left = 472
    Top = 8
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
      object miSummaries: TMenuItem
        Caption = 'Su&mmary'
        Hint = 'Displays the brief description of the current demo features'
        object miCustomizeSummaries: TMenuItem
          Caption = '&Customize Summaries...'
          Hint = 'Press to customize summaries'
          OnClick = miCustomizeSummariesClick
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object miSelectedRecordOnly: TMenuItem
          Caption = 'C&alculate on selected records only'
          Hint = 'Check to calculate on selected records only'
          OnClick = miSelectedRecordOnlyClick
        end
        object miIgnoreNullValues: TMenuItem
          Caption = '&Ignore Null Values when calculating'
          Hint = 
            'Ignore Null values when calculating Count and Average summary ki' +
            'nds'
          OnClick = miIgnoreNullValuesClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miFooter: TMenuItem
        Caption = 'Show &Footer'
        Hint = 'Show view footer '
        OnClick = miFooterClick
      end
      object miMultiSelect: TMenuItem
        Caption = '&Multi Select'
        Checked = True
        Hint = 'Check to select more than one record'
        OnClick = miMultiSelectClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
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
    Kind = lfOffice11
    Left = 504
    Top = 8
  end
end
