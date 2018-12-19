inherited EditorsMaskDemoMainForm: TEditorsMaskDemoMainForm
  Left = 169
  Top = 101
  Caption = 'ExpressQuantumTreeList5 EditorsMaskDemo'
  ClientHeight = 546
  ClientWidth = 792
  OldCreateOrder = True
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Width = 792
    Caption = 
      'Practice using masked data-aware editors for reading and writing' +
      '.'#10'Experiment by changing the Options above and also see Help/Abo' +
      'ut for other things to try.'
    Color = 12937777
    Font.Color = clWhite
  end
  inherited sbMain: TStatusBar
    Top = 527
    Width = 792
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 32
    Width = 189
    Height = 495
    Align = alLeft
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 187
      Height = 32
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Departments'
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object tlDepartments: TcxDBTreeList
      Left = 1
      Top = 33
      Width = 187
      Height = 461
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band + 1'
          Width = 165
        end>
      DataController.DataSource = EditorsMaskDemoDataDM.DataSourceDEPARTMENTS
      DataController.ParentField = 'ID'
      DataController.KeyField = 'ID'
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Headers = False
      OptionsView.ShowRoot = False
      RootValue = 255
      Styles.Background = EditorsMaskDemoDataDM.stBlueSky
      Styles.Content = EditorsMaskDemoDataDM.stBlueLight
      Styles.Selection = EditorsMaskDemoDataDM.stBlueDark
      TabOrder = 1
      object tlDepartmentsNAME: TcxDBTreeListColumn
        DataBinding.FieldName = 'NAME'
        Width = 185
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  object Panel2: TPanel [3]
    Left = 189
    Top = 32
    Width = 603
    Height = 495
    Align = alClient
    Color = 15451300
    TabOrder = 1
    object lbFirstName: TLabel
      Left = 28
      Top = 56
      Width = 51
      Height = 13
      Caption = 'First name:'
    end
    object lbMiddleName: TLabel
      Left = 16
      Top = 84
      Width = 63
      Height = 13
      Caption = 'Middle name:'
    end
    object lbLastName: TLabel
      Left = 28
      Top = 112
      Width = 52
      Height = 13
      Caption = 'Last name:'
    end
    object lbCountry: TLabel
      Left = 40
      Top = 188
      Width = 39
      Height = 13
      Caption = 'Country:'
    end
    object lbPostalCode: TLabel
      Left = 20
      Top = 160
      Width = 59
      Height = 13
      Caption = 'Postal code:'
    end
    object lbCity: TLabel
      Left = 60
      Top = 216
      Width = 20
      Height = 13
      Caption = 'City:'
    end
    object lbAddress: TLabel
      Left = 44
      Top = 244
      Width = 35
      Height = 13
      Caption = 'Adress:'
    end
    object lbPhone: TLabel
      Left = 44
      Top = 292
      Width = 34
      Height = 13
      Caption = 'Phone:'
    end
    object lbFax: TLabel
      Left = 56
      Top = 320
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
    object lbEmail: TLabel
      Left = 48
      Top = 396
      Width = 31
      Height = 13
      Caption = 'E-mail:'
    end
    object lbHomePage: TLabel
      Left = 20
      Top = 368
      Width = 58
      Height = 13
      Caption = 'Home page:'
    end
    object lbInfoPhone: TLabel
      Left = 212
      Top = 292
      Width = 105
      Height = 13
      Caption = 'Delphi Standard Mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoFax: TLabel
      Left = 212
      Top = 320
      Width = 229
      Height = 13
      Caption = 'Regular Expression with Auto Complete Function'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoHomePage: TLabel
      Left = 344
      Top = 368
      Width = 229
      Height = 13
      Caption = 'Regular Expression with Auto Complete Function'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoEmail: TLabel
      Left = 344
      Top = 396
      Width = 91
      Height = 13
      Caption = 'Regular Expression'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoPostalCode: TLabel
      Left = 212
      Top = 160
      Width = 229
      Height = 13
      Caption = 'Regular Expression with Auto Complete Function'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoFirstName: TLabel
      Left = 212
      Top = 56
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoMiddleName: TLabel
      Left = 212
      Top = 84
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoLastName: TLabel
      Left = 212
      Top = 112
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoCountry: TLabel
      Left = 212
      Top = 188
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoCity: TLabel
      Left = 212
      Top = 216
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbInfoAddress: TLabel
      Left = 344
      Top = 244
      Width = 42
      Height = 13
      Caption = 'No mask'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 601
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Users'
      Color = 4707838
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object edtFirstName: TcxDBTextEdit
      Left = 84
      Top = 52
      DataBinding.DataField = 'FNAME'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Properties.ReadOnly = False
      Style.Color = 16247513
      TabOrder = 1
      Width = 121
    end
    object edtMiddleName: TcxDBTextEdit
      Left = 84
      Top = 80
      DataBinding.DataField = 'MNAME'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Properties.ReadOnly = False
      Style.Color = 16247513
      TabOrder = 2
      Width = 121
    end
    object edtLastName: TcxDBTextEdit
      Left = 84
      Top = 108
      DataBinding.DataField = 'LNAME'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Style.Color = 16247513
      TabOrder = 3
      Width = 121
    end
    object edtCountry: TcxDBTextEdit
      Left = 84
      Top = 184
      DataBinding.DataField = 'COUNTRY'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Style.Color = 16247513
      TabOrder = 5
      Width = 121
    end
    object edtCity: TcxDBTextEdit
      Left = 84
      Top = 212
      DataBinding.DataField = 'CITY'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Style.Color = 16247513
      TabOrder = 6
      Width = 121
    end
    object edtAddress: TcxDBTextEdit
      Left = 84
      Top = 240
      DataBinding.DataField = 'ADDRESS'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Style.Color = 16247513
      TabOrder = 7
      Width = 253
    end
    object DBNavigator1: TcxDBNavigator
      Left = 48
      Top = 440
      Width = 224
      Height = 25
      Buttons.Filter.Enabled = False
      Buttons.Filter.Visible = False
      DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      TabOrder = 12
    end
    object edtPostalCode: TcxDBButtonEdit
      Left = 84
      Top = 156
      DataBinding.DataField = 'POSTALCODE'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d\d\d\d\d? | \w\w\w'#39' '#39'\w\w\w'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtPostalCodePropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 4
      Width = 121
    end
    object edtPhone: TcxDBButtonEdit
      Left = 84
      Top = 288
      DataBinding.DataField = 'PHONE'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.EditMask = '!\(999\) 000-0000;1;_'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtPhonePropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 8
      Width = 121
    end
    object edtFax: TcxDBButtonEdit
      Left = 84
      Top = 316
      DataBinding.DataField = 'FAX'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '(\(\d\d\d\)'#39#39' '#39#39')?\d\d\d-\d\d\d\d'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtFaxPropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 9
      Width = 121
    end
    object edtHomePage: TcxDBButtonEdit
      Left = 84
      Top = 364
      DataBinding.DataField = 'HOMEPAGE'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = 'http\:\/\/(\w+(\.\w+)*@)?\w+\.\w+(\.\w+)*(/(\w+(/\w+)*/?)?)?'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtHomePagePropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 10
      Width = 253
    end
    object edtEmail: TcxDBButtonEdit
      Left = 84
      Top = 392
      DataBinding.DataField = 'EMAIL'
      DataBinding.DataSource = EditorsMaskDemoDataDM.DataSourceUSERS
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\w+@\w+\.\w+(\.\w+)*'
      Properties.MaxLength = 0
      Properties.OnButtonClick = edtEmailPropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 11
      Width = 253
    end
  end
  inherited mmMain: TMainMenu
    Left = 528
    inherited miOptions: TMenuItem
      Caption = 'Options'
      object miDefaultMaskSettings: TMenuItem [0]
        Caption = 'Default &Mask Settings'
        Hint = 'Sets the default mask set'
        OnClick = miDefaultMaskExecute
      end
      object miShowMaskButtons: TMenuItem [1]
        Caption = 'Show Mask &Buttons'
        Hint = 'Shows the edit mask buttons'
        OnClick = miShowEditMaskButtonsExecute
      end
      object miSeparator1: TMenuItem [2]
        Caption = '-'
      end
    end
  end
end
