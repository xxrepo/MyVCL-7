object VBScriptHomePage: TVBScriptHomePage
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
  object cxWebStyleController1: TcxWebStyleController
    Left = 280
    Top = 24
    object cxWebStyleController1Item1: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
    end
  end
  object customerTable: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'customer'
    Left = 88
    Top = 16
  end
  object orderTable: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'orders'
    Left = 176
    Top = 16
  end
end
