inherited frmDepartments: TfrmDepartments
  Width = 234
  inherited lbCaption: TLabel
    Width = 234
  end
  inherited plTop: TPanel
    Width = 234
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
      Width = 220
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
