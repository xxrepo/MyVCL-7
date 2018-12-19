object LookupHomePage: TLookupHomePage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  OnDeactivate = cxWebPageModuleDeactivate
  Left = 50
  Top = 50
  Height = 811
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 1081
  object dsMain: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'OrderNo'
    DataSet = ADOTable1
    Left = 264
    Top = 16
  end
  object dsLookupList: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'CustNo'
    DataSet = ADOTable2
    Left = 368
    Top = 16
  end
  object cxWebDBGrid1: TcxWebDBGrid
    CustomEvents = <>
    Left = 9
    Top = 101
    Height = 328
    Width = 1070
    ZIndex = 0
    BorderWidth = 1
    BorderColor = clWebBlack
    IndicatorWidth = 18
    KeepPageSize = False
    PageSize = 9
    ReadOnly = False
    RowHeight = 26
    SelectedColor = clWebHighlight
    SelectedFontColor = clWebCaptionText
    ShowGroupedColumns = True
    DataBinding.DataSource = dsMain
    FirstVisibleRow = 0
    object cxWebDBGrid1Column1: TcxWebDBColumn
      Title = 'OrderNo'
      VAlignment = wvalCenter
      UndefinedValuesState = uvsUnchecked
      Width = 150
      DataBinding.FieldName = 'OrderNo'
    end
    object cxWebDBGrid1Column4: TcxWebDBColumn
      Title = 'CustNo'
      VAlignment = wvalCenter
      UndefinedValuesState = uvsUnchecked
      Width = 150
      DataBinding.FieldName = 'CustNo'
    end
    object cxWebDBGrid1Column2: TcxWebDBColumn
      Title = 'CustCompany'
      VAlignment = wvalCenter
      ViewType = cvtLookup
      UndefinedValuesState = uvsUnchecked
      Width = 150
      DataBinding.FieldName = 'CustNo'
      DataBinding.KeyFieldName = 'CustNo'
      DataBinding.ListFieldName = 'Company'
      DataBinding.ListSource = dsLookupList
    end
    object cxWebDBGrid1Column3: TcxWebDBColumn
      Title = 'SaleDate'
      VAlignment = wvalCenter
      UndefinedValuesState = uvsUnchecked
      Width = 150
      DataBinding.FieldName = 'SaleDate'
    end
    object cxWebDBGrid1Column17: TcxWebDBColumn
      Title = 'PaymentMethod'
      VAlignment = wvalCenter
      UndefinedValuesState = uvsUnchecked
      Width = 150
      DataBinding.FieldName = 'PaymentMethod'
    end
    object cxWebDBGrid1Column18: TcxWebDBColumn
      Title = 'ItemsTotal'
      VAlignment = wvalCenter
      UndefinedValuesState = uvsUnchecked
      Width = 150
      DataBinding.FieldName = 'ItemsTotal'
    end
    object cxWebDBGrid1Column21: TcxWebDBColumn
      Title = 'AmountPaid'
      VAlignment = wvalCenter
      UndefinedValuesState = uvsUnchecked
      Width = 150
      DataBinding.FieldName = 'AmountPaid'
    end
  end
  object cxWebDBLookup1: TcxWebDBLookup
    CustomEvents = <>
    Left = 171
    Top = 449
    Height = 22
    Width = 127
    ZIndex = 0
    TabOrder = 1
    DataBinding.DataSource = dsMain
    DataBinding.FieldName = 'CustNo'
    DataBinding.KeyFieldName = 'CustNo'
    DataBinding.ListSource = dsLookupList
    DataBinding.ListFieldName = 'Company'
  end
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    Left = 20
    Top = 448
    Height = 17
    Width = 108
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Simple lookup'
  end
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    Left = 21
    Top = 484
    Height = 17
    Width = 105
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Extended lookup'
  end
  object cxWebExtDBLookup1: TcxWebExtDBLookup
    CustomEvents = <>
    Left = 172
    Top = 484
    Height = 22
    Width = 124
    ZIndex = 0
    TabOrder = 0
    DataBinding.DataSource = dsMain
    DataBinding.FieldName = 'CustNo'
    DataBinding.KeyFieldName = 'CustNo'
    DataBinding.ListSource = dsLookupList
    DataBinding.ListFieldIndex = 0
    DataBinding.ListFieldNames = 'Company;Country;City;Phone'
    ButtonImageIndex = 0
    ButtonWidth = 18
    LookupHeight = 200
    LookupWidth = 600
  end
  object cxWebDBDataNavigator1: TcxWebDBDataNavigator
    CustomEvents = <>
    Left = 12
    Top = 60
    Height = 26
    Width = 390
    ZIndex = 0
    Buttons = <
      item
        ButtonType = nbFirst
        Hint = 'First record'
      end
      item
        ButtonType = nbPrevPage
        Hint = 'Prior page'
      end
      item
        ButtonType = nbPrev
        Hint = 'Prior record'
      end
      item
        ButtonType = nbPageSize
        Hint = 'Page size'
      end
      item
        ButtonType = nbApplyPageSize
        Hint = 'Apply page size'
      end
      item
        ButtonType = nbNext
        Hint = 'Next record'
      end
      item
        ButtonType = nbNextPage
        Hint = 'Next page'
      end
      item
        ButtonType = nbLast
        Hint = 'Last record'
      end
      item
        ButtonType = nbInsert
        Hint = 'Insert record'
      end
      item
        ButtonType = nbEdit
        Hint = 'Edit record'
      end
      item
        ButtonType = nbDelete
        Hint = 'Delete record'
      end
      item
        ButtonType = nbPost
        Hint = 'Post changes'
      end
      item
        ButtonType = nbCancel
        Hint = 'Cancel changes'
      end
      item
        ButtonType = nbRefresh
        Hint = 'Refresh'
      end>
    PageSize = 5
    DataBinding.DataSource = dsMain
  end
  object cbLAL: TcxWebCheckBox
    CustomEvents = <>
    Left = 755
    Top = 69
    Height = 23
    Width = 160
    ZIndex = 0
    TabOrder = 2
    Caption = 'Load all records mode'
    OnClick = cbLALClick
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'orders'
    Left = 544
    Top = 16
  end
  object ADOTable2: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'customer'
    Left = 656
    Top = 16
  end
end
