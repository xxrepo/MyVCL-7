inherited frmSortBySummary: TfrmSortBySummary
  Left = 253
  Top = 157
  Width = 809
  Caption = 'PivotGrid - Sort By Summary'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDescrip: TLabel
    Width = 801
    Height = 16
    Caption = 
      'This demo allows you to sort values of one field by the grand to' +
      'tal summaries of another field'
  end
  object DBPivotGrid: TcxDBPivotGrid [1]
    Left = 0
    Top = 88
    Width = 801
    Height = 455
    Align = alClient
    DataSource = dmOrders.dsOrders
    Groups = <>
    Styles.OnGetColumnHeaderStyle = GetGroupHeaderStyle
    Styles.OnGetRowHeaderStyle = GetGroupHeaderStyle
    TabOrder = 0
    TabStop = True
    object pgfPurchaseQuarter: TcxDBPivotGridField
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Purchase Quarter'
      DataBinding.FieldName = 'PurchaseDate'
      GroupInterval = giDateQuarter
      Visible = True
    end
    object pgfPaymentType: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Payment Type'
      DataBinding.FieldName = 'PaymentType'
      Visible = True
    end
    object pgfQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      DataBinding.FieldName = 'Quantity'
      Visible = True
    end
    object pgfCarName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      DataBinding.FieldName = 'Car Name'
      SummaryType = stCount
      SortOrder = soDescending
      Visible = True
      Width = 111
    end
    object pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 1
      DataBinding.FieldName = 'Unit Price'
      Visible = True
    end
    object pgfCompanyName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      DataBinding.FieldName = 'Company Name'
      SortBySummaryInfo.Field = pgfPaymentAmount
      SortOrder = soDescending
      TopValueCount = 3
      TopValueShowOthers = True
      Visible = True
      Width = 142
    end
    object pgfPaymentAmount: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Payment Amount'
      DataBinding.FieldName = 'PaymentAmount'
      Visible = True
    end
  end
  object pnSettings: TPanel [2]
    Left = 0
    Top = 16
    Width = 801
    Height = 72
    Align = alTop
    TabOrder = 1
    object lbSortThe: TLabel
      Left = 16
      Top = 11
      Width = 37
      Height = 13
      Caption = 'Sort the'
      FocusControl = cbxSortField
    end
    object lbSortBy: TLabel
      Left = 198
      Top = 11
      Width = 33
      Height = 13
      Caption = 'field by'
      FocusControl = cbxSortByField
    end
    object lbShowTop: TLabel
      Left = 16
      Top = 46
      Width = 45
      Height = 13
      Caption = 'Show top'
      FocusControl = speTopCount
    end
    object lbValues: TLabel
      Left = 136
      Top = 46
      Width = 31
      Height = 13
      Caption = 'values'
    end
    object bvSplitter: TBevel
      Left = 8
      Top = 35
      Width = 787
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object cbxSortField: TcxComboBox
      Left = 62
      Top = 7
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Car Name'
        'Company Name'
        'Payment Type'
        'Purchase Quarter')
      Properties.OnChange = SortFieldChanged
      TabOrder = 0
      Text = 'Company Name'
      Width = 127
    end
    object cbxSortByField: TcxComboBox
      Left = 241
      Top = 7
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'None'
        'Payment Amount'
        'Quantity')
      Properties.OnChange = SortByChanged
      TabOrder = 1
      Text = 'Payment Amount'
      Width = 136
    end
    object speTopCount: TcxSpinEdit
      Left = 72
      Top = 43
      Properties.AssignedValues.MinValue = True
      Properties.OnChange = speTopCountPropertiesChange
      TabOrder = 2
      Width = 57
    end
    object cbxTopValuesShowOthers: TcxCheckBox
      Left = 238
      Top = 42
      Caption = 'TopValuesShowOthers'
      Properties.OnChange = cbxTopValuesShowOthersPropertiesChange
      TabOrder = 3
      Width = 145
    end
  end
end
