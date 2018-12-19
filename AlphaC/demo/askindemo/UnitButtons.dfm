object FrameButtons: TFrameButtons
  Left = 0
  Top = 0
  Width = 530
  Height = 462
  TabOrder = 0
  object sToolBar2: TsToolBar
    Left = 25
    Top = 12
    Width = 312
    Height = 48
    Align = alNone
    BorderWidth = 2
    ButtonHeight = 34
    ButtonWidth = 34
    Flat = True
    Images = MainForm.ImageList24
    TabOrder = 0
    Transparent = True
    SkinData.SkinSection = 'TOOLBAR'
    object ToolButton1: TToolButton
      Tag = 5
      Left = 0
      Top = 0
      Caption = '1'
      ImageIndex = 3
    end
    object ToolButton4: TToolButton
      Tag = 5
      Left = 34
      Top = 0
      Caption = 'ToolButton4'
      DropdownMenu = PopupMenu1
      ImageIndex = 2
      Style = tbsDropDown
    end
    object ToolButton5: TToolButton
      Left = 81
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsDivider
    end
    object ToolButton8: TToolButton
      Tag = 5
      Left = 89
      Top = 0
      Caption = 'ToolButton8'
      Grouped = True
      ImageIndex = 0
      Style = tbsCheck
    end
    object ToolButton6: TToolButton
      Tag = 5
      Left = 123
      Top = 0
      Caption = 'ToolButton6'
      Grouped = True
      ImageIndex = 1
      Style = tbsCheck
    end
    object ToolButton7: TToolButton
      Tag = 5
      Left = 157
      Top = 0
      Caption = 'ToolButton7'
      Grouped = True
      ImageIndex = 4
      Style = tbsCheck
    end
  end
  object sBitBtn3: TsBitBtn
    Tag = 5
    Left = 235
    Top = 371
    Width = 131
    Height = 64
    Caption = 'TsBitBtn'
    TabOrder = 1
    SkinData.SkinSection = 'BUTTON_HUGE'
    ImageIndex = 3
    Images = MainForm.ImageList24
    Reflected = True
  end
  object sComboBox2: TsComboBox
    Tag = 5
    Left = 367
    Top = 34
    Width = 119
    Height = 19
    Alignment = taLeftJustify
    BoundLabel.Active = True
    BoundLabel.Caption = 'ToolBar SkinSection :'
    BoundLabel.Indent = 2
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclTopLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'COMBOBOX'
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = -1
    ParentFont = False
    TabOrder = 2
    OnChange = sComboBox2Change
    Items.Strings = (
      'BUTTON_BIG'
      'CHECKBOX'
      'PANEL_LOW'
      'PANEL'
      'BUTTON'
      'SPEEDBUTTON'
      'GROUPBOX'
      'DIALOG'
      'BAR'
      'DRAGBAR'
      'PROGRESSH'
      'TOOLBAR'
      'GRIPH')
  end
  object sBitBtn8: TsBitBtn
    Tag = 5
    Left = 93
    Top = 371
    Width = 64
    Height = 64
    TabOrder = 3
    NumGlyphs = 2
    SkinData.SkinSection = 'BUTTON_HUGE'
    ImageIndex = 1
    Images = MainForm.ImgList_MultiState
    Reflected = True
    ShowCaption = False
  end
  object sGroupBox2: TsGroupBox
    Left = 24
    Top = 258
    Width = 461
    Height = 99
    Caption = 'Glyphs : '
    TabOrder = 4
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Tag = 5
      Left = 31
      Top = 23
      Width = 50
      Height = 13
      Caption = 'Blending : '
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 196
      Top = 25
      Width = 6
      Height = 13
      Caption = '0'
    end
    object sLabel3: TsLabel
      Left = 389
      Top = 24
      Width = 12
      Height = 13
      Caption = '32'
    end
    object sLabel4: TsLabel
      Tag = 5
      Left = 247
      Top = 22
      Width = 29
      Height = 13
      Caption = 'Size : '
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sCheckBox1: TsCheckBox
      Tag = 5
      Left = 40
      Top = 62
      Width = 55
      Height = 20
      Caption = 'Grayed'
      TabOrder = 0
      OnClick = sCheckBox1Click
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sTrackBar1: TsTrackBar
      Tag = 5
      Left = 80
      Top = 20
      Width = 109
      Height = 25
      Max = 100
      TabOrder = 1
      OnChange = sTrackBar1Change
      SkinData.SkinSection = 'TRACKBAR'
    end
    object sCheckBox2: TsCheckBox
      Left = 124
      Top = 62
      Width = 66
      Height = 20
      Caption = 'Reflected'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = sCheckBox2Click
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sTrackBar2: TsTrackBar
      Tag = 5
      Left = 276
      Top = 18
      Width = 109
      Height = 25
      Max = 48
      Min = 16
      Position = 32
      TabOrder = 3
      OnChange = sTrackBar2Change
      SkinData.SkinSection = 'TRACKBAR'
    end
  end
  object sBitBtn4: TsBitBtn
    Tag = 5
    Left = 162
    Top = 371
    Width = 64
    Height = 64
    TabOrder = 5
    NumGlyphs = 2
    SkinData.SkinSection = 'BUTTON_HUGE'
    ImageIndex = 2
    Images = MainForm.ImgList_MultiState
    Reflected = True
    ShowCaption = False
  end
  object sPanel2: TsPanel
    Left = 24
    Top = 80
    Width = 461
    Height = 121
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    SkinData.SkinSection = 'GROUPBOX'
    object sSpeedButton1: TsSpeedButton
      Tag = 5
      Left = 272
      Top = 12
      Width = 82
      Height = 43
      Flat = True
      Layout = blGlyphTop
      NumGlyphs = 2
      Spacing = 0
      SkinData.SkinSection = 'SPEEDBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 1
      Images = MainForm.ImgList_MultiState
      Reflected = True
      ShowCaption = False
      TextAlignment = taLeftJustify
    end
    object sLabel5: TsLabel
      Tag = 5
      Left = 301
      Top = 68
      Width = 61
      Height = 13
      Caption = 'HUE offset : '
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel6: TsLabel
      Left = 366
      Top = 68
      Width = 6
      Height = 13
      Caption = '0'
    end
    object sBitBtn1: TsBitBtn
      Tag = 5
      Left = 364
      Top = 12
      Width = 82
      Height = 43
      Caption = 'sBitBtn1'
      TabOrder = 0
      NumGlyphs = 2
      Spacing = 3
      SkinData.SkinSection = 'BUTTON'
      DisabledGlyphKind = []
      ImageIndex = 2
      Images = MainForm.ImgList_MultiState
      Reflected = True
      ShowFocus = False
    end
    object sButton1: TsButton
      Left = 12
      Top = 12
      Width = 242
      Height = 96
      Caption = 'bsCommandLink style'
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
      CommandLinkHint = 
        'This style is supported in TsButton in all Delphi and Windows ve' +
        'rsions'
      DisabledImageIndex = 2
      HotImageIndex = 1
      Images = MainForm.ImageList32
      ImageIndex = 0
      ImageMargins.Left = 2
      ImageMargins.Right = 2
      PressedImageIndex = 3
      SelectedImageIndex = 4
      ContentMargin = 14
      Style = bsCommandLink
      Reflected = True
    end
    object sTrackBar3: TsTrackBar
      Tag = 5
      Left = 288
      Top = 80
      Width = 137
      Height = 25
      Max = 360
      TabOrder = 2
      OnChange = sTrackBar3Change
      SkinData.SkinSection = 'TRACKBAR'
    end
  end
  object sBitBtn6: TsBitBtn
    Tag = 5
    Left = 25
    Top = 371
    Width = 64
    Height = 64
    TabOrder = 7
    NumGlyphs = 2
    SkinData.SkinSection = 'BUTTON_HUGE'
    ImageIndex = 0
    Images = MainForm.ImgList_MultiState
    Reflected = True
    ShowCaption = False
  end
  object sComboBox4: TsComboBox
    Tag = 5
    Left = 340
    Top = 211
    Width = 142
    Height = 19
    Alignment = taLeftJustify
    BoundLabel.Active = True
    BoundLabel.Caption = 'Buttons SkinSection property :'
    BoundLabel.Indent = 2
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'COMBOBOX'
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = -1
    ParentFont = False
    TabOrder = 8
    OnChange = sComboBox4Change
    Items.Strings = (
      'TOOLBUTTON'
      'BUTTON_BIG'
      'BUTTON_HUGE'
      'CHECKBOX'
      'BUTTON'
      'SPEEDBUTTON'
      'SPEEDBUTTON_SMALL'
      'WEBBUTTON')
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 333
    Top = 2
  end
  object PopupMenu1: TPopupMenu
    OwnerDraw = True
    Left = 361
    Top = 2
    object Item11: TMenuItem
      Caption = 'Item 1'
    end
    object Item21: TMenuItem
      Caption = 'Item 2'
    end
    object Item31: TMenuItem
      Caption = 'Item 3'
    end
    object Item41: TMenuItem
      Caption = 'Item 4'
      object Subitem411: TMenuItem
        Caption = 'Subitem 41'
      end
      object Subitem421: TMenuItem
        Caption = 'Subitem 42'
      end
      object Subitem431: TMenuItem
        Caption = 'Subitem 43'
      end
      object Subitem441: TMenuItem
        Caption = 'Subitem 44'
      end
      object Subitem451: TMenuItem
        Caption = 'Subitem 45'
      end
      object Subitem461: TMenuItem
        Caption = 'Subitem 46'
      end
      object Subitem471: TMenuItem
        Caption = 'Subitem 47'
      end
    end
  end
end
