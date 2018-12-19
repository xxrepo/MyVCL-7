object fmMain: TfmMain
  Left = 226
  Top = 108
  Width = 732
  Height = 582
  Caption = 'ExpressMasterView - Self-referenced table demo'
  PixelsPerInch = 96
  TextHeight = 13
  object MasterView: TdxMasterView
    Left = 0
    Top = 0
    Width = 724
    Height = 488
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OptionsView = [movAnimation, movAutoColumnWidth, movHideFocusRect, movKeepColumnWidths, movTransparentDragAndDrop, movUseBitmapToDrawPreview]
    object MasterViewStyle1: TdxMasterViewStyle
      Color = 16777088
      AssignedValues = [svColor]
    end
    object MasterViewStyle2: TdxMasterViewStyle
      AnotherColor = 13434828
      Color = 8453888
      AssignedValues = [svAnotherColor, svColor]
    end
    object MasterViewStyle3: TdxMasterViewStyle
      Color = clYellow
      AssignedValues = [svColor]
    end
    object MasterViewStyle4: TdxMasterViewStyle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      AssignedValues = [svFont]
    end
    object MasterViewStyle5: TdxMasterViewStyle
      AnotherColor = 8453888
      Color = 13434828
      AssignedValues = [svAnotherColor, svColor]
    end
    object lvlProducts: TdxMasterViewLevel
      Caption = 'Products'
      ContentStyle = MasterViewStyle1
      DataSource = DataSource1
      ID = 'Pr_id'
      LevelSeparatorWidth = 1
      OptionsView = [lovGridWithPreview, lovOccupyRestSpace]
      RowSeparatorWidth = 1
      OnFilterRecord = lvlProductsFilterRecord
      object lvlProductsPr_name: TdxMasterViewColumn
        FieldName = 'Pr_name'
        RowIndex = 0
        ColIndex = 0
        RowCount = 2
        Width = 144
      end
      object lvlProductsPr_info: TdxMasterViewColumn
        FieldName = 'Pr_info'
        MultiLine = True
        RowIndex = 0
        ColIndex = 1
        RowCount = 2
        Width = 508
      end
      object lvlControls: TdxMasterViewLevel
        Caption = 'Controls'
        ContentStyle = MasterViewStyle2
        DataSource = DataSource1
        DetailKey = 'Pr_parent'
        ID = 'Pr_id'
        LevelSeparatorWidth = 1
        MasterKey = 'Pr_id'
        OptionsView = [lovGridWithPreview, lovOccupyRestSpace]
        object lvlControlsPr_name: TdxMasterViewColumn
          FieldName = 'Pr_name'
          RowIndex = 0
          ColIndex = 0
          RowCount = 2
          Width = 114
        end
        object lvlControlsPr_info: TdxMasterViewColumn
          ContentStyle = MasterViewStyle5
          FieldName = 'Pr_info'
          MultiLine = True
          RowIndex = 0
          ColIndex = 1
          RowCount = 2
          Width = 519
        end
        object lvlComponents: TdxMasterViewLevel
          Caption = 'Components'
          ContentStyle = MasterViewStyle3
          DataSource = DataSource1
          DetailKey = 'Pr_parent'
          ID = 'Pr_id'
          MasterKey = 'Pr_id'
          OptionsView = [lovGridWithPreview, lovOccupyRestSpace]
          object lvlComponentsPr_name: TdxMasterViewColumn
            ContentStyle = MasterViewStyle4
            FieldName = 'Pr_name'
            RowIndex = 0
            ColIndex = 0
            Width = 171
          end
          object lvlComponentsPr_info: TdxMasterViewColumn
            FieldName = 'Pr_info'
            MultiLine = True
            RowIndex = 0
            ColIndex = 1
            Width = 461
          end
        end
      end
    end
  end
  object plBottom: TPanel
    Left = 0
    Top = 488
    Width = 724
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnFullCollapse: TButton
      Left = 96
      Top = 16
      Width = 75
      Height = 25
      Caption = 'FullCollapse'
      TabOrder = 0
      OnClick = btnFullCollapseClick
    end
    object btnFullExpand: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'FullExpand'
      TabOrder = 1
      OnClick = btnFullExpandClick
    end
    object Customize: TButton
      Left = 208
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Customize'
      TabOrder = 2
      OnClick = CustomizeClick
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 524
    Top = 28
  end
  object Table1: TTable
    Active = True
    DatabaseName = '..\SelfRef'
    FieldDefs = <
      item
        Name = 'Pr_id'
        DataType = ftInteger
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Pr_parent'
        DataType = ftInteger
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Pr_name'
        DataType = ftString
        Precision = 0
        Required = False
        Size = 50
      end
      item
        Name = 'Pr_bdate'
        DataType = ftDate
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Pr_edate'
        DataType = ftDate
        Precision = 0
        Required = False
        Size = 0
      end
      item
        Name = 'Pr_info'
        DataType = ftMemo
        Precision = 0
        Required = False
        Size = 1
      end>
    IndexDefs = <
      item
        Options = [ixPrimary, ixUnique]
        Fields = 'Pr_id'
      end
      item
        Name = 'Parent'
        Options = [ixCaseInsensitive]
        Fields = 'Pr_parent'
      end>
    IndexFieldNames = 'Pr_parent'
    StoreDefs = True
    TableName = 'Project.db'
    Left = 552
    Top = 28
  end
end
