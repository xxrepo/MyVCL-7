object EditorsLookupDemoDataDM: TEditorsLookupDemoDataDM
  OldCreateOrder = False
  Left = 310
  Top = 163
  Height = 442
  Width = 489
  object dsProjects: TDataSource
    DataSet = qryProjects
    Left = 112
    Top = 56
  end
  object dsItems: TDataSource
    DataSet = tblItems
    Left = 112
    Top = 120
  end
  object tblItems: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'ITEMS.DB'
    Left = 40
    Top = 120
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
  end
  object tblUsers: TTable
    Active = True
    OnCalcFields = tblUsersCalcFields
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'USERS.DB'
    Left = 40
    Top = 176
    object tblUsersID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblUsersUserName: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'UserName'
      Calculated = True
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
    object tblUsersDEPARTMENTID: TIntegerField
      FieldName = 'DEPARTMENTID'
    end
    object tblUsersDepartment: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Department'
      LookupDataSet = tblDepartments
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'DEPARTMENTID'
      Lookup = True
    end
  end
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 112
    Top = 176
  end
  object Database: TDatabase
    Connected = True
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 40
    Top = 8
  end
  object dsDepartments: TDataSource
    DataSet = tblDepartments
    Left = 112
    Top = 232
  end
  object tblDepartments: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'DIVISIONS.DB'
    Left = 40
    Top = 232
  end
  object imStat: TImageList
    Left = 256
    Top = 40
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001800000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080808080808080808080808080800000000000000000008080800000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008080800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000808080808080808080808080000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
      000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000808080FFFFFF008000008000008000
      008000008000008000FFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFF008000008000008000FFFFFFFFFFFF000000
      FFFFFF00000000FFFFFFFFFF00FFFFFFFFFF000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFF008000808080C0C0C0FFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
      000000FFFFFF00000000FFFFFFFFFFFFFFFF000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000808080FFFFFFFFFFFF008000008000
      008000008000008000FFFFFF000000000000000000000000808080FFFFFFFFFF
      FF008000008000008000808080C0C0C0FFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFF008000008000FFFFFF000000FFFFFF000000
      FFFFFF000000FFFFFF00000000FFFFC0C0C0000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFF0080
      00008000FFFFFF008000008000808080FFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF
      000000FFFFFF000000FFFFFF000000000000000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000808000808000000000FFFFFF008000
      008000008000008000FFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF008000808080808080FFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFF000000FFFFFF000000FFFFFF000000
      FFFFFF000000FFFFFF000000000000000000000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000808000808000000000000000000000808000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF008000808080C0C0C0FFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFF000000000000FFFFFF000000FFFFFF
      000000FFFFFF000000000000000000000000000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000FFFF00808000000000FFFF00000000808000000000000000000000
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000808080FFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFF000000000000FFFFFF000000
      FFFFFF000000000000000000000000000000000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
      0000000000FFFF00FFFF00000000000000FFFF00FFFF00000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000FFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
      000000808080000000000000000000000000000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFF008000008000008000FFFFFFFFFFFFFFFFFF
      FFFFFF000000000000000000000000000000000000000000000000808080FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF0000000000000000000000000000000000000000000000008080808080
      8080808080808080808080808000000000000000000000000000000000000000
      0000000000000000000000000000000000808080808080808080808080808080
      8080808080808080808080800000000000000000000000008080808080808080
      8080808080808080808080808080808080808080808080808080808000000000
      0000000000000000808080808080808080808080808080808080808080808080
      8080800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF0000C0C0C000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C00000000000000000000000000000000000000000000000000000000000
      0000000080808080808080808080808080808080808080808080808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C00000000000000000000000000000000000000000008080800000000000
      0000000000000000000000000000000000000000000000000000000080808000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000FF0000FF0000FF0000FF0000C0C0C000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFFFFFF
      FF808080FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF00000000
      0000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000C0C0C000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      000000000000000000000000000000000000000000000000808080FFFFFFFFFF
      FF80808000FFFFFFFFFF00FFFF000080000000FFFFFF00FFFFFFFFFF00000000
      0000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C0000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFF80808000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00000080808000
      0000000000000000000000000000808080FFFFFFFFFFFF008000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFF808080FFFFFF00FFFF000080000000FFFFFF00FFFF00000080808000
      0000000000000000000000000000808080FFFFFFFFFFFF008000008000FFFFFF
      FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFF0080
      00FFFFFFFFFFFF808080FFFFFF00008000000000FFFF00000080808000000000
      0000000000008000008000008000008000008000008000008000008000008000
      FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFF80808000FFFF000080000000FFFFFF00000080808000000000
      0000000000008000008000008000008000008000008000008000008000008000
      008000FFFFFFFFFFFF0000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFF0080
      00008000FFFFFFFFFFFF80808000FFFFFFFFFF00000080808000000000000000
      0000000000008000008000008000008000008000008000008000008000008000
      FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF808080FFFFFF00FFFF00000080808000000000000000
      0000000000000000000000000000808080FFFFFFFFFFFF008000008000FFFFFF
      FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFF0080
      00008000008000FFFFFFFFFFFF00000000000080808000000000000000000000
      0000000000000000000000000000808080FFFFFFFFFFFF008000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
      0000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFF0080
      00008000008000008000008000FFFFFFFFFFFF00000000000000000000000000
      0000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000C0C0C00000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
      0000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      0000000000000000000000000000000000000000000000008080808080808080
      8080808080808080808080808080808080808000000000000000000000000000
      0000000000000000000000000000808080808080808080808080808080808080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFE00E007F801C003C000
      E007F801C003C000E007F801C003C000E007F801C003C000E007F801C003C000
      E007F801C003C000E007F801C003C001E0079001C003C003E0070001C003C007
      E0070001C003C00FE0070001C003C00FE00F9801C003C00FE01FF801C003C00F
      E03FF801C003C00FFFFFFFFFFFFFFFFFFF3FFF1FFC03FFFFFE1FFE1FC001F003
      FC0FFE1FC001F003F807FE3FC001F003F007FF1FC001F003FE1FFE1FC001F003
      FE1FFE1FC0038003FE1FFE1FC0038003FE1FFE1FC0078003FE1FFE1FC007F003
      FE1FFE1FC00FF003FE1FFE1FC00FF003FE1FFE1FC00FF007FE1FFE1FC00FF00F
      FE3FFE3FC00FF01FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qryProjects: TQuery
    Active = True
    DatabaseName = 'DemosDB'
    RequestLive = True
    SQL.Strings = (
      'SELECT DEVPROJECTS.*, (USERS.FNAME+ USERS.LNAME) as Manager'
      ''
      
        'FROM USERS RIGHT JOIN DEVPROJECTS ON USERS.ID = DEVPROJECTS.MANA' +
        'GERID')
    Left = 40
    Top = 56
    object qryProjectsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryProjectsNAME: TStringField
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 100
    end
    object qryProjectsMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
    end
    object qryProjectsManager: TStringField
      DisplayWidth = 20
      FieldName = 'Manager'
      ReadOnly = True
      Size = 50
    end
  end
  object StyleController: TcxEditStyleController
    Style.Color = 16247513
    Left = 256
    Top = 120
  end
end