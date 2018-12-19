object fmMain: TfmMain
  Left = 179
  Top = 110
  Width = 788
  Height = 598
  Caption = 'ExpressMasterView - Columns Demo'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtom: TPanel
    Left = 0
    Top = 400
    Width = 780
    Height = 171
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlButtom'
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 130
      Width = 780
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 60
        Height = 13
        Caption = 'CurrentLevel'
      end
      object Label2: TLabel
        Left = 208
        Top = 16
        Width = 69
        Height = 13
        Caption = 'CurrentColumn'
      end
      object cmbLevels: TComboBox
        Left = 80
        Top = 8
        Width = 113
        Height = 21
        ItemHeight = 13
        Items.Strings = (
          'MasterViewLevel1'
          'MasterViewLevel2')
        TabOrder = 0
        Text = 'cmbLevels'
        OnChange = cmbLevelsChange
      end
      object cmbColumns: TComboBox
        Left = 280
        Top = 8
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'cmbColumns'
        OnChange = cmbColumnsChange
      end
      object btnPreview: TButton
        Left = 440
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Preview...'
        TabOrder = 2
        OnClick = btnPreviewClick
      end
      object btnPrint: TButton
        Left = 520
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Print...'
        TabOrder = 3
        OnClick = btnPrintClick
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 780
      Height = 130
      ActivePage = tsMasterView
      Align = alClient
      TabOrder = 1
      object tsMasterView: TTabSheet
        Caption = 'MasterView'
        object Bevel1: TBevel
          Left = 1
          Top = 8
          Width = 95
          Height = 9
          Shape = bsTopLine
        end
        object Label25: TLabel
          Left = 8
          Top = 2
          Width = 78
          Height = 13
          Caption = 'OptionsBehavior'
        end
        object Bevel2: TBevel
          Left = 136
          Top = 8
          Width = 257
          Height = 9
          Shape = bsTopLine
        end
        object Label26: TLabel
          Left = 240
          Top = 2
          Width = 59
          Height = 13
          Caption = 'OptionsView'
        end
        object btncustomize: TButton
          Left = 496
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Customize'
          TabOrder = 0
          OnClick = btncustomizeClick
        end
        object chbMultiSelect: TCheckBox
          Left = 0
          Top = 16
          Width = 97
          Height = 17
          Caption = 'mobMultiSelect'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = chbMultiSelectClick
        end
        object chbUseIndent: TCheckBox
          Tag = 1
          Left = 0
          Top = 32
          Width = 97
          Height = 17
          Caption = 'mobUseIndent'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = chbMultiSelectClick
        end
        object chbDrawEndEllipsis: TCheckBox
          Tag = 4
          Left = 144
          Top = 50
          Width = 121
          Height = 17
          Caption = 'movDrawEndEllipsis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = chbMultiSelectClick
        end
        object chbHideFocusRect: TCheckBox
          Tag = 5
          Left = 144
          Top = 67
          Width = 121
          Height = 17
          Caption = 'movHideFocusRect'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = chbMultiSelectClick
        end
        object chbHideSelection: TCheckBox
          Tag = 6
          Left = 144
          Top = 83
          Width = 129
          Height = 17
          Caption = 'movHideSelection'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = chbMultiSelectClick
        end
        object chbKeepColumnWidths: TCheckBox
          Tag = 7
          Left = 272
          Top = 16
          Width = 121
          Height = 17
          Caption = 'movKeepColumnWidths'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = chbMultiSelectClick
        end
        object chbTransparentDragAndDrop: TCheckBox
          Tag = 8
          Left = 272
          Top = 33
          Width = 169
          Height = 17
          Caption = 'movTransparentDragAndDrop'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = chbMultiSelectClick
        end
        object chbAutoColumnWidth: TCheckBox
          Tag = 3
          Left = 144
          Top = 33
          Width = 129
          Height = 17
          Caption = 'movAutoColumnWidth'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 8
          OnClick = chbMultiSelectClick
        end
        object chbUseBitmap: TCheckBox
          Tag = 9
          Left = 272
          Top = 50
          Width = 145
          Height = 17
          Caption = 'movUseBitmap'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = chbMultiSelectClick
        end
        object chbUseBitmapToDrawPreview: TCheckBox
          Tag = 10
          Left = 272
          Top = 67
          Width = 177
          Height = 17
          Caption = 'movUseBitmapToDrawPreview'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnClick = chbMultiSelectClick
        end
        object chbAnimation: TCheckBox
          Tag = 2
          Left = 144
          Top = 16
          Width = 97
          Height = 17
          Caption = 'movAnimation'
          TabOrder = 11
          OnClick = chbMultiSelectClick
        end
        object btnFullCollapse: TButton
          Left = 576
          Top = 8
          Width = 75
          Height = 25
          Caption = 'FullCollapse'
          TabOrder = 12
          OnClick = btnFullCollapseClick
        end
        object btnFullExpand: TButton
          Left = 656
          Top = 8
          Width = 75
          Height = 25
          Caption = 'FullExpand'
          TabOrder = 13
          OnClick = btnFullExpandClick
        end
      end
      object tsLevel1: TTabSheet
        Caption = 'Level'
        object Bevel3: TBevel
          Left = 1
          Top = 8
          Width = 112
          Height = 9
          Shape = bsTopLine
        end
        object Label27: TLabel
          Left = 16
          Top = 2
          Width = 78
          Height = 13
          Caption = 'OptionsBehavior'
        end
        object Bevel4: TBevel
          Left = 153
          Top = 9
          Width = 248
          Height = 7
          Shape = bsTopLine
        end
        object Label28: TLabel
          Left = 240
          Top = 2
          Width = 84
          Height = 13
          Caption = 'OptionsCustomize'
        end
        object Bevel5: TBevel
          Left = 1
          Top = 40
          Width = 112
          Height = 9
          Shape = bsTopLine
        end
        object Label29: TLabel
          Left = 32
          Top = 34
          Width = 51
          Height = 13
          Caption = 'OptionsDB'
        end
        object Bevel6: TBevel
          Left = 449
          Top = 8
          Width = 232
          Height = 9
          Shape = bsTopLine
        end
        object Label30: TLabel
          Left = 536
          Top = 2
          Width = 59
          Height = 13
          Caption = 'OptionsView'
        end
        object chbColumnMoving: TCheckBox
          Tag = 1
          Left = 152
          Top = 19
          Width = 113
          Height = 17
          Caption = 'locColumnMoving'
          TabOrder = 0
          OnClick = chbDblClkExpandingClick
        end
        object chbColumnHiding: TCheckBox
          Tag = 2
          Left = 152
          Top = 35
          Width = 97
          Height = 17
          Caption = 'locColumnHiding'
          TabOrder = 1
          OnClick = chbDblClkExpandingClick
        end
        object chbColumnHorSizing: TCheckBox
          Tag = 3
          Left = 152
          Top = 51
          Width = 137
          Height = 17
          Caption = 'locColumnHorSizing'
          TabOrder = 2
          OnClick = chbDblClkExpandingClick
        end
        object chbColumnVerSizing: TCheckBox
          Tag = 4
          Left = 152
          Top = 67
          Width = 137
          Height = 17
          Caption = 'locColumnVerSizing'
          TabOrder = 3
          OnClick = chbDblClkExpandingClick
        end
        object chbColumnSorting: TCheckBox
          Tag = 5
          Left = 152
          Top = 83
          Width = 129
          Height = 17
          Caption = 'locColumnSorting'
          TabOrder = 4
          OnClick = chbDblClkExpandingClick
        end
        object chbColumnGrouping: TCheckBox
          Tag = 6
          Left = 280
          Top = 19
          Width = 121
          Height = 17
          Caption = 'locColumnGrouping'
          TabOrder = 5
          OnClick = chbDblClkExpandingClick
        end
        object chbHideColumnOnGrouping: TCheckBox
          Tag = 7
          Left = 280
          Top = 35
          Width = 161
          Height = 17
          Caption = 'locHideColumnOnGrouping'
          TabOrder = 6
          OnClick = chbDblClkExpandingClick
        end
        object chbShowColumnOnUngrouping: TCheckBox
          Tag = 8
          Left = 280
          Top = 51
          Width = 169
          Height = 17
          Caption = 'locShowColumnOnUngrouping'
          TabOrder = 7
          OnClick = chbDblClkExpandingClick
        end
        object chbDblClkExpanding: TCheckBox
          Left = 0
          Top = 19
          Width = 121
          Height = 17
          Caption = 'lobDblClkExpanding'
          TabOrder = 8
          OnClick = chbDblClkExpandingClick
        end
        object chbSmartLoad: TCheckBox
          Tag = 9
          Left = 0
          Top = 51
          Width = 97
          Height = 17
          Caption = 'lodSmartLoad'
          TabOrder = 9
          OnClick = chbDblClkExpandingClick
        end
        object chbSmartRefresh: TCheckBox
          Tag = 10
          Left = 0
          Top = 67
          Width = 97
          Height = 17
          Caption = 'lodSmartRefresh'
          TabOrder = 10
          OnClick = chbDblClkExpandingClick
        end
        object chbSmartReload: TCheckBox
          Tag = 11
          Left = 0
          Top = 83
          Width = 97
          Height = 17
          Caption = 'lodSmartReload'
          TabOrder = 11
          OnClick = chbDblClkExpandingClick
        end
        object chbCaption: TCheckBox
          Tag = 12
          Left = 456
          Top = 19
          Width = 97
          Height = 17
          Caption = 'lovCaption'
          TabOrder = 12
          OnClick = chbDblClkExpandingClick
        end
        object chbFooter: TCheckBox
          Tag = 13
          Left = 456
          Top = 35
          Width = 97
          Height = 17
          Caption = 'lovFooter'
          TabOrder = 13
          OnClick = chbDblClkExpandingClick
        end
        object chbGrid: TCheckBox
          Tag = 14
          Left = 456
          Top = 51
          Width = 97
          Height = 17
          Caption = 'lovGrid'
          TabOrder = 15
          OnClick = chbDblClkExpandingClick
        end
        object chbGridWithPreview: TCheckBox
          Tag = 15
          Left = 456
          Top = 67
          Width = 121
          Height = 17
          Caption = 'lovGridWithPreview'
          TabOrder = 14
          OnClick = chbDblClkExpandingClick
        end
        object chbGroupByBox: TCheckBox
          Tag = 16
          Left = 456
          Top = 83
          Width = 97
          Height = 17
          Caption = 'lovGroupByBox'
          TabOrder = 16
          OnClick = chbDblClkExpandingClick
        end
        object chbHeader: TCheckBox
          Tag = 17
          Left = 584
          Top = 19
          Width = 97
          Height = 17
          Caption = 'lovHeader'
          TabOrder = 17
          OnClick = chbDblClkExpandingClick
        end
        object chbOccupyRestSpace: TCheckBox
          Tag = 18
          Left = 584
          Top = 35
          Width = 123
          Height = 17
          Caption = 'lovOccupyRestSpace'
          TabOrder = 19
          OnClick = chbDblClkExpandingClick
        end
        object chbPreview: TCheckBox
          Tag = 19
          Left = 584
          Top = 51
          Width = 97
          Height = 17
          Caption = 'lovPreview'
          TabOrder = 18
          OnClick = chbDblClkExpandingClick
        end
      end
      object tsStandartColumn: TTabSheet
        Caption = 'StandardColumn'
        object Label3: TLabel
          Left = 0
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Alignment'
        end
        object Label4: TLabel
          Left = 0
          Top = 32
          Width = 36
          Height = 13
          Caption = 'Caption'
        end
        object Label5: TLabel
          Left = 0
          Top = 56
          Width = 41
          Height = 13
          Caption = 'ColIndex'
        end
        object Label6: TLabel
          Left = 0
          Top = 80
          Width = 50
          Height = 13
          Caption = 'FieldName'
        end
        object Label7: TLabel
          Left = 160
          Top = 8
          Width = 81
          Height = 13
          Caption = 'HeaderAlignment'
        end
        object Label8: TLabel
          Left = 160
          Top = 32
          Width = 108
          Height = 13
          Caption = 'HeaderGlyphAlignment'
        end
        object Label9: TLabel
          Left = 160
          Top = 56
          Width = 70
          Height = 13
          Caption = 'MaxRowCount'
        end
        object Label10: TLabel
          Left = 160
          Top = 80
          Width = 67
          Height = 13
          Caption = 'MinRowCount'
        end
        object Label11: TLabel
          Left = 352
          Top = 8
          Width = 48
          Height = 13
          Caption = 'MaxWidth'
        end
        object Label12: TLabel
          Left = 352
          Top = 32
          Width = 45
          Height = 13
          Caption = 'MinWidth'
        end
        object Label13: TLabel
          Left = 352
          Top = 56
          Width = 50
          Height = 13
          Caption = 'RowCount'
        end
        object Label14: TLabel
          Left = 352
          Top = 80
          Width = 48
          Height = 13
          Caption = 'RowIndex'
        end
        object cmbAlignment: TComboBox
          Left = 52
          Top = 0
          Width = 97
          Height = 21
          ItemHeight = 13
          Items.Strings = (
            'taLeftJustify'
            'taRightJustify'
            'taCenter')
          TabOrder = 0
          Text = 'cmbAlignment'
          OnChange = cmbAlignmentChange
        end
        object edCaption: TEdit
          Left = 52
          Top = 24
          Width = 97
          Height = 21
          TabOrder = 1
          Text = 'edCaption'
          OnChange = edCaptionChange
        end
        object cmbFieldName: TComboBox
          Left = 52
          Top = 72
          Width = 97
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Text = 'cmbFieldName'
          OnChange = cmbFieldNameChange
        end
        object cmbHeaderAlignment: TComboBox
          Left = 272
          Top = 0
          Width = 73
          Height = 21
          ItemHeight = 13
          Items.Strings = (
            'taLeftJustify'
            'taRightJustify'
            'taCenter')
          TabOrder = 3
          Text = 'cmbHeaderAlignment'
          OnChange = cmbHeaderAlignmentChange
        end
        object btnGlyph: TButton
          Left = 496
          Top = 56
          Width = 75
          Height = 25
          Caption = 'HeaderGlyph'
          TabOrder = 4
          OnClick = btnGlyphClick
        end
        object cmbGlyphAlignment: TComboBox
          Left = 272
          Top = 24
          Width = 73
          Height = 21
          ItemHeight = 13
          Items.Strings = (
            'taLeftJustify'
            'taRightJustify'
            'taCenter')
          TabOrder = 5
          Text = 'cmbGlyphAlignment'
          OnChange = cmbGlyphAlignmentChange
        end
        object GroupBox1: TGroupBox
          Left = 584
          Top = 5
          Width = 185
          Height = 68
          Caption = 'Options'
          TabOrder = 6
          object chbGrouping: TCheckBox
            Left = 8
            Top = 13
            Width = 97
            Height = 17
            Caption = 'coGrouping'
            TabOrder = 0
            OnClick = chbGroupingClick
          end
          object chbHidden: TCheckBox
            Tag = 1
            Left = 8
            Top = 29
            Width = 97
            Height = 17
            Caption = 'coHidden'
            TabOrder = 1
            OnClick = chbGroupingClick
          end
          object chbHorSizing: TCheckBox
            Tag = 2
            Left = 8
            Top = 45
            Width = 97
            Height = 17
            Caption = 'coHorSizing'
            TabOrder = 2
            OnClick = chbGroupingClick
          end
          object chbMoving: TCheckBox
            Tag = 3
            Left = 96
            Top = 13
            Width = 81
            Height = 17
            Caption = 'coMoving'
            TabOrder = 3
            OnClick = chbGroupingClick
          end
          object chbSorting: TCheckBox
            Tag = 4
            Left = 96
            Top = 29
            Width = 81
            Height = 17
            Caption = 'coSorting'
            TabOrder = 4
            OnClick = chbGroupingClick
          end
          object chbVerSizing: TCheckBox
            Tag = 5
            Left = 96
            Top = 45
            Width = 81
            Height = 17
            Caption = 'coVerSizing'
            TabOrder = 5
            OnClick = chbGroupingClick
          end
        end
        object chbMultiLine: TCheckBox
          Left = 496
          Top = 8
          Width = 73
          Height = 17
          Caption = 'MultiLine'
          TabOrder = 7
          OnClick = chbMultiLineClick
        end
        object chbVisible: TCheckBox
          Left = 496
          Top = 32
          Width = 73
          Height = 17
          Caption = 'Visible'
          TabOrder = 8
          OnClick = chbVisibleClick
        end
        object sedColIndex: TCSpinEdit
          Left = 52
          Top = 48
          Width = 97
          Height = 22
          TabStop = True
          ParentColor = False
          TabOrder = 9
          OnChange = sedColIndexChange
        end
        object sedMaxRowCount: TCSpinEdit
          Left = 272
          Top = 48
          Width = 73
          Height = 22
          TabStop = True
          ParentColor = False
          TabOrder = 10
          OnChange = sedMaxRowCountChange
        end
        object sedMinRowCount: TCSpinEdit
          Left = 272
          Top = 72
          Width = 73
          Height = 22
          TabStop = True
          ParentColor = False
          TabOrder = 11
          OnChange = sedMinRowCountChange
        end
        object sedMaxWidth: TCSpinEdit
          Left = 405
          Top = 0
          Width = 73
          Height = 22
          TabStop = True
          ParentColor = False
          TabOrder = 12
          OnChange = sedMaxWidthChange
        end
        object sedMinWidth: TCSpinEdit
          Left = 405
          Top = 24
          Width = 73
          Height = 22
          TabStop = True
          ParentColor = False
          TabOrder = 13
          OnChange = sedMinWidthChange
        end
        object sedRowCount: TCSpinEdit
          Left = 405
          Top = 48
          Width = 73
          Height = 22
          TabStop = True
          ParentColor = False
          TabOrder = 14
          OnChange = sedRowCountChange
        end
        object sedRowIndex: TCSpinEdit
          Left = 405
          Top = 72
          Width = 73
          Height = 22
          TabStop = True
          ParentColor = False
          TabOrder = 15
          OnChange = sedRowIndexChange
        end
      end
      object tsGraphicColumn: TTabSheet
        Caption = 'GraphicColumn'
        object Label32: TLabel
          Left = 8
          Top = 56
          Width = 65
          Height = 13
          Caption = 'Transparency'
        end
        object chbBlendedSelection: TCheckBox
          Left = 8
          Top = 0
          Width = 113
          Height = 17
          Caption = 'BlendedSelection'
          TabOrder = 0
          OnClick = chbBlendedSelectionClick
        end
        object chbCustomGraphic: TCheckBox
          Tag = 1
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'CustomGraphic'
          TabOrder = 1
          OnClick = chbBlendedSelectionClick
        end
        object chbStretch: TCheckBox
          Tag = 2
          Left = 8
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Stretch'
          TabOrder = 2
          OnClick = chbBlendedSelectionClick
        end
        object cmbTransparency: TComboBox
          Left = 78
          Top = 53
          Width = 91
          Height = 21
          ItemHeight = 13
          Items.Strings = (
            'tpDefault'
            'tpOpaque'
            'tpTransparent')
          TabOrder = 3
          Text = 'cmbTransparency'
          OnChange = cmbTransparencyChange
        end
      end
      object tsImageColumn: TTabSheet
        Caption = 'ImageColumn'
        object chbShowDescription: TCheckBox
          Left = 8
          Top = 16
          Width = 105
          Height = 17
          Caption = 'ShowDescription'
          TabOrder = 0
          OnClick = chbShowDescriptionClick
        end
      end
      object tsCheckColumn: TTabSheet
        Caption = 'CheckColumn'
        object Label15: TLabel
          Left = 8
          Top = 32
          Width = 77
          Height = 13
          Caption = 'DisplayChecked'
        end
        object Label16: TLabel
          Left = 8
          Top = 56
          Width = 52
          Height = 13
          Caption = 'DisplayNull'
        end
        object Label17: TLabel
          Left = 8
          Top = 80
          Width = 90
          Height = 13
          Caption = 'DisplayUnchecked'
        end
        object Label18: TLabel
          Left = 184
          Top = 32
          Width = 90
          Height = 13
          Caption = 'ShowNullFieldStyle'
        end
        object Label19: TLabel
          Left = 184
          Top = 56
          Width = 70
          Height = 13
          Caption = 'ValueChecked'
        end
        object Label20: TLabel
          Left = 184
          Top = 80
          Width = 83
          Height = 13
          Caption = 'ValueUnchecked'
        end
        object chbBorder3D: TCheckBox
          Left = 8
          Top = 8
          Width = 81
          Height = 17
          Caption = 'Border3D'
          TabOrder = 0
          OnClick = chbBorder3DClick
        end
        object edDisplayChecked: TEdit
          Left = 104
          Top = 24
          Width = 65
          Height = 21
          TabOrder = 1
          Text = 'edDisplayChecked'
          OnChange = edDisplayCheckedChange
        end
        object edDisplayNull: TEdit
          Left = 104
          Top = 48
          Width = 65
          Height = 21
          TabOrder = 2
          Text = 'edDisplayNull'
          OnChange = edDisplayNullChange
        end
        object edDisplayUnchecked: TEdit
          Left = 104
          Top = 72
          Width = 65
          Height = 21
          TabOrder = 3
          Text = 'edDisplayUnchecked'
          OnChange = edDisplayUncheckedChange
        end
        object cmbShowNullFieldStyle: TComboBox
          Left = 280
          Top = 24
          Width = 81
          Height = 21
          ItemHeight = 13
          Items.Strings = (
            'nfsUnchecked'
            'nfsInactive'
            'nfsGrayedChecked')
          TabOrder = 4
          Text = 'cmbShowNullFieldStyle'
          OnChange = cmbShowNullFieldStyleChange
        end
        object edValueChecked: TEdit
          Left = 280
          Top = 48
          Width = 81
          Height = 21
          TabOrder = 5
          Text = 'edValueChecked'
          OnChange = edValueCheckedChange
        end
        object edValueUnchecked: TEdit
          Left = 280
          Top = 72
          Width = 81
          Height = 21
          TabOrder = 6
          Text = 'edValueUnchecked'
          OnChange = edValueUncheckedChange
        end
      end
      object tsSummary: TTabSheet
        Caption = 'Summary'
        object Label21: TLabel
          Left = 8
          Top = 16
          Width = 93
          Height = 13
          Caption = 'SummaryFieldName'
        end
        object Label22: TLabel
          Left = 8
          Top = 48
          Width = 75
          Height = 13
          Caption = 'SummaryFormat'
        end
        object Label23: TLabel
          Left = 8
          Top = 80
          Width = 67
          Height = 13
          Caption = 'SummaryType'
        end
        object Label24: TLabel
          Left = 216
          Top = 16
          Width = 76
          Height = 13
          Caption = 'FooterAlignment'
        end
        object Label31: TLabel
          Left = 224
          Top = 40
          Width = 241
          Height = 13
          Caption = 'To activate Footer, turn  lovFooter on the Level tab'
        end
        object cmbSummaryFieldName: TComboBox
          Left = 104
          Top = 8
          Width = 97
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'cmbSummaryFieldName'
          OnChange = cmbSummaryFieldNameChange
        end
        object cmbSummaryType: TComboBox
          Left = 104
          Top = 72
          Width = 97
          Height = 21
          ItemHeight = 13
          Items.Strings = (
            'stNone'
            'stSum'
            'stMin'
            'stMax'
            'stCount'
            'stAverage')
          TabOrder = 1
          Text = 'cmbSummaryType'
          OnChange = cmbSummaryTypeChange
        end
        object cmbFooterAlignment: TComboBox
          Left = 296
          Top = 8
          Width = 89
          Height = 21
          ItemHeight = 13
          Items.Strings = (
            'taLeftJustify'
            'taRightJustify'
            'taCenter')
          TabOrder = 2
          Text = 'cmbFooterAlignment'
          OnChange = cmbFooterAlignmentChange
        end
        object edSummaryFormat: TEdit
          Left = 104
          Top = 40
          Width = 97
          Height = 21
          TabOrder = 3
          Text = 'edSummaryFormat'
          OnChange = edSummaryFormatChange
        end
      end
    end
  end
  object MasterView: TdxMasterView
    Left = 0
    Top = 0
    Width = 780
    Height = 400
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OptionsView = [movAnimation, movAutoColumnWidth, movHideSelection, movKeepColumnWidths, movTransparentDragAndDrop, movUseBitmapToDrawPreview]
    object HeaderStyle: TdxMasterViewStyle
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      AssignedValues = [svColor, svFont]
    end
    object MasterViewLevel1: TdxMasterViewLevel
      Caption = 'Events'
      DataSource = dsEvents
      ID = 'EventNo'
      OptionsCustomizeBox = [loxCaption, loxColumns, loxFooter, loxGrid, loxGridWithPreview, loxGroupByBox, loxHeader, loxOccupyRestSpace, loxPreview, loxViewMode]
      OptionsDB = [lodConfirmDelete, lodSmartReload]
      OptionsView = [lovGrid, lovGridWithPreview, lovGroupByBox, lovHeader, lovOccupyRestSpace]
      PreviewFieldName = 'Event_Description'
      object Level1EventNo: TdxMasterViewColumn
        FieldName = 'EventNo'
        RowIndex = 0
        ColIndex = 0
      end
      object Level1VenueNo: TdxMasterViewColumn
        FieldName = 'VenueNo'
        RowIndex = 0
        ColIndex = 1
      end
      object Level1Event_Name: TdxMasterViewColumn
        Caption = 'Event Name'
        FieldName = 'Event_Name'
        RowIndex = 0
        ColIndex = 2
        Width = 641
      end
      object Level1Event_Date: TdxMasterViewColumn
        Caption = 'Event Date'
        FieldName = 'Event_Date'
        RowIndex = 1
        ColIndex = 1
        Width = 179
      end
      object Level1Event_Time: TdxMasterViewColumn
        Caption = 'Event Time'
        FieldName = 'Event_Time'
        RowIndex = 2
        ColIndex = 1
        Width = 179
      end
      object Level1Event_Description: TdxMasterViewColumn
        Caption = 'Event Description'
        FieldName = 'Event_Description'
        MultiLine = True
        RowIndex = 1
        ColIndex = 0
        RowCount = 4
        SortIndex = 0
        SortOrder = soAscending
        Width = 462
      end
      object Level1Ticket_price: TdxMasterViewColumn
        Caption = 'Ticket Price'
        FieldName = 'Ticket_price'
        RowIndex = 3
        ColIndex = 1
        RowCount = 2
        Width = 179
      end
      object Level1Event_Photo: TdxMasterViewGraphicColumn
        Caption = 'Event Photo'
        FieldName = 'Event_Photo'
        RowIndex = 0
        ColIndex = 3
        RowCount = 5
        Width = 196
      end
      object Level1Priority: TdxMasterViewImageColumn
        FieldName = 'Priority'
        RowIndex = 1
        ColIndex = 3
        RowCount = 4
        Width = 151
        Images = ImageList
        Items.Items = (
          (
            '0'
            0
            'Low')
          (
            '1'
            1
            'Normal')
          (
            '2'
            2
            'High'))
      end
      object Level1Low_Price: TdxMasterViewCheckColumn
        Caption = 'Low Price'
        FieldName = 'Low_Price'
        RowIndex = 0
        ColIndex = 4
        Width = 151
        DisplayChecked = 'Y'
        DisplayNull = 'null'
        DisplayUnchecked = 'N'
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object MasterViewLevel2: TdxMasterViewLevel
        Caption = 'Venues'
        DataSource = dsVenues
        DetailKey = 'VenueNo'
        ID = 'VenueNo'
        MasterKey = 'VenueNo'
        OptionsDB = [lodConfirmDelete, lodSmartReload]
        ViewMode = vmVertical
        HeaderWidths = (
          -1
          -1)
        object Level2VenueNo: TdxMasterViewColumn
          FieldName = 'VenueNo'
          RowIndex = 0
          ColIndex = 0
        end
        object Level2Venue: TdxMasterViewColumn
          FieldName = 'Venue'
          RowIndex = 1
          ColIndex = 0
        end
        object Level2Capacity: TdxMasterViewColumn
          FieldName = 'Capacity'
          RowIndex = 2
          ColIndex = 0
        end
        object Level2Venue_Map: TdxMasterViewGraphicColumn
          Caption = 'Venue Map'
          FieldName = 'Venue_Map'
          RowIndex = 0
          ColIndex = 1
          RowCount = 8
          Width = 282
        end
        object Level2Remarks: TdxMasterViewColumn
          FieldName = 'Remarks'
          MultiLine = True
          RowIndex = 3
          ColIndex = 0
          RowCount = 5
        end
      end
    end
  end
  object tbEvents: TTable
    Active = True
    OnCalcFields = tbEventsCalcFields
    DatabaseName = 'DBDEMOS'
    FieldDefs = <
      item
        Name = 'EventNo'
        DataType = ftAutoInc
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'VenueNo'
        DataType = ftInteger
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Event_Name'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 30
      end
      item
        Name = 'Event_Date'
        DataType = ftDate
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Event_Time'
        DataType = ftTime
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Event_Description'
        DataType = ftMemo
        Precision = 0
        Required = False
        Size = 100
      end
      item
        Name = 'Ticket_price'
        DataType = ftCurrency
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Event_Photo'
        DataType = ftGraphic
        Precision = 0
        Required = False
        Size = 0
      end>
    StoreDefs = True
    TableName = 'events.db'
    Left = 56
    Top = 24
    object tbEventsEventNo: TAutoIncField
      FieldName = 'EventNo'
      ReadOnly = True
    end
    object tbEventsVenueNo: TIntegerField
      FieldName = 'VenueNo'
    end
    object tbEventsEvent_Name: TStringField
      FieldName = 'Event_Name'
      Size = 30
    end
    object tbEventsEvent_Date: TDateField
      FieldName = 'Event_Date'
    end
    object tbEventsEvent_Time: TTimeField
      FieldName = 'Event_Time'
    end
    object tbEventsEvent_Description: TMemoField
      FieldName = 'Event_Description'
      BlobType = ftMemo
      Size = 100
    end
    object tbEventsTicket_price: TCurrencyField
      FieldName = 'Ticket_price'
    end
    object tbEventsEvent_Photo: TGraphicField
      FieldName = 'Event_Photo'
      BlobType = ftGraphic
    end
    object tbEventsPriority: TSmallintField
      FieldName = 'Priority'
      Calculated = True
    end
    object tbEventsLow_Price: TStringField
      FieldName = 'Low_Price'
      Calculated = True
    end
  end
  object dsEvents: TDataSource
    DataSet = tbEvents
    Left = 88
    Top = 24
  end
  object ImageList: TImageList
    Left = 120
    Top = 24
    Bitmap = {
      3609000003000000424D36090000000000003600000028000000300000001000
      0000010018000000000000090000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000C6C6C6C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6C6C6C6
      848400008400008400848400848400C6C6C60000000000000000000000000000
      00000000000000000000000000000000000000C6C6C6C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      C6C6C6FF0000840000C6C6C60000000000000000000000000000000000000000
      00000000000000C6C6C600840000840000840000840000840000840000840000
      8400C6C6C6000000000000000000000000000000000000000000000000000000
      C6C6C60000FF000084C6C6C60000000000000000000000000000000000000000
      00000000000000000000000000C6C6C6FF0000FF0000FF0000840000C6C6C600
      0000000000000000000000000000000000000000C6C6C6008400008400008400
      000000000000000000008400008400008400008400C6C6C60000000000000000
      00000000000000000000000000C6C6C60000FF0000FF0000FF000084C6C6C600
      0000000000000000000000000000000000000000000000000000C6C6C6FF0000
      FF0000FF0000FF0000FF0000840000C6C6C60000000000000000000000000000
      00C6C6C600FF0000840000000000000000000000000000000000000000000000
      8400008400C6C6C6000000000000000000000000000000000000000000000000
      C6C6C60000FF000084C6C6C60000000000000000000000000000000000000000
      00000000000000000000C6C6C6C6C6C6C6C6C6FF0000840000C6C6C6C6C6C6C6
      C6C6000000000000000000000000000000C6C6C600FF00008400000000000000
      000000000000000000000000000000008400008400848400C6C6C60000000000
      00000000000000000000000000000000000000C6C6C6C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      C6C6C6FF0000840000C6C6C60000000000000000000000000000000000000000
      00C6C6C600840000000000000000000000000000000000000000000000000000
      0000008400008400C6C6C6000000000000000000000000000000000000000000
      C6C6C60000FF000084C6C6C60000000000000000000000000000000000000000
      00000000000000000000000000000000C6C6C6FF0000840000C6C6C600000000
      0000000000000000000000000000000000C6C6C6008400000000000000000000
      000000000000000000000000000000000000008400008400C6C6C60000000000
      00000000000000000000000000000000C6C6C60000FF000084C6C6C600000000
      0000000000000000000000000000000000000000000000000000000000000000
      C6C6C6FF0000840000C6C6C60000000000000000000000000000000000000000
      00C6C6C600840000840000000000000000000000000000000000000000000000
      0000008400848400C6C6C6000000000000000000000000000000000000C6C6C6
      0000FF0000FF0000FF000084C6C6C60000000000000000000000000000000000
      00000000000000000000000000000000C6C6C6FF0000840000C6C6C600000000
      0000000000000000000000000000000000C6C6C600FF00008400000000000000
      000000000000000000000000000000008400008400C6C6C60000000000000000
      00000000000000000000000000C6C6C60000FF0000FF0000FF000084C6C6C600
      0000000000000000000000000000000000000000000000000000000000000000
      C6C6C6FF0000840000C6C6C60000000000000000000000000000000000000000
      00000000C6C6C600840000000000000000000000000000000000000000000000
      8400008400C6C6C6000000000000000000000000000000000000000000C6C6C6
      0000FF0000FF0000FF000084C6C6C60000000000000000000000000000000000
      00000000000000000000000000000000C6C6C6FF0000840000C6C6C600000000
      0000000000000000000000000000000000000000C6C6C600FF00008400008400
      008400000000000000008400008400008400C6C6C60000000000000000000000
      00000000000000000000000000C6C6C60000FF0000FF0000FF000084C6C6C600
      0000000000000000000000000000000000000000000000000000000000000000
      C6C6C6C6C6C6C6C6C6C6C6C60000000000000000000000000000000000000000
      00000000000000C6C6C6C6C6C600FF0000840000840000840000FF00C6C6C6C6
      C6C6000000000000000000000000000000000000000000000000000000000000
      C6C6C60000FF000084C6C6C60000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C60000000000000000000000000000000000000000
      00000000000000000000000000000000000000C6C6C6C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000424D
      BE000000000000003E0000002800000030000000100000000100010000000000
      800000000000000000000000020000000200000000000000FFFFFF00FFFFFFFF
      FFFF0000FFFFFC1FFFFF0000FE7FF00FFE7F0000FC3FE007FC3F0000F81FC383
      F81F0000F00F8FE3FC3F0000F00F8FE1FE7F0000FC3F9FF1FC3F0000FC3F9FF1
      FC3F0000FC3F8FF1F81F0000FC3F8FE3F81F0000FC3FCFE3F81F0000FC3FC187
      F81F0000FC3FE00FFC3F0000FFFFF83FFE7F0000FFFFFFFFFFFF0000}
  end
  object tbVenues: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    FieldDefs = <
      item
        Name = 'VenueNo'
        DataType = ftAutoInc
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Venue'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 30
      end
      item
        Name = 'Capacity'
        DataType = ftInteger
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Venue_Map'
        DataType = ftGraphic
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Remarks'
        DataType = ftMemo
        Precision = 0
        Required = False
        Size = 80
      end>
    StoreDefs = True
    TableName = 'venues.db'
    Left = 56
    Top = 56
  end
  object dsVenues: TDataSource
    DataSet = tbVenues
    Left = 88
    Top = 56
  end
  object odpOpenGlyph: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 120
    Top = 56
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.RegistryPath = 'Software\Developer Express\PrintingSystem\DesignTime'
    Left = 640
    Top = 538
    object dxComponentPrinter1Link1: TdxMasterViewReportLink
      Active = True
      Component = MasterView
      DateTime = 36937.245373495370000000
      DesignerHelpContext = 0
      PrinterPage.CenterOnPageH = True
      PrinterPage.Footer = 250
      PrinterPage.Header = 250
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      AutoNodesExpand = True
      CaptionNodeFont.Charset = DEFAULT_CHARSET
      CaptionNodeFont.Color = clWindowText
      CaptionNodeFont.Height = -11
      CaptionNodeFont.Name = 'Times New Roman'
      CaptionNodeFont.Style = []
      DrawMode = mvdmBorrowSource
      EvenFont.Charset = DEFAULT_CHARSET
      EvenFont.Color = clWindowText
      EvenFont.Height = -11
      EvenFont.Name = 'Times New Roman'
      EvenFont.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Times New Roman'
      FooterFont.Style = []
      GroupNodeFont.Charset = DEFAULT_CHARSET
      GroupNodeFont.Color = clWindowText
      GroupNodeFont.Height = -11
      GroupNodeFont.Name = 'Times New Roman'
      GroupNodeFont.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'Times New Roman'
      HeaderFont.Style = []
      OddFont.Charset = DEFAULT_CHARSET
      OddFont.Color = clWindowText
      OddFont.Height = -11
      OddFont.Name = 'Times New Roman'
      OddFont.Style = []
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clWindowText
      PreviewFont.Height = -11
      PreviewFont.Name = 'Times New Roman'
      PreviewFont.Style = []
      Left = 376
      Top = 271
    end
  end
end