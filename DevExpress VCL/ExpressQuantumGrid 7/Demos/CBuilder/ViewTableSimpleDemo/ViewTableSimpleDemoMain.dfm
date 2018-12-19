object ViewTableSimpleDemoMainForm: TViewTableSimpleDemoMainForm
  Left = 182
  Top = 38
  Width = 912
  Height = 644
  Caption = 'ExpressQuantumGrid ViewTableSimple Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 217
    Top = 20
    Width = 2
    Height = 551
    Cursor = crHSplit
  end
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 904
    Height = 20
    Align = alTop
    AutoSize = False
    Caption = 
      'Use the new Table View. Experiment by changing the Options above' +
      '. Click "About this demo" for more information.` '
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
  object pnGenres: TPanel
    Left = 0
    Top = 20
    Width = 217
    Height = 551
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object pnGenresCaption: TPanel
      Left = 0
      Top = 0
      Width = 217
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Categories'
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cxgGenras: TcxGrid
      Left = 0
      Top = 33
      Width = 217
      Height = 518
      Align = alClient
      TabOrder = 1
      object cxgGenrasDBTableView: TcxGridDBTableView
        DataController.DataSource = ViewTableSimpleDemoMainDM.dsGENRES
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
        Styles.StyleSheet = ViewTableSimpleDemoMainDM.GridTableViewStyleSheetDevExpress
        object cxgGenrasDBTableViewNAME: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Options.Editing = False
          Options.Filtering = False
        end
      end
      object cxgGenrasLevel: TcxGridLevel
        GridView = cxgGenrasDBTableView
      end
    end
  end
  object pnFilms: TPanel
    Left = 219
    Top = 20
    Width = 685
    Height = 551
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnFilmsCaption: TPanel
      Left = 0
      Top = 0
      Width = 685
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Films'
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cxgFilms: TcxGrid
      Left = 0
      Top = 33
      Width = 685
      Height = 518
      Align = alClient
      TabOrder = 1
      object cxgFilmsDBTableView: TcxGridDBTableView
        DataController.DataSource = ViewTableSimpleDemoMainDM.dsFilms
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsView.Navigator = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        Preview.Column = cxgFilmsDBTableViewTAGLINE
        Preview.Place = ppTop
        Preview.Visible = True
        object cxgFilmsDBTableViewICON: TcxGridDBColumn
          Caption = 'Icon'
          DataBinding.FieldName = 'ICON'
          PropertiesClassName = 'TcxImageProperties'
          Properties.GraphicClassName = 'TJPEGImage'
          Properties.Stretch = True
        end
        object cxgFilmsDBTableViewCAPTION: TcxGridDBColumn
          Caption = 'Caption'
          DataBinding.FieldName = 'CAPTION'
          PropertiesClassName = 'TcxTextEditProperties'
        end
        object cxgFilmsDBTableViewYEAR: TcxGridDBColumn
          Caption = 'Year'
          DataBinding.FieldName = 'YEAR'
          Visible = False
          GroupIndex = 0
          SortOrder = soAscending
        end
        object cxgFilmsDBTableViewTAGLINE: TcxGridDBColumn
          Caption = 'Tagline'
          DataBinding.FieldName = 'TAGLINE'
          PropertiesClassName = 'TcxMemoProperties'
        end
        object cxgFilmsDBTableViewPLOTOUTLINE: TcxGridDBColumn
          Caption = 'Plotoutline'
          DataBinding.FieldName = 'PLOTOUTLINE'
          PropertiesClassName = 'TcxMemoProperties'
        end
        object cxgFilmsDBTableViewRUNTIME: TcxGridDBColumn
          Caption = 'Runtime'
          DataBinding.FieldName = 'RUNTIME'
          PropertiesClassName = 'TcxTextEditProperties'
        end
        object cxgFilmsDBTableViewCOLOR: TcxGridDBColumn
          Caption = 'Color'
          DataBinding.FieldName = 'COLOR'
          PropertiesClassName = 'TcxCheckBoxProperties'
        end
        object cxgFilmsDBTableViewPHOTO: TcxGridDBColumn
          Caption = 'Photo'
          DataBinding.FieldName = 'PHOTO'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekPict
          Properties.PictureGraphicClassName = 'TJPEGImage'
        end
        object cxgFilmsDBTableViewWEBSITE: TcxGridDBColumn
          Caption = 'Website'
          DataBinding.FieldName = 'WEBSITE'
          PropertiesClassName = 'TcxHyperLinkEditProperties'
        end
      end
      object cxgFilmsLevel: TcxGridLevel
        GridView = cxgFilmsDBTableView
      end
    end
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 571
    Width = 904
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object mmMain: TMainMenu
    Left = 568
    Top = 16
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
      Caption = '&Options'
      object miMultiSelect: TMenuItem
        Caption = '&Multi Select'
        Hint = 'Allows you to select several rows'
        OnClick = miMultiSelectClick
      end
      object miShowIndicator: TMenuItem
        Caption = 'Show &Indicator'
        Hint = 'Determines whether the row indicator is visible'
        OnClick = miShowIndicatorClick
      end
      object miSeparator5: TMenuItem
        Caption = '-'
      end
      object miIncSearch: TMenuItem
        Caption = 'Incremental &Search'
        OnClick = miIncSearchClick
      end
      object miImmediateEditor: TMenuItem
        Caption = 'Immediate &Editor'
        Checked = True
        Hint = 
          'Determines whether the editor of a specific column is activated ' +
          'immediately as a user enters an appropriate cell'
        OnClick = miImmediateEditorClick
      end
      object miFocusCellOnTab: TMenuItem
        Caption = '&Focus Cell On Tab'
        Hint = 'Tab key changes cell focus'
        OnClick = miFocusCellOnTabClick
      end
      object miShowPreviewRow: TMenuItem
        Caption = 'Show &Preview Row'
        Checked = True
        Hint = 'Shows/Hides preview column'
        OnClick = miShowPreviewRowClick
      end
      object miShowNavigator: TMenuItem
        Caption = 'Show &Navigator'
        Checked = True
        Hint = 'Displays the inplace navigator'
        OnClick = miShowNavigatorClick
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
    Left = 600
    Top = 16
  end
end
