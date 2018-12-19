object frmMain: TfrmMain
  Left = 300
  Top = 120
  Width = 760
  Height = 735
  Caption = 'ExpressQuantumGrid CardLayout Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 752
    Height = 29
    Align = alTop
    AutoSize = False
    Caption = 
      '  This demo shows different layout options available for the Car' +
      'dView. Click '#39'About this demo'#39' for more information.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object Grid: TcxGrid
    Left = 0
    Top = 29
    Width = 752
    Height = 655
    Align = alClient
    TabOrder = 0
    LevelTabs.Style = 9
    LookAndFeel.NativeStyle = True
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    object cvHorizontal: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCars
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.LayeredRows = True
      OptionsCustomize.RowMoving = True
      OptionsView.CardAutoWidth = True
      OptionsView.CardWidth = 300
      OptionsView.CategorySeparatorWidth = 1
      OptionsView.CellAutoHeight = True
      OptionsView.SeparatorColor = clSilver
      Styles.StyleSheet = CardsStyleSheet
      object cvHorizontalTrademark: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Trademark'
        Options.ShowCaption = False
        Position.BeginsLayer = True
        Styles.Content = styleCardHeader
      end
      object cvHorizontalModel: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Model'
        Options.ShowCaption = False
        Position.BeginsLayer = False
        Styles.Content = styleCardHeader
      end
      object cvHorizontalPicture: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Picture'
        RepositoryItem = EditRepositoryImage
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cvHorizontalRow3: TcxGridDBCardViewRow
        Caption = 'Engine'
        Expanded = True
        Kind = rkCategory
        Options.ShowData = False
        Position.BeginsLayer = True
      end
      object cvHorizontalHP: TcxGridDBCardViewRow
        Caption = 'Max output (hp)'
        DataBinding.FieldName = 'HP'
        Position.BeginsLayer = True
      end
      object cvHorizontalLiter: TcxGridDBCardViewRow
        Caption = 'Displacement (liters)'
        DataBinding.FieldName = 'Liter'
        Position.BeginsLayer = True
      end
      object cvHorizontalCyl: TcxGridDBCardViewRow
        Caption = 'Cylinders'
        DataBinding.FieldName = 'Cyl'
        Position.BeginsLayer = False
      end
      object cvHorizontalRow4: TcxGridDBCardViewRow
        Caption = 'Transmission'
        Kind = rkCategory
        Options.ShowData = False
        Position.BeginsLayer = True
      end
      object cvHorizontalTransmissSpeedCount: TcxGridDBCardViewRow
        Caption = 'Speed count'
        DataBinding.FieldName = 'TransmissSpeedCount'
        Position.BeginsLayer = True
      end
      object cvHorizontalTransmissAutomatic: TcxGridDBCardViewRow
        Caption = 'Automatic'
        DataBinding.FieldName = 'TransmissAutomatic'
        RepositoryItem = EditRepositoryAutomatic
        Position.BeginsLayer = False
      end
      object cvHorizontalRow2: TcxGridDBCardViewRow
        Caption = 'Fuel economy'
        DataBinding.FieldName = 'FuelEconomy'
        RepositoryItem = EditRepositoryFuelEconomy
        Kind = rkCategory
        Options.Editing = False
        Position.BeginsLayer = True
        Styles.Content = styleCategoryRow
      end
      object cvHorizontalMPG_City: TcxGridDBCardViewRow
        Caption = 'City (mpg)'
        DataBinding.FieldName = 'MPG_City'
        Position.BeginsLayer = True
      end
      object cvHorizontalMPG_Highway: TcxGridDBCardViewRow
        Caption = 'Highway (mpg)'
        DataBinding.FieldName = 'MPG_Highway'
        Position.BeginsLayer = False
      end
      object cvHorizontalCategory: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Category'
        Visible = False
        Position.BeginsLayer = True
      end
      object cvHorizontalRow1: TcxGridDBCardViewRow
        Caption = 'Additional information'
        Kind = rkCategory
        Options.ShowData = False
        Position.BeginsLayer = True
      end
      object cvHorizontalDescription: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Description'
        RepositoryItem = EditRepositoryMemo
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cvHorizontalHyperlink: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Hyperlink'
        RepositoryItem = EditRepositoryHyperLink
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cvHorizontalPrice: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Price'
        RepositoryItem = EditRepositoryPrice
        Options.ShowCaption = False
        Position.BeginsLayer = False
        Styles.Content = stylePrice
      end
    end
    object cvVertical: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCars
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      LayoutDirection = ldVertical
      OptionsCustomize.LayeredRows = True
      OptionsCustomize.RowMoving = True
      OptionsView.CardAutoWidth = True
      OptionsView.CardWidth = 10000
      OptionsView.CellAutoHeight = True
      OptionsView.LayerSeparatorWidth = 1
      OptionsView.SeparatorWidth = 0
      RowLayout = rlVertical
      Styles.StyleSheet = CardsStyleSheet
      object cvVerticalTrademark: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Trademark'
        Options.ShowCaption = False
        Position.BeginsLayer = True
        Styles.Content = styleCardHeader
      end
      object cvVerticalModel: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Model'
        Options.ShowCaption = False
        Position.BeginsLayer = False
        Styles.Content = styleCardHeader
      end
      object cvVerticalPicture: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Picture'
        RepositoryItem = EditRepositoryImage
        Options.ShowCaption = False
        Position.BeginsLayer = False
        Position.Width = 250
      end
      object cvVerticalHyperlink: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Hyperlink'
        RepositoryItem = EditRepositoryHyperLink
        Options.ShowCaption = False
        Position.BeginsLayer = False
      end
      object cvVerticalPrice: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Price'
        RepositoryItem = EditRepositoryPrice
        Options.ShowCaption = False
        Position.BeginsLayer = False
        Styles.Content = stylePrice
      end
      object cvVerticalRow1: TcxGridDBCardViewRow
        Caption = 'Engine'
        Expanded = True
        Kind = rkCategory
        Options.ShowData = False
        Position.BeginsLayer = True
      end
      object cvVerticalHP: TcxGridDBCardViewRow
        Caption = 'Max output (hp)'
        DataBinding.FieldName = 'HP'
        Position.BeginsLayer = False
      end
      object cvVerticalLiter: TcxGridDBCardViewRow
        Caption = 'Displacement (liters)'
        DataBinding.FieldName = 'Liter'
        Position.BeginsLayer = False
      end
      object cvVerticalCyl: TcxGridDBCardViewRow
        Caption = 'Cylinders'
        DataBinding.FieldName = 'Cyl'
        Position.BeginsLayer = False
      end
      object cvVerticalRow2: TcxGridDBCardViewRow
        Caption = 'Transmission'
        Expanded = True
        Kind = rkCategory
        Options.ShowData = False
        Position.BeginsLayer = False
      end
      object cvVerticalTransmissSpeedCount: TcxGridDBCardViewRow
        Caption = 'Speed count'
        DataBinding.FieldName = 'TransmissSpeedCount'
        Position.BeginsLayer = False
      end
      object cvVerticalTransmissAutomatic: TcxGridDBCardViewRow
        Caption = 'Automatic'
        DataBinding.FieldName = 'TransmissAutomatic'
        RepositoryItem = EditRepositoryAutomatic
        Position.BeginsLayer = False
      end
      object cvVerticalCategory: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Category'
        Visible = False
        Position.BeginsLayer = False
      end
      object cvVerticalFuelEconomy: TcxGridDBCardViewRow
        Caption = 'Fuel economy'
        DataBinding.FieldName = 'FuelEconomy'
        RepositoryItem = EditRepositoryFuelEconomy
        Expanded = True
        Kind = rkCategory
        Options.Editing = False
        Position.BeginsLayer = False
      end
      object cvVerticalMPG_City: TcxGridDBCardViewRow
        Caption = 'City (mpg)'
        DataBinding.FieldName = 'MPG_City'
        Position.BeginsLayer = False
      end
      object cvVerticalMPG_Highway: TcxGridDBCardViewRow
        Caption = 'Highway (mpg)'
        DataBinding.FieldName = 'MPG_Highway'
        Position.BeginsLayer = False
      end
      object cvVerticalRow3: TcxGridDBCardViewRow
        Caption = 'Additional information'
        Expanded = True
        Kind = rkCategory
        Options.ShowData = False
        Position.BeginsLayer = True
      end
      object cvVerticalDescription: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Description'
        RepositoryItem = EditRepositoryMemo
        Options.ShowCaption = False
        Position.BeginsLayer = False
      end
    end
    object GridLevel1: TcxGridLevel
      Caption = 'Horizontal Row Layout + Horizontal Card Layout'
      GridView = cvHorizontal
    end
    object GridLevel2: TcxGridLevel
      Caption = 'Vertical Row Layout + Vertical Card Layout'
      GridView = cvVertical
    end
  end
  object dbMain: TDatabase
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 232
    Top = 120
  end
  object dsCars: TDataSource
    DataSet = tblCars
    Left = 232
    Top = 156
  end
  object tblCars: TTable
    Active = True
    OnCalcFields = tblCarsCalcFields
    DatabaseName = 'DemosDB'
    TableName = 'Cars.DB'
    Left = 260
    Top = 156
    object tblCarsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblCarsTrademark: TStringField
      FieldName = 'Trademark'
      Size = 50
    end
    object tblCarsModel: TStringField
      FieldName = 'Model'
      Size = 50
    end
    object tblCarsHP: TSmallintField
      FieldName = 'HP'
    end
    object tblCarsLiter: TFloatField
      FieldName = 'Liter'
    end
    object tblCarsCyl: TSmallintField
      FieldName = 'Cyl'
    end
    object tblCarsTransmissSpeedCount: TSmallintField
      FieldName = 'TransmissSpeedCount'
    end
    object tblCarsTransmissAutomatic: TStringField
      FieldName = 'TransmissAutomatic'
      Size = 3
    end
    object tblCarsMPG_City: TSmallintField
      FieldName = 'MPG_City'
    end
    object tblCarsMPG_Highway: TSmallintField
      FieldName = 'MPG_Highway'
    end
    object tblCarsCategory: TStringField
      FieldName = 'Category'
      Size = 7
    end
    object tblCarsDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
      Size = 10
    end
    object tblCarsHyperlink: TStringField
      FieldName = 'Hyperlink'
      Size = 50
    end
    object tblCarsPicture: TBlobField
      FieldName = 'Picture'
      BlobType = ftParadoxOle
      Size = 10
    end
    object tblCarsPrice: TFloatField
      FieldName = 'Price'
    end
    object tblCarsFuelEconomy: TStringField
      FieldKind = fkCalculated
      FieldName = 'FuelEconomy'
      Calculated = True
    end
  end
  object mmMain: TMainMenu
    Left = 300
    Top = 116
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miView: TMenuItem
      Caption = '&View'
      object miCardAutoWidth: TMenuItem
        Caption = 'Card auto width'
        OnClick = miCardAutoWidthClick
      end
      object miCellSelection: TMenuItem
        Caption = 'Cell selection'
        OnClick = miCellSelectionClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miCustomize: TMenuItem
        Caption = 'Customize...'
        OnClick = miCustomizeClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 300
    Top = 156
    PixelsPerInch = 96
    object styleSelection: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5228795
      TextColor = clBlack
    end
    object styleCardHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object styleCardBorder: TcxStyle
      AssignedValues = [svColor]
      Color = 13603685
    end
    object styleBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 15918293
    end
    object styleCategoryRow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16766389
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object stylePrice: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object CardsStyleSheet: TcxGridCardViewStyleSheet
      Styles.Background = styleBackground
      Styles.Selection = styleSelection
      Styles.CardBorder = styleCardBorder
      Styles.CategoryRow = styleCategoryRow
      Styles.CategorySeparator = styleCardBorder
      Styles.LayerSeparator = styleCardBorder
      BuiltIn = True
    end
  end
  object EditRepository: TcxEditRepository
    Left = 300
    Top = 188
    object EditRepositoryImage: TcxEditRepositoryImageItem
      Properties.GraphicClassName = 'TJPEGImage'
      Properties.Stretch = True
    end
    object EditRepositoryMemo: TcxEditRepositoryMemoItem
      Properties.VisibleLineCount = 15
    end
    object EditRepositoryHyperLink: TcxEditRepositoryHyperLinkItem
    end
    object EditRepositoryPrice: TcxEditRepositoryCurrencyItem
    end
    object EditRepositoryFuelEconomy: TcxEditRepositoryTextItem
      Properties.Alignment.Horz = taRightJustify
    end
    object EditRepositoryAutomatic: TcxEditRepositoryCheckBoxItem
      Properties.ValueChecked = 'Yes'
      Properties.ValueUnchecked = 'No'
    end
  end
end
