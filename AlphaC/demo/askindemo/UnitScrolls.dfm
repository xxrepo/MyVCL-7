object FrameScrolls: TFrameScrolls
  Left = 0
  Top = 0
  Width = 497
  Height = 390
  TabOrder = 0
  object sGauge1: TsGauge
    Left = 27
    Top = 68
    Width = 233
    Height = 23
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlack
    Suffix = '%'
  end
  object sGauge2: TsGauge
    Left = 288
    Top = 20
    Width = 32
    Height = 157
    Kind = gkVerticalBar
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlack
    Suffix = '%'
  end
  object sTrackBar1: TsTrackBar
    Tag = 5
    Left = 26
    Top = 28
    Width = 234
    Height = 31
    Max = 100
    Frequency = 10
    Position = 47
    TabOrder = 0
    OnChange = sTrackBar1Change
    SkinData.SkinSection = 'TRACKBAR'
  end
  object sScrollBar1: TsScrollBar
    Tag = 5
    Left = 28
    Top = 131
    Width = 232
    Height = 24
    LargeChange = 10
    PageSize = 0
    Position = 47
    TabOrder = 1
    OnChange = sScrollBar2Change
    SkinManager = MainForm.sSkinManager1
  end
  object sScrollBar3: TsScrollBar
    Tag = 5
    Left = 371
    Top = 20
    Width = 16
    Height = 157
    Kind = sbVertical
    PageSize = 0
    Position = 47
    TabOrder = 2
    OnChange = sScrollBar2Change
    SkinManager = MainForm.sSkinManager1
  end
  object sComboBox1: TsComboBox
    Tag = 5
    Left = 148
    Top = 233
    Width = 133
    Height = 21
    Alignment = taLeftJustify
    BoundLabel.Active = True
    BoundLabel.Caption = 'SkinSection property :'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'COMBOBOX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = -1
    ParentFont = False
    TabOrder = 3
    OnChange = sComboBox1Change
    Items.Strings = (
      'GAUGE'
      'CHECKBOX'
      'PANEL_LOW'
      'PANEL'
      'BUTTON'
      'SPEEDBUTTON'
      'GROUPBOX'
      'EDIT')
  end
  object sComboBox2: TsComboBox
    Tag = 5
    Left = 148
    Top = 257
    Width = 133
    Height = 21
    Alignment = taLeftJustify
    BoundLabel.Active = True
    BoundLabel.Caption = 'ProgressBar SkinSection :'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'COMBOBOX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = -1
    ParentFont = False
    TabOrder = 4
    OnChange = sComboBox2Change
    Items.Strings = (
      'PANEL'
      'BUTTON'
      'GROUPBOX'
      'DIALOG'
      'PROGRESSH'
      'SPEEDBUTTON'
      'PROGRESSV')
  end
  object sProgressBar1: TsProgressBar
    Left = 28
    Top = 165
    Width = 232
    Height = 25
    BorderWidth = 1
    Position = 47
    TabOrder = 5
    SkinData.SkinSection = 'GAUGE'
    Style = pbstMarquee
    MarqueeInterval = 50
  end
  object sTrackBar2: TsTrackBar
    Tag = 5
    Left = 395
    Top = 15
    Width = 40
    Height = 166
    Max = 100
    Orientation = trVertical
    Frequency = 10
    Position = 47
    TabOrder = 6
    OnChange = sTrackBar1Change
    SkinData.SkinSection = 'TRACKBAR'
  end
  object sProgressBar2: TsProgressBar
    Left = 328
    Top = 20
    Width = 32
    Height = 157
    BorderWidth = 1
    Orientation = pbVertical
    Position = 47
    TabOrder = 7
    SkinData.SkinSection = 'GAUGE'
  end
  object sRadioButton1: TsRadioButton
    Left = 72
    Top = 196
    Width = 53
    Height = 20
    Caption = 'Normal'
    TabOrder = 8
    OnClick = sRadioButton1Click
    SkinData.SkinSection = 'RADIOBUTTON'
  end
  object sRadioButton2: TsRadioButton
    Left = 152
    Top = 196
    Width = 62
    Height = 20
    Caption = 'Marquee'
    Checked = True
    TabOrder = 9
    TabStop = True
    OnClick = sRadioButton2Click
    SkinData.SkinSection = 'RADIOBUTTON'
  end
  object sCheckBox1: TsCheckBox
    Left = 40
    Top = 100
    Width = 64
    Height = 20
    Caption = 'Animated'
    Checked = True
    State = cbChecked
    TabOrder = 10
    OnClick = sCheckBox1Click
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 8
    Top = 4
  end
end
