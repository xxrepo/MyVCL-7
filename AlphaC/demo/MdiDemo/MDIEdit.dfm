object EditForm: TEditForm
  Tag = 1
  Left = 284
  Top = 224
  Width = 535
  Height = 374
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Untitled'
  Color = 14145495
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Editor: TsRichEdit
    Left = 0
    Top = 29
    Width = 527
    Height = 299
    Align = alClient
    Color = 16777200
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
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
  object sCoolBar1: TsCoolBar
    Left = 0
    Top = 0
    Width = 527
    Height = 29
    AutoSize = True
    Bands = <
      item
        Control = sBitBtn1
        ImageIndex = -1
        Width = 523
      end>
    SkinData.SkinSection = 'TOOLBAR'
    object sBitBtn1: TsBitBtn
      Left = 9
      Top = 0
      Width = 510
      Height = 25
      Caption = 'sBitBtn1'
      TabOrder = 0
      SkinData.SkinSection = 'TOOLBUTTON'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = Edit1Click
    Left = 96
    Top = 64
    object Cut2: TMenuItem
      Caption = 'Cu&t'
      OnClick = Cut1Click
    end
    object Copy2: TMenuItem
      Caption = '&Copy'
      OnClick = Copy1Click
    end
    object Paste2: TMenuItem
      Caption = '&Paste'
      OnClick = Paste1Click
    end
  end
  object SaveFileDialog: TsSaveDialog
    Filter = 
      'Rich text files (*.rtf)|*.rtf|Plain text files (*.txt)|*.txt|All' +
      ' files|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofNoReadOnlyReturn]
    Left = 56
    Top = 64
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 136
    Top = 64
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 176
    Top = 64
  end
  object PrintDialog1: TPrintDialog
    Left = 216
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 208
    object File1: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = '&Open...'
        OnClick = Open1Click
      end
      object Close1: TMenuItem
        Caption = '&Close'
      end
      object Save1: TMenuItem
        Caption = '&Save'
      end
      object Saveas1: TMenuItem
        Caption = 'Save &as...'
      end
      object Print1: TMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object Printersetup1: TMenuItem
        Caption = 'Printer setup...'
        OnClick = Printersetup1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      GroupIndex = 1
      object Cut1: TMenuItem
        Caption = 'Cu&t'
        ShortCut = 16472
      end
      object Copy1: TMenuItem
        Caption = '&Copy'
        ShortCut = 16451
      end
      object Paste1: TMenuItem
        Caption = '&Paste'
        ShortCut = 16470
      end
      object Delete1: TMenuItem
        Caption = 'De&lete'
        ShortCut = 16452
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Selectall1: TMenuItem
        Caption = 'Select &all'
        ShortCut = 16449
      end
    end
    object Character1: TMenuItem
      Caption = '&Character'
      GroupIndex = 1
      object Left1: TMenuItem
        Caption = '&Left'
        Checked = True
      end
      object Right1: TMenuItem
        Caption = '&Right'
      end
      object Center1: TMenuItem
        Caption = '&Center'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Wordwrap1: TMenuItem
        Caption = '&Word wrap'
        Checked = True
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Font1: TMenuItem
        Caption = '&Font...'
      end
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 80
    Top = 24
  end
end
