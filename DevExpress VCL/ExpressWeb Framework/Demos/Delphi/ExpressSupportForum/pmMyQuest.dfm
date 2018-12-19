object MyQuest: TMyQuest
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
  Height = 421
  HorizontalOffset = 200
  VerticalOffset = 124
  Width = 842
  object DataSource: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'questionid'
    DataSet = Query
    Left = 222
    Top = 6
  end
  object Query: TADOQuery
    Connection = DM.Connection
    LockType = ltReadOnly
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
      'select q.questionid, q.subject, q.status, q.date, a.articleid'
      'from questions q'
      'left join answeronq a on a.questionid = q.questionid'
      'where q.userid = :uid')
    Left = 300
    Top = 6
    object Queryquestionid: TIntegerField
      FieldName = 'questionid'
    end
    object Querysubject: TStringField
      FieldName = 'subject'
      Size = 100
    end
    object Querystatus: TSmallintField
      FieldName = 'status'
    end
    object Querydate: TDateTimeField
      FieldName = 'date'
    end
    object Queryarticleid: TIntegerField
      FieldName = 'articleid'
    end
  end
  object WebDBTable: TcxWebDBTable
    CustomEvents = <>
    Left = 16
    Top = 200
    Height = 0
    Width = 573
    ZIndex = 0
    DataBinding.DataSource = DataSource
    Columns = <
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'status'
        Title = 'Status'
        TitleAlignment = whalLeft
        ViewType = tvtHyperText
        Width = 0
      end
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'subject'
        Title = 'Subject'
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
    OnGetDisplayText = WebDBTableGetDisplayText
    OnGetHrefValue = WebDBTableGetHrefValue
    OnGetTitleHTML = WebDBTableGetTitleHTML
  end
end
