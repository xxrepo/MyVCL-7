object WebServiceHomePage: TWebServiceHomePage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmReset
  ComponentPersistent.ExceptedComponents = <
    item
      Component = weSearch
    end
    item
      Component = WebTable
    end>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptFlow
  ServerScript = JScript
  TopPos = 0
  Left = 50
  Top = 50
  Height = 615
  HorizontalOffset = 232
  VerticalOffset = 189
  Width = 888
  object weSearch: TcxWebEdit
    CustomEvents = <>
    Left = 97
    Top = 191
    Height = 22
    Width = 165
    ZIndex = 0
    TabOrder = 0
  end
  object wbtnSearch: TcxWebButton
    CustomEvents = <>
    Left = 102
    Top = 157
    ZIndex = 0
    TabOrder = 1
    Caption = 'Search'
    GlyphPosition = gpBeforeText
    OnClick = wbtnSearchClick
  end
  object WebTable: TcxWebTable
    CustomEvents = <>
    OnBeforeRender = WebTableBeforeRender
    Left = 0
    Top = 0
    Height = 200
    Width = 620
    ZIndex = 0
    AllowSorting = False
    RecordCount = 0
    Columns = <
      item
        Alignment = whalLeft
        ViewType = tvtText
        SortMode = tsmNone
        Title = 'Title'
        TitleAlignment = whalCenter
        Width = 0
      end
      item
        Alignment = whalLeft
        ViewType = tvtText
        SortMode = tsmNone
        TitleAlignment = whalCenter
        Width = 0
      end>
    MaximumWidth = True
    Paging.Alignment = whalCenter
    Paging.MaxPageNumbers = 10
    Paging.PagingSize = 10
    Paging.PagingType = tptBoth
    PageIndex = 0
    AlternatingItemsStyles.Default = TableAlter
    ItemsStyles.Default = TableItems
    PagingNumbersStyles.Default = TablePaging
    PagingNumbersStyles.Hover = TablePagingHover
    SelectingPagingNumberStyles.Default = TablePagingSelected
    BorderColor = clWebWindow
    BorderWidth = 1
    CellPadding = -1
    CellSpacing = 0
    ShowHeaders = False
    OnGetDisplayText = WebTableGetDisplayText
  end
  object HTTPRIO: THTTPRIO
    WSDLLocation = 'http://api.google.com/GoogleSearch.wsdl'
    HTTPWebNode.Agent = 'Borland SOAP 1.1'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody]
    Left = 104
    Top = 24
  end
  object StyleController: TcxWebStyleController
    Left = 208
    Top = 36
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
    object TablePagingSelected: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebBlack
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 8
      Style.Font.Weight = wfwBold
    end
  end
  object cxWebImage1: TcxWebImage
    CustomEvents = <>
    Left = 15
    Top = 80
    Height = 31
    Width = 94
    ZIndex = 0
    PictureURL = '/powred1.gif'
  end
end
