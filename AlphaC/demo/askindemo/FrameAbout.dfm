object FrameAbout: TFrameAbout
  Left = 0
  Top = 0
  Width = 490
  Height = 513
  TabOrder = 0
  DesignSize = (
    490
    513)
  object sGroupBox1: TsGroupBox
    Left = 25
    Top = 124
    Width = 441
    Height = 329
    Anchors = [akTop]
    Caption = 'Some features'
    TabOrder = 0
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object sCheckBox1: TsCheckBox
      Tag = 5
      Left = 28
      Top = 35
      Width = 373
      Height = 45
      Caption = 
        'Skins are upgradeable and have a very simple structure. If you w' +
        'ant to add themes of your own, read more about the skins structu' +
        're in the AlphaSkins overview.'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 0
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
      ReadOnly = True
      WordWrap = True
    end
    object sCheckBox2: TsCheckBox
      Tag = 5
      Left = 28
      Top = 88
      Width = 373
      Height = 33
      Caption = 
        'The elements of each control are calculated in real-time, so any' +
        ' control can be freely moved and resized at run-time.'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 1
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
      ReadOnly = True
      WordWrap = True
    end
    object sCheckBox3: TsCheckBox
      Tag = 5
      Left = 28
      Top = 128
      Width = 373
      Height = 46
      Caption = 
        'Drawing of components is produced in several layers, so componen' +
        'ts may be alpha-blended, can have nice realistic borders, shadow' +
        's and some other beautiful effects'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 2
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
      ReadOnly = True
      WordWrap = True
    end
    object sCheckBox4: TsCheckBox
      Tag = 5
      Left = 28
      Top = 180
      Width = 373
      Height = 20
      Caption = 
        'It is possible to embed any skins within the Exe-file for easy d' +
        'eployment.'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 3
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
      ReadOnly = True
      WordWrap = True
    end
    object sCheckBox5: TsCheckBox
      Tag = 5
      Left = 28
      Top = 210
      Width = 373
      Height = 34
      Caption = 
        'Most standard edit controls are skinned automatically by TsSkinP' +
        'rovider component'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 4
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
      ReadOnly = True
      WordWrap = True
    end
    object sCheckBox6: TsCheckBox
      Tag = 5
      Left = 28
      Top = 254
      Width = 373
      Height = 19
      Caption = 'Unicode support (see help-file for details)'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 5
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
      ReadOnly = True
      WordWrap = True
    end
    object sCheckBox7: TsCheckBox
      Tag = 5
      Left = 28
      Top = 286
      Width = 373
      Height = 19
      Caption = 'Many standard and 3rd-party components are supported'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 6
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
      ReadOnly = True
      WordWrap = True
    end
  end
  object sPanel1: TsPanel
    Left = 24
    Top = 12
    Width = 441
    Height = 101
    BevelOuter = bvNone
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
    DesignSize = (
      441
      101)
    object sLabel2: TsLabelFX
      Left = 51
      Top = 60
      Width = 345
      Height = 34
      Alignment = taCenter
      Anchors = [akTop]
      Caption = 
        'We have also added some properties, which make AlphaControls (an' +
        'd the applications that use them) unique. '
      ParentFont = False
      WordWrap = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14603725
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object sLabel1: TsLabelFX
      Left = 35
      Top = 6
      Width = 373
      Height = 55
      Alignment = taCenter
      Anchors = [akTop]
      AutoSize = False
      Caption = 
        'A package of standard and unique skinned VCL for professional UI' +
        ' design development using "AlphaSkins". AlphaControls is an easy' +
        '-to-use universal and powerful tool for developing original skin' +
        'ned and non-skinned business/media applications.'
      ParentFont = False
      WordWrap = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14603725
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Shadow.BlurCount = 3
    end
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 30
    Top = 12
  end
end
