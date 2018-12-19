inherited SimpleListDemoMainForm: TSimpleListDemoMainForm
  Left = 198
  Top = 139
  Width = 689
  Caption = 'ExpressQuantumTreeList4 SimpleList Demo'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Width = 681
    Caption = 
      'Use Express QuantumTreeList as a ListView replacement (in report' +
      ' mode). Experiment by changing the Options above and also see He' +
      'lp/About for other things to try.'
  end
  inherited sbMain: TStatusBar
    Width = 681
  end
  object cxDBTreeList: TcxDBTreeList [2]
    Left = 0
    Top = 32
    Width = 681
    Height = 360
    Styles.StyleSheet = SimpleListDemoDataDM.TreeListStyleSheetDevExpress
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Primary Info'
        Width = 401
      end
      item
        Caption.Text = 'Secondary Info'
        Width = 1003
      end>
    BufferedPaint = False
    DataController.DataSource = SimpleListDemoDataDM.dsCars
    DataController.ParentField = 'ID'
    DataController.KeyField = 'ID'
    OptionsBehavior.AutomateLeftMostIndent = False
    OptionsBehavior.IncSearchItem = cxDBTreeListTrademark
    OptionsBehavior.IncSearch = True
    OptionsData.Inserting = True
    OptionsSelection.MultiSelect = True
    OptionsView.Bands = True
    OptionsView.GridLineColor = 15451300
    OptionsView.Indicator = True
    OptionsView.ShowRoot = False
    RootValue = -1
    TabOrder = 1
    object cxDBTreeListID: TcxDBTreeListColumn
      Visible = False
      Caption.Text = 'ID'
      DataBinding.FieldName = 'ID'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListTrademark: TcxDBTreeListColumn
      Caption.Text = 'Trademark'
      DataBinding.FieldName = 'Trademark'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListModel: TcxDBTreeListColumn
      Caption.Text = 'Model'
      DataBinding.FieldName = 'Model'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListPicture: TcxDBTreeListColumn
      RepositoryItem = eriPicture
      Caption.Text = 'Picture'
      DataBinding.FieldName = 'Picture'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListPrice: TcxDBTreeListColumn
      Caption.Text = 'Price'
      DataBinding.FieldName = 'Price'
      Width = 101
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxDBTreeListHP: TcxDBTreeListColumn
      RepositoryItem = eriHP
      Caption.Text = 'HP'
      DataBinding.FieldName = 'HP'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListLiter: TcxDBTreeListColumn
      RepositoryItem = eriLiter
      Caption.Text = 'Liter'
      DataBinding.FieldName = 'Liter'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListCyl: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositorySpinItem
      Caption.Text = 'Cyl'
      DataBinding.FieldName = 'Cyl'
      Width = 101
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListTransmissSpeedCount: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositorySpinItem
      Caption.Text = 'TransmissSpeedCount'
      DataBinding.FieldName = 'TransmissSpeedCount'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListTransmissAutomatic: TcxDBTreeListColumn
      RepositoryItem = eriTransmissAuto
      Caption.Text = 'TransmissAutomatic'
      DataBinding.FieldName = 'TransmissAutomatic'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListMPG_City: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositorySpinItem
      Caption.Text = 'MPG_City'
      DataBinding.FieldName = 'MPG_City'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListMPG_Highway: TcxDBTreeListColumn
      RepositoryItem = cxEditRepositorySpinItem
      Caption.Text = 'MPG_Highway'
      DataBinding.FieldName = 'MPG_Highway'
      Width = 101
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListCategory: TcxDBTreeListColumn
      Caption.Text = 'Category'
      DataBinding.FieldName = 'Category'
      Width = 101
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListHyperlink: TcxDBTreeListColumn
      RepositoryItem = eriURL
      Caption.Text = 'Hyperlink'
      DataBinding.FieldName = 'Hyperlink'
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object cxDBTreeListDescription: TcxDBTreeListColumn
      RepositoryItem = eriDescription
      Caption.Text = 'Description'
      DataBinding.FieldName = 'Description'
      Position.ColIndex = 9
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
  end
  inherited memAboutText: TMemo
    Left = 552
    Top = 280
    Lines.Strings = (
      'In this demo you can:'
      ''
      '- try the TreeList options'
      ''
      '- practice Incremental Search (type any Trademark)'
      ''
      '- display resizable images by clicking on the focused icon'
      ''
      
        '- click on column headers to sort (hold down the shift key for s' +
        'orting multiple columns)'
      ' '
      
        '- reorder columns using drag&drop facilities (drag any column he' +
        'ader and drop it to the required place)'
      ''
      '- insert/delete records (via the Ins/Ctrl+Del keys)'
      ''
      '- delete several records at once using the Multi Select option'
      ''
      '- check how little source code is required'
      ''
      
        '- NOTE: if you haven'#39't done so already, you might like to practi' +
        'ce by completing the tutorial version of this demo (see the tuto' +
        'rials folder)')
    TabOrder = 2
  end
  inherited mmMain: TMainMenu
    inherited miOptions: TMenuItem
      object miView: TMenuItem [0]
        Caption = '&View'
        object miBands: TMenuItem
          Caption = '&Bands'
          Checked = True
          Hint = 'Shows/hides bands within a tree list control'
          OnClick = miBandsClick
        end
        object miHeaders: TMenuItem
          Caption = '&Headers'
          Checked = True
          Hint = 'Shows/hides column headers within a tree list control'
          OnClick = miHeadersClick
        end
        object miGridLines: TMenuItem
          Caption = 'Grid &Lines'
          Hint = 'Displays lines that separate TreeList items'
          OnClick = miGridLinesClick
        end
      end
      object miBehavior: TMenuItem [1]
        Caption = '&Behavior'
        object miIncSearch: TMenuItem
          Caption = '&Incremental Search'
          Checked = True
          Hint = 
            'Enables a user to start typing and make the TreeList automatical' +
            'ly navigate to the closest match'
          OnClick = miIncSearchClick
        end
        object miFocusCellOnCycle: TMenuItem
          Caption = 'Focus Cell On &Cycle'
          Hint = 
            'Enables moving focus to the next row after it reaches the last c' +
            'ell within the current row'
          OnClick = miFocusCellOnCycleClick
        end
        object miImmediateEditor: TMenuItem
          Caption = 'Imme&diate Editor'
          Checked = True
          Hint = 
            'If checked, a specific column editor is activated when a user cl' +
            'icks an appropriate cell'
          OnClick = miImmediateEditorClick
        end
      end
      object miMultiSelect: TMenuItem [2]
        Caption = '&Multi Select'
        Checked = True
        Hint = 'Enables multiple rows  selection'
        OnClick = miMultiSelectClick
      end
      object miSeparator1: TMenuItem [3]
        Caption = '-'
      end
      object miGridLookFeel: TMenuItem [4]
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = '&Kind'
          object miFlat: TMenuItem
            Caption = '&Flat'
            GroupIndex = 1
            Hint = 'Setting this option changes the demo appearance to Flat style'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object miStandard: TMenuItem
            Tag = 1
            Caption = '&Standard'
            GroupIndex = 1
            Hint = 
              'Setting this option changes the demo appearance to Standard styl' +
              'e'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object miUltraFlat: TMenuItem
            Tag = 2
            Caption = '&Ultra Flat'
            Checked = True
            GroupIndex = 1
            Hint = 
              'Setting this option changes the demo appearance to Ultra Flat st' +
              'yle'
            RadioItem = True
            OnClick = LookAndFeelChange
          end
          object Office111: TMenuItem
            Tag = 3
            Caption = 'Office 11'
            GroupIndex = 1
            RadioItem = True
            OnClick = LookAndFeelChange
          end
        end
        object miNativeStyle: TMenuItem
          Tag = 4
          Caption = '&Native Style'
          Hint = 'Setting this option changes the demo appearance to Native style'
          OnClick = LookAndFeelChange
        end
      end
      object miSeparator2: TMenuItem [5]
        Caption = '-'
      end
    end
  end
  object cxEditRepository: TcxEditRepository
    Left = 352
    Top = 8
    object cxEditRepositorySpinItem: TcxEditRepositorySpinItem
      Properties.SpinButtons.ShowFastButtons = True
    end
    object eriPicture: TcxEditRepositoryBlobItem
      Properties.BlobEditKind = bekPict
      Properties.PictureGraphicClassName = 'TJPEGImage'
    end
    object eriHP: TcxEditRepositorySpinItem
      Properties.Increment = 10.000000000000000000
      Properties.LargeIncrement = 100.000000000000000000
      Properties.SpinButtons.ShowFastButtons = True
    end
    object eriLiter: TcxEditRepositorySpinItem
      Properties.Increment = 0.100000000000000000
      Properties.LargeIncrement = 1.000000000000000000
    end
    object eriTransmissAuto: TcxEditRepositoryCheckBoxItem
      Properties.ValueChecked = 'Yes'
      Properties.ValueUnchecked = 'No'
    end
    object eriDescription: TcxEditRepositoryBlobItem
      Properties.BlobEditKind = bekMemo
      Properties.MemoScrollBars = ssVertical
      Properties.PictureGraphicClassName = 'TJPEGImage'
    end
    object eriURL: TcxEditRepositoryHyperLinkItem
    end
  end
end
