object FormMain: TFormMain
  Left = 423
  Top = 193
  Width = 497
  Height = 398
  Caption = 'ComboTarget Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 129
    Width = 489
    Height = 242
    ActivePage = TabSheetData
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheetText: TTabSheet
      Caption = 'Text'
      object MemoText: TMemo
        Left = 0
        Top = 0
        Width = 481
        Height = 214
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheetFiles: TTabSheet
      Caption = 'Files'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 148
        Width = 481
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ResizeStyle = rsUpdate
      end
      object ListBoxFiles: TListBox
        Left = 0
        Top = 0
        Width = 481
        Height = 148
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
      object ListBoxMaps: TListBox
        Left = 0
        Top = 151
        Width = 481
        Height = 63
        Align = alBottom
        ItemHeight = 13
        TabOrder = 1
      end
    end
    object TabSheetBitmap: TTabSheet
      Caption = 'Bitmap'
      ImageIndex = 2
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 0
        Width = 481
        Height = 214
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object ImageBitmap: TImage
          Left = 0
          Top = 0
          Width = 639
          Height = 333
          AutoSize = True
        end
      end
    end
    object TabSheetURL: TTabSheet
      Caption = 'URL'
      ImageIndex = 3
      object Label1: TLabel
        Left = 12
        Top = 20
        Width = 19
        Height = 13
        Caption = 'URL'
        FocusControl = EditURLURL
      end
      object Label2: TLabel
        Left = 12
        Top = 44
        Width = 20
        Height = 13
        Caption = 'Title'
        FocusControl = EditURLTitle
      end
      object EditURLURL: TEdit
        Left = 48
        Top = 16
        Width = 573
        Height = 21
        TabOrder = 0
      end
      object EditURLTitle: TEdit
        Left = 48
        Top = 40
        Width = 573
        Height = 21
        TabOrder = 1
      end
    end
    object TabSheetData: TTabSheet
      Caption = 'Data'
      ImageIndex = 4
      object ListViewData: TListView
        Left = 0
        Top = 0
        Width = 481
        Height = 214
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'Filename'
            MinWidth = 200
          end
          item
            Alignment = taRightJustify
            Caption = 'Size'
            MinWidth = 50
          end>
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = ListViewDataDblClick
      end
    end
    object TabSheetMetaFile: TTabSheet
      Caption = 'MetaFile'
      ImageIndex = 5
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 481
        Height = 214
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object ImageMetaFile: TImage
          Left = 0
          Top = 0
          Width = 635
          Height = 325
          AutoSize = True
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    Caption = ' '
    TabOrder = 1
    object PanelDropZone: TPanel
      Left = 181
      Top = 4
      Width = 304
      Height = 121
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      Caption = ' '
      TabOrder = 0
      object Label3: TLabel
        Left = 4
        Top = 4
        Width = 296
        Height = 113
        Align = alClient
        Caption = 
          'This application demonstrates the TComboTarget component.  TComb' +
          'oTarget is an example of a drop target component which can accep' +
          't multiple unrelated data formats.  Drop data anywhere in this w' +
          'indow to have it displayed in the pane below.'
        WordWrap = True
      end
    end
    object Panel1: TPanel
      Left = 4
      Top = 4
      Width = 177
      Height = 121
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 177
        Height = 121
        Align = alClient
        Caption = ' Accept the following formats '
        TabOrder = 0
        object CheckBoxText: TCheckBox
          Left = 12
          Top = 20
          Width = 97
          Height = 17
          Caption = 'Text'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBoxTextClick
        end
        object CheckBoxFiles: TCheckBox
          Left = 12
          Top = 36
          Width = 97
          Height = 17
          Caption = 'Files'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = CheckBoxFilesClick
        end
        object CheckBoxURLs: TCheckBox
          Left = 12
          Top = 52
          Width = 97
          Height = 17
          Caption = 'URLs'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = CheckBoxURLsClick
        end
        object CheckBoxBitmaps: TCheckBox
          Left = 12
          Top = 68
          Width = 97
          Height = 17
          Caption = 'Bitmaps'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = CheckBoxBitmapsClick
        end
        object CheckBoxMetaFiles: TCheckBox
          Left = 12
          Top = 84
          Width = 97
          Height = 17
          Caption = 'Meta files'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = CheckBoxMetaFilesClick
        end
        object CheckBoxData: TCheckBox
          Left = 12
          Top = 100
          Width = 97
          Height = 17
          Caption = 'Data'
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = CheckBoxDataClick
        end
      end
    end
  end
  object DropComboTarget1: TDropComboTarget
    DragTypes = [dtCopy, dtLink]
    OnDrop = DropComboTarget1Drop
    Target = GroupBox1
    Left = 236
    Top = 88
  end
end
