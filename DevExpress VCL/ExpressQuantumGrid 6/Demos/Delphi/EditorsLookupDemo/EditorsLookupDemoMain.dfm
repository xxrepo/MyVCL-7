object EditorsLookupDemoMainForm: TEditorsLookupDemoMainForm
  Left = 269
  Top = 185
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ExpressQuantumGrid EditorsLookupDemo '
  ClientHeight = 340
  ClientWidth = 546
  Color = 15451300
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 546
    Height = 48
    Align = alTop
    Caption = 
      'Practice using lookup data-aware editors for reading and writing' +
      '.'#10#13'See also the Storage menu to provide runtime store/restore de' +
      'mo settings.'#10#13'Click '#39'About this demo'#39' for more information.'
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
    Top = 321
    Width = 546
    Height = 19
    AutoHint = True
    Align = alTop
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object pnlEditors: TPanel
    Left = 0
    Top = 48
    Width = 546
    Height = 273
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object gbIssue: TGroupBox
      Left = 8
      Top = 56
      Width = 329
      Height = 177
      Caption = 'Issue'
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Name:'
      end
      object Label2: TLabel
        Left = 8
        Top = 58
        Width = 56
        Height = 13
        Caption = 'Description:'
      end
      object Label9: TLabel
        Left = 8
        Top = 38
        Width = 65
        Height = 13
        Caption = 'Issue Creator:'
      end
      object edName: TcxDBTextEdit
        Left = 80
        Top = 10
        Width = 241
        Height = 21
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 0
      end
      object meDescription: TcxDBMemo
        Left = 8
        Top = 73
        Width = 313
        Height = 97
        DataBinding.DataField = 'DESCRIPTION'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Properties.ScrollBars = ssVertical
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 2
      end
      object lcbCreator: TcxDBLookupComboBox
        Left = 80
        Top = 33
        Width = 241
        Height = 21
        DataBinding.DataField = 'CREATORID'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Properties.DropDownListStyle = lsEditList
        Properties.ImmediateDropDown = False
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'UserName'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = EditorsLookupDemoDataDM.dsUsers
        Properties.MaxLength = 50
        Properties.OnNewLookupDisplayText = lcbCreatorNewLookupDisplayText
        Style.Color = 16247513
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 1
      end
    end
    object gbInfo: TGroupBox
      Left = 344
      Top = 64
      Width = 193
      Height = 81
      Caption = 'Info'
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 16
        Width = 34
        Height = 13
        Caption = 'Priority:'
      end
      object Label4: TLabel
        Left = 8
        Top = 39
        Width = 40
        Height = 13
        Caption = 'Created:'
      end
      object cbPriority: TcxDBImageComboBox
        Left = 64
        Top = 10
        Width = 121
        Height = 21
        DataBinding.DataField = 'PRIORITY'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Properties.Images = EditorsLookupDemoDataDM.imStat
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
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 0
      end
      object deCreateDate: TcxDBDateEdit
        Left = 64
        Top = 33
        Width = 121
        Height = 21
        DataBinding.DataField = 'CREATEDDATE'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 1
      end
      object chbRequest: TcxDBCheckBox
        Left = 8
        Top = 56
        Width = 121
        Height = 21
        Caption = 'Request'
        DataBinding.DataField = 'TYPE'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        TabOrder = 2
      end
    end
    object gbStatus: TGroupBox
      Left = 344
      Top = 144
      Width = 193
      Height = 89
      Caption = 'Status'
      TabOrder = 3
      object Label5: TLabel
        Left = 8
        Top = 20
        Width = 33
        Height = 13
        Caption = 'Status:'
      end
      object Label6: TLabel
        Left = 8
        Top = 43
        Width = 43
        Height = 13
        Caption = 'Modified:'
      end
      object Label7: TLabel
        Left = 8
        Top = 67
        Width = 28
        Height = 13
        Caption = 'Fixed:'
      end
      object cbStatus: TcxDBImageComboBox
        Left = 64
        Top = 14
        Width = 121
        Height = 21
        DataBinding.DataField = 'STATUS'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Properties.Images = EditorsLookupDemoDataDM.imStat
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
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 0
      end
      object deLastModifiedDate: TcxDBDateEdit
        Left = 64
        Top = 38
        Width = 121
        Height = 21
        DataBinding.DataField = 'LASTMODIFIEDDATE'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 1
      end
      object deFixedDate: TcxDBDateEdit
        Left = 64
        Top = 62
        Width = 121
        Height = 21
        DataBinding.DataField = 'FIXEDDATE'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 2
      end
    end
    object DBNavigator: TcxDBNavigator
      Left = 8
      Top = 240
      Width = 285
      Height = 25
      Buttons.PageSize = 10
      DataSource = EditorsLookupDemoDataDM.dsItems
      TabOrder = 4
    end
    object gbProject: TGroupBox
      Left = 8
      Top = 8
      Width = 529
      Height = 49
      Caption = 'Primary Info'
      TabOrder = 0
      object Label8: TLabel
        Left = 8
        Top = 22
        Width = 36
        Height = 13
        Caption = 'Project:'
      end
      object Label10: TLabel
        Left = 268
        Top = 22
        Width = 62
        Height = 13
        Caption = 'Issue Owner:'
      end
      object lcbProject: TcxDBLookupComboBox
        Left = 44
        Top = 16
        Width = 217
        Height = 21
        DataBinding.DataField = 'PROJECTID'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Width = 200
            FieldName = 'NAME'
          end
          item
            Caption = 'Manager'
            Width = 100
            FieldName = 'Manager'
          end>
        Properties.ListSource = EditorsLookupDemoDataDM.dsProjects
        Style.Color = 16247513
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 0
      end
      object lcbOwner: TcxDBLookupComboBox
        Left = 330
        Top = 16
        Width = 191
        Height = 21
        DataBinding.DataField = 'OWNERID'
        DataBinding.DataSource = EditorsLookupDemoDataDM.dsItems
        Properties.DropDownListStyle = lsEditList
        Properties.ImmediateDropDown = False
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'UserName'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = EditorsLookupDemoDataDM.dsUsers
        Properties.MaxLength = 50
        Properties.OnNewLookupDisplayText = lcbCreatorNewLookupDisplayText
        Style.Color = 16247513
        Style.StyleController = EditorsLookupDemoDataDM.StyleController
        TabOrder = 1
      end
    end
  end
  object mmMain: TMainMenu
    Left = 300
    Top = 8
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
      object LookupOptions1: TMenuItem
        Caption = 'Lookup &Options'
        object miEditMode: TMenuItem
          Tag = 3
          Caption = '&Edit mode'
          Checked = True
          GroupIndex = 2
          RadioItem = True
          OnClick = ChangeLookupModeClick
        end
        object miPickMode: TMenuItem
          Tag = 1
          Caption = '&Pick mode'
          GroupIndex = 2
          Hint = 'Pick mode with incremental filtering'
          RadioItem = True
          OnClick = ChangeLookupModeClick
        end
        object miStandardMode: TMenuItem
          Tag = 2
          Caption = '&Standard mode'
          GroupIndex = 2
          Hint = 'Standard lookup mode'
          RadioItem = True
          OnClick = ChangeLookupModeClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miLookFeel: TMenuItem
        Caption = '&Look&&Feel'
        OnClick = miLookFeelClick
        object miKind: TMenuItem
          Caption = 'Kind'
          OnClick = miKindClick
          object miFlat: TMenuItem
            Caption = '&Flat'
            Hint = 'Setting this option changes the editors appearance to Flat style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miStandard: TMenuItem
            Caption = '&Standard'
            Hint = 
              'Setting this option changes the editors appearance to Standard s' +
              'tyle'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miUltraFlat: TMenuItem
            Caption = '&Ultra Flat'
            Checked = True
            Hint = 
              'Setting this option changes the editors appearance to Ultra Flat' +
              ' style'
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
          Hint = 
            'Setting this option changes the appearance of the editors to the' +
            ' native style'
          OnClick = miNativeStyleClick
        end
      end
    end
    object miStorage: TMenuItem
      Caption = '&Storage'
      object miStorageActive: TMenuItem
        Caption = 'Save the settings before closing the demo '
        Checked = True
        Hint = 
          'Determines whether the settings are stored before closing the de' +
          'mo'
        OnClick = miStorageActiveClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miStoringGridLookFeel: TMenuItem
        Caption = 'Save the Demo'#39's &Look&&Feel before closing the demo '
        Checked = True
        Hint = 
          'Determines whether the Demo'#39's Look&Feel is stored before closing' +
          ' the demo'
        OnClick = miStoringGridLookFeelClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miStorageType: TMenuItem
        Caption = 'Storage &Location'
        object miIniStoreType: TMenuItem
          Caption = '&Ini file'
          Checked = True
          Hint = 'Setting this option changes the current storage to an INI file'
          RadioItem = True
          OnClick = StorageTypeClick
        end
        object miRegistryStoreType: TMenuItem
          Tag = 1
          Caption = '&Registry'
          Hint = 'Setting this option changes the current storage to the registry'
          RadioItem = True
          OnClick = StorageTypeClick
        end
        object miMemoryStoreType: TMenuItem
          Tag = 2
          Caption = '&Memory'
          Hint = 'Setting this option changes the current storage to memory'
          RadioItem = True
          OnClick = StorageTypeClick
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object miStore: TMenuItem
        Caption = '&Store'
        Hint = 'Saves the demo settings to the current storage'
        OnClick = miStoreClick
      end
      object miRestore: TMenuItem
        Caption = '&Restore'
        Hint = 'Restores the demo settings from the current storage'
        OnClick = miRestoreClick
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
    Left = 332
    Top = 8
  end
  object cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = LookAndFeelController
        Properties.Strings = (
          'Kind'
          'Name'
          'NativeStyle'
          'Tag')
      end
      item
        Component = lcbCreator
        Properties.Strings = (
          'Properties.DropDownListStyle'
          'Properties.ImmediateDropDown')
      end
      item
        Component = lcbOwner
        Properties.Strings = (
          'Properties.DropDownListStyle'
          'Properties.ImmediateDropDown')
      end
      item
        Component = lcbProject
        Properties.Strings = (
          'Properties.DropDownListStyle')
      end
      item
        Component = miEditMode
        Properties.Strings = (
          'Checked')
      end
      item
        Component = miPickMode
        Properties.Strings = (
          'Checked')
      end
      item
        Component = miStandardMode
        Properties.Strings = (
          'Checked')
      end>
    StorageName = 'cxPropertiesStore.ini'
    Left = 364
    Top = 8
  end
  object cxStorageActiveStore: TcxPropertiesStore
    Components = <
      item
        Component = cxPropertiesStore
        Properties.Strings = (
          'Active'
          'StorageName'
          'StorageType')
      end
      item
        Component = miIniStoreType
        Properties.Strings = (
          'Checked')
      end
      item
        Component = miMemoryStoreType
        Properties.Strings = (
          'Checked')
      end
      item
        Component = miRegistryStoreType
        Properties.Strings = (
          'Checked')
      end
      item
        Component = miStorageActive
        Properties.Strings = (
          'Checked')
      end
      item
        Component = miStoringGridLookFeel
        Properties.Strings = (
          'Checked'
          'Enabled')
      end>
    StorageName = 'cxStorageActiveStore.INI'
    Left = 400
    Top = 8
  end
end
