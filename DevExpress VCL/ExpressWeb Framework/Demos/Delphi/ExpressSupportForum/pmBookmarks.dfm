object Bookmarks: TBookmarks
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptFlow
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  Left = 50
  Top = 50
  Height = 562
  HorizontalOffset = 206
  VerticalOffset = 141
  Width = 822
  object DataNavigator: TcxWebDBDataNavigator
    CustomEvents = <>
    StyleItem_Default = DM.NavigatorStyle
    StyleItem_Hover = DM.NavigatorStyleHover
    Left = 10
    ShowHint = True
    Top = 216
    Height = 26
    Width = 297
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
      end>
    PageSize = 5
    Styles.Default = DM.NavigatorStyle
    Styles.Hover = DM.NavigatorStyleHover
    DataBinding.DataSource = DataSource
  end
  object Grid: TcxWebDBGrid
    CustomEvents = <>
    Left = 10
    Top = 15
    Height = 186
    Width = 606
    ZIndex = 0
    BorderWidth = 1
    BorderColor = clWebBlack
    IndicatorWidth = 18
    KeepPageSize = False
    PageSize = 7
    ReadOnly = False
    RowHeight = 26
    SelectedColor = clWebLightGrey
    SelectedFontColor = clWebBlack
    ShowGroupedColumns = True
    ShowGroupPanel = False
    ShowHeader = False
    ShowStatusPanel = False
    DataBinding.DataSource = DataSource
    FirstVisibleRow = 0
    object Name: TcxWebDBColumn
      Title = 'Status'
      VAlignment = wvalCenter
      Width = 586
      DataBinding.FieldName = 'CalcName'
    end
  end
  object DataSource: TcxWebDBDataSource
    CustomEvents = <>
    OnDeleting = DataSourceDeleting
    OnStartEdit = DataSourceStartEdit
    AllowExpanding = False
    AllowGrouping = False
    AllowSorting = False
    DataSet = Query
    Left = 444
    Top = 40
  end
  object Query: TADOQuery
    Connection = DM.Connection
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = QueryCalcFields
    Parameters = <
      item
        Name = 'uid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from  '
      'bookmarks '
      'where userid = :uid;')
    Left = 226
    Top = 18
    object QueryBOOKMARKID: TIntegerField
      FieldName = 'BOOKMARKID'
    end
    object QueryUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object QueryCATEGORYID: TIntegerField
      FieldName = 'CATEGORYID'
    end
    object QueryARTICLEID: TIntegerField
      FieldName = 'ARTICLEID'
    end
    object QueryNAME: TStringField
      FieldName = 'NAME'
      Size = 150
    end
    object QueryCalcName: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcName'
      Size = 150
      Calculated = True
    end
  end
  object SelectArtQuery: TADOQuery
    Connection = DM.Connection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'qid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select ARTICLEID '
      'from answeronq '
      'where questionid = :qid')
    Left = 90
    Top = 28
  end
  object DelBookQuery: TADOQuery
    Connection = DM.Connection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'BOOKMARKID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM BOOKMARKS'
      'WHERE BOOKMARKID=:BOOKMARKID ')
    Left = 308
    Top = 26
  end
end
