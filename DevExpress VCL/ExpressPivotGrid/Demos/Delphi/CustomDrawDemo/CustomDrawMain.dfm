inherited frmCustomDraw: TfrmCustomDraw
  Left = 231
  Top = 126
  Caption = 'PivotGrid - CustomDraw Demo'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDescrip: TLabel
    Height = 16
    Caption = 
      'This demo shows you how to paint the pivot grid'#39's elements manua' +
      'lly'
  end
  object DBPivotGrid: TcxDBPivotGrid [1]
    Left = 0
    Top = 16
    Width = 807
    Height = 527
    Align = alClient
    DataSource = dmOrders.dsOrders
    Groups = <>
    TabOrder = 0
    TabStop = True
    OnCustomDrawFieldHeader = DBPivotGridCustomDrawFieldHeader
    OnCustomDrawColumnHeader = DBPivotGridCustomDrawColumnHeader
    OnCustomDrawRowHeader = DBPivotGridCustomDrawRowHeader
    OnCustomDrawCell = DBPivotGridCustomDrawCell
    OnCustomDrawPart = DBPivotGridCustomDrawPart
    object pgfPaymentType: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Payment Type'
      DataBinding.FieldName = 'PaymentType'
      Visible = True
    end
    object pgfQuantity: TcxDBPivotGridField
      AreaIndex = 0
      DataBinding.FieldName = 'Quantity'
      Visible = True
    end
    object pgfCarName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      DataBinding.FieldName = 'Car Name'
      Visible = True
      Width = 96
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
  inherited mmMain: TMainMenu
    inherited miOptions: TMenuItem
      object N3: TMenuItem
        Caption = '-'
      end
      object Drawing1: TMenuItem
        Caption = 'Drawing'
        object Content1: TMenuItem
          Tag = 1
          Caption = 'Content'
          Checked = True
          OnClick = DrawingClick
        end
        object FieldHeaders1: TMenuItem
          Tag = 2
          Caption = 'Field Headers'
          Checked = True
          OnClick = DrawingClick
        end
        object GroupHeaders1: TMenuItem
          Tag = 3
          Caption = 'Group Headers'
          Checked = True
          OnClick = DrawingClick
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object Background1: TMenuItem
          Caption = 'Background'
          Checked = True
          OnClick = DrawingClick
        end
      end
    end
    inherited miLookFeel: TMenuItem
      inherited Kind1: TMenuItem
        inherited miUltraFlat: TMenuItem
          Checked = True
        end
        inherited miOffice11: TMenuItem
          Checked = False
        end
      end
    end
  end
end
