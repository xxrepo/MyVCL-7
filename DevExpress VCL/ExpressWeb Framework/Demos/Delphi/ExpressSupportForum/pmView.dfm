object View: TView
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
  Height = 501
  HorizontalOffset = 345
  VerticalOffset = 244
  Width = 727
  object Query: TADOQuery
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
      
        'select articleid, expertid, subject, source, platform, products,' +
        ' body '
      'from articles  '
      'where articleid = :aid'
      '')
    Left = 38
    Top = 16
    object Queryexpertid: TIntegerField
      FieldName = 'expertid'
    end
    object Querysubject: TStringField
      FieldName = 'subject'
      Size = 255
    end
    object Querysource: TStringField
      FieldName = 'source'
      Size = 50
    end
    object Queryplatform: TIntegerField
      FieldName = 'platform'
    end
    object Queryproducts: TIntegerField
      FieldName = 'products'
    end
    object Querybody: TMemoField
      FieldName = 'body'
      BlobType = ftMemo
    end
    object Queryarticleid: TIntegerField
      FieldName = 'articleid'
    end
  end
  object ExpertQuery: TADOQuery
    Connection = DM.Connection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'eid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * '
      'from experts  '
      'where expertid = :eid')
    Left = 100
    Top = 22
    object ExpertQueryEXPERTID: TIntegerField
      FieldName = 'EXPERTID'
    end
    object ExpertQueryLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 10
    end
    object ExpertQueryPASSWD: TStringField
      FieldName = 'PASSWD'
      Size = 10
    end
    object ExpertQueryFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
    end
    object ExpertQueryLASTNAME: TStringField
      FieldName = 'LASTNAME'
    end
    object ExpertQueryMIDNAME: TStringField
      FieldName = 'MIDNAME'
      FixedChar = True
      Size = 1
    end
    object ExpertQueryCOMPANYNAME: TStringField
      FieldName = 'COMPANYNAME'
      Size = 50
    end
    object ExpertQueryEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object ExpertQueryWWW: TStringField
      FieldName = 'WWW'
      Size = 100
    end
    object ExpertQueryRATING: TSmallintField
      FieldName = 'RATING'
    end
    object ExpertQueryISEDITOR: TStringField
      FieldName = 'ISEDITOR'
      FixedChar = True
      Size = 1
    end
    object ExpertQueryIS_DISABLED: TStringField
      FieldName = 'IS_DISABLED'
      FixedChar = True
      Size = 1
    end
    object ExpertQueryDATE: TDateTimeField
      FieldName = 'DATE'
    end
  end
  object AttachQuery: TADOQuery
    Connection = DM.Connection
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
      'select att.displayname, att.filename '
      'from attachments att, attfiles f'
      'where f.articleid = :aid'
      '   and f.attachid = att.attachid')
    Left = 174
    Top = 24
    object AttachQuerydisplayname: TStringField
      DisplayWidth = 200
      FieldName = 'displayname'
      Size = 200
    end
    object AttachQueryfilename: TStringField
      FieldName = 'filename'
      Size = 50
    end
  end
end
