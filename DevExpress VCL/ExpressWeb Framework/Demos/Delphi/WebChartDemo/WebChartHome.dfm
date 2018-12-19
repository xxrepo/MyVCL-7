object WebChartHomePage: TWebChartHomePage
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
  Left = 50
  Top = 50
  Height = 804
  HorizontalOffset = 200
  VerticalOffset = 124
  Width = 896
  object WebChart: TcxWebChart
    CustomEvents = <>
    Left = 0
    Top = 0
    Height = 325
    Width = 673
    ZIndex = 0
    BackImageInside = False
    BackImageMode = pbmStretch
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    MarginBottom = 4
    MarginLeft = 3
    MarginRight = 3
    MarginTop = 4
    Title.Font.Height = -17
    Title.Text.Strings = (
      '')
    AxisVisible = False
    Chart3DPercent = 15
    ClipPoints = False
    Frame.Visible = False
    MaxPointsPerPage = 0
    Monochrome = False
    Page = 1
    View3D = True
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DWalls = False
    Series = {
      545046300A545069655365726965730753657269657331114D61726B732E4172
      726F774C656E67746802080D4D61726B732E56697369626C65090B5365726965
      73436F6C6F720705636C526564055469746C6506085365726965732031125069
      6556616C7565732E4461746554696D65080E50696556616C7565732E4E616D65
      06035069650F50696556616C7565732E4F7264657207066C6F4E6F6E65000000}
  end
  object wcbChartType: TcxWebComboBox
    CustomEvents = <>
    StyleItem_Default = WebStyleControllerItem1
    Left = 441
    Top = 30
    Height = 20
    Width = 256
    ZIndex = 0
    Styles.Default = WebStyleControllerItem1
    TabOrder = 0
    ItemIndex = -1
    Items = <>
  end
  object wchShowLegend: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = WebStyleControllerItem1
    Left = 165
    Top = 58
    Height = 23
    Width = 171
    ZIndex = 0
    Styles.Default = WebStyleControllerItem1
    TabOrder = 1
    Caption = 'Show Legend'
    Checked = True
  end
  object wedTitle: TcxWebEdit
    CustomEvents = <>
    StyleItem_Default = WebStyleControllerItem1
    Left = 157
    Top = 97
    Height = 21
    Width = 260
    ZIndex = 0
    Styles.Default = WebStyleControllerItem1
    TabOrder = 2
  end
  object wbtnApply: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = WebStyleControllerItem1
    Left = 133
    Top = 227
    ZIndex = 0
    Styles.Default = WebStyleControllerItem1
    TabOrder = 6
    Caption = 'Apply'
    GlyphPosition = gpBeforeText
    OnClick = wbtnApplyClick
  end
  object wcbShowAxis: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = WebStyleControllerItem1
    Left = 141
    Top = 117
    Height = 23
    Width = 171
    ZIndex = 0
    Styles.Default = WebStyleControllerItem1
    TabOrder = 3
    Caption = 'Show Axis'
  end
  object wcb3D: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = WebStyleControllerItem1
    Left = 459
    Top = 201
    Height = 23
    Width = 76
    ZIndex = 0
    Styles.Default = WebStyleControllerItem1
    TabOrder = 5
    Caption = '3D'
    Checked = True
  end
  object cbShowMarks: TcxWebCheckBox
    CustomEvents = <>
    StyleItem_Default = WebStyleControllerItem1
    Left = 517
    Top = 181
    Height = 23
    Width = 171
    ZIndex = 0
    Styles.Default = WebStyleControllerItem1
    TabOrder = 4
    Caption = 'Show Marks'
    Checked = True
  end
  object WebStyleController: TcxWebStyleController
    Left = 152
    Top = 32
    object WebStyleControllerItem1: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 9
    end
  end
end
