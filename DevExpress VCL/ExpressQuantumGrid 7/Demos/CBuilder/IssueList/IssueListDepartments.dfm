inherited frmDepartments: TfrmDepartments
  ClientWidth = 226
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbCaption: TLabel
    Width = 226
  end
  inherited plTop: TPanel
    Width = 226
    ParentColor = True
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 8
      Top = 24
      Width = 211
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataSource = dmMain.dsDepartment
      DataBinding.DataField = 'NAME'
      Style.StyleController = dmMain.edstcMain
      TabOrder = 0
    end
  end
  inherited cxNavigator: TcxNavigator
  end
end
