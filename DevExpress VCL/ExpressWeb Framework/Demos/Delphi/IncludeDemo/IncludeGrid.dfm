object IncludeGridPage: TIncludeGridPage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  OnDeactivate = cxWebPageModuleDeactivate
  Left = 50
  Top = 50
  Height = 619
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 902
  object ADOTable1: TADOTable
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    CursorType = ctStatic
    TableName = 'country'
    Left = 112
    Top = 40
  end
  object cxWebDBDataNavigator1: TcxWebDBDataNavigator
    CustomEvents = <>
    Left = 8
    Top = 16
    Height = 26
    Width = 390
    ZIndex = 0
    Buttons = <
      item
        ButtonType = nbFirst
        Hint = 'First record'
      end
      item
        ButtonType = nbPrevPage
        Hint = 'Prior page'
      end
      item
        ButtonType = nbPrev
        Hint = 'Prior record'
      end
      item
        ButtonType = nbPageSize
        Hint = 'Page size'
      end
      item
        ButtonType = nbApplyPageSize
        Hint = 'Apply page size'
      end
      item
        ButtonType = nbNext
        Hint = 'Next record'
      end
      item
        ButtonType = nbNextPage
        Hint = 'Next page'
      end
      item
        ButtonType = nbLast
        Hint = 'Last record'
      end
      item
        ButtonType = nbInsert
        Hint = 'Insert record'
      end
      item
        ButtonType = nbEdit
        Hint = 'Edit record'
      end
      item
        ButtonType = nbDelete
        Hint = 'Delete record'
      end
      item
        ButtonType = nbPost
        Hint = 'Post changes'
      end
      item
        ButtonType = nbCancel
        Hint = 'Cancel changes'
      end
      item
        ButtonType = nbRefresh
        Hint = 'Refresh'
      end>
    PageSize = 5
    DataBinding.DataSource = cxWebDBDataSource1
  end
  object cxWebDBDataSource1: TcxWebDBDataSource
    CustomEvents = <>
    KeyFieldName = 'Name'
    DataSet = ADOTable1
    Left = 248
    Top = 40
  end
  object cxWebDBGrid1: TcxWebDBGrid
    CustomEvents = <>
    Left = 12
    Top = 58
    Height = 250
    Width = 770
    ZIndex = 0
    BorderWidth = 1
    BorderColor = clWebBlack
    IndicatorWidth = 18
    KeepPageSize = False
    PageSize = 6
    ReadOnly = False
    RowHeight = 26
    SelectedColor = clWebHighlight
    SelectedFontColor = clWebCaptionText
    ShowGroupedColumns = True
    DataBinding.DataSource = cxWebDBDataSource1
    FirstVisibleRow = 0
    object cxWebDBGrid1Column1: TcxWebDBColumn
      Title = 'Name'
      VAlignment = wvalCenter
      Width = 151
      DataBinding.FieldName = 'Name'
    end
    object cxWebDBGrid1Column2: TcxWebDBColumn
      Title = 'Capital'
      VAlignment = wvalCenter
      Width = 151
      DataBinding.FieldName = 'Capital'
    end
    object cxWebDBGrid1Column3: TcxWebDBColumn
      Title = 'Continent'
      VAlignment = wvalCenter
      Width = 151
      DataBinding.FieldName = 'Continent'
    end
    object cxWebDBGrid1Column4: TcxWebDBColumn
      Title = 'Area'
      VAlignment = wvalCenter
      Width = 150
      DataBinding.FieldName = 'Area'
    end
    object cxWebDBGrid1Column5: TcxWebDBColumn
      Title = 'Population'
      VAlignment = wvalCenter
      Width = 147
      DataBinding.FieldName = 'Population'
    end
  end
end
