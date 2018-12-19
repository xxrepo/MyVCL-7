object FrameTabControls: TFrameTabControls
  Left = 0
  Top = 0
  Width = 498
  Height = 431
  AutoScroll = False
  TabOrder = 0
  object sTabControl2: TsTabControl
    Left = 192
    Top = 325
    Width = 277
    Height = 38
    MultiLine = True
    TabOrder = 0
    Tabs.Strings = (
      'First item'
      'Second item'
      'Third item'
      'Fourth item')
    TabIndex = 0
    SkinData.SkinSection = 'PAGECONTROL'
  end
  object sPageControl1: TsPageControl
    Left = 19
    Top = 20
    Width = 451
    Height = 277
    ActivePage = sTabSheet1
    HotTrack = True
    Images = MainForm.ImageList16
    TabHeight = 28
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    OnCloseBtnClick = sPageControl1CloseBtnClick
    object sTabSheet1: TsTabSheet
      Caption = 'sTabSheet1'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      SkinData.SkinSection = 'TABSHEET'
      object sGroupBox5: TsGroupBox
        Left = 28
        Top = 46
        Width = 121
        Height = 129
        Caption = 'Tabs position'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object sRadioButton6: TsRadioButton
          Tag = 5
          Left = 26
          Top = 29
          Width = 38
          Height = 20
          Caption = 'Top'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = sRadioButton6Change
          SkinData.SkinSection = 'RADIOBUTTON'
        end
        object sRadioButton7: TsRadioButton
          Tag = 5
          Left = 26
          Top = 51
          Width = 54
          Height = 20
          Caption = 'Bottom'
          TabOrder = 1
          OnClick = sRadioButton7Change
          SkinData.SkinSection = 'RADIOBUTTON'
        end
        object sRadioButton8: TsRadioButton
          Tag = 5
          Left = 26
          Top = 73
          Width = 39
          Height = 20
          Caption = 'Left'
          TabOrder = 2
          OnClick = sRadioButton8Change
          SkinData.SkinSection = 'RADIOBUTTON'
        end
        object sRadioButton9: TsRadioButton
          Tag = 5
          Left = 26
          Top = 95
          Width = 45
          Height = 20
          Caption = 'Right'
          TabOrder = 3
          OnClick = sRadioButton9Change
          SkinData.SkinSection = 'RADIOBUTTON'
        end
      end
      object sCheckBox8: TsCheckBox
        Tag = 5
        Left = 52
        Top = 17
        Width = 58
        Height = 20
        Caption = 'Multiline'
        TabOrder = 2
        OnClick = sCheckBox8Change
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sTabControl1: TsTabControl
        Left = 204
        Top = 49
        Width = 189
        Height = 132
        HotTrack = True
        Images = MainForm.ImageList16
        MultiLine = True
        TabHeight = 30
        TabOrder = 0
        Tabs.Strings = (
          'First item'
          'Second item'
          'Third item'
          'Fourth item')
        TabIndex = 0
        SkinData.SkinSection = 'PAGECONTROL'
      end
      object sCheckBox14: TsCheckBox
        Left = 176
        Top = 16
        Width = 164
        Height = 20
        Caption = 'Use Close Button on this page'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 3
        OnClick = sCheckBox14Click
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = 'sTabSheet2'
      ImageIndex = 3
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      SkinData.SkinSection = 'TABSHEET'
      object sCheckBox1: TsCheckBox
        Left = 56
        Top = 24
        Width = 85
        Height = 19
        Caption = 'sCheckBox1'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox3: TsCheckBox
        Left = 56
        Top = 85
        Width = 85
        Height = 19
        Caption = 'sCheckBox3'
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox4: TsCheckBox
        Left = 56
        Top = 115
        Width = 85
        Height = 19
        Caption = 'sCheckBox4'
        TabOrder = 2
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox5: TsCheckBox
        Left = 56
        Top = 146
        Width = 85
        Height = 19
        Caption = 'sCheckBox5'
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox6: TsCheckBox
        Left = 56
        Top = 176
        Width = 85
        Height = 19
        Caption = 'sCheckBox6'
        TabOrder = 4
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox7: TsCheckBox
        Left = 192
        Top = 24
        Width = 85
        Height = 19
        Caption = 'sCheckBox7'
        TabOrder = 5
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox10: TsCheckBox
        Left = 192
        Top = 85
        Width = 91
        Height = 19
        Caption = 'sCheckBox10'
        TabOrder = 6
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox11: TsCheckBox
        Left = 192
        Top = 115
        Width = 91
        Height = 19
        Caption = 'sCheckBox11'
        TabOrder = 7
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox12: TsCheckBox
        Left = 192
        Top = 146
        Width = 91
        Height = 19
        Caption = 'sCheckBox12'
        TabOrder = 8
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox13: TsCheckBox
        Left = 192
        Top = 176
        Width = 91
        Height = 19
        Caption = 'sCheckBox13'
        TabOrder = 9
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox2: TsCheckBox
        Left = 56
        Top = 54
        Width = 85
        Height = 19
        Caption = 'sCheckBox2'
        TabOrder = 10
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox9: TsCheckBox
        Left = 192
        Top = 54
        Width = 85
        Height = 19
        Caption = 'sCheckBox9'
        TabOrder = 11
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
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
    object sTabSheet7: TsTabSheet
      Caption = 'Custom tab kind'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      TabSkin = 'PROGRESSH'
      object sCheckBox16: TsCheckBox
        Left = 32
        Top = 24
        Width = 169
        Height = 20
        Caption = 'Use default Skinsection for Tab'
        TabOrder = 0
        OnClick = sCheckBox16Click
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
  end
  object sRadioButton1: TsRadioButton
    Left = 24
    Top = 384
    Width = 52
    Height = 20
    Caption = 'tsTabs'
    Checked = True
    TabOrder = 2
    TabStop = True
    OnClick = sRadioButton1Click
    SkinData.SkinSection = 'RADIOBUTTON'
  end
  object sRadioButton2: TsRadioButton
    Left = 96
    Top = 384
    Width = 66
    Height = 20
    Caption = 'tsButtons'
    TabOrder = 3
    OnClick = sRadioButton2Click
    SkinData.SkinSection = 'RADIOBUTTON'
  end
  object sRadioButton3: TsRadioButton
    Left = 176
    Top = 384
    Width = 84
    Height = 20
    Caption = 'tsFlatButtons'
    TabOrder = 4
    OnClick = sRadioButton3Click
    SkinData.SkinSection = 'RADIOBUTTON'
  end
  object sComboBox1: TsComboBox
    Left = 348
    Top = 382
    Width = 125
    Height = 19
    Alignment = taLeftJustify
    BoundLabel.Active = True
    BoundLabel.Caption = 'SkinSection'
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
    TabOrder = 5
    OnChange = sComboBox1Change
    Items.Strings = (
      'CHECKBOX'
      'PAGECONTROL'
      'PANEL'
      'DIALOG'
      'GROUPBOX')
  end
  object sCheckBox15: TsCheckBox
    Left = 44
    Top = 332
    Width = 115
    Height = 20
    Caption = 'Show Close buttons'
    TabOrder = 6
    OnClick = sCheckBox15Click
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 43
    Top = 6
  end
end
