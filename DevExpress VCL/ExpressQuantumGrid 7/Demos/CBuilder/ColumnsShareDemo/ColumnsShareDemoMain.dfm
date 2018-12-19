object ColumnsShareDemoMainForm: TColumnsShareDemoMainForm
  Left = 22
  Top = 77
  Width = 985
  Height = 654
  Caption = 'ExpressQuantumGrid Columns Share Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 977
    Height = 20
    Align = alTop
    AutoSize = False
    Caption = 
      'This demo shows how several columns using a single lookup editor' +
      '. Click '#39'About this demo'#39' for more information.'
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
    Width = 977
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 20
    Width = 977
    Height = 561
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    RootLevelStyles.Tab = ColumnsShareDemoMainDM.cxStyle2
    RootLevelStyles.TabsBackground = ColumnsShareDemoMainDM.cxStyle1
    object tvProjects: TcxGridDBTableView
      DataController.DataSource = ColumnsShareDemoMainDM.dsProjects
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      Styles.StyleSheet = ColumnsShareDemoMainDM.GridTableViewStyleSheetDevExpress
      object tvProjectsNAME: TcxGridDBColumn
        Caption = 'Name'
        DataBinding.FieldName = 'NAME'
      end
      object tvProjectsMANAGERID: TcxGridDBColumn
        Caption = 'Manager'
        DataBinding.FieldName = 'MANAGERID'
        RepositoryItem = eriLookupComboUsers
      end
    end
    object tvItems: TcxGridDBTableView
      DataController.DataSource = ColumnsShareDemoMainDM.dsItems
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.CellAutoHeight = True
      OptionsView.Indicator = True
      Preview.Column = tvItemsDESCRIPTION
      Preview.Visible = True
      Styles.StyleSheet = ColumnsShareDemoMainDM.GridTableViewStyleSheetDevExpress
      object tvItemsNAME: TcxGridDBColumn
        Caption = 'Name'
        DataBinding.FieldName = 'NAME'
      end
      object tvItemsTYPE: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'TYPE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ColumnsShareDemoMainDM.imStat
        Properties.Items = <
          item
            Description = 'Bug'
            ImageIndex = 2
            Value = False
          end
          item
            Description = 'Request'
            ImageIndex = 3
            Value = True
          end>
        Properties.LargeImages = ColumnsShareDemoMainDM.imStat
        MinWidth = 50
      end
      object tvItemsPROJECTID: TcxGridDBColumn
        Caption = 'Project'
        DataBinding.FieldName = 'PROJECTID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = ColumnsShareDemoMainDM.dsProjects
        SortOrder = soAscending
      end
      object tvItemsPRIORITY: TcxGridDBColumn
        Caption = 'Priority'
        DataBinding.FieldName = 'PRIORITY'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Images = ColumnsShareDemoMainDM.imStat
        Properties.Items = <
          item
            Description = 'Low'
            ImageIndex = 0
            Value = 1
          end
          item
            Description = 'Normal'
            Value = 2
          end
          item
            Description = 'High'
            ImageIndex = 1
            Value = 3
          end>
        MinWidth = 50
      end
      object tvItemsSTATUS: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'STATUS'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ColumnsShareDemoMainDM.imStat
        Properties.Items = <
          item
            Description = 'New'
            ImageIndex = 4
            Value = 1
          end
          item
            Description = 'Postponed'
            ImageIndex = 5
            Value = 2
          end
          item
            Description = 'Fixed'
            ImageIndex = 6
            Value = 3
          end
          item
            Description = 'Rejected'
            ImageIndex = 7
            Value = 4
          end>
      end
      object tvItemsCREATORID: TcxGridDBColumn
        Caption = 'Creator'
        DataBinding.FieldName = 'CREATORID'
        RepositoryItem = eriLookupComboUsers
        Width = 101
      end
      object tvItemsCREATEDDATE: TcxGridDBColumn
        Caption = 'CreateDate'
        DataBinding.FieldName = 'CREATEDDATE'
      end
      object tvItemsOWNERID: TcxGridDBColumn
        Caption = 'Owner'
        DataBinding.FieldName = 'OWNERID'
        RepositoryItem = eriLookupComboUsers
      end
      object tvItemsLASTMODIFIEDDATE: TcxGridDBColumn
        Caption = 'LastModifiedDate'
        DataBinding.FieldName = 'LASTMODIFIEDDATE'
      end
      object tvItemsFIXEDDATE: TcxGridDBColumn
        Caption = 'FixedDate'
        DataBinding.FieldName = 'FIXEDDATE'
      end
      object tvItemsDESCRIPTION: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'DESCRIPTION'
      end
    end
    object cvUsers: TcxGridDBCardView
      DataController.DataSource = ColumnsShareDemoMainDM.dsUsers
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.SeparatorColor = 12937777
      Styles.StyleSheet = ColumnsShareDemoMainDM.GridCardViewStyleSheetDevExpress
      object cvUsersFNAME: TcxGridDBCardViewRow
        Caption = 'First Name'
        DataBinding.FieldName = 'FNAME'
      end
      object cvUsersMNAME: TcxGridDBCardViewRow
        Caption = 'Midle Name'
        DataBinding.FieldName = 'MNAME'
      end
      object cvUsersLNAME: TcxGridDBCardViewRow
        Caption = 'Last Name'
        DataBinding.FieldName = 'LNAME'
      end
      object cvUsersDepartment: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Department'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        Properties.ListFieldIndex = -1
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
      end
      object cvUsersCOUNTRY: TcxGridDBCardViewRow
        Caption = 'Country'
        DataBinding.FieldName = 'COUNTRY'
      end
      object cvUsersPOSTALCODE: TcxGridDBCardViewRow
        Caption = 'PostalCode'
        DataBinding.FieldName = 'POSTALCODE'
      end
      object cvUsersCITY: TcxGridDBCardViewRow
        Caption = 'City'
        DataBinding.FieldName = 'CITY'
      end
      object cvUsersADDRESS: TcxGridDBCardViewRow
        Caption = 'Address'
        DataBinding.FieldName = 'ADDRESS'
      end
      object cvUsersPHONE: TcxGridDBCardViewRow
        Caption = 'Phone'
        DataBinding.FieldName = 'PHONE'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\(\d\d\d\))? \d(\d\d?)? - (\d\d\d? - \d\d|\d\d\d\d)'
      end
      object cvUsersFAX: TcxGridDBCardViewRow
        Caption = 'Fax'
        DataBinding.FieldName = 'FAX'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\(\d\d\d\))? \d(\d\d?)? - (\d\d - \d\d | \d\d\d\d)'
      end
      object cvUsersEMAIL: TcxGridDBCardViewRow
        Caption = 'EMail'
        DataBinding.FieldName = 'EMAIL'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
      end
      object cvUsersHOMEPAGE: TcxGridDBCardViewRow
        Caption = 'HomePage'
        DataBinding.FieldName = 'HOMEPAGE'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
      end
    end
    object tvTeam: TcxGridDBTableView
      DataController.DataSource = ColumnsShareDemoMainDM.dsProjectTeam
      DataController.DetailKeyFieldNames = 'PROJECTID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      Styles.StyleSheet = ColumnsShareDemoMainDM.GridTableViewStyleSheetDevExpress
      object tvTeamUSERID: TcxGridDBColumn
        Caption = 'Name'
        DataBinding.FieldName = 'USERID'
        RepositoryItem = eriLookupComboUsers
      end
      object tvTeamFUNCTION: TcxGridDBColumn
        Caption = 'Function'
        DataBinding.FieldName = 'FUNCTION'
      end
    end
    object lvItems: TcxGridLevel
      Caption = 'Items'
      GridView = tvItems
    end
    object lvProjects: TcxGridLevel
      Caption = 'Projects'
      GridView = tvProjects
      object lvTeam: TcxGridLevel
        GridView = tvTeam
      end
    end
    object lvUsers: TcxGridLevel
      Caption = 'Users'
      GridView = cvUsers
    end
  end
  object mmMain: TMainMenu
    Left = 504
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
      object miPersonEditor: TMenuItem
        Caption = 'Persons Editor'
        object miLookupEditor: TMenuItem
          Caption = 'Lookup ComboBox Editor'
          Checked = True
          GroupIndex = 1
          RadioItem = True
          OnClick = miLookUpEditorClick
        end
        object miExtLookUpEditor: TMenuItem
          Caption = 'ExtLookup ComboBox Editor'
          GroupIndex = 1
          RadioItem = True
          OnClick = miExtLookUpEditorClick
        end
      end
      object miCustomizePersonsLookupCombobox: TMenuItem
        Caption = '&Customize Persons Lookup Combobox ...'
        Hint = 'These changes will affect all Persons lookup combo boxes'
        OnClick = miCustomizePersonsLookupComboboxClick
      end
      object miSeparator1: TMenuItem
        Caption = '-'
      end
      object miLookFeel: TMenuItem
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = '&Kind'
          object miFlat: TMenuItem
            Caption = '&Flat'
            GroupIndex = 2
            Hint = 
              'Setting this option changes the grid view appearance to Flat sty' +
              'le'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miStandard: TMenuItem
            Caption = '&Standard'
            GroupIndex = 2
            Hint = 
              'Setting this option changes the grid view appearance to Standard' +
              ' style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miUltraFlat: TMenuItem
            Caption = '&Ultra Flat'
            Checked = True
            GroupIndex = 2
            Hint = 
              'Setting this option changes the grid view appearance to Ultra Fl' +
              'at style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miOffice11: TMenuItem
            Caption = '&Office11'
            GroupIndex = 2
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
          Hint = 
            'Setting this option changes the appearance of grid items to the ' +
            'native style'
          OnClick = miNativeStyleClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object cxEditRepository: TcxEditRepository
    Left = 536
    Top = 16
    object erExtLookupComboBoxItem: TcxEditRepositoryExtLookupComboBoxItem
      Properties.DropDownSizeable = True
      Properties.View = cxGridViewRepositoryDBTableView
      Properties.KeyFieldNames = 'ID'
      Properties.ListFieldItem = cxGridViewRepositoryDBTableViewUserName
    end
    object eriLookupComboUsers: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'UserName'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = ColumnsShareDemoMainDM.dsUsers
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <>
    Left = 352
    Top = 16
  end
  object cxGridViewRepository: TcxGridViewRepository
    Left = 384
    Top = 16
    object cxGridViewRepositoryDBTableView: TcxGridDBTableView
      DataController.DataSource = ColumnsShareDemoMainDM.dsUsers
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Styles.StyleSheet = ColumnsShareDemoMainDM.GridTableViewStyleSheetDevExpress
      object cxGridViewRepositoryDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Width = 51
      end
      object cxGridViewRepositoryDBTableViewUserName: TcxGridDBColumn
        DataBinding.FieldName = 'UserName'
      end
      object cxGridViewRepositoryDBTableViewDepartment: TcxGridDBColumn
        DataBinding.FieldName = 'Department'
      end
      object cxGridViewRepositoryDBTableViewCOUNTRY: TcxGridDBColumn
        Caption = 'Country'
        DataBinding.FieldName = 'COUNTRY'
        Width = 69
      end
      object cxGridViewRepositoryDBTableViewPOSTALCODE: TcxGridDBColumn
        Caption = 'Postal Code'
        DataBinding.FieldName = 'POSTALCODE'
        Width = 92
      end
      object cxGridViewRepositoryDBTableViewCITY: TcxGridDBColumn
        Caption = 'City'
        DataBinding.FieldName = 'CITY'
      end
      object cxGridViewRepositoryDBTableViewADDRESS: TcxGridDBColumn
        Caption = 'Address'
        DataBinding.FieldName = 'ADDRESS'
        Width = 158
      end
      object cxGridViewRepositoryDBTableViewPHONE: TcxGridDBColumn
        Caption = 'Phone'
        DataBinding.FieldName = 'PHONE'
        Width = 95
      end
      object cxGridViewRepositoryDBTableViewFAX: TcxGridDBColumn
        Caption = 'Fax'
        DataBinding.FieldName = 'FAX'
        Width = 103
      end
      object cxGridViewRepositoryDBTableViewEMAIL: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'EMAIL'
        Width = 190
      end
      object cxGridViewRepositoryDBTableViewHOMEPAGE: TcxGridDBColumn
        Caption = 'Homepage'
        DataBinding.FieldName = 'HOMEPAGE'
        Width = 201
      end
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 568
    Top = 16
  end
end
