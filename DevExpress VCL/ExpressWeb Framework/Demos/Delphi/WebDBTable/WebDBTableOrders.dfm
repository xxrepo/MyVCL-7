object WebDBTableOrdersPage: TWebDBTableOrdersPage
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
  OnDeactivate = cxWebPageModuleDeactivate
  Left = 50
  Top = 50
  Height = 731
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 945
  object cxWebDBTable1: TcxWebDBTable
    CustomEvents = <>
    Left = 0
    Top = 0
    Height = 315
    Width = 846
    ZIndex = 0
    DataBinding.DataSource = WebDBDataSource
    Columns = <>
    MaximumWidth = True
    Paging.Alignment = whalCenter
    Paging.MaxPageNumbers = 10
    Paging.PagingSize = 10
    Paging.PagingType = tptTop
    PageIndex = 0
    BorderColor = clWebWindow
    BorderWidth = 1
    CellPadding = -1
    CellSpacing = 0
    ShowHeaders = True
  end
  object WebDBDataSource: TcxWebDBDataSource
    CustomEvents = <>
    DataSet = ADOQuery
    Left = 88
    Top = 32
  end
  object cxWebDBLabel1: TcxWebDBLabel
    CustomEvents = <>
    Left = 283
    Top = 47
    Height = 20
    Width = 106
    ZIndex = 0
    WordWrap = False
    DataBinding.DataSource = dsCustInfo
    DataBinding.FieldName = 'company'
  end
  object dsCustInfo: TcxStdWebDataSource
    CustomEvents = <>
    DataSet = CustInfoADOQuery
    Left = 416
    Top = 24
  end
  object CustInfoADOQuery: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    Parameters = <
      item
        Name = 'custno'
        DataType = ftInteger
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select company from CUSTOMER where custno =:custno')
    Left = 480
    Top = 40
  end
  object ADOQuery: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    Parameters = <
      item
        Name = 'custno'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'From Orders Where custno =:custno')
    Left = 256
    Top = 32
  end
end
