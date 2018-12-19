object FrameScrollBoxes: TFrameScrollBoxes
  Left = 0
  Top = 0
  Width = 488
  Height = 425
  TabOrder = 0
  DesignSize = (
    488
    425)
  object sScrollBox1: TsScrollBox
    Left = 17
    Top = 51
    Width = 456
    Height = 358
    HorzScrollBar.Increment = 38
    HorzScrollBar.Tracking = True
    VertScrollBar.Increment = 26
    VertScrollBar.Tracking = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoMouseWheel = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL_LOW'
    object sGauge1: TsGauge
      Left = 304
      Top = 196
      Width = 145
      Height = 25
      SkinData.SkinSection = 'GAUGE'
      ForeColor = clBlack
      Suffix = '%'
    end
    object sSpinEdit2: TsSpinEdit
      Tag = 5
      Left = 203
      Top = 92
      Width = 80
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      MaxValue = 0
      MinValue = 0
      Value = 0
    end
    object sMemo2: TsMemo
      Tag = 5
      Left = 13
      Top = 17
      Width = 185
      Height = 89
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'sMemo2')
      ParentFont = False
      TabOrder = 1
      Text = 'sMemo2'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
    end
    object sCurrencyEdit2: TsCurrencyEdit
      Tag = 5
      Left = 202
      Top = 17
      Width = 80
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object sCurrencyEdit3: TsCurrencyEdit
      Tag = 5
      Left = 202
      Top = 42
      Width = 80
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object sSpinEdit3: TsSpinEdit
      Tag = 5
      Left = 203
      Top = 66
      Width = 80
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '0'
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      MaxValue = 0
      MinValue = 0
      Value = 0
    end
    object sTrackBar2: TsTrackBar
      Tag = 5
      Left = 25
      Top = 111
      Width = 170
      Height = 33
      Max = 100
      Frequency = 10
      Position = 47
      TabOrder = 5
      OnChange = sTrackBar2Change
      SkinData.SkinSection = 'TRACKBAR'
    end
    object sButton2: TsButton
      Tag = 5
      Left = 29
      Top = 154
      Width = 75
      Height = 25
      Caption = 'sButton2'
      TabOrder = 6
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton3: TsButton
      Tag = 5
      Left = 108
      Top = 154
      Width = 75
      Height = 25
      Caption = 'sButton3'
      TabOrder = 7
      SkinData.SkinSection = 'BUTTON'
    end
    object sGroupBox3: TsGroupBox
      Left = 298
      Top = 7
      Width = 158
      Height = 162
      Caption = 'sGroupBox3'
      TabOrder = 8
      SkinData.SkinSection = 'GROUPBOX'
      object sCheckBox10: TsCheckBox
        Tag = 5
        Left = 28
        Top = 29
        Width = 86
        Height = 20
        Caption = 'sCheckBox10'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox11: TsCheckBox
        Tag = 5
        Left = 28
        Top = 54
        Width = 86
        Height = 20
        Caption = 'sCheckBox11'
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox12: TsCheckBox
        Tag = 5
        Left = 28
        Top = 79
        Width = 86
        Height = 20
        Caption = 'sCheckBox12'
        TabOrder = 2
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox13: TsCheckBox
        Tag = 5
        Left = 28
        Top = 104
        Width = 86
        Height = 20
        Caption = 'sCheckBox13'
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox14: TsCheckBox
        Tag = 5
        Left = 28
        Top = 129
        Width = 86
        Height = 20
        Caption = 'sCheckBox14'
        TabOrder = 4
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
    object sPageControl1: TsPageControl
      Tag = 5
      Left = 56
      Top = 312
      Width = 361
      Height = 271
      ActivePage = sTabSheet1
      HotTrack = True
      TabHeight = 42
      TabOrder = 9
      SkinData.SkinSection = 'PAGECONTROL'
      object sTabSheet1: TsTabSheet
        Caption = 'sTabSheet1'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet2: TsTabSheet
        Caption = 'sTabSheet2'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet3: TsTabSheet
        Caption = 'sTabSheet3'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet4: TsTabSheet
        Caption = 'sTabSheet4'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet5: TsTabSheet
        Caption = 'sTabSheet5'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet6: TsTabSheet
        Caption = 'sTabSheet6'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        SkinData.SkinSection = 'TABSHEET'
      end
    end
    object sPanel1: TsPanel
      Tag = 5
      Left = 288
      Top = 252
      Width = 177
      Height = 41
      Caption = ' '
      TabOrder = 10
      SkinData.SkinSection = 'PANEL'
      object sButton1: TsButton
        Tag = 5
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'sButton1'
        TabOrder = 0
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton4: TsButton
        Tag = 5
        Left = 92
        Top = 8
        Width = 75
        Height = 25
        Caption = 'sButton4'
        TabOrder = 1
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object sPanel2: TsPanel
      Left = 24
      Top = 192
      Width = 257
      Height = 101
      Caption = ' '
      TabOrder = 11
      SkinData.SkinSection = 'PANEL'
      object sPanel3: TsPanel
        Left = 12
        Top = 12
        Width = 209
        Height = 57
        Caption = ' '
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
      end
    end
    object sButton5: TsButton
      Tag = 5
      Left = 187
      Top = 154
      Width = 75
      Height = 25
      Caption = 'sButton3'
      TabOrder = 12
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sComboBox1: TsComboBox
    Tag = 5
    Left = 140
    Top = 17
    Width = 141
    Height = 19
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
    TabOrder = 1
    OnChange = sComboBox1Change
    Items.Strings = (
      'ALPHAEDIT'
      'EDIT'
      'CHECKBOX'
      'PANEL_LOW'
      'PANEL'
      'BUTTON'
      'SPEEDBUTTON'
      'GROUPBOX'
      'DIALOG'
      'DRAGBAR'
      'EDIT'
      'PROGRESSH'
      'GRIPH'
      'EXTRALINE'
      'HINT')
  end
  object sCheckBox1: TsCheckBox
    Left = 296
    Top = 16
    Width = 105
    Height = 20
    Caption = 'AutoMouseWheel'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = sCheckBox1Click
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 38
    Top = 15
  end
end
