object Tree: TTree
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
  Left = 50
  Top = 50
  Height = 514
  HorizontalOffset = 200
  VerticalOffset = 162
  Width = 803
  object TreeView: TcxWebTreeView
    CustomEvents = <>
    StyleItem_Default = Tree
    StyleItem_Hover = TreeHover
    Left = 10
    Top = 15
    Height = 91
    Width = 240
    ZIndex = 0
    CollapsedImageIndex = 1
    ExpandedImageIndex = 0
    Images = ImageList
    Indent = 13
    Styles.Default = Tree
    Styles.Hover = TreeHover
  end
  object StyleController: TcxWebStyleController
    Left = 324
    Top = 38
    object Tree: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Color = clWebWhite
      Style.Borders.Left.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Width = 0
      Style.Font.Color = clWebWhite
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Shading.Color = 14575114
      Style.Shading.AssignedValues = [wsavColor]
    end
    object TreeItem: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebWhite
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
    end
    object TreeHover: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Color = clWebWhite
      Style.Borders.Left.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Width = 0
      Style.Font.Color = 59135
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Shading.Color = 14575114
      Style.Shading.AssignedValues = [wsavColor]
    end
  end
  object ImageList: TcxWebImageList
    Images = <
      item
        FileName = 'minus.gif'
      end
      item
        FileName = 'plus.gif'
      end>
    ImagesPath = '/dxforum/images/'
    Left = 186
    Top = 34
  end
end
