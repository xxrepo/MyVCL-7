object FrameListViews: TFrameListViews
  Left = 0
  Top = 0
  Width = 505
  Height = 403
  TabOrder = 0
  object sListView1: TsListView
    Left = 22
    Top = 104
    Width = 459
    Height = 245
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
    Columns = <
      item
        Caption = 'Column 1'
        ImageIndex = 0
        Width = 140
      end
      item
        Caption = 'Column 2'
        ImageIndex = 1
        Width = 100
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'Column 3'
        ImageIndex = 6
      end>
    Items.Data = {
      610100000800000001000000FFFFFFFFFFFFFFFF04000000000000001C466972
      7374206974656D2077697468206C6F6E672063617074696F6E09537562497465
      6D2031095375624974656D2032095375624974656D2033095375624974656D20
      3402000000FFFFFFFFFFFFFFFF03000000000000001D5365636F6E6420697465
      6D2077697468206C6F6E672063617074696F6E095375624974656D2031095375
      624974656D2032095375624974656D203303000000FFFFFFFFFFFFFFFF000000
      0000000000064974656D203304000000FFFFFFFFFFFFFFFF0000000000000000
      064974656D203405000000FFFFFFFFFFFFFFFF0000000000000000064974656D
      203506000000FFFFFFFFFFFFFFFF0000000000000000064974656D2036070000
      00FFFFFFFFFFFFFFFF0000000000000000064974656D203708000000FFFFFFFF
      FFFFFFFF0000000000000000064974656D2038FFFFFFFFFFFFFFFFFFFFFFFFFF
      FF}
    LargeImages = MainForm.ImageList32
    RowSelect = True
    ShowWorkAreas = True
    SmallImages = MainForm.ImageList16
    TabOrder = 0
    ViewStyle = vsReport
  end
  object sGroupBox10: TsGroupBox
    Left = 21
    Top = 21
    Width = 336
    Height = 64
    Caption = 'ViewStyle'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object sRadioButton21: TsRadioButton
      Tag = 5
      Left = 13
      Top = 26
      Width = 52
      Height = 20
      Caption = 'vsIcon'
      TabOrder = 0
      OnClick = sRadioButton21Change
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sRadioButton22: TsRadioButton
      Tag = 5
      Left = 90
      Top = 26
      Width = 47
      Height = 20
      HelpContext = 1
      Caption = 'vsList'
      TabOrder = 1
      OnClick = sRadioButton22Change
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sRadioButton23: TsRadioButton
      Tag = 5
      Left = 163
      Top = 26
      Width = 64
      Height = 20
      HelpContext = 2
      Caption = 'vsReport'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = sRadioButton23Change
      SkinData.SkinSection = 'RADIOBUTTON'
    end
    object sRadioButton24: TsRadioButton
      Tag = 5
      Left = 245
      Top = 26
      Width = 76
      Height = 20
      HelpContext = 3
      Caption = 'vsSmallIcon'
      TabOrder = 3
      OnClick = sRadioButton24Change
      SkinData.SkinSection = 'RADIOBUTTON'
    end
  end
  object sButton1: TsButton
    Left = 24
    Top = 356
    Width = 161
    Height = 25
    Caption = 'Add 100 items'
    TabOrder = 2
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 7
    Top = 9
  end
end
