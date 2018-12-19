object IntroList: TIntroList
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
  Height = 430
  HorizontalOffset = 200
  VerticalOffset = 124
  Width = 820
  object Query: TADOQuery
    Connection = DM.Connection
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'cid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * '
      'from categories'
      'where parentid = :cid')
    Left = 20
    Top = 24
    object QueryCATEGORYID: TIntegerField
      FieldName = 'CATEGORYID'
    end
    object QueryPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object QueryNAME: TStringField
      DisplayWidth = 200
      FieldName = 'NAME'
      Size = 200
    end
    object QueryDESCRIPTION: TStringField
      DisplayWidth = 200
      FieldName = 'DESCRIPTION'
      Size = 200
    end
    object QueryCHILDCOUNT: TIntegerField
      FieldName = 'CHILDCOUNT'
    end
    object QueryDATE: TDateTimeField
      FieldName = 'DATE'
    end
  end
  object DataSource: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'CATEGORYID'
    DataSet = Query
    Left = 162
    Top = 38
  end
  object ArticliesQuery: TADOQuery
    Connection = DM.Connection
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'cid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select a.subject, a.articleid, a.source '
      'from articles a, artfromcat ac '
      'where ac.categoryid = :cid and ac.articleid = a.articleid and '
      '      a.editorid Is Not Null ')
    Left = 290
    Top = 34
    object ArticliesQuerysubject: TStringField
      FieldName = 'subject'
      Size = 255
    end
    object ArticliesQueryarticleid: TIntegerField
      FieldName = 'articleid'
    end
    object ArticliesQuerysource: TStringField
      FieldName = 'source'
      Size = 50
    end
  end
  object ArtDataSource: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'articleid'
    DataSet = ArticliesQuery
    Left = 386
    Top = 38
  end
  object CurArtDataSource: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'CATEGORYID'
    DataSet = CurArtQuery
    Left = 540
    Top = 38
  end
  object CurArtQuery: TADOQuery
    Connection = DM.Connection
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'CID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM CATEGORIES'
      'WHERE CATEGORYID = :CID')
    Left = 484
    Top = 12
    object CurArtQueryCATEGORYID: TIntegerField
      FieldName = 'CATEGORYID'
    end
    object CurArtQueryPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object CurArtQueryNAME: TStringField
      DisplayWidth = 200
      FieldName = 'NAME'
      Size = 200
    end
    object CurArtQueryDESCRIPTION: TStringField
      DisplayWidth = 200
      FieldName = 'DESCRIPTION'
      Size = 200
    end
    object CurArtQueryCHILDCOUNT: TIntegerField
      FieldName = 'CHILDCOUNT'
    end
    object CurArtQueryDATE: TDateTimeField
      FieldName = 'DATE'
    end
  end
  object ArtDBTable: TcxWebDBTable
    CustomEvents = <>
    Left = 532
    Top = 31
    Height = 27
    Width = 611
    ZIndex = 0
    DataBinding.DataSource = ArtDataSource
    Columns = <
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'subject'
        Title = 'Subject'
        TitleAlignment = whalLeft
        ViewType = tvtHyperText
        Width = 0
      end>
    MaximumWidth = True
    Paging.Alignment = whalCenter
    Paging.MaxPageNumbers = 10
    Paging.PagingSize = 10
    Paging.PagingType = tptBoth
    PageIndex = 0
    AlternatingItemsStyles.Default = DM.TableAlter
    HeaderStyles.Default = DM.TableHeader
    HeaderStyles.Hover = DM.TableHeaderHover
    ItemsStyles.Default = DM.TableItems
    PagingStyles.Default = DM.TablePaging
    PagingNumbersStyles.Default = DM.TablePaging
    PagingNumbersStyles.Hover = DM.TablePagingHover
    SelectingPagingNumberStyles.Default = DM.TablePagingSelect
    BorderColor = clWebWindow
    BorderWidth = 0
    CellPadding = 2
    CellSpacing = 0
    ShowHeaders = True
    OnGetHrefValue = ArtDBTableGetHrefValue
    OnGetTitleHTML = ArtDBTableGetTitleHTML
  end
  object CatDBTable: TcxWebDBTable
    CustomEvents = <>
    Left = 0
    Top = 0
    Height = 32
    Width = 608
    ZIndex = 0
    DataBinding.DataSource = DataSource
    Columns = <
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'NAME'
        Title = 'Name'
        TitleAlignment = whalLeft
        ViewType = tvtHyperText
        Width = 0
      end
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'DESCRIPTION'
        Title = 'Description'
        TitleAlignment = whalLeft
        ViewType = tvtText
        Width = 0
      end>
    MaximumWidth = True
    Paging.Alignment = whalCenter
    Paging.MaxPageNumbers = 10
    Paging.PagingSize = 10
    Paging.PagingType = tptBoth
    PageIndex = 0
    AlternatingItemsStyles.Default = DM.TableAlter
    HeaderStyles.Default = DM.TableHeader
    HeaderStyles.Hover = DM.TableHeaderHover
    ItemsStyles.Default = DM.TableItems
    PagingStyles.Default = DM.TablePaging
    PagingNumbersStyles.Default = DM.TablePaging
    PagingNumbersStyles.Hover = DM.TablePagingHover
    SelectingPagingNumberStyles.Default = DM.TablePagingSelect
    BorderColor = clWebWindow
    BorderWidth = 0
    CellPadding = 2
    CellSpacing = 0
    ShowHeaders = True
    OnGetHrefValue = CatDBTableGetHrefValue
    OnGetTitleHTML = CatDBTableGetTitleHTML
  end
end
