object DM: TDM
  OldCreateOrder = True
  OnActivate = cxWebHomeDataModuleActivate
  OnBeforeDispatchPage = cxWebHomeDataModuleBeforeDispatchPage
  OnDeactivate = cxWebHomeDataModuleDeactivate
  Left = 395
  Top = 198
  Height = 287
  Width = 287
  object Connection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DB\dxForum.mdb;Pers' +
      'ist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 42
    Top = 124
  end
  object StyleController: TcxWebStyleController
    Left = 39
    Top = 30
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
    object TextStyle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 8
    end
    object TableItemsHover: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 9
    end
    object ButtonStyle: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebMidnightBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebPowderBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = 14575114
      Style.Shading.AssignedValues = [wsavColor]
    end
    object ButtonStyleHover: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebMidnightBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebYellow
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = 14575114
      Style.Shading.AssignedValues = [wsavColor]
    end
    object GridStyle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
    end
    object NavigatorStyle: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Color = clWebDarkGray
      Style.Borders.Left.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebWhite
      Style.Shading.AssignedValues = [wsavColor]
    end
    object NavigatorStyleHover: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Color = clWebYellow
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
      Style.Font.Weight = wfwNormal
      Style.Shading.Color = clWebLightGrey
      Style.Shading.AssignedValues = [wsavColor]
    end
    object EditStyle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 9
    end
    object TablePagingSelect: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebBlack
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsNone
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 0
      Style.Font.Color = clWebBlack
      Style.Font.Decoration = [wfdNone]
      Style.Font.Name = 'Arial'
      Style.Font.Names.Strings = (
        'Arial')
      Style.Font.Size.Value = 8
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebWhite
      Style.Shading.AssignedValues = [wsavColor]
    end
  end
end
