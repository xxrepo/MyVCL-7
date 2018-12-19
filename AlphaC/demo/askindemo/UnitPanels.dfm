object FramePanels: TFramePanels
  Left = 0
  Top = 0
  Width = 567
  Height = 558
  TabOrder = 0
  DesignSize = (
    567
    558)
  object sContainer2: TsPanel
    Left = 178
    Top = 12
    Width = 355
    Height = 219
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    BorderWidth = 8
    Caption = ' '
    TabOrder = 0
    SkinData.SkinSection = 'PANEL_LOW'
    object sSplitter1: TsSplitter
      Left = 9
      Top = 123
      Width = 337
      Height = 6
      Cursor = crVSplit
      Align = alBottom
      ResizeStyle = rsUpdate
      SkinData.SkinSection = 'SPLITTER'
    end
    object sSplitter2: TsSplitter
      Left = 83
      Top = 9
      Height = 114
      ResizeStyle = rsUpdate
      SkinData.SkinSection = 'SPLITTER'
    end
    object sPanel1: TsPanel
      Left = 9
      Top = 129
      Width = 337
      Height = 81
      Align = alBottom
      BorderWidth = 5
      Caption = ' '
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sPanel6: TsPanel
        Left = 6
        Top = 6
        Width = 325
        Height = 69
        Align = alClient
        BevelOuter = bvLowered
        BorderWidth = 5
        Caption = ' '
        TabOrder = 0
        SkinData.SkinSection = 'PANEL_LOW'
        object sPanel7: TsPanel
          Left = 6
          Top = 6
          Width = 313
          Height = 57
          Align = alClient
          BorderWidth = 5
          TabOrder = 0
          SkinData.SkinSection = 'PANEL'
        end
      end
    end
    object sPanel2: TsPanel
      Left = 9
      Top = 9
      Width = 74
      Height = 114
      Align = alLeft
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
    end
    object sPanel4: TsPanel
      Left = 89
      Top = 9
      Width = 257
      Height = 114
      Align = alClient
      TabOrder = 1
      SkinData.SkinSection = 'PANEL_LOW'
    end
  end
  object sPanel3: TsPanel
    Left = 8
    Top = 140
    Width = 163
    Height = 209
    Anchors = [akLeft, akTop, akBottom]
    BevelOuter = bvNone
    Caption = 'sPanel3'
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
  end
  object sPanel5: TsPanel
    Left = 178
    Top = 243
    Width = 355
    Height = 106
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' '
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      355
      106)
    object sButton1: TsButton
      Tag = 5
      Left = 12
      Top = 8
      Width = 75
      Height = 91
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Lowered'
      TabOrder = 0
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton2: TsButton
      Tag = 5
      Left = 92
      Top = 8
      Width = 75
      Height = 91
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Raised'
      TabOrder = 1
      OnClick = sButton2Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton3: TsButton
      Tag = 5
      Left = 172
      Top = 8
      Width = 152
      Height = 91
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Box'
      TabOrder = 2
      OnClick = sButton3Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 8
    Width = 163
    Height = 125
    Caption = 'sGroupBox1'
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object sGroupBox2: TsGroupBox
      Left = 32
      Top = 40
      Width = 122
      Height = 75
      Caption = 'sGroupBox2'
      TabOrder = 0
      CaptionLayout = clTopCenter
      CaptionYOffset = 4
      SkinData.SkinSection = 'GROUPBOX'
    end
  end
  object sComboBox1: TsComboBox
    Tag = 5
    Left = 316
    Top = 421
    Width = 217
    Height = 19
    Anchors = [akLeft, akRight, akBottom]
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
    DropDownCount = 10
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
    OnChange = sComboBox1Change
    Items.Strings = (
      'BUTTON_BIG'
      'CHECKBOX'
      'PANEL_LOW'
      'PANEL'
      'BUTTON'
      'SPEEDBUTTON'
      'GROUPBOX'
      'DIALOG'
      'FORMTITLE'
      'DRAGBAR'
      'EDIT'
      'PROGRESSH'
      'GRIPH'
      'EXTRALINE'
      'HINT'
      'BUTTON_HUGE')
  end
  object sComboBox2: TsComboBox
    Tag = 5
    Left = 316
    Top = 449
    Width = 217
    Height = 19
    Anchors = [akLeft, akRight, akBottom]
    Alignment = taLeftJustify
    BoundLabel.Active = True
    BoundLabel.Caption = 'GroupBox.CaptionSkin property :'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    DropDownCount = 10
    SkinData.SkinSection = 'COMBOBOX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = -1
    ParentFont = False
    TabOrder = 5
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
      'FORMTITLE'
      'DRAGBAR'
      'EDIT'
      'PROGRESSH'
      'GRIPH'
      'EXTRALINE'
      'HINT')
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 196
    Top = 8
  end
end
