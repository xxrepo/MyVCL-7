object ViewReject: TViewReject
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
  Height = 439
  HorizontalOffset = 200
  VerticalOffset = 107
  Width = 847
  object Query: TADOQuery
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
      
        'SELECT r.REASON, q.SUBJECT, e.EMAIL, e.FIRSTNAME, e.MIDNAME, e.L' +
        'ASTNAME'
      'FROM REJECTS r, EXPERTS e, QUESTIONS q'
      'WHERE r.QUESTIONID = :qid AND e.EXPERTID = r.EXPERTID AND'
      '  q.QUESTIONID = r.QUESTIONID')
    Left = 202
    Top = 4
  end
end
