object Viewquest: TViewquest
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
  Height = 411
  HorizontalOffset = 280
  VerticalOffset = 112
  Width = 718
  object Query: TADOQuery
    Connection = DM.Connection
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
      
        'select u.email, u.nickname, q.subject, q.status, q.platform, q.p' +
        'roducts, q.body_q  '
      'from users u, questions q '
      'where q.questionid = :qid and u.userid = q.userid')
    Left = 58
    Top = 32
  end
  object ArtQuery: TADOQuery
    Connection = DM.Connection
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
    Left = 188
    Top = 38
  end
end
