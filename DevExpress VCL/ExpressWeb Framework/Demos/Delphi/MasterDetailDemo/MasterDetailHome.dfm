object MasterDetailHomePage: TMasterDetailHomePage
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
  Height = 885
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 1008
  object dsDetail: TcxWebDBDataSource
    CustomEvents = <>
    AllowEditing = False
    KeyFieldName = 'OrderNo'
    DataSet = ADOQuery1
    Left = 48
    Top = 24
  end
  object cxWebDBGrid1: TcxWebDBGrid
    CustomEvents = <>
    Left = 20
    Top = 471
    Height = 198
    Width = 907
    ZIndex = 0
    BorderWidth = 1
    BorderColor = clWebBlack
    IndicatorType = itCursor
    IndicatorWidth = 18
    KeepPageSize = False
    PageSize = 4
    ReadOnly = True
    RowHeight = 26
    SelectedColor = clWebHighlight
    SelectedFontColor = clWebCaptionText
    ShowGroupedColumns = True
    DataBinding.DataSource = dsDetail
    FirstVisibleRow = 0
    object cxWebDBGrid1Column1: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Order No'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 176
      DataBinding.FieldName = 'OrderNo'
    end
    object cxWebDBGrid1Column5: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Items total'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 171
      DataBinding.FieldName = 'ItemsTotal'
    end
    object cxWebDBGrid1Column2: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Amount paid'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 176
      DataBinding.FieldName = 'AmountPaid'
    end
    object cxWebDBGrid1Column3: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Payment Method'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 176
      DataBinding.FieldName = 'PaymentMethod'
    end
    object cxWebDBGrid1Column4: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Sale date'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 188
      DataBinding.FieldName = 'SaleDate'
    end
  end
  object dsMaster: TcxWebDBDataSource
    CustomEvents = <>
    AllowEditing = False
    KeyFieldName = 'CustNo'
    OnScrolled = dsMasterScrolled
    DataSet = ADOTable1
    Left = 272
    Top = 32
  end
  object cxWebDBGrid2: TcxWebDBGrid
    CustomEvents = <>
    Left = 20
    Top = 170
    Height = 198
    Width = 900
    ZIndex = 0
    BorderWidth = 1
    BorderColor = clWebBlack
    IndicatorType = itCursor
    IndicatorWidth = 18
    KeepPageSize = False
    PageSize = 4
    ReadOnly = True
    RowHeight = 26
    SelectedColor = clWebHighlight
    SelectedFontColor = clWebCaptionText
    ShowGroupedColumns = True
    DataBinding.DataSource = dsMaster
    FirstVisibleRow = 0
    object cxWebDBGrid2Column1: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Company'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 173
      DataBinding.FieldName = 'Company'
    end
    object cxWebDBGrid2Column2: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'City'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 173
      DataBinding.FieldName = 'City'
    end
    object cxWebDBGrid2Column3: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Country'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 173
      DataBinding.FieldName = 'Country'
    end
    object cxWebDBGrid2Column4: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Address'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 173
      DataBinding.FieldName = 'Addr1'
    end
    object cxWebDBGrid2Column5: TcxWebDBColumn
      CheckedValue = 'True'
      ReadOnly = True
      ShowCellHint = False
      ShowHeaderHint = False
      Title = 'Phone'
      VAlignment = wvalCenter
      UncheckedValue = 'False'
      UndefinedValuesState = uvsUnchecked
      Width = 188
      DataBinding.FieldName = 'Phone'
    end
  end
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    Left = 20
    Top = 101
    Height = 22
    Width = 226
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Customer info (master table)'
  end
  object cxWebDBDataNavigator2: TcxWebDBDataNavigator
    CustomEvents = <>
    Left = 20
    Top = 429
    Height = 26
    Width = 260
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
        Visible = False
      end
      item
        ButtonType = nbEdit
        Hint = 'Edit record'
        Visible = False
      end
      item
        ButtonType = nbDelete
        Hint = 'Delete record'
        Visible = False
      end
      item
        ButtonType = nbPost
        Hint = 'Post changes'
        Visible = False
      end
      item
        ButtonType = nbCancel
        Hint = 'Cancel changes'
        Visible = False
      end
      item
        ButtonType = nbRefresh
        Hint = 'Refresh'
      end>
    PageSize = 5
    DataBinding.DataSource = dsDetail
  end
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    Left = 20
    Top = 403
    Height = 22
    Width = 191
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Order info (detail table)'
  end
  object cxWebDBDataNavigator1: TcxWebDBDataNavigator
    CustomEvents = <>
    Left = 20
    Top = 128
    Height = 26
    Width = 260
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
        Visible = False
      end
      item
        ButtonType = nbEdit
        Hint = 'Edit record'
        Visible = False
      end
      item
        ButtonType = nbDelete
        Hint = 'Delete record'
        Visible = False
      end
      item
        ButtonType = nbPost
        Hint = 'Post changes'
        Visible = False
      end
      item
        ButtonType = nbCancel
        Hint = 'Cancel changes'
        Visible = False
      end
      item
        ButtonType = nbRefresh
        Hint = 'Refresh'
      end>
    PageSize = 5
    DataBinding.DataSource = dsMaster
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'customer'
    Left = 360
    Top = 16
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from orders where CustNo=1221')
    Left = 176
    Top = 24
  end
end
