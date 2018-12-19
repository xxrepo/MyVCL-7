object ServerScriptsHomePage: TServerScriptsHomePage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmReset
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 1
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  OnDeactivate = cxWebPageModuleDeactivate
  Left = 50
  Top = 50
  Height = 395
  HorizontalOffset = 200
  VerticalOffset = 124
  Width = 395
  object Table: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'events.db'
    Left = 96
    Top = 16
  end
end
