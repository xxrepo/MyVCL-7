object WebDBTableHomePage: TWebDBTableHomePage
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
  Height = 756
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 922
  object cxWebDBTable1: TcxWebDBTable
    CustomEvents = <>
    Left = 36
    Top = 64
    Height = 178
    Width = 683
    ZIndex = 0
    DataBinding.DataSource = cxWebDBDataSource1
    Columns = <
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'Company'
        Title = 'Company'
        TitleAlignment = whalCenter
        ViewType = tvtHyperText
        Width = 0
      end
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'City'
        Title = 'City'
        TitleAlignment = whalCenter
        ViewType = tvtText
        Width = 0
      end
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'State'
        Title = 'State'
        TitleAlignment = whalCenter
        ViewType = tvtText
        Width = 0
      end
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'Country'
        Title = 'Country'
        TitleAlignment = whalCenter
        ViewType = tvtText
        Width = 0
      end
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'Phone'
        Title = 'Phone'
        TitleAlignment = whalCenter
        ViewType = tvtText
        Width = 0
      end
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'FAX'
        Title = 'FAX'
        TitleAlignment = whalCenter
        ViewType = tvtText
        Width = 0
      end
      item
        Alignment = whalLeft
        DataBinding.FieldName = 'Contact'
        Title = 'Contact'
        TitleAlignment = whalCenter
        ViewType = tvtText
        Width = 0
      end>
    MaximumWidth = True
    Paging.Alignment = whalCenter
    Paging.MaxPageNumbers = 10
    Paging.PagingSize = 10
    Paging.PagingType = tptBoth
    PageIndex = 0
    AlternatingItemsStyles.Default = TableAlter
    HeaderStyles.Default = TableHeader
    HeaderStyles.Hover = TableHeader
    ItemsStyles.Default = TableItems
    PagingStyles.Default = TablePaging
    PagingNumbersStyles.Default = TablePaging
    PagingNumbersStyles.Hover = TablePagingHover
    BorderColor = clWebWindow
    BorderWidth = 0
    CellPadding = 2
    CellSpacing = 0
    ShowHeaders = True
    OnGetHrefValue = cxWebDBTable1GetHrefValue
  end
  object cxWebDBDataSource1: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'CustNo'
    DataSet = ADOTable1
    Left = 152
    Top = 32
  end
  object StyleController: TcxWebStyleController
    Left = 456
    Top = 16
    object TableHeader: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWhite
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 9
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebBlack
      Style.Shading.AssignedValues = [wsavColor]
    end
    object TablePaging: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebBlack
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 8
      Style.Shading.Color = clWebWhite
      Style.Shading.AssignedValues = [wsavColor]
    end
    object TablePagingHover: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebOrange
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 8
      Style.Shading.Color = clWebWhite
      Style.Shading.AssignedValues = [wsavColor]
    end
    object TableHeaderHover: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebOrange
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 9
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebBlack
      Style.Shading.AssignedValues = [wsavColor]
    end
    object TableAlter: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 9
      Style.Shading.Color = 16707563
      Style.Shading.AssignedValues = [wsavColor]
    end
    object TableItems: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 9
    end
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'customer'
    Left = 328
    Top = 16
  end
end
