object FrmAdvCurveEditor: TFrmAdvCurveEditor
  Left = 8
  Top = 8
  Caption = 'Curve Points Editor'
  ClientHeight = 577
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object CurvePanel1: TAdvCurve
    Left = 200
    Top = 0
    Width = 578
    Height = 551
    ShowCurve = True
    ShowHandles = True
    ShowLines = True
    Points = <>
    Align = alClient
    OnMouseDown = CurvePanel1MouseDown
    OnMouseMove = CurvePanel1MouseMove
    OnMouseUp = CurvePanel1MouseUp
    OnCurvePointSelected = CurvePanel1CurvePointSelected
    OnCurveDraw = CurvePanel1CurveDraw
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 200
    Height = 551
    Align = alLeft
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object ListBox1: TListBox
      Left = 0
      Top = 27
      Width = 198
      Height = 522
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object Panel10: TPanel
      Left = 0
      Top = 0
      Width = 198
      Height = 27
      Align = alTop
      TabOrder = 1
      object SpeedButton2: TSpeedButton
        Left = 5
        Top = 2
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Hint = 'Add Serie'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF00007200007200006B000066000065000065FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0001B70001B7050DAC393EB058
          5AB25657AB2E2F9000006F000069000069FF00FFFF00FFFF00FFFF00FFFF00FF
          0016CE0915C66C74D9CED1F2FFFFFFFFFFFFFFFFFFFFFFFFC1C2DF5A5A9F0101
          6900007DFF00FFFF00FFFF00FF0018DF0A1DD3A8B0EDFFFFFFFFFFFFBDBEE98C
          8CD18D8DD0CACAEAFFFFFFFFFFFF8C8CBD010169000072FF00FFFF00FF0018DF
          919DEFFFFFFFE6E8F94F53CE0002AB00009D0000950000975F5FBEF0F0FAFFFF
          FF6565A6000072FF00FF001EF12743E7FBFBFFF7F8FD3B4BDA0000C0161DBEB0
          B4E7A3A5E00A0CA000008F5252B9FFFFFFD9D9E90B0B7F00007A001EF17287F6
          FFFFFF91A1F4000DDA000BD0161DCBF1F4FEDEE1F60508A900009A000093ACAC
          DDFFFFFF5353AF00007A0023F8A8B8FCFFFFFF4060F61734ECA0AEF2BABEF1F8
          F9FEF3F4FBB6B8E99799DC0D0EA25A5BBFFFFFFF8487D60000790E3EFEC5CFFE
          FFFFFF3259FE2649F9FAFCFFFFFFFFFFFFFFFFFFFFFFFFFFEBECF91519B14A4F
          C1FFFFFF9094D90000A23C63FFC4D0FFFFFFFF5979FF052EFF375CFB586DF4F0
          F3FEE3E6FA4D5ADE3446D20004B7757CD6FFFFFF797DD50000A8103EFFB6C5FF
          FFFFFFC7D2FF032CFF0020FF1739FBF3F6FFE1E5FA071FDC0007CE0C1CCBD9DC
          F5FDFDFE313CC80000A8FF00FF8DA4FFFFFFFFFFFFFF8AA0FF0027FF002CFF46
          6AFF4163F8001DE9061CDFA1ACF1FFFFFFB4BAED0007BBFF00FFFF00FF718DFF
          DAE1FFFFFFFFFFFFFFB1C0FF3B5DFF1538FF1739FE4966F8C0CAFAFFFFFFEDEF
          FC3041D30007BBFF00FFFF00FFFF00FF88A0FFE6EBFFFFFFFFFFFFFFFDFDFFE2
          E9FFE4EBFFFFFFFFFFFFFFDBE0FA3D50E0000BCCFF00FFFF00FFFF00FFFF00FF
          FF00FF8AA1FFBAC7FEE8ECFFFFFFFFFFFFFFFFFFFFE4E9FE889BF61738E6000B
          CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8AA0FF8AA3FF90
          A6FF7993FE4A6BF91A40EFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton1: TSpeedButton
        Left = 33
        Top = 2
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Hint = 'Remove Serie'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF00007200007200006B000066000065000065FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0001B70001B7050DAC393EB058
          5AB25657AB2E2F9000006F000069000069FF00FFFF00FFFF00FFFF00FFFF00FF
          0016CE0915C66C74D9CED1F2FFFFFFFFFFFFFFFFFFFFFFFFC1C2DF5A5A9F0101
          6900007DFF00FFFF00FFFF00FF0018DF0A1DD3A8B0EDFFFFFFFFFFFFBDBEE98C
          8CD18D8DD0CACAEAFFFFFFFFFFFF8C8CBD010169000072FF00FFFF00FF0018DF
          919DEFFFFFFFE6E8F94F53CE0002AB161DBE1A1CB10000975F5FBEF0F0FAFFFF
          FF6565A6000072FF00FF001EF12743E7FBFBFFF7F8FD3B4BDA0000C0161DBE16
          19B40B0CA1090B9F00008F5252B9FFFFFFD9D9E90B0B7F00007A001EF17287F6
          FFFFFF91A1F4000DDA000BD0161DCB1D1EAE0C0DA00609A700009A000093ACAC
          DDFFFFFF5353AF00007A0023F8A8B8FCFFFFFF4060F61734ECF8F9FEF8F9FEF8
          F9FEF3F4FBF3F4FBF3F4FB0D0EA25A5BBFFFFFFF8487D60000790E3EFEC5CFFE
          FFFFFF3259FE2649F9C5CFFDFFFFFFFFFFFFFFFFFFFFFFFFEBECF91519B14A4F
          C1FFFFFF9094D90000A23C63FFC4D0FFFFFFFF5979FF052EFF123AFE122EEB0D
          24E20719D90F17D10004B70004B7757CD6FFFFFF797DD50000A8103EFFB6C5FF
          FFFFFFC7D2FF032CFF0020FF0829FE1630EB0119E20517D90A11D00C1CCBD9DC
          F5FDFDFE313CC80000A8FF00FF8DA4FFFFFFFFFFFFFF8AA0FF0027FF012CFF04
          24FF1C3EFB001DE9061CDFA1ACF1FFFFFFB4BAED0007BBFF00FFFF00FF718DFF
          DAE1FFFFFFFFFFFFFFB1C0FF3B5DFF1538FF1739FE4966F8C0CAFAFFFFFFEDEF
          FC3041D30007BBFF00FFFF00FFFF00FF88A0FFE6EBFFFFFFFFFFFFFFFDFDFFE2
          E9FFE4EBFFFFFFFFFFFFFFDBE0FA3D50E0000BCCFF00FFFF00FFFF00FFFF00FF
          FF00FF8AA1FFBAC7FEE8ECFFFFFFFFFFFFFFFFFFFFE4E9FE889BF61738E6000B
          CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8AA0FF8AA3FF90
          A6FF7993FE4A6BF91A40EFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 551
    Width = 778
    Height = 26
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      778
      26)
    object Button3: TButton
      Left = 626
      Top = 0
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 551
      Top = 0
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button19: TButton
      Left = 701
      Top = 0
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Apply'
      TabOrder = 2
      OnClick = Button19Click
    end
  end
end