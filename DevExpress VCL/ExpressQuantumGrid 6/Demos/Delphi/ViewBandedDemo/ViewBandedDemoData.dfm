object ViewBandedDemoDataDM: TViewBandedDemoDataDM
  OldCreateOrder = False
  Left = 285
  Top = 231
  Height = 406
  Width = 309
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
  object tblUSERS: TTable
    Active = True
    OnCalcFields = tblUSERSCalcFields
    DatabaseName = 'DemosDB'
    TableName = 'USERS.DB'
    Left = 120
    Top = 112
    object tblUSERSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblUSERSFNAME: TStringField
      FieldName = 'FNAME'
      Size = 25
    end
    object tblUSERSLNAME: TStringField
      FieldName = 'LNAME'
      Size = 25
    end
    object tblUSERSPHONE: TStringField
      FieldName = 'PHONE'
      Size = 24
    end
    object tblUSERSName: TStringField
      FieldKind = fkCalculated
      FieldName = 'Name'
      Size = 50
      Calculated = True
    end
  end
  object dsUSERS: TDataSource
    DataSet = tblUSERS
    Left = 40
    Top = 112
  end
  object dsPROJECTS: TDataSource
    DataSet = tblPROJECTS
    Left = 40
    Top = 56
  end
  object tblPROJECTS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PROJECTS.DB'
    Left = 120
    Top = 56
    object tblPROJECTSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPROJECTSNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object tblPROJECTSMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
    end
  end
  object tlbITEMS: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'ITEMS.DB'
    Left = 120
    Top = 176
    object tlbITEMSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tlbITEMSNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tlbITEMSTYPE: TBooleanField
      FieldName = 'TYPE'
    end
    object tlbITEMSPROJECTID: TIntegerField
      FieldName = 'PROJECTID'
    end
    object tlbITEMSPRIORITY: TSmallintField
      FieldName = 'PRIORITY'
    end
    object tlbITEMSSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object tlbITEMSCREATORID: TIntegerField
      FieldName = 'CREATORID'
    end
    object tlbITEMSCREATEDDATE: TDateTimeField
      FieldName = 'CREATEDDATE'
    end
    object tlbITEMSOWNERID: TIntegerField
      FieldName = 'OWNERID'
    end
    object tlbITEMSLASTMODIFIEDDATE: TDateTimeField
      FieldName = 'LASTMODIFIEDDATE'
    end
    object tlbITEMSFIXEDDATE: TDateTimeField
      FieldName = 'FIXEDDATE'
    end
    object tlbITEMSDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 10
    end
    object tlbITEMSRESOLUTION: TMemoField
      FieldName = 'RESOLUTION'
      BlobType = ftMemo
      Size = 10
    end
  end
  object dsITEMS: TDataSource
    DataSet = tlbITEMS
    Left = 40
    Top = 176
  end
end
