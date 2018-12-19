object FormMain: TFormMain
  Left = 571
  Top = 240
  Width = 615
  Height = 624
  ActiveControl = ListViewDataFormats
  Caption = 'Drop Source Analyzer'
  Color = clBtnFace
  Constraints.MinWidth = 565
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 245
    Width = 607
    Height = 3
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    MinSize = 1
    ResizeStyle = rsUpdate
  end
  object Panel2: TPanel
    Left = 0
    Top = 248
    Width = 607
    Height = 330
    Align = alClient
    BevelOuter = bvNone
    Caption = ' '
    Constraints.MinHeight = 100
    TabOrder = 0
    object EditHexView: TRichEdit
      Left = 0
      Top = 65
      Width = 607
      Height = 265
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Pitch = fpFixed
      Font.Style = []
      ParentColor = True
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      Visible = False
      WantReturns = False
      WordWrap = False
    end
    object IntroView: TRichEdit
      Left = 0
      Top = 65
      Width = 607
      Height = 265
      Align = alClient
      ParentColor = True
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
      WantReturns = False
      WordWrap = False
    end
    object PanelError: TPanel
      Left = 0
      Top = 0
      Width = 607
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 2
      Visible = False
      object PanelErrorInner: TPanel
        Left = 4
        Top = 4
        Width = 599
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 2
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Panel3: TPanel
          Left = 41
          Top = 2
          Width = 554
          Height = 51
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 4
          Color = clWindow
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 4
            Width = 546
            Height = 13
            Align = alTop
            Caption = 'Error'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LabelError: TLabel
            Left = 4
            Top = 17
            Width = 546
            Height = 30
            Align = alClient
            Caption = 'Blah blah'
            ShowAccelChar = False
            WordWrap = True
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 2
          Width = 39
          Height = 51
          Align = alLeft
          BevelOuter = bvNone
          BorderWidth = 4
          Color = clWindow
          TabOrder = 1
          object Image1: TImage
            Left = 4
            Top = 4
            Width = 31
            Height = 43
            Align = alClient
            AutoSize = True
            Picture.Data = {
              07544269746D6170F6060000424DF60600000000000036000000280000001800
              0000180000000100180000000000C0060000120B0000120B0000000000000000
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000082000082
              00018600058E00058E000186000082000082FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008200
              058E010F9F021BAF021DB1021DB1021DB1021DB1021BAF010F9F00058E000082
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
              820002880114A5021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB102
              1DB1021DB10114A5000288000082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF000082000691021BB5021DB5021DB1021DB1021DB1021DB1021DB1021D
              B1021DB1021DB1021DB1021DB1021DB1021BAF000691000082FF00FFFF00FFFF
              00FFFF00FFFF00FF000082000692021EC2021EC1021DBB021DB6021DB1021DB1
              021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB10006
              91000082FF00FFFF00FFFF00FFFF00FF000288011CCB011ECF021EC9021EC202
              1DBC021DB7021DB2021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB1
              021DB1021DB1021BAF000288FF00FFFF00FFFF00FF0000820115BD011FDC011E
              D5011ED0001BC90726C72F4DCF011BB7011CB2021DB1021DB1021CB10018AF27
              44C20F2DB80018AF021DB1021DB1021DB10114A5000082FF00FFFF00FF000593
              011FE6011FE3011FDD011ED80723D39FB0EFFEFEFF657DDD0016B7011BB4021C
              B10014AC4460CBF7F8FCC0CAEF112DB8021DB1021DB1021DB1021DB100058EFF
              00FF0000820111BC011FF2011FEB011FE5011FDE1131DDEAEEFCFFFFFFFFFFFF
              647DDE0016B80013B1445FCBF7F8FEFFFFFFFFFFFF2C49C4021DB1021DB1021D
              B1021DB1010F9F000082000082011CE2011FF8011FF3011FED011FE60019DE29
              49E3E5E9FBFFFFFFFFFFFF5670DA3E5AD1F7F8FEFFFFFFFBFBFE4C67CE0018AF
              021DB1021DB1021DB1021DB1021BAF0000820001870221EF0323FA0121FA011F
              F4011FEE011FE70016DE2848E3E3E9FCFFFFFFFCFCFFFBFBFFFFFFFFFAFAFE4C
              67CF0015AC011CB1021DB1021DB1021DB1021DB1021DB10001860005970729FA
              0F31FA0425FA011FFA011FF6011FEF011FE90015E02243E5E2E7FCFFFFFFFFFF
              FFF6F7FE4462D50013B5021CB2021DB1021DB1021DB1021DB1021DB1021DB100
              058E0005981135FA2D4FFB1033FA011FFA011FFA011FF7011EF20016EA3857ED
              E6EBFCFFFFFFFFFFFFF6F7FE5672DD0017BF011CBB021DB5021DB1021DB1021D
              B1021DB1021DB100058E0001881638F64C6BFC274AFB0222FA011FFA001FFA00
              17F84262F7F7F8FFFFFFFFF0F3FEE9EDFCFFFFFFFFFFFF647EE10017C0011CBC
              021DB6021DB2021DB1021DB1021DB1000186000082102FEF5C79FC506EFC0C2D
              FA011FFA001CFA4263FCF7F8FFFFFFFFFBFBFF3F5DEF2342E7E5E9FCFFFFFFFF
              FFFF657EE2021CC4021DBD021DB8021DB2021DB1021BAF000082000082071ACB
              506EFC8299FC2D50FB0323FA1133FAF8FAFFFFFFFFFBFBFF4968FA0017EE0015
              E62848E9E5E9FCFFFFFFFFFFFF2C4BD7021EC5021EBF021DBA021DB4010F9F00
              0082FF00FF01079E2D4FFB92A6FE768FFC1A3EFB031FFA7991FCEDF0FF4A69FC
              0017FA001FF7011FF00016E72849EADEE5FB96A7F20723D4021ECC021EC6021E
              C1021DBA00058EFF00FFFF00FF0000820D26DD5F7BFCADBDFE6F8AFC173AFB02
              21FA1438FB001CFA001FFA011FFA011FF8011FF30019EB0F31E90323E0001CD9
              011ED4011ECE021EC70114AD000082FF00FFFF00FFFF00FF0003911B3CF47992
              FCBFCBFE7F97FC2D4FFB0A2DFA0221FA011FFA011FFA011FFA011FF8011FF401
              1FEE011FE7011FE1011FDC011ED5011CC6000288FF00FFFF00FFFF00FFFF00FF
              000082020AA72346FB7D95FCC1CCFEA3B4FE5F7BFC2D4FFB1538FB0A2DFA0628
              FA0628FA092BFA0D2FF70C2DF00524EA011FE2011ED5000693000082FF00FFFF
              00FFFF00FFFF00FFFF00FF000082020AA71C3EF46984FCAFBDFEBFCBFEA5B6FE
              8198FC647FFC516FFC4A69FC4565FB3658FB1A3EF80626F0011CDE0006960000
              82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000820003920F28DE36
              58FB6782FC8AA0FE99ACFE93A7FE8299FC6984FC4767FC2245FB0A2CF70116CE
              00028B000082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FF0000820208A00A1ECF1839F42346FA284BFB2346FB173AF60A29EB03
              14C5000598000082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008200008200018900059D0005
              9C000189000082000082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FF}
            Transparent = True
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 578
    Width = 607
    Height = 19
    AutoHint = True
    Panels = <>
    ParentFont = True
    SimplePanel = True
    UseSystemFont = False
  end
  object ListViewDataFormats: TListView
    Left = 0
    Top = 48
    Width = 607
    Height = 197
    Align = alTop
    Columns = <
      item
        Caption = 'ID'
      end
      item
        AutoSize = True
        Caption = 'Name'
        MinWidth = 50
      end
      item
        Caption = 'Aspect'
        Width = 75
      end
      item
        Caption = 'Medium'
        MinWidth = 50
        Width = 100
      end
      item
        Alignment = taRightJustify
        Caption = 'Size'
      end>
    ColumnClick = False
    Constraints.MinHeight = 100
    Constraints.MinWidth = 100
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    SmallImages = ImageList2
    SortType = stText
    TabOrder = 2
    ViewStyle = vsReport
    OnAdvancedCustomDrawSubItem = ListViewDataFormatsAdvancedCustomDrawSubItem
    OnDeletion = ListViewDataFormatsDeletion
    OnSelectItem = ListViewDataFormatsSelectItem
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 607
    Height = 48
    AutoSize = True
    ButtonWidth = 127
    Caption = 'ToolBar1'
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 3
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActionClear
      AutoSize = True
    end
    object ToolButton2: TToolButton
      Left = 56
      Top = 2
      Action = ActionPaste
      AutoSize = True
    end
    object ToolButton3: TToolButton
      Left = 187
      Top = 2
      Action = ActionSave
      AutoSize = True
      Wrap = True
    end
    object ToolButton4: TToolButton
      Left = 0
      Top = 24
      Action = ActionPrefetch
      AutoSize = True
      Style = tbsCheck
    end
    object ButtonDirection: TToolButton
      Left = 97
      Top = 24
      Action = ActionDir
      AutoSize = True
      DropdownMenu = PopupMenuDirection
      Style = tbsDropDown
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 32
    Top = 80
    object ActionClear: TAction
      Caption = 'Clear'
      Hint = 
        'Clear|Clear the format list and content pane and release all ref' +
        'erences to the drop source'#39's data object'
      ImageIndex = 1
      OnExecute = ActionClearExecute
    end
    object ActionPaste: TAction
      Caption = 'Paste from Clipboard'
      Hint = 'Paste|Read the content of the clipboard'#39's data object'
      ImageIndex = 0
      OnExecute = ActionPasteExecute
      OnUpdate = ActionPasteUpdate
    end
    object ActionSave: TAction
      Caption = 'Save list...'
      Hint = 'Save|Save the data format list to a text file'
      ImageIndex = 2
      OnExecute = ActionSaveExecute
      OnUpdate = ActionSaveUpdate
    end
    object ActionDirTarget: TAction
      Category = 'Direction'
      Caption = 'To target'
      Checked = True
      Hint = 
        'Drop source to Drop target|List the data formats that can be rea' +
        'd from the drop source'
      ImageIndex = 3
      OnExecute = ActionDirTargetExecute
    end
    object ActionDirSource: TAction
      Category = 'Direction'
      Caption = 'To source'
      Hint = 
        'Drop target to Drop source|List the data formats that can be wri' +
        'tten to the drop source'
      ImageIndex = 4
      OnExecute = ActionDirSourceExecute
    end
    object ActionDir: TAction
      Category = 'Direction'
      Caption = 'Data direction'
      Hint = 
        'Direction|List data formats that can be read from the drop sourc' +
        'e or written to the drop source'
      ImageIndex = 3
      OnExecute = ActionDirExecute
    end
    object ActionPrefetch: TAction
      Caption = 'Prefetch data'
      Hint = 
        'Prefetch|When selected, prefetches data from the drop source whe' +
        'n the drop occurs. Otherwise fetches data on-demand'
      ImageIndex = 5
      OnExecute = ActionPrefetchExecute
    end
  end
  object ImageList1: TImageList
    Left = 32
    Top = 136
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033140000451B00005722000057220000471C0000361600000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000043E9000043E9000043E9000043E9000043E9000043E90000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000491C
      0000491C000080320000A5410000AA420000AA420000A741000084340000511F
      0000511F0000000000000000000000000000000000000000000000000000034B
      B500034BB5000C5DCF004586CF006392C7005E8CBF003D73B40008479F00003A
      9900043E90000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000592300006E2B
      0000AF440000B1450000AA420000A5410000AA420000AA420000AF440000B145
      0000702C00003616000000000000000000000000000000000000034BB500045B
      DE0077B1F000F6F4F600D9E6F000B7D3F000B5D0EE00CFDAE600DED9D5005580
      B0000241A400043E900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000592300007B300000C54D
      0000B8480000AA420000A5410000A5410000A7410000A7410000A7410000AA42
      0000B1450000702C0000511F00000000000000000000034BB400035BDE009ECA
      F800FFFFFF00589EEF001169E500025CE200025CE3001169E5005CA0EF00F8F4
      EF00809EBC000142A500043E9000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000059230000D4530000CC50
      0000BB490000AA420000C67F4200F8EFE700F3E3D400B2551000A7410000A741
      0000AA420000B1450000511F00000000000000000000034BB5007AB5F600FEFE
      FF00297FE900004BDE00116BE5003B8AEB003587EA00045EE200004BE0003688
      ED00F8FAF6005B89BC00043E9000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F250000A03F0000EB5C0000CC50
      0000B1450000C67A3A00FCF8F400FFFFFF00DAAA7E00AA460300A7410000A741
      0000A7410000AF44000084340000451B00000F6ADE001169DE00F8FBFF005A9F
      EF00004DE0003688EA00E7F2FC00C1DDFA00D9EAFC00CCE3FB00166EE6000053
      E00064A6F200EEEAE700094FAF00043E90000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F250000D7540000EB5C0000D453
      0000CA7A3800FCF7F300FEFEFC00D7A06F00A7410000A7410000A7410000A741
      0000A7410000AC4300009E3E0000451B00000F6ADE005EA5F200E9F3FC001674
      E7000F6EE700DCEDFC00509CEE000050E0000057E1009EC9F600A4CCF7000054
      E0000F6AE500E3EEF7004787D100043E90000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000772E0000F6600000F8620000FB9E
      4F00FEF6EE00FFFFFF00FEFAF600F7CFAA00F6CCA600E7C9AB00E7C9AB00E7C9
      AC00E9CBAF00AA420000AA4200004F1F00000F6ADE0082BCF600C9E3FB001176
      EA00318BEE00EEF6FE000A6AE600FFFFFF000056E1001870E5007AB4F2000055
      E100035CE200C4DDF80070A9E600043E90000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000089350000FF781300FF6A0400FED1
      A700FFFFFF00FFFFFF00FFFEFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AC430000AA420000572200000F6ADE0089C4F700CBE6FC001A82
      EE002A8CEF00E2F0FE003990EE00FFFFFF00FFFFFF001872E6000051E0000055
      E100035CE200C5DEFA0076B2F400043E90000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000089350000FF882900FF801E00F26C
      0B00FEC28C00FFFFFF00FFFBF800FBAB6600E2792500D77D3100D57B3100D47B
      3200D47A3100B8480000A54100004B1D00000F6ADE0077BCF800EBF4FE003298
      F2001582EF0088C5F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00599FEE000052
      E000106AE500E7F2FE00529EF400043E90000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000089350000FF801E00FFAD6700FF64
      0000EE5E0000FEB77900FFFFFF00FFEDDA00EF863000D4530000CF510000CF51
      0000C54D0000BB490000953A00004B1D00000F6ADE003599F300FBFEFF007FC5
      FA001F90F300208CF20075BBF700FFFFFF00FFFFFF009FCBF6001872E600004F
      E00066A7EF00F8FCFF000D67E200043E90000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E65A0000FFC69300FF98
      4200E1580000EB5D0000FEB27000FFFFFF00FFF8F200E26B1100CF510000CA4F
      0000C04B0000C74E0000752D000000000000000000000F6ADE00A4DCFC00FEFE
      FF005EB8F8002092F4001C89F000FFFFFF00459AEF000160E5000050E0003584
      EA00FCFEFF0073B0F400034BB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E65A0000FF892B00FFDA
      B700FF974100F8620000E95E0100FCB87A00FEC79500E5620500D9550000D453
      0000D7540000B4460000752D000000000000000000000F6ADE0041AFFC00C5ED
      FF00FFFFFF0081C7FA00369CF4001E87EF00137AEA001878E9005EA3F000FFFF
      FF009ECAF800035BDE00034BB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C54D0000FF98
      4200FFE2C600FFBB7F00FF872800FF750F00FF6B0500FF6E0800FF6E0800FF67
      0100CA4F0000702C0000000000000000000000000000000000000F6ADE0045B4
      FE00A7DEFF00FFFFFF00E9F6FE00CCE7FB00CAE5FB00E6F2FC00FFFFFF0070AF
      F400045BDE00034BB50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF80
      1E00FF801E00FFBA7D00FFD5AD00FFC59100FFB57400FFA55800FF832300D754
      0000D75400000000000000000000000000000000000000000000000000000F6A
      DE000F6ADE003AA0F60076BFFA008EC7F80087C0F6005CA5F2000F6AE000034B
      B500034BB5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1580000FF700A00FF7D1900FF781300FB630000B64700000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000F6ADE000F6ADE000F6ADE000F6ADE000F6ADE000F6ADE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B8200004B
      8200004B82008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D590073424100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B96732C5C28357FFD38A67FFE18E6FFFDC8C6BFFDA8A
      6CFFD7896DFFCD8A6BFFAA6C43FFA55E2DFF0000000000000000000000000000
      00000000000033140000451B00005722000057220000471C0000361600000000
      00000000000000000000000000000000000000000000004B820025ACDA0020A7
      D8001CA3D500A4676900FBE7D300F8EEDC00F6EDD700F4E9D300F4E9D000F4E7
      D000F4E6CF00F6E7CE007342410000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B70000000000BA69336BB9642FBCBA6530EDB965
      2FFFB9652FF7B9642FF7C58254FFEFCEB9FFDDFFFFFF86EEC7FFA1F4D7FFA1F6
      D7FF8BEEC7FFE0FFFFFFDDA184FFAA693DFF000000000000000000000000491C
      0000491C000080320000A5410000AA420000AA420000A741000084340000511F
      0000511F000000000000000000000000000000000000004B82002DB4DE0028AF
      DC0022AAD900A4676900F3DCCF00DC924100DC913F00DA913F00DA913F00DA90
      3E00DA913F00EBDAC2007342410000000000000000000005B7000005B7000005
      B700000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000000000000000000BB6832DEF8F1EAF2F7ECDFFDF6EA
      DEFFF6EADCFFF6EADCFFC27E50FFEFB599FFEAF3E8FF50BE83FF6EC997FF70C9
      98FF53BE83FFE4F4E9FFDD9B7AFFA96839FF0000000000000000592300006E2B
      0000AF440000B1450000AA420000A5410000AA420000AA420000AF440000B145
      0000702C000036160000000000000000000000000000004B820034BAE2002EB4
      E00029AFDD00A66A6A00F6E1D500F7DCC000F7D0AB00F7D0AB00F7D0AB00F6CE
      A500F2D3B100EBDCC5007342410000000000000000000005B7000005B6000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B700000000000000000000000000BE7037F5F5EBDFFEFDBE67FFFBBD
      64FFFCBD63FFFCBD63FFC38053FFEAB596FFF3F3EAFFEDF1E6FFEFF1E6FFEFF0
      E6FFEDF1E5FFF3F5EDFFD59B78FFAF6F43FF00000000592300007B300000C54D
      0000B8480000AA420000A5410000A5410000A7410000A7410000A7410000AA42
      0000B1450000702C0000511F00000000000000000000004B82003CBFE70036BA
      E30031B5E100AA6D6B00F7E5DC00DC924100DC913E00DC913E00DC913E00DC90
      3D00DA913F00EEDECA00734241000000000000000000000000000006D7000005
      BA000005B7000005B700000000000000000000000000000000000005B7000005
      B70000000000000000000000000000000000C0773BF7F7EDE3FFFDC16DFFFFD7
      9DFFFFD69AFFFFD797FFC98A60FFE6B491FFE2A680FFE1A680FFDEA27CFFDCA0
      7AFFDB9E78FFD99D76FFD49972FFBA7D56FF0000000059230000D4530000CC50
      0000BB490000AA420000B2551000F3E3D400F8EFE700C67F4200A7410000A741
      0000AA420000B1450000511F00000000000000000000004B820043C5EB003EC1
      E70038BCE500AF726B00F8EAE200F8E7D400F8DDC200F7DDC100F7DABF00F6D8
      BB00F2DCC200EFE1D00073424100000000000000000000000000000000000000
      00000005B7000005B7000005B600000000000005B6000005B7000005B7000000
      000000000000000000000000000000000000C37B3FF7F7F0E6FFF8B354FFF7B4
      53FFF8B352FFF8B152FFCA8C64FFEAB798FFDDA47DFFDDA57FFFDBA27BFFD99F
      79FFD99F78FFD89E77FFD89D77FFBE835CFF5F250000A03F0000EB5C0000CC50
      0000B1450000AC430000AA460300DAAA7E00FFFFFF00FCF8F400C4793A00A741
      0000A7410000AF44000084340000451B000000000000004B82004BCBEF0045C7
      ED0040C2E900B4776C00FBF0EB00DD934100DD903D00DD903D00DC903D00DC90
      3C00DC914000F4E9DA0073424100000000000000000000000000000000000000
      0000000000000005B6000006C7000006C7000006CE000005B400000000000000
      000000000000000000000000000000000000C48144FFF8F2EBFFFEE7D6FFFDE7
      D6FFFDE7D6FFFDE6D5FFC8875CFFEFBEA0FFFDFCFAFFFEFCFBFFFEFDFDFFFEFD
      FCFFFDFBFAFFFDFCFBFFDDA784FFC07E52FF5F250000D7540000EB5C0000D453
      0000B1450000AA420000AC430000AA420000D5A06F00FEFEFC00FCF7F300C277
      3800A7410000AC4300009E3E0000451B000000000000004B820052D0F3004CCC
      EF0047C7EE00B87B6E00FEF4F000FEF4EB00FAEBDD00FAEADA00F8E7D700F8E9
      D800F7EBDD00E1DAD30073424100000000000000000000000000000000000000
      000000000000000000000006C1000005C1000006DA0000000000000000000000
      000000000000000000000000000000000000C58346F7F9F3ECFFFEE8D6FFFDE7
      D6FFFDE7D6FFFDE7D5FFC7855AFFEFBF9DFFFFFFFFFFCC926DFFFFFFFFFFFFFF
      FFFFFFFBF7FFFFF8F1FFE4AE8BFFC78960FF772E0000F6600000F8620000FED5
      AF00F8D1AC00F4CFAB00F8D0AB00F7CEA600F6CFAA00FCF8F600FFFFFF00FAF4
      EE00CB894F00AA420000AA4200004F1F000000000000004B820059D5F60054D1
      F3004FCFF000BD816F00FEF6F200FFFFFF00FEFFFE00FBF8F700FAFAF700A067
      5B00A0675B00A0675B00A0675B00000000000000000000000000000000000000
      0000000000000005B6000006D7000006CE000006DA000006E900000000000000
      000000000000000000000000000000000000C58748F7F9F4EDFFFEE8D8FFFEE8
      D7FFFEE7D6FFFDE5D3FFCC8C64FFF3CDAFFFFFFFFFFFE3C7B2FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEABEA0FFC9885FFF89350000FF781300FF6A0400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00FFFFFF00FFFF
      FF00E6C6A700AC430000AA4200005722000000000000004B82005FDAF8005BD8
      F60055D3F300C2846F00FFF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00A067
      5B00D7925500F47A4100FF00FE00000000000000000000000000000000000000
      00000006E5000006DA000006D30000000000000000000006E5000006EF000000
      000000000000000000000000000000000000C58749F7F9F4EFFFFEE7D7FFFDE7
      D5FFFDE6D4FFFCE6D2FFD4966DFFD49D7AFFD09770FFD6A381FFCD8D67FFCD8F
      68FFD09974FFD19872FFC88A61FFAC591F3689350000FF882900FF801E00F489
      3100FC8C3200FC8C3100FC8C3100F8822500EDA56600FEFBF800FFFFFF00E9B8
      8C00C75A0B00B8480000A54100004B1D000000000000004B820065DEFB0060DC
      F8005CD8F700C5887000D1926D00D1926D00D1926D00D1926D00D1926D00A067
      5B00B79A6F00004B820000000000000000000000000000000000000000000006
      F8000006DA000006EF00000000000000000000000000000000000006F8000006
      F60000000000000000000000000000000000C5884AF7F9F4F0FFFCE6D3FFFDE7
      D3FFFCE4D1FFFBE3CDFFFAE0C8FFF8DCC1FFF5D6BAFFF3D4B4FFF1D2B2FFF8F4
      F0FFC38145F7FFFFFF00FFFFFF00FFFFFF0089350000FF801E00FFAD6700FF64
      0000EE5D0000FB630000FB630000FC8B3000FCEBDA00FFFFFF00EAAF7900CF52
      0000C54D0000BB490000953A00004B1D000000000000004B820069E1FE0066DE
      FB0063DDFB0063DDFB005DD9F80057D5F60050CFF20049C9EE0042C2EA003CBF
      E70038BBE500004B8200000000000000000000000000000000000006F6000006
      F6000006F8000000000000000000000000000000000000000000000000000006
      F6000006F600000000000000000000000000C5884AF7F9F5F1FFFCE3CFFFFCE4
      CFFFFCE3CDFFFAE1CAFFF9DDC3FFF6D9BBFFF4E9DFFFF7F2ECFFFBF7F3FFF5EF
      E9FFC17D44FBFFFFFF00FFFFFF00FFFFFF0000000000E65A0000FFC69300FF98
      4200E1580000EB5C0000FB751100FFF8F200FFFFFF00F0AC7000CF520000CA4F
      0000C04B0000C74E0000752D00000000000000000000004B82006AE2FE006AE2
      FE005858580058585800585858005858580058585800585858005858580045C7
      EB0040C1E900004B82000000000000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000006F6000000000000000000C5884BF6F9F5F1FFFCE3CDFFFBE3
      CDFFFBE2CBFFF9E0C8FFF8DCC1FFF5D6B9FFFDFBF8FFFCE6CDFFFAE5C9FFE2B5
      83FFBE7841A6FFFFFF00FFFFFF00FFFFFF0000000000E65A0000FF892B00FFDA
      B700FF974100F8620000EA640500FCC69500FEB87A00E35C0100D9550000D453
      0000D7540000B4460000752D00000000000000000000004B82006AE2FE006AE2
      FE0058585800C1B0AA00C1B0A900C1B0A900C1B0A900C0ACA400585858004DCC
      F00047C7ED00004B820000000000000000000006F6000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C4874AEAFAF6F2FCFAE0C7FFFBE2
      C9FFFBE0C8FFF9DFC4FFF8DBC0FFF4D6B7FFFFFBF8FFF6D8B3FFE1AF7CFFDB91
      63F6B36A3D07FFFFFF00FFFFFF00FFFFFF000000000000000000C54D0000FF98
      4200FFE2C600FFBB7F00FF872800FF750F00FF6B0500FF6E0800FF6E0800FF67
      0100CA4F0000702C000000000000000000000000000000000000004B8200004B
      820058585800D9CCC600F8F7F600F7F6F400F7F6F400C2B5AD0058585800004B
      8200004B82000000000000000000000000000006F6000006F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C38448C3F7F2ECECF8F4EEFCF8F3
      EDFFF8F3EDFFF8F3EDFFF8F2ECFFF7F2ECFFF2E6D7FFE2B17CFFDB9364F5B267
      3A07FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FF80
      1E00FF801E00FFBA7D00FFD5AD00FFC59100FFB57400FFA55800FF832300D754
      0000D75400000000000000000000000000000000000000000000000000000000
      0000000000005858580058585800585858005858580058585800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C07C4360C88A4CBBC88B4EEEC88B
      4EFFC88B4EF7C88C4EF7C98B4EF7C78A4EF7C4884AD4C3753A91B2673B06FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000E1580000FF700A00FF7D1900FF781300FB630000B64700000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00F81FF81F00000000E007E00700000000
      C003C00300000000800180010000000080018001000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080018001000000008001800100000000C003C00300000000
      E007E00700000000F81FF81F00000000C001FFFC0000F81F80019FF90000E007
      80018FF30000C003800187E7000080018001C3CF000080018001F11F00000000
      8001F83F000000008001FC7F000000008001F83F000000008001F19F00000000
      8003E3CF000000008003C7E70000800180038FFB0000800180031FFF0000C003
      C0073FFF0000E007F83FFFFF0000F81F00000000000000000000000000000000
      000000000000}
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    FileName = 'dataformats.txt'
    Filter = 'Text file (*.txt)|*.txt|All files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save data format list'
    Left = 128
    Top = 84
  end
  object PopupMenuDirection: TPopupMenu
    Images = ImageList1
    Left = 132
    Top = 132
    object otarget1: TMenuItem
      Action = ActionDirTarget
      GroupIndex = 1
      RadioItem = True
    end
    object osource1: TMenuItem
      Action = ActionDirSource
      GroupIndex = 1
      RadioItem = True
    end
  end
  object ImageList2: TImageList
    Height = 14
    Width = 14
    Left = 248
    Top = 136
    Bitmap = {
      494C01010100050004000E000E00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000380000000E0000000100200000000000400C
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
      0000000000000000000000000000000000000000000000000000000000000080
      B300008CBF000099CC0000A2D50000A2D5000099CC00008CBF000080B3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007BAE0000CC
      FF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF00007B
      AE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000080B30016D1
      FF0016D1FF0016D1FF000099CC003333330016D1FF0016D1FF0016D1FF000080
      B300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001BAF
      DC0035D8FF0035D8FF0028C8F20034AFCC0035D8FF0035D8FF001BAFDC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008D
      C0005BE1FF005BE1FF000099CC00333333005BE1FF005BE1FF00008DC0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000041BFE30082EAFF000099CC003333330082EAFF0041BFE300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009BCE00A8F3FF000099CC0033333300A8F3FF00009BCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000064CEEA00C7FAFF00C7FAFF0064CEEA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000A6D900DDFFFF00DDFFFF0000A6D90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000AADD0000AADD000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000380000000E0000000100010000000000700000000000000000000000
      000000000000000000000000FFFFFF00FFFC000000000000FFFC000000000000
      E01C000000000000C00C000000000000C00C000000000000E01C000000000000
      E01C000000000000F03C000000000000F03C000000000000F87C000000000000
      F87C000000000000FCFC000000000000FFFC000000000000FFFC000000000000
      00000000000000000000000000000000000000000000}
  end
end
