object Frames: TFrames
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 1
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  Left = 50
  Top = 50
  Height = 289
  HorizontalOffset = 205
  VerticalOffset = 156
  Width = 332
  object Query: TADOQuery
    Connection = DM.Connection
    Parameters = <
      item
        Name = 'USERID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO FORUM_TRACK ([USERID]) VALUES (:USERID)')
    Left = 144
    Top = 16
  end
end
