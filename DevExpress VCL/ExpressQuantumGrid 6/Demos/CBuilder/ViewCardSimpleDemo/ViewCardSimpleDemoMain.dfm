object ViewCardSimpleDemoMainForm: TViewCardSimpleDemoMainForm
  Left = 200
  Top = 132
  Width = 822
  Height = 545
  Caption = 'ExpressQuantumGrid ViewCardSimple Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 185
    Top = 20
    Width = 2
    Height = 452
    Cursor = crHSplit
  end
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 814
    Height = 20
    Align = alTop
    AutoSize = False
    Caption = 
      'Use the new Card View. Experiment by changing the Options above.' +
      ' Click "About this demo" for more information. '
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
    Top = 472
    Width = 814
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object pnDepartments: TPanel
    Left = 0
    Top = 20
    Width = 185
    Height = 452
    Align = alLeft
    Caption = 'pnDepartments'
    TabOrder = 1
    object pnDepartmentsCaption: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 32
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Departments'
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cxGridDepartments: TcxGrid
      Left = 1
      Top = 33
      Width = 183
      Height = 418
      Align = alClient
      TabOrder = 1
      object cxGridDepartmentsDBTableView: TcxGridDBTableView
        DataController.DataSource = ViewCardSimpleDemoDataDM.dsDEPARTMENTS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = ViewCardSimpleDemoDataDM.GridTableViewStyleSheetDevExpress
        object cxGridDepartmentsDBTableViewNAME: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Options.Editing = False
          Options.Filtering = False
        end
      end
      object cxGridDepartmentsLevel: TcxGridLevel
        GridView = cxGridDepartmentsDBTableView
      end
    end
  end
  object pnUsers: TPanel
    Left = 187
    Top = 20
    Width = 627
    Height = 452
    Align = alClient
    Caption = 'pnUsers'
    TabOrder = 2
    object cxGridUsers: TcxGrid
      Left = 1
      Top = 33
      Width = 625
      Height = 418
      Align = alClient
      TabOrder = 0
      object cxGridUsersDBCardView: TcxGridDBCardView
        DataController.DataSource = ViewCardSimpleDemoDataDM.dsUSERS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsView.Navigator = True
        OptionsView.SeparatorColor = 12937777
        object cxGridUsersDBCardViewFNAME: TcxGridDBCardViewRow
          Caption = 'First Name'
          DataBinding.FieldName = 'FNAME'
          Kind = rkCaption
        end
        object cxGridUsersDBCardViewMNAME: TcxGridDBCardViewRow
          Caption = 'Middle Name'
          DataBinding.FieldName = 'MNAME'
        end
        object cxGridUsersDBCardViewLNAME: TcxGridDBCardViewRow
          Caption = 'Last Name'
          DataBinding.FieldName = 'LNAME'
        end
        object cxGridUsersDBCardViewCOUNTRY: TcxGridDBCardViewRow
          Caption = 'Country'
          DataBinding.FieldName = 'COUNTRY'
        end
        object cxGridUsersDBCardViewPOSTALCODE: TcxGridDBCardViewRow
          Caption = 'Postalcode'
          DataBinding.FieldName = 'POSTALCODE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d\d\d\d\d? | \w\w\w'#39' '#39'\w\w\w'
        end
        object cxGridUsersDBCardViewCITY: TcxGridDBCardViewRow
          Caption = 'City'
          DataBinding.FieldName = 'CITY'
        end
        object cxGridUsersDBCardViewADDRESS: TcxGridDBCardViewRow
          Caption = 'Address'
          DataBinding.FieldName = 'ADDRESS'
        end
        object cxGridUsersDBCardViewPHONE: TcxGridDBCardViewRow
          Caption = 'Phone'
          DataBinding.FieldName = 'PHONE'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(999\) 000-0000;1;_'
        end
        object cxGridUsersDBCardViewFAX: TcxGridDBCardViewRow
          Caption = 'Fax'
          DataBinding.FieldName = 'FAX'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '(\(\d\d\d\)'#39' '#39')?\d\d\d-\d\d\d\d'
        end
        object cxGridUsersDBCardViewEMAIL: TcxGridDBCardViewRow
          Caption = 'Email'
          DataBinding.FieldName = 'EMAIL'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\w+@\w+\.\w+(\.\w+)*'
        end
        object cxGridUsersDBCardViewHOMEPAGE: TcxGridDBCardViewRow
          Caption = 'Homepage'
          DataBinding.FieldName = 'HOMEPAGE'
          PropertiesClassName = 'TcxHyperLinkEditProperties'
        end
      end
      object cxGridUsersLevel: TcxGridLevel
        GridView = cxGridUsersDBCardView
      end
    end
    object pnUsersCaption: TPanel
      Left = 1
      Top = 1
      Width = 625
      Height = 32
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Users'
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object mmMain: TMainMenu
    Left = 520
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
      object miInvertSelect: TMenuItem
        Caption = 'Invert Select'
        Checked = True
        Hint = 
          'Determines whether the selection mark highlights a single cell w' +
          'ithin a focused row or the whole focused row'
        OnClick = miInvertSelectClick
      end
      object miCellSelect: TMenuItem
        Caption = 'CellSelect'
        Checked = True
        Hint = 
          'Determines whether the individual cells are selected within a vi' +
          'ew instead of the whole rows'
        OnClick = miCellSelectClick
      end
      object miMultiSelect: TMenuItem
        Caption = 'MulitiSelect'
        Hint = 'Allows you to select several rows'
        OnClick = miMulitiSelectClick
      end
      object miHideFocusRect: TMenuItem
        Caption = 'Hide Focus Rect'
        Checked = True
        Hint = 
          'Determines whether the focus rectangle is displayed around the f' +
          'ocused record within a view'
        OnClick = miHideFocusRectClick
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
    Left = 488
  end
end
