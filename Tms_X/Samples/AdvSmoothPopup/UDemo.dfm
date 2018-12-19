object Form205: TForm205
  Left = 0
  Top = 0
  Caption = 'TMS Advanced Smooth Popup Demo'
  ClientHeight = 329
  ClientWidth = 708
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000000000000000000000000000000000000CCCCCCCCCCCCCCCC0000
    000000000000000000000000000000C000C000C0CCC000C000C000C0000C00C0
    00C0C0C0CCC000C000CC0CC0C000CCCCC0C000C00CCC00000000000000000000
    000000000000CCCCCCCCCCCCCCCC00000000000000000000000000000000FFFF
    0000FFFF0000FFFF000000000000FFFF0000FFFF0000DDD10000DDDE0000DD51
    0000DC97000005D80000FFFF0000FFFF000000000000FFFF0000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 60
    Height = 13
    Caption = 'Popup style:'
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 62
    Height = 13
    Caption = 'Popup Color:'
  end
  object Label3: TLabel
    Left = 8
    Top = 115
    Width = 83
    Height = 13
    Caption = 'Animation factor:'
  end
  object MonthCalendar1: TMonthCalendar
    Left = 344
    Top = 8
    Width = 337
    Height = 297
    Date = 41167.506558391200000000
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnChange = ComboBox1Change
    Items.Strings = (
      'Office 2003 Blue'
      'Office 2003 Silver'
      'Office 2003 Olive'
      'Office 2003 Classic'
      'Office 2007 Luna'
      'Office 2007 Silver'
      'Office 2007 Obsidian'
      'Office 2010 Blue'
      'Office 2010 Silver'
      'Office 2010 Black'
      'Windows XP'
      'Whidbey'
      'Windows Vista'
      'Windows 7'
      'Terminal'
      'Windows 8')
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 40
    Width = 217
    Height = 17
    Alignment = taLeftJustify
    BiDiMode = bdRightToLeftNoAlign
    Caption = 'Close on deactivate'
    Checked = True
    ParentBiDiMode = False
    State = cbChecked
    TabOrder = 2
    OnClick = CheckBox1Click
  end
  object Button2: TButton
    Left = 192
    Top = 70
    Width = 33
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 150
    Top = 189
    Width = 75
    Height = 26
    Caption = 'Popup'
    TabOrder = 4
    OnClick = Button3Click
  end
  object TrackBar1: TTrackBar
    Left = 112
    Top = 101
    Width = 113
    Height = 45
    Min = 1
    Position = 1
    TabOrder = 5
    OnChange = TrackBar1Change
  end
  object Button1: TButton
    Left = 150
    Top = 157
    Width = 75
    Height = 26
    Caption = 'Default Style'
    TabOrder = 6
    OnClick = Button1Click
  end
  object AdvSmoothPopup1: TAdvSmoothPopup
    FormStyle = fsStayOnTop
    ShadowIntensity = 0.900000000000000000
    Buttons = <>
    ButtonFont.Charset = DEFAULT_CHARSET
    ButtonFont.Color = clWhite
    ButtonFont.Height = -11
    ButtonFont.Name = 'Tahoma'
    ButtonFont.Style = []
    PictureContainer = GDIPPictureContainer1
    OnButtonClick = AdvSmoothPopup1ButtonClick
    HeaderCaption = 'Header'
    FooterCaption = 'Footer'
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWhite
    FooterFont.Height = -16
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = [fsBold]
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWhite
    HeaderFont.Height = -16
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = [fsBold]
    OnClose = AdvSmoothPopup1Close
    Left = 208
    Top = 200
  end
  object GDIPPictureContainer1: TGDIPPictureContainer
    Items = <
      item
        Picture.Data = {
          89504E470D0A1A0A0000000D494844520000000F0000000F08030000000C0865
          78000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          0300504C54450000006030306038307040307040407048408048408050408050
          50A07070A07870C04030C05040C05840D06050D06850D07050D07060D07870E0
          7860D08070E08870A08080B08880D08880E09080E09890F09890E0A090E0A8A0
          E0B8B0F0A8A0F0B8B0F0C8C0FFC8C0FFD0D0FFFFFF0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000054F05B00000010074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0053F7072500000009704859730000
          0EC300000EC301C76FA8640000001974455874536F667477617265005061696E
          742E4E45542076332E352E343E8DCC760000008949444154185745CFEB128220
          1086E10535A830F240A9816872FFB7481F340EEF0CBB3CC32F284A2984685275
          5D4792EFE37B76BC2A92BB2FED9CE4F6296D9C8437210463F2F4B01D065CF319
          2CBC68AD8110B017B8BF2330AD9ED32539BFFFDD8C4A010E47A9119E5A5CD776
          C56C2746CDFC28CDB0ED9E679D856FCE9EB92BA3885F55154F31C6E20FA96215
          5EB2E65E7B0000000049454E44AE426082}
        Name = '1'
        Tag = 0
      end
      item
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000010000000100803000000282D0F
          53000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          0300504C54450000003866B33967B4396FB4396FB5486FB44775B34970B54876
          B44977B54070C04078C04876C34977C45078C0567FC15080C05780C25880C250
          80D05088D0638CC1658DC2648CCD6088D06B91CA6B95CA6E97CA6090D06098D0
          7598CE759DCE789FCF7E9DCE7098D0779CD47098E078A0CF7EA1CD7FA1D670A0
          E0819FCE82A4CF80A3D781A3D880A0E080A8E090A8E090B0E0A0B8E0A0C0E0B0
          C8E0C0D0F0C0D8F0E0E8F0F0F0F0F0F8F0000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000543AE8D60000010074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0053F7072500000009704859730000
          0EC300000EC301C76FA8640000001974455874536F667477617265005061696E
          742E4E45542076332E352E343E8DCC76000000BF4944415428532D8FED520231
          0C454341815DC5401709902EB8940F05747565C9FBBF58690A99E94CCFB9F747
          0241673F7B1E4C77E90BF11D5F889D63FBF471171BAABCAFEB8A19172A4EE4FD
          9FC469A25945F15AF983C8A5BECA0F5337C031152ECC8D3444F90A66EC7DE598
          B9956F2A700C4397F82CF24B45610D0C5CCAAF9A5B8B06DE5999DB7F659BBFC1
          974D82B46F312B21F4138BC41C4726EEF1899AB7AD7256EAEA4B7CF447D9FC7E
          DCB697A3C53CEB948F6B43584F8C9928867003D42A470AB74027C50000000049
          454E44AE426082}
        Name = '2'
        Tag = 0
      end
      item
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000100000000E080300000011F16C
          B8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          0300504C54450000002030403030603040405048304040505058505058705060
          706068702048B04040804048905048904058B05050A05058A05058B06058B060
          60906070807078906068A04050C05058C05060C06060C06068C06068D07068C0
          7070C07078C07070D07078E07088D0903830B07060D078608078C08078D08078
          E0908040B09050B09850B0A050D08870E09070D0C060E0C870E0D07080808080
          88808080B09098A0A0A0A0A0A8B0B0A8B0B0B8B08088C08080D08088D09088D0
          9090C08080E08088F09088F09090F09098F0A098E0A098F0A098FFA0A8C0A0B0
          C0B0A8C0B0B8C0B0B8D0A0A0FFB0A8F0B0A8FFBEC4E7C0B890C0B8B0C0B8C0F0
          E090C0C0C0C0C0D0C0C8D0DCCECEDBDDDBD0E0F0E0D8D0E2DBDCE0E0E0E0E0F0
          E0E8F0F0F0F0F0F0FFF0F8FFFFF8FFFFFFFF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000069141A530000010074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0053F7072500000009704859730000
          0EC300000EC301C76FA8640000001974455874536F667477617265005061696E
          742E4E45542076332E352E343E8DCC76000000D549444154185763B0B5B1B1B6
          565793979393959596FEFF9FC1C6CF31190212258484C002F6C95E5E21212141
          F1E24C8240016B3F45B07C52421C9F063F584021D9C89CCDCC2C264E122CA006
          14484E364B0ED08952B216000AC8FBC900D5B3681906EB78B9880105E4FC5C65
          646CDC59B4F5833543EDC0023E3E4ECEBEA1609120A080AC9F8F13078788A925
          5824E23F83B48F93033B036B645C208BB681B74A3883949B833D3BB3686C9C87
          058BB1AE9E0A8394933D17A397576818A795A7B28AAA3283BFB4203F3F3F2F0F
          0FB7B08985B27234008E3C3E9623D0CC150000000049454E44AE426082}
        Name = '3'
        Tag = 0
      end
      item
        Picture.Data = {
          89504E470D0A1A0A0000000D494844520000000B0000000B08030000009E7287
          14000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          0300504C54450000005A7FAD88ABDB8BADDC90B0DD93B2DE94B3DE96B4DF97B6
          DF9DBAE1A2BDE2A5BFE3A9C2E4ACC4E5AFC7E7B1C8E8B5CBE9BACEE9BACEEABD
          D0EBBED1ECC2D3EBC1D4EDC6D6ECC6D7EEC9D9EDC9D9EFCBDAEECCDBEED0DEF1
          D3E0F2D8E3F3DBE6F4E0E8F4E5EDF7E7EEF6E7EEF8E8EFF8EAF0F7EAF0F9EFF3
          F8F2F5F9F3F6FAF6F8FBF4F8FCF9FAFCFFFFFF00000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000D5BFEA420000010074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0053F7072500000009704859730000
          0EC300000EC301C76FA8640000001974455874536F667477617265005061696E
          742E4E45542076332E352E343E8DCC760000006D494441541857358D890E8230
          0043CBC489A022430E0F1CA07820DBFFFF5D19A84D9A342F2F29C84F16AD42D5
          93E0C357FA5EA7A2218C5FDA299578E318BBE1B91E14223D636B9F4B04ED8F0F
          E2CB27A79338FFFD348191F9AC9F163DF85AEFAAF6BA9737F7455EB6C1A630E4
          08797619D9CD6720400000000049454E44AE426082}
        Name = '4'
        Tag = 0
      end>
    Version = '1.0.0.0'
    Left = 208
    Top = 248
  end
  object ColorDialog1: TColorDialog
    Left = 8
    Top = 96
  end
end
