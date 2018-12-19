object frmMain: TfrmMain
  Left = 300
  Top = 120
  Width = 720
  Height = 600
  Caption = 'ExpressQuantumGrid Filter Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 712
    Height = 29
    Align = alTop
    AutoSize = False
    Caption = 
      '  This demo shows the advanced filter capabilities of the Table/' +
      'Card view'
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
    Top = 57
    Width = 712
    Height = 489
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = True
    object TableView: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = True
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = True
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = True
      NavigatorButtons.Delete.Visible = True
      NavigatorButtons.Edit.Visible = True
      NavigatorButtons.Post.Visible = True
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = True
      NavigatorButtons.GotoBookmark.Visible = True
      NavigatorButtons.Filter.Visible = True
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.PercentWildcard = '*'
      DataController.Filter.UnderscoreWildcard = '?'
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DateTimeHandling.Filters = [dtfRelativeDays, dtfRelativeDayPeriods, dtfRelativeWeeks, dtfRelativeMonths, dtfRelativeYears, dtfPastFuture, dtfMonths, dtfYears]
      DateTimeHandling.IgnoreTimeForFiltering = True
      DateTimeHandling.Grouping = dtgRelativeToToday
      Filtering.ColumnPopup.MaxDropDownItemCount = 30
      FilterRow.Visible = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      object TableViewOrderID: TcxGridColumn
        Caption = 'Order ID'
        DataBinding.ValueType = 'Integer'
        Width = 49
      end
      object TableViewCompany: TcxGridColumn
        Caption = 'Company'
        Width = 205
      end
      object TableViewCountry: TcxGridColumn
        Caption = 'Country'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ClearKey = 46
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 25
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Caption = 'Name'
            Fixed = True
            SortOrder = soAscending
            Width = 265
            FieldName = 'NAME'
          end
          item
            Caption = 'Flag'
            Fixed = True
            RepositoryItem = erMainFlag
            Width = 60
            FieldName = 'NATIONALFLAG'
          end>
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsCountries
        Width = 110
      end
      object TableViewProduct: TcxGridColumn
        Caption = 'Product'
        Width = 130
      end
      object TableViewOrderDate: TcxGridColumn
        Caption = 'Order Date'
        DataBinding.ValueType = 'DateTime'
        Width = 130
      end
      object TableViewQuantity: TcxGridColumn
        Caption = 'Quantity'
        DataBinding.ValueType = 'Integer'
        Width = 50
      end
    end
    object GridLevel1: TcxGridLevel
      GridView = TableView
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 712
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clGray
    TabOrder = 1
    object pnlMaskInfo: TPanel
      Left = 1
      Top = 1
      Width = 710
      Height = 26
      Align = alClient
      BevelOuter = bvNone
      Caption = 
        'You can use * and ? symbols in the filter row to define a filter' +
        ' mask (for example: Express* for all products beginning with Exp' +
        'ress)'
      Color = clInfoBk
      TabOrder = 0
    end
  end
  object dbMain: TDatabase
    Connected = True
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
  object dsCompanies: TDataSource
    DataSet = tblCompanies
    Left = 232
    Top = 156
  end
  object tblCompanies: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'COMPANIES.DB'
    Left = 260
    Top = 156
    object tblCompaniesCOMPANYNAME: TStringField
      FieldName = 'COMPANYNAME'
      Size = 50
    end
    object tblCompaniesCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
  end
  object mmMain: TMainMenu
    Left = 300
    Top = 120
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
      object miColumnFilterPopupMultiSelect: TMenuItem
        Caption = 'Column Filter Popup MultiSelect'
        OnClick = miColumnFilterPopupMultiSelectClick
      end
      object miApplyMultiSelectChanges: TMenuItem
        Caption = 'Apply MultiSelect changes'
        object miApplyMultiSelectChangesImmediately: TMenuItem
          Caption = 'Immediately'
          GroupIndex = 1
          RadioItem = True
          OnClick = miApplyMultiSelectChangesClick
        end
        object miApplyMultiSelectChangesOnButtonClick: TMenuItem
          Caption = 'On button click'
          GroupIndex = 1
          RadioItem = True
          OnClick = miApplyMultiSelectChangesClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miColumnFilterPopupFilteredList: TMenuItem
        Caption = 'Column Filter Popup filtered list'
        OnClick = miColumnFilterPopupFilteredListClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miFilterRow: TMenuItem
        Caption = 'Filter Row'
        OnClick = miFilterRowClick
      end
      object miApplyFilterRowChanges: TMenuItem
        Caption = 'Apply Filter Row changes'
        object miApplyFilterRowChangesOnCellExit: TMenuItem
          Caption = 'On cell exit'
          GroupIndex = 2
          RadioItem = True
          OnClick = miApplyFilterRowChangesClick
        end
        object miApplyFilterRowChangesImmediately: TMenuItem
          Caption = 'Immediately'
          GroupIndex = 2
          RadioItem = True
          OnClick = miApplyFilterRowChangesClick
        end
      end
    end
    object miDateTimeFilters: TMenuItem
      Caption = '&DateTime Filters'
      object miDateTimeFilterRelativeDays: TMenuItem
        Caption = 'Relative Days'
        OnClick = miDateTimeFilterClick
      end
      object miDateTimeFilterRelativeDayPeriods: TMenuItem
        Caption = 'Relative Day Periods'
        OnClick = miDateTimeFilterClick
      end
      object miDateTimeFilterRelativeWeeks: TMenuItem
        Caption = 'Relative Weeks'
        OnClick = miDateTimeFilterClick
      end
      object miDateTimeFilterRelativeMonths: TMenuItem
        Caption = 'Relative Months'
        OnClick = miDateTimeFilterClick
      end
      object miDateTimeFilterRelativeYears: TMenuItem
        Caption = 'Relative Years'
        OnClick = miDateTimeFilterClick
      end
      object miDateTimeFilterPastFuture: TMenuItem
        Caption = 'Past/Future'
        OnClick = miDateTimeFilterClick
      end
      object miDateTimeFilterMonths: TMenuItem
        Caption = 'Months'
        OnClick = miDateTimeFilterClick
      end
      object miDateTimeFilterYears: TMenuItem
        Caption = 'Years'
        OnClick = miDateTimeFilterClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object tblCountries: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'COUNTRIES.DB'
    Left = 260
    Top = 188
  end
  object tblProducts: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'PRODUCTS.DB'
    Left = 260
    Top = 220
    object tblProductsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblProductsName: TStringField
      FieldName = 'Name'
      Size = 100
    end
  end
  object dsCountries: TDataSource
    DataSet = tblCountries
    Left = 232
    Top = 188
  end
  object erMain: TcxEditRepository
    Left = 300
    Top = 156
    object erMainFlag: TcxEditRepositoryImageItem
      Properties.GraphicClassName = 'TJPEGImage'
      Properties.Stretch = True
    end
  end
end
