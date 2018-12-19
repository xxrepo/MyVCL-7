object WebsnapAdaptersCountryItemPage: TWebsnapAdaptersCountryItemPage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  Left = 50
  Top = 50
  Height = 574
  HorizontalOffset = 311
  VerticalOffset = 128
  Width = 673
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
        Adapter = WebsnapAdaptersDataMod.Adapter
      end
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = WebsnapAdaptersDataMod.Adapter
      end
      object AdapterButtonGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object BtnApply: TAdapterActionButton
          ActionName = 'Apply'
          PageName = 'WebsnapAdaptersCountryListPage'
        end
        object BtnRefreshRow: TAdapterActionButton
          ActionName = 'RefreshRow'
          Caption = 'Refresh'
          HideOptions = [bhoHideOnActionNotVisible, bhoHideOnDisabledAction]
        end
        object BtnCancel: TAdapterActionButton
          ActionName = 'Cancel'
          PageName = 'WebsnapAdaptersCountryListPage'
        end
      end
    end
  end
  object cxWebSnapControlAdapter1: TcxWebSnapControlAdapter
    CustomEvents = <>
    Left = 50
    Top = 81
    Height = 22
    Width = 166
    ZIndex = 0
    WebSnapControl = AdapterFieldGroup1
  end
  object cxWebSnapControlAdapter2: TcxWebSnapControlAdapter
    CustomEvents = <>
    Left = 45
    Top = 193
    Height = 22
    Width = 175
    ZIndex = 0
    WebSnapControl = AdapterButtonGroup1
  end
end
