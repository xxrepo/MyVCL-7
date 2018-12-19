object WebsnapAdaptersPageProducerPage: TWebsnapAdaptersPageProducerPage
  OldCreateOrder = False
  OnCreate = WebAppPageModuleCreate
  OnDestroy = WebAppPageModuleDestroy
  PageProducer = PageProducer
  AppServices = WebAppComponents
  Left = 254
  Top = 107
  Height = 296
  Width = 255
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object PageDispatcher: TPageDispatcher
    DefaultPage = 'WebsnapAdaptersCountryListPage'
    Left = 48
    Top = 152
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 200
  end
end
