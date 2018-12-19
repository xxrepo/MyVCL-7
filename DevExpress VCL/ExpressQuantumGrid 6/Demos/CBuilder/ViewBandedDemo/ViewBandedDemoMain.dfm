object ViewBandedDemoMainForm: TViewBandedDemoMainForm
  Left = 64
  Top = 29
  Width = 934
  Height = 647
  Caption = 'ExpressQuantumGrid ViewBanded Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 926
    Height = 20
    Align = alTop
    AutoSize = False
    Caption = 
      'Create and remove bands at runtime. Experiment using the Options' +
      ' available. Click "About this demo" for more information.'
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
  object cxGrid: TcxGrid
    Left = 0
    Top = 20
    Width = 926
    Height = 554
    Align = alClient
    TabOrder = 0
    object btvItems: TcxGridDBBandedTableView
      DataController.DataSource = ViewBandedDemoDataDM.dsITEMS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.Navigator = True
      Bands = <
        item
          Caption = 'Item Info'
        end
        item
          Caption = 'Creator Info'
        end
        item
          Caption = 'Owner Info'
        end>
      object btvItemsNAME: TcxGridDBBandedColumn
        Caption = 'Name'
        DataBinding.FieldName = 'NAME'
        Width = 200
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvItemsTYPE: TcxGridDBBandedColumn
        Caption = 'Type'
        DataBinding.FieldName = 'TYPE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ilMain
        Properties.Items = <
          item
            Description = 'Bug'
            ImageIndex = 9
            Value = False
          end
          item
            Description = 'Request'
            ImageIndex = 8
            Value = True
          end>
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object btvItemsPRIORITY: TcxGridDBBandedColumn
        Caption = 'Priority'
        DataBinding.FieldName = 'PRIORITY'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.ImageAlign = iaRight
        Properties.Images = ilMain
        Properties.Items = <
          item
            Description = 'Low'
            ImageIndex = 4
            Value = 1
          end
          item
            Description = 'Hi'
            ImageIndex = 3
            Value = 2
          end>
        Width = 60
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object btvItemsPROJECTID: TcxGridDBBandedColumn
        Caption = 'Project'
        DataBinding.FieldName = 'PROJECTID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = ViewBandedDemoDataDM.dsPROJECTS
        Visible = False
        GroupIndex = 0
        SortOrder = soAscending
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object btvItemsSTATUS: TcxGridDBBandedColumn
        Caption = 'Status'
        DataBinding.FieldName = 'STATUS'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.ImageAlign = iaRight
        Properties.Images = ilMain
        Properties.Items = <
          item
            Description = 'New'
            ImageIndex = 5
            Value = '1'
          end
          item
            Description = 'Postponed'
            ImageIndex = 6
            Value = 2
          end
          item
            Description = 'Rejected'
            ImageIndex = 7
            Value = 3
          end
          item
            Description = 'Fixed'
            ImageIndex = 10
            Value = 4
          end>
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object btvItemsDESCRIPTION: TcxGridDBBandedColumn
        Caption = 'Description'
        DataBinding.FieldName = 'DESCRIPTION'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object btvItemsFIXEDDATE: TcxGridDBBandedColumn
        Caption = 'Fixed Date'
        DataBinding.FieldName = 'FIXEDDATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object btvItemsCREATEDDATE: TcxGridDBBandedColumn
        Caption = 'Created Date'
        DataBinding.FieldName = 'CREATEDDATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object btvItemsCreatorName: TcxGridDBBandedColumn
        Caption = 'Creator Name'
        DataBinding.FieldName = 'CREATORID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end>
        Properties.ListSource = ViewBandedDemoDataDM.dsUSERS
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvItemsCreatorPhone: TcxGridDBBandedColumn
        Caption = 'Creator Phone'
        DataBinding.FieldName = 'CREATORID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'PHONE'
          end>
        Properties.ListSource = ViewBandedDemoDataDM.dsUSERS
        Options.Editing = False
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object btvItemsOwnerName: TcxGridDBBandedColumn
        Caption = 'Owner Name'
        DataBinding.FieldName = 'OWNERID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end>
        Properties.ListSource = ViewBandedDemoDataDM.dsUSERS
        Width = 100
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvItemsOwnerPhone: TcxGridDBBandedColumn
        Caption = 'Owner Phone'
        DataBinding.FieldName = 'OWNERID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'PHONE'
          end>
        Properties.ListSource = ViewBandedDemoDataDM.dsUSERS
        Options.Editing = False
        Width = 90
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object glItems: TcxGridLevel
      GridView = btvItems
    end
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 574
    Width = 926
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object mmMain: TMainMenu
    Images = ilMain
    Left = 752
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
      Caption = '&Options'
      object miBandSizing: TMenuItem
        Caption = 'Band Si&zing'
        Checked = True
        OnClick = miBandSizingClick
      end
      object miBandMoving: TMenuItem
        Caption = 'Band &Moving'
        Checked = True
        OnClick = miBandMovingClick
      end
      object miCreateBand: TMenuItem
        Caption = '&Create Band...'
        OnClick = miCreateBandClick
      end
      object miDeleteBand: TMenuItem
        Caption = '&Delete Band...'
        OnClick = miDeleteBandClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miShowPreviewRow: TMenuItem
        Caption = 'Show &Preview Row'
        OnClick = miShowPreviewRowClick
      end
      object miShowNavigator: TMenuItem
        Caption = 'Show &Navigator'
        Checked = True
        Hint = 'Displays the inplace navigator'
        OnClick = miShowNavigatorClick
      end
      object miColumnsCustomization: TMenuItem
        Caption = 'Columns C&ustomization...'
        OnClick = miColumnsCustomizationClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object ilMain: TImageList
    Left = 720
    Top = 24
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001800000000000030
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
      0000000000000000000000000000000000000000808080808080808080808080
      8080808080808080808080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000808080000000000000000000000000000000000000000000
      0000000000000000000000008080800000000000000000008080800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFF808080FFFFFF00FFFFFFFFFF00FFFF
      FFFFFF00FFFFFFFFFF00FFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFF80808000FFFFFFFFFF00FFFF000080
      000000FFFFFF00FFFFFFFFFF000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFF008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFF80808000FFFFFFFFFF00FFFF
      FFFFFF00FFFFFFFFFF000000808080000000000000000000808080FFFFFFFFFF
      FFFFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFF008000008000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFF808080FFFFFF00FFFF000080
      000000FFFFFF00FFFF000000808080000000000000000000808080FFFFFFFFFF
      FFFFFFFF008000808080C0C0C0FFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000080000080000080
      00008000008000008000008000008000FFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFF008000FFFFFFFFFFFF808080FFFFFF000080
      00000000FFFF000000808080000000000000000000000000808080FFFFFFFFFF
      FF008000008000008000808080C0C0C0FFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000080000080000080
      00008000008000008000008000008000008000FFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF80808000FFFF000080
      000000FFFFFF000000808080000000000000000000000000808080FFFFFF0080
      00008000FFFFFF008000008000808080FFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000080000080000080
      00008000008000008000008000008000FFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFF008000008000FFFFFFFFFFFF80808000FFFF
      FFFFFF000000808080000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF008000808080808080FFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFF008000008000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF
      00FFFF000000808080000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF008000808080C0C0C0FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFF008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000808080FFFFFF008000008000008000FFFFFFFFFFFF000000
      000000808080000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000808080FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C000000000000000000000
      0000000000000000808080FFFFFF008000008000008000008000008000FFFFFF
      FFFFFF000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000000000000000000000000000000000000000808080FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8080808080808080808080808080808000000000000000000000000000000000
      0000000000000000808080808080808080808080808080808080808080808080
      8080800000000000000000000000000000000000000000008080808080808080
      8080808080808080808080808080808080808080808080808080808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF0000C0C0C000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080808080808080808080808080800000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000808080808080808080808080000000FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000FF0000FF0000FF0000FF0000FF0000C0C0C000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
      000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF0000000000000000000000000000
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000C0C0C000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00808080FFFFFF008000008000008000008000008000008000FFFFFF00000000
      0000000000000000808080FFFFFF008000008000008000FFFFFFFFFFFF000000
      FFFFFF00000000FFFFFFFFFF00FFFFFFFFFF0000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
      000000FFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00808080FFFFFFFFFFFF008000008000008000008000008000FFFFFF00000000
      0000000000000000808080FFFFFF008000008000FFFFFF000000FFFFFF000000
      FFFFFF000000FFFFFF00000000FFFFC0C0C00000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF
      000000FFFFFF000000FFFFFF0000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00808000808000000000FFFFFF008000008000008000008000FFFFFF00000000
      0000000000000000808080FFFFFFFFFFFF000000FFFFFF000000FFFFFF000000
      FFFFFF000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000008080008080000000000000
      00000000808000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFFFFFFFF000000000000FFFFFF000000FFFFFF
      000000FFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000000000000000000000000000FFFF00808000000000FFFF
      00000000808000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFFFFFFFFFFFFFF000000000000FFFFFF000000
      FFFFFF0000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
      000000000000000000000000000000000000000000FFFF00FFFF000000000000
      00FFFF00FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
      0000008080800000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
      C0C0C00000000000000000000000000000000000000000000000000000000000
      00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFF008000008000008000FFFFFFFFFFFFFFFFFF
      FFFFFF0000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF0000C0C0C000000000000000000000000000
      0000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF0000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000FF0000FF000000000000000000000000000000000000
      0000000000000000000000808080808080808080808080808080808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0080808080808080808080808080808080808080808080808080808000000000
      0000000000000000808080808080808080808080808080808080808080808080
      8080800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080808080808080808080808080808080808080808080808080808080
      8080000000000000000000808080808080808080808080808080808080808080
      8080808080808080808080808080808080800000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C00000000000000000000000000000000000000000000000000000000000
      00808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
      8080000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C00000000000000000000000000000000000000000000000008080808080
      80FF0000C0C0C0FFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFC0C0C080
      8080000000000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C08080800000000000000000000000000000
      0000000000000080008080008080808000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000808080FF0000FF00
      00FF0000C0C0C0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFC0C0C080
      8080000000000000FF0000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C08080800000000000000000000000000000
      00800080800080FFFFFFFFFFFFC0C0C080808000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      000000000000000000000000000000000000000000808080FF0000FF0000FF00
      00FF0000C0C0C0FFFFFF00FFFF808080808080808080C0C0C0FFFFFFC0C0C080
      8080000000FF0000808080808080808080808080808080FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C08080800000000000000000008000808000
      80FFFFFFFFFFFF000000000000C0C0C0C0C0C080808000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C0000000000000000000000000000000000000808080FF0000FF0000FF00
      00FF0000C0C0C0FFFFFF808080FF0000FF0000FF0000808080FFFFFFC0C0C080
      8080808080FF0000808080808080FF0000FF0000FF0000FF0000808080FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C0808080808080800080800080FFFFFFFFFF
      FF000000000000800080800080000000C0C0C0C0C0C080808000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000808080FF0000FF0000FF0000FF00
      00FF0000C0C0C0FFFFFF808080C0C0C0808080FF0000808080FFFFFFC0C0C080
      8080808080808080808080FF0000FF0000C0C0C0C0C0C0808080FF0000808080
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C0808080808080800080FFFFFF0000000000
      00800080800080800080800080800080000000C0C0C0C0C0C080808000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000808080FF0000FF0000FF00008080
      80808080C0C0C0FFFFFF808080FFFFFFC0C0C0808080808080FFFFFFC0C0C080
      8080808080C0C0C0808080FF0000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C08080808080800000000000008000808000
      8080008000808000FFFF800080800080800080000000C0C0C0C0C0C080808000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000808080FF0000FF00008080808080
      80808080C0C0C0FFFFFF00FFFF808080808080808080C0C0C0FFFFFFC0C0C080
      808000000080808000FFFFFF0000FF0000FF0000FF0000FF0000FF0000808080
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C08080808080808000808000808000808000
      80800080800080008080800080800080800080800080000000C0C0C000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000808080FF0000FF00008080808080
      80808080C0C0C0FFFFFFFFFFFFFFFFFF00FFFFFFFFFF80808080808080808080
      808000000000000080808000FFFFFF0000FFFFFFFFFFFF808080FF0000808080
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C0808080000000800080FFFFFF8000808000
      8080008080008080008000FFFF00FFFF80008080008080008000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000808080FF0000FF0000C0C0C08080
      80808080C0C0C0FFFFFF00FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFC0C0C000
      000000000000000000000080808000FFFFFF0000FF0000FF0000808080FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C0808080000000000000800080FFFFFF8000
      8080008080008080008080008000808000FFFF00FFFF80008080008000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000C0C0C0FF0000FF0000FFFF
      FFC0C0C0C0C0C0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFC0C0C0C0C0C000000000
      0000000000000000000000C0C0C0FF0000FF0000FF0000808080FFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFC0C0C0808080000000000000000000800080FFFF
      FF80008080008080008000808080008000FFFF00FFFF80008080008080008000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000C0C0C0FF0000FFFFFFC0C0
      C0FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808000000000
      0000000000000000000000C0C0C0FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFF
      FFFFFFFFFFFF8080808080808080808080800000000000000000000000008000
      80FFFFFF80008080008000FFFF00FFFF00FFFF80008080008080008000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000C0C0C0FF0000FF00
      00C0C0C0FFFFFFC0C0C080808080808080808080808080808000000000000000
      0000000000000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC0C0C0FFFFFFC0C0C00000000000000000000000000000000000
      00800080FFFFFF80008080008080008080008080008000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      C0C0C0000000000000000000000000000000000000000000000000C0C0C0C0C0
      C0FF0000FF0000FFFFFFC0C0C080808080808080808000000000000000000000
      0000000000000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC0C0C0C0C0C00000000000000000000000000000000000000000
      00000000800080FFFFFF80008080008000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF0000FF0000FF
      0000000000000000000000000000000000000000000000000000000000000000
      00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000000000000000
      0000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000000000
      0000000000000080008080008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFC03FFFF0000F003C001C0030000
      F003C001C0030000F003C001C0030000F003C001C0030000F003C001C0030000
      8003C003C00300008003C003C00300008003C007C0030000F003C007C0030000
      F003C00FC0030000F003C00FC0030000F007C00FC0030000F00FC00FC0030000
      F01FC00FC0030000FFFFFFFFFFFF0000FF3FFFFFFFFFFE00FE1FE007F801C000
      FC0FE007F801C000F807E007F801C000F007E007F801C000FE1FE007F801C000
      FE1FE007F801C000FE1FE007F801C001FE1FE0079001C003FE1FE0070001C007
      FE1FE0070001C00FFE1FE0070001C00FFE1FE00F9801C00FFE1FE01FF801C00F
      FE3FE03FF801C00FFFFFFFFFFFFFFFFFFC00E000FFFFFF1FF800E000FE3FFE1F
      E000E000F81FFE1FC000C000E00FFE3F800080008007FF1F800000000003FE1F
      000000000001FE1F000000000000FE1F000080000001FE1F0000C0008001FE1F
      0001E000C001FE1F8003E000E000FE1F8003E000F000FE1FC007E001F803FE1F
      E00FE003FC0FFE3FF83FE007FE3FFFFF00000000000000000000000000000000
      000000000000}
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 688
    Top = 24
  end
end
