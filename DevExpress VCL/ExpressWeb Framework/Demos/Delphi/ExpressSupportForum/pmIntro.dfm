object Intro: TIntro
  OldCreateOrder = True
  OnDestroy = cxWebPageModuleDestroy
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  Left = 50
  Top = 50
  Height = 366
  HorizontalOffset = 200
  VerticalOffset = 107
  Width = 714
  object AnsweredQuestionQuery: TADOQuery
    Connection = DM.Connection
    CursorType = ctOpenForwardOnly
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'userid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT aq.articleid, q.subject, q.questionid '
      'From QUESTIONS q, ANSWERONQ aq '
      'Where q.userid = :userid'
      '         and q.status = 2  and q.questionid = aq.questionid'
      
        'and EXISTS(SELECT 1 FROM ARTICLES WHERE ARTICLES.ARTICLEID=aq.AR' +
        'TICLEID)'
      'ORDER BY DATE')
    Left = 90
    Top = 24
  end
  object UnassignedQuestionQuery: TADOQuery
    Connection = DM.Connection
    CursorType = ctOpenForwardOnly
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'userid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * '
      'From QUESTIONS  '
      'where userid = :userid and status = 3 '
      'ORDER BY DATE')
    Left = 266
    Top = 24
  end
end
