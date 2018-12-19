object CustomRowHeightDemoMainForm: TCustomRowHeightDemoMainForm
  Left = 115
  Top = 47
  Width = 767
  Height = 654
  Caption = 'ExpressQuantumGrid CustomRowHeight Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 759
    Height = 33
    Align = alTop
    AutoSize = False
    Caption = 
      'Experiment by zooming in or out on the photo (see the Options). ' +
      'Click '#39'About this demo'#39' for more information.'
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
  object sbMain: TStatusBar
    Left = 0
    Top = 581
    Width = 759
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 33
    Width = 759
    Height = 548
    Align = alClient
    TabOrder = 1
    object tvFilms: TcxGridDBTableView
      DataController.DataSource = CustomRowHeightDemoDataDM.dsFilms
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnGetCellHeight = tvFilmsGetCellHeight
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupRowSizing = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      object tvFilmsCAPTION: TcxGridDBColumn
        Caption = 'Caption'
        DataBinding.FieldName = 'CAPTION'
        Width = 157
      end
      object tvFilmsPLOTOUTLINE: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'PLOTOUTLINE'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 222
      end
      object tvFilmsPHOTO: TcxGridDBColumn
        Caption = 'Photo'
        DataBinding.FieldName = 'PHOTO'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.Stretch = True
        Width = 366
      end
    end
    object lvFilms: TcxGridLevel
      GridView = tvFilms
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 24
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = 'Options'
      object miPictureZoom: TMenuItem
        Caption = 'Picture &Zoom'
        object miZoom100perc: TMenuItem
          Caption = '100%'
          RadioItem = True
          OnClick = miZoomClick
        end
        object miZoom75perc: TMenuItem
          Caption = '75%'
          RadioItem = True
          OnClick = miZoomClick
        end
        object miZoom50perc: TMenuItem
          Caption = '50%'
          Checked = True
          RadioItem = True
          OnClick = miZoomClick
        end
        object miZoom25perc: TMenuItem
          Caption = '25%'
          RadioItem = True
          OnClick = miZoomClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 472
    Top = 24
  end
end
