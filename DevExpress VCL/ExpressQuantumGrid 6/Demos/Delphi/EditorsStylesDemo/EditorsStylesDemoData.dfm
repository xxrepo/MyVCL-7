object EditorsStylesDemoDataDM: TEditorsStylesDemoDataDM
  OldCreateOrder = False
  Left = 323
  Top = 241
  Height = 147
  Width = 415
  object tblProjects: TTable
    Active = True
    DatabaseName = 'ExtEditorsDB'
    TableName = 'PROJECTS.DB'
    Left = 128
    Top = 40
    object tblProjectsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblProjectsNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object tblProjectsMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
    end
  end
  object tblItems: TTable
    Active = True
    DatabaseName = 'ExtEditorsDB'
    TableName = 'ITEMS.DB'
    Left = 72
    Top = 40
    object tblItemsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblItemsNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tblItemsTYPE: TBooleanField
      FieldName = 'TYPE'
    end
    object tblItemsPROJECTID: TIntegerField
      FieldName = 'PROJECTID'
    end
    object tblItemsPRIORITY: TSmallintField
      FieldName = 'PRIORITY'
    end
    object tblItemsSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object tblItemsCREATORID: TIntegerField
      FieldName = 'CREATORID'
    end
    object tblItemsCREATEDDATE: TDateTimeField
      FieldName = 'CREATEDDATE'
    end
    object tblItemsOWNERID: TIntegerField
      FieldName = 'OWNERID'
    end
    object tblItemsLASTMODIFIEDDATE: TDateTimeField
      FieldName = 'LASTMODIFIEDDATE'
    end
    object tblItemsFIXEDDATE: TDateTimeField
      FieldName = 'FIXEDDATE'
    end
    object tblItemsDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 10
    end
    object tblItemsRESOLUTION: TMemoField
      FieldName = 'RESOLUTION'
      BlobType = ftMemo
      Size = 10
    end
    object tblItemsPROGRESS: TIntegerField
      FieldName = 'PROGRESS'
    end
    object tblItemsCHECKPROGRESS: TIntegerField
      FieldName = 'CHECKPROGRESS'
    end
    object tblItemsFIRSTTARGET: TIntegerField
      FieldName = 'FIRSTTARGET'
    end
    object tblItemsNOTIFICATIONS: TStringField
      FieldName = 'NOTIFICATIONS'
      Size = 255
    end
    object tblItemsIDES: TStringField
      FieldName = 'IDES'
      Size = 255
    end
  end
  object tblUsers: TTable
    Active = True
    OnCalcFields = tblUsersCalcFields
    DatabaseName = 'ExtEditorsDB'
    TableName = 'USERS.DB'
    Left = 192
    Top = 40
    object tblUsersID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblUsersFNAME: TStringField
      FieldName = 'FNAME'
      Size = 25
    end
    object tblUsersMNAME: TStringField
      FieldName = 'MNAME'
    end
    object tblUsersLNAME: TStringField
      FieldName = 'LNAME'
      Size = 25
    end
    object tblUsersCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 15
    end
    object tblUsersPOSTALCODE: TStringField
      FieldName = 'POSTALCODE'
      Size = 10
    end
    object tblUsersCITY: TStringField
      FieldName = 'CITY'
      Size = 15
    end
    object tblUsersADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 60
    end
    object tblUsersPHONE: TStringField
      FieldName = 'PHONE'
      Size = 24
    end
    object tblUsersFAX: TStringField
      FieldName = 'FAX'
      Size = 24
    end
    object tblUsersEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tblUsersHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 50
    end
    object tblUsersUserName: TStringField
      FieldKind = fkCalculated
      FieldName = 'UserName'
      Size = 50
      Calculated = True
    end
  end
  object tblNoteBook: TTable
    Active = True
    DatabaseName = 'ExtEditorsDB'
    TableName = 'NOTEBOOK.DB'
    Left = 272
    Top = 40
    object tblNoteBookID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblNoteBookNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object tblNoteBookDATE: TDateTimeField
      FieldName = 'DATE'
    end
    object tblNoteBookNOTE: TMemoField
      FieldName = 'NOTE'
      BlobType = ftMemo
      Size = 10
    end
    object tblNoteBookNOTEFONT: TStringField
      FieldName = 'NOTEFONT'
      Size = 255
    end
    object tblNoteBookNOTEFONTCOLOR: TIntegerField
      FieldName = 'NOTEFONTCOLOR'
    end
    object tblNoteBookNOTETEXTSIZE: TIntegerField
      FieldName = 'NOTETEXTSIZE'
    end
    object tblNoteBookNOTETEXTBKCOLOR: TIntegerField
      FieldName = 'NOTETEXTBKCOLOR'
    end
  end
  object Database: TDatabase
    Connected = True
    DatabaseName = 'ExtEditorsDB'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'PATH=Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 8
    Top = 8
  end
  object dsProjects: TDataSource
    DataSet = tblProjects
    Left = 128
    Top = 8
  end
  object dsItems: TDataSource
    DataSet = tblItems
    Left = 72
    Top = 8
  end
  object dsNoteBook: TDataSource
    DataSet = tblNoteBook
    Left = 272
    Top = 8
  end
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 192
    Top = 8
  end
end
