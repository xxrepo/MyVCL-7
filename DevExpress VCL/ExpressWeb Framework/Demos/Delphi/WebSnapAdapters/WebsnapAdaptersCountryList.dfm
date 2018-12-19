object WebsnapAdaptersCountryListPage: TWebsnapAdaptersCountryListPage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmReset
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  Left = 50
  Top = 50
  Height = 466
  HorizontalOffset = 281
  VerticalOffset = 137
  Width = 604
  object cxWebSnapControlAdapter1: TcxWebSnapControlAdapter
    CustomEvents = <>
    Left = 43
    Top = 75
    Height = 22
    Width = 111
    ZIndex = 0
    WebSnapControl = AdapterGrid1
  end
  object AdapterPageProducer: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 208
    Top = 16
    object AdapterForm1: TAdapterForm
      object AdapterErrorList1: TAdapterErrorList
      end
      object AdapterGrid1: TAdapterGrid
        Adapter = WebsnapAdaptersDataMod.Adapter
        object ColName: TAdapterDisplayColumn
          FieldName = 'Name'
        end
        object ColCapital: TAdapterDisplayColumn
          FieldName = 'Capital'
        end
        object ColContinent: TAdapterDisplayColumn
          FieldName = 'Continent'
        end
        object ColArea: TAdapterDisplayColumn
          FieldName = 'Area'
        end
        object ColPopulation: TAdapterDisplayColumn
          FieldName = 'Population'
        end
        object AdapterCommandColumn1: TAdapterCommandColumn
          Caption = '&nbsp'
          object NewRow: TAdapterActionButton
            ActionName = 'NewRow'
            Caption = 'New'
            PageName = 'WebsnapAdaptersCountryItemPage'
          end
          object EditRow: TAdapterActionButton
            ActionName = 'EditRow'
            Caption = 'Edit'
            PageName = 'WebsnapAdaptersCountryItemPage'
          end
          object DeleteRow: TAdapterActionButton
            ActionName = 'DeleteRow'
            Caption = 'Del'
          end
        end
      end
    end
  end
end
