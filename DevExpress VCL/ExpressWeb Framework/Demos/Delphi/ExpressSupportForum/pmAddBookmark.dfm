object AddBookmark: TAddBookmark
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptFlow
  ServerScript = JScript
  TopPos = 0
  OnBeforeGenerateContent = cxWebPageModuleBeforeGenerateContent
  Left = 50
  Top = 50
  Height = 378
  HorizontalOffset = 201
  VerticalOffset = 153
  Width = 661
  object Add: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = DM.ButtonStyle
    StyleItem_Hover = DM.ButtonStyleHover
    Left = 384
    Top = 43
    Height = 20
    Width = 94
    ZIndex = 0
    Styles.Default = DM.ButtonStyle
    Styles.Hover = DM.ButtonStyleHover
    TabOrder = 0
    Caption = 'Add'
    GlyphPosition = gpBeforeText
    OnClick = AddClick
  end
  object Cancel: TcxWebButton
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          'close();')
      end>
    StyleItem_Default = DM.ButtonStyle
    StyleItem_Hover = DM.ButtonStyleHover
    Left = 0
    Top = 0
    Height = 20
    Width = 94
    ZIndex = 0
    Styles.Default = DM.ButtonStyle
    Styles.Hover = DM.ButtonStyleHover
    TabOrder = 1
    Caption = 'Cancel'
    GlyphPosition = gpBeforeText
  end
  object BookName: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = DM.EditStyle
    Left = 80
    Top = 64
    Height = 19
    Width = 214
    ZIndex = 0
    Styles.Default = DM.EditStyle
    TabOrder = 2
  end
  object ArticleQuery: TADOQuery
    Connection = DM.Connection
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'aid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * '
      'from articles '
      'where articleid=:aid')
    Left = 76
    Top = 26
  end
  object CategoryQuery: TADOQuery
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
      'from categories '
      'where categoryid=:cid')
    Left = 134
    Top = 12
  end
  object InsertBookmarkQuery: TADOQuery
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
      end
      item
        Name = 'CATEGORYID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'USERID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'NAME'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ARTICLEID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO BOOKMARKS'
      '([BOOKMARKID], [CATEGORYID], [USERID], [NAME], [ARTICLEID])'
      'VALUES'
      '(:BOOKMARKID, :CATEGORYID, :USERID, :NAME, :ARTICLEID)')
    Left = 384
    Top = 20
  end
  object GetMaxBookmarkIdQuery: TADOQuery
    Connection = DM.Connection
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT MAX(BOOKMARKID) AS M'
      'FROM BOOKMARKS')
    Left = 256
    Top = 20
  end
end
