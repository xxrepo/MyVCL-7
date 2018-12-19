object WebsnapAdaptersDataMod: TWebsnapAdaptersDataMod
  OldCreateOrder = False
  OnActivate = WebDataModuleActivate
  OnDeactivate = WebDataModuleDeactivate
  Left = 544
  Top = 246
  Height = 279
  Width = 438
  object Session1: TSession
    Left = 160
    Top = 16
  end
  object Adapter: TDataSetAdapter
    DataSet = Country
    Left = 152
    Top = 80
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object Country: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'country'
    Left = 80
    Top = 128
  end
end
