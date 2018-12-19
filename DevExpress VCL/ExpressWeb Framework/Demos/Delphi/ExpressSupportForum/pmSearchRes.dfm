object Searchres: TSearchres
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
  Height = 529
  HorizontalOffset = 200
  VerticalOffset = 124
  Width = 815
  object Query: TADOQuery
    Connection = DM.Connection
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from articles a '
      'where a.editorid is not null and '
      
        'Exists (select 1 from indexwords where a.articleid=articleid and' +
        ' keywordid in('
      'select keywordid from keywords where keyword in(')
    Left = 214
    Top = 10
    object Queryarticleid: TIntegerField
      FieldName = 'articleid'
    end
    object Querysubject: TStringField
      DisplayWidth = 200
      FieldName = 'subject'
      Size = 200
    end
  end
  object DataSource: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'articleid'
    DataSet = Query
    Left = 344
    Top = 8
  end
  object cxWebDBTable1: TcxWebDBTable
    CustomEvents = <>
    Left = 130
    Top = 56
    Height = 26
    Width = 523
    ZIndex = 0
    DataBinding.DataSource = DataSource
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
    ItemsStyles.Hover = DM.TableItemsHover
    PagingStyles.Default = DM.TablePaging
    PagingNumbersStyles.Default = DM.TablePaging
    PagingNumbersStyles.Hover = DM.TablePagingHover
    SelectingPagingNumberStyles.Default = DM.TablePagingSelect
    BorderColor = clWebWindow
    BorderWidth = 0
    CellPadding = 2
    CellSpacing = 0
    ShowHeaders = True
    OnGetHrefValue = cxWebDBTable1GetHrefValue
    OnGetTitleHTML = cxWebDBTable1GetTitleHTML
  end
end
