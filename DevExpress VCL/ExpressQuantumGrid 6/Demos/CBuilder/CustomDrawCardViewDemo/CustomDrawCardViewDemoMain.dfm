object CustomDrawCardViewDemoMainForm: TCustomDrawCardViewDemoMainForm
  Left = 129
  Top = 16
  Width = 820
  Height = 691
  Caption = 'ExpressQuantumGrid CustomDrawCardView Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 812
    Height = 18
    Align = alTop
    AutoSize = False
    Caption = 
      'This demo shows some examples of custom draw. Click "About this ' +
      'demo" for more information.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Splitter: TSplitter
    Left = 241
    Top = 18
    Width = 2
    Height = 598
    Cursor = crHSplit
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 616
    Width = 812
    Height = 21
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object pnPersonLines: TPanel
    Left = 0
    Top = 18
    Width = 241
    Height = 598
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object pnPersonLinesCaption: TPanel
      Left = 0
      Top = 0
      Width = 241
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Occupation'
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cxgPersonLine: TcxGrid
      Left = 0
      Top = 33
      Width = 241
      Height = 565
      Align = alClient
      TabOrder = 1
      object tvPersonLine: TcxGridDBTableView
        DataController.DataSource = CustomDrawCardViewDemoMainDM.dsPERSONSLINE
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = CustomDrawCardViewDemoMainDM.GridTableViewStyleSheetDevExpress
        object tvPersonLineNAME: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
        end
      end
      object lvPersonLine: TcxGridLevel
        GridView = tvPersonLine
      end
    end
  end
  object pnPersons: TPanel
    Left = 243
    Top = 18
    Width = 569
    Height = 598
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object cxgPersons: TcxGrid
      Left = 0
      Top = 33
      Width = 569
      Height = 565
      Align = alClient
      TabOrder = 0
      object cvPersons: TcxGridDBCardView
        DataController.DataSource = CustomDrawCardViewDemoMainDM.dsPresons
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cvPersonsCustomDrawCell
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsView.CardBorderWidth = 1
        Styles.ContentEven = CustomDrawCardViewDemoMainDM.stDefault
        Styles.ContentOdd = CustomDrawCardViewDemoMainDM.stDefault
        object cvPersonsFIRSTNAME: TcxGridDBCardViewRow
          Caption = 'Firstname'
          DataBinding.FieldName = 'FIRSTNAME'
        end
        object cvPersonsSECONDNAME: TcxGridDBCardViewRow
          Caption = 'Secondname'
          DataBinding.FieldName = 'SECONDNAME'
        end
        object cvPersonsGENDER: TcxGridDBCardViewRow
          Caption = 'Gender'
          DataBinding.FieldName = 'GENDER'
        end
        object cvPersonsBIRTHNAME: TcxGridDBCardViewRow
          Caption = 'Birth Name'
          DataBinding.FieldName = 'BIRTHNAME'
        end
        object cvPersonsDATEOFBIRTH: TcxGridDBCardViewRow
          Caption = 'Date of birth'
          DataBinding.FieldName = 'DATEOFBIRTH'
        end
        object cvPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow
          Caption = 'Location of Birth'
          DataBinding.FieldName = 'LOCATIONOFBIRTH'
        end
        object cvPersonsBIRTHCOUNTRY: TcxGridDBCardViewRow
          Caption = 'Birth Country'
          DataBinding.FieldName = 'BIRTHCOUNTRY'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = CustomDrawCardViewDemoMainDM.dsCountries
        end
        object cvPersonsBIOGRAPHY: TcxGridDBCardViewRow
          Caption = 'Biography'
          DataBinding.FieldName = 'BIOGRAPHY'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
        end
        object cvPersonsNICKNAME: TcxGridDBCardViewRow
          Caption = 'Nickname'
          DataBinding.FieldName = 'NICKNAME'
        end
      end
      object lvPersons: TcxGridLevel
        GridView = cvPersons
      end
    end
    object pnPersonsCaption: TPanel
      Left = 0
      Top = 0
      Width = 569
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Persons'
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object mmMain: TMainMenu
    Left = 488
    Top = 32
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = '&Options'
      object miFont: TMenuItem
        Caption = '&Font...'
        OnClick = miFontClick
      end
      object miSeparator4: TMenuItem
        Caption = '-'
      end
      object miCustomDrawStyles: TMenuItem
        Caption = '&Custom Draw Styles'
        object miBackgroudImage: TMenuItem
          Caption = '&Background Image'
          Checked = True
          GroupIndex = 4
          RadioItem = True
          object miTile: TMenuItem
            Caption = '&Tile'
            Checked = True
            RadioItem = True
            OnClick = miTileClick
          end
          object miSky: TMenuItem
            Caption = '&Sky'
            RadioItem = True
            OnClick = miSkyClick
          end
          object miEgypt: TMenuItem
            Caption = '&Egypt'
            RadioItem = True
            OnClick = miEgyptClick
          end
          object miMyFace: TMenuItem
            Caption = 'My &Face'
            RadioItem = True
            OnClick = miMyFaceClick
          end
          object miCar: TMenuItem
            Caption = '&Car'
            RadioItem = True
            OnClick = miCarClick
          end
          object miLoadImage: TMenuItem
            Caption = '&Load Image...'
            RadioItem = True
            OnClick = miLoadImageClick
          end
        end
        object miGradient: TMenuItem
          Caption = '&Gradient Drawing'
          GroupIndex = 4
          RadioItem = True
          object miGrey: TMenuItem
            Caption = 'G&rey'
            GroupIndex = 1
            RadioItem = True
            OnClick = miGreyClick
          end
          object miGreen: TMenuItem
            Caption = '&Green'
            GroupIndex = 1
            RadioItem = True
            OnClick = miGreenClick
          end
          object miGold: TMenuItem
            Caption = 'Go&ld'
            GroupIndex = 1
            RadioItem = True
            OnClick = miGoldClick
          end
          object miBlue: TMenuItem
            Caption = '&Blue'
            GroupIndex = 1
            RadioItem = True
            OnClick = miBlueClick
          end
        end
        object miDependOnDataDrawing: TMenuItem
          Caption = 'D&epends on the data'
          GroupIndex = 4
          RadioItem = True
          OnClick = miDependOnDataDrawingClick
        end
        object miDefaultDrawing: TMenuItem
          Caption = '&Default Drawing'
          GroupIndex = 4
          RadioItem = True
          OnClick = miDefaultDrawingClick
        end
      end
      object miSeparator1: TMenuItem
        Caption = '-'
      end
      object miLookAndFeel: TMenuItem
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = '&Kind'
          object miFlat: TMenuItem
            Caption = '&Flat'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miStandard: TMenuItem
            Caption = '&Standard'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miUltraFlat: TMenuItem
            Caption = '&Ultra Flat'
            Checked = True
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miOffice11: TMenuItem
            Tag = 3
            Caption = '&Office11'
            Hint = 
              'Setting this option changes the grid view appearance to Office11' +
              ' style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
        end
        object miNativeStyle: TMenuItem
          Caption = '&Native Style'
          Checked = True
          OnClick = miNativeStyleClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      OnClick = miAboutClick
    end
  end
  object ilPics: TImageList
    Left = 392
    Top = 32
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000100000000100180000000000000C
      0000000000000000000000000000000000000000001710FE1710FE1710FE1710
      FE334AA8334AA8334AA8334AA81710FE1710FE1710FE6C6C6D00000000000000
      00000000005F79E75F79E75F79E75F79E75F79E75F79E782A9D481A7D15D77E2
      5E77E3576ECE5E77E35F79E75F79E77381C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000262B6A1710FE1710FE1710
      FE4A8CB15EB6E85EB6E85EB6E81710FE1710FE7B7B7C00000000000000000000
      00005F79E75B73DA5B73DA5B73D95971D55D76E05A72D797C8FD97C8FD6E8DDD
      5F79E75C74DC5E78E55F79E76379D30000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000F0F0F07B7B8B1511951511
      CE4A8CB15EB6E85EB6E85AABDA151195262B6A00000000000000000000000000
      00005F79E75C75DE5970D35F79E75F79E76883BE85AFED97C8FD97C8FD84ACE2
      5F79E75B73D95A71D1919BC4E6E6E60000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00345A7142799A37667E37667EE1E1E200000000000000000000000000000000
      00005F79E75F79E7576ECE5F79E76A88E78BB6E58EBBEB91BFF197C8FD97C8FD
      5F77BF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000F0F0F04952
      555197C137667E2E46725197C137667E152D34467D836C6C6D89898AA8A8A900
      00008792C35A71D15971D55F79E780A7E68BB6E58BB6E58FBCED95C5F997C8FD
      7184AE0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000002F4F655EB6
      E85EB6E837667E27338837667E5EB6E85EB6E800FFFF00FFFF00FFFF00FFFF00
      00000000000000000000005F79E76C8ADF84ACD78AB4E396C6FA94C4F796C7FC
      93BCE80000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007B7B7C467D8337667E5EB6
      E85EB6E855A2CE24354D4A8CB15EB6E85EB6E800E0F000FFFF00FFFF00FFFF00
      0000000000000000000000B8BCCA9FA9C389B3E18DB8E88AB5E3A1C5EB90BEEF
      91BFF10000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF00FFFF2E88A35EB6
      E85EB6E85EB6E8F0F0F042799A5EB6E85EB6E85EB6E82F4F6500D2E100FFFFC4
      C4C40000000000000000000000000000008BB6E58FBCED8EBBEB89B2E094C4F7
      92C0F38AB5E3C5CFD90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF00FFFF04B3C35EB6
      E85EB6E85EB6E85EB6E85EB6E85EB6E85EB6E85EB6E824354D04B3C300FFFFC4
      C4C4000000000000000000000000E9F1FA8BB6E58EBBEB95C5F986AFDC93C1F4
      96C7FC91BFF1809EC10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000011818900FFFF2E88A33766
      7E5EB6E85EB6E85AABDA5EB6E824354D181D235AABDA5EB6E800FFFF00FFFFE1
      E1E2000000000000000000000000B6CAE18BB6E590BEF09FB4CC7798BD818182
      74747660758E47515C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000006C6C6D00F1FF259EB8181D
      235EB6E855A2CE152D342B465742799A5AABDA55A2CE5EB6E800FFFF00FFFF00
      0000000000000000000000000000A1BCDC86AEDA7494B76063675F748C495460
      3B3E4385ACD83535370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000089898A00FFFF00FF
      FF5EB6E85EB6E85EB6E85EB6E85EB6E85197C15EB6E855A2CE00FFFF00939C00
      00000000000000000000000000000000005B6D838BB6E58BB6E593C1F497C8FD
      97C8FD85ACD83535370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F0F0F000FFFF00FF
      FF3C98BB5EB6E83B738A345A715EB6E85EB6E85AABDA1294A600FFFF5A646800
      0000000000000000000000000000D9D9D94B55638BB6E58BB6E591BFF197C8FD
      97C8FD667F9A3535370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A8A8A90093
      9C00FFFF00FFFF2E88A34A8CB13A8DAD259EB800FFFF00FFFFD3D3D300000000
      0000000000000000000000000000F2F2F23A3D4286AEDA454D58353537353537
      3535373535373535370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D3D3
      D300FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00E0F00F707B00000000000000
      000000000000000000000000000000000035353740454D353537353537353537
      3535373535374E4E500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000097979889898AE1E1E200000000000000000000000000000000
      0000000000000000000000000000000000000000B3B3B4686869686869B3B3B4
      D9D9D90000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF008007800000000000800F000100000000
      801F000100000000F83F001F00000000E001001F00000000E001E01F00000000
      8001E01F000000008000F807000000008000F007000000008000F00700000000
      8001F00700000000C001F80700000000C001F00700000000E003F00700000000
      F007F80700000000FE3FFC1F0000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    Filter = 'BMP Windows Bitmap|*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 360
    Top = 32
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 328
    Top = 32
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 291
    Top = 34
  end
end
