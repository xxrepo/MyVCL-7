inherited ProviderModeDemoMainForm: TProviderModeDemoMainForm
  Left = 232
  Top = 114
  Caption = 'ExpressQuantumTreeList4 ProviderModeDemo '
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited lscrip: TLabel
    Caption = 
      'Use TreeList to work with non db data structure (about 100'#39'000 n' +
      'odes). Experiment with Options above and also see Help/About for' +
      ' other things to try.'
  end
  inherited memAboutText: TMemo
    Lines.Strings = (
      'In this demo you can:'
      ''
      '- change the TreeList elements displayed via the Options menu;'
      ''
      '- add/delete any nodes (using the Ins/Ctrl+Delete keys)'
      ''
      '- change the nodes hierarchy via drag&drop facilities'
      ''
      
        '- disable/enable the TreeList'#39's SmartLoad mode (see Options/Smar' +
        'tLoad)'
      ''
      
        '- see how fast the TreeList works with a large set of data in Sm' +
        'artLoad mode'
      ''
      
        '- NOTE: if you haven'#39't done so already, you might like to practi' +
        'ce by completing the tutorial version of this demo (see the tuto' +
        'rials folder)')
  end
  object TreeList: TcxVirtualTreeList [3]
    Left = 0
    Top = 32
    Width = 700
    Height = 360
    Styles.StyleSheet = TreeListStyleSheetDevExpress
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Provider mode'
        Width = 515
      end>
    BufferedPaint = False
    DragMode = dmAutomatic
    OptionsBehavior.ImmediateEditor = False
    OptionsBehavior.AutomateLeftMostIndent = False
    OptionsData.Inserting = True
    OptionsView.GridLineColor = 11316396
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    TabOrder = 2
    OnDragOver = TreeListDragOver
    object clnId: TcxTreeListColumn
      PropertiesClassName = 'TcxSpinEditProperties'
      Caption.Text = 'Id'
      DataBinding.ValueType = 'Integer'
      Width = 182
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object clnName: TcxTreeListColumn
      Caption.Text = 'Text'
      DataBinding.ValueType = 'String'
      Width = 162
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object clnDate: TcxTreeListColumn
      Caption.Text = 'Date'
      DataBinding.ValueType = 'DateTime'
      Width = 171
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  inherited mmMain: TMainMenu
    inherited miOptions: TMenuItem
      object miSmartLoadMode: TMenuItem [0]
        Caption = '&Smart Load mode'
        Checked = True
        Hint = 'Enables SmartLoad mode '
        OnClick = miSmartLoadModeClick
      end
      object N2: TMenuItem [1]
        Caption = '-'
      end
      object miShowButtons: TMenuItem [2]
        Caption = 'Show &Buttons'
        Checked = True
        Hint = 'Displays buttons to the left of each node with children'
        OnClick = miShowButtonsClick
      end
      object miShowRoot: TMenuItem [3]
        Caption = 'Show &Root'
        Checked = True
        Hint = 
          'Displays the button to the left of the first node as a root of a' +
          'll nodes'
        OnClick = miShowRootClick
      end
      object miShowIndicator: TMenuItem [4]
        Caption = 'Show &Indicator'
        Checked = True
        Hint = 'Shows indicators on the left side of tree list nodes'
        OnClick = miShowIndicatorClick
      end
      object miShowTreeLines: TMenuItem [5]
        Caption = 'Show Tree &Lines'
        Checked = True
        Hint = 
          'Shows the dotted lines between parent and child nodes within a t' +
          'ree list control'
        OnClick = miShowTreeLinesClick
      end
      object miCellAutoHeight: TMenuItem [6]
        Caption = 'Cell Auto &Height'
        Hint = 
          'If checked, a cell'#39's contents are displayed in multiple lines wh' +
          'ere necessary'
        OnClick = miCellAutoHeightClick
      end
      object miCellEndEllipsis: TMenuItem [7]
        Caption = 'Cell End &Ellipsis'
        Hint = 
          'Displays an ellipsis when the entire text cannot be displayed wi' +
          'thin a cell'
        OnClick = miCellEndEllipsisClick
      end
      object miColumnAutoWidth: TMenuItem [8]
        Caption = 'Column Auto &Width'
        Hint = 
          'If checked, column widths are changed in order to display all co' +
          'lumns without using the horizontal scrollbar'
        OnClick = miColumnAutoWidthClick
      end
      object N1: TMenuItem [9]
        Caption = '-'
      end
      object miGridLookFeel: TMenuItem [10]
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
      object miSeparator2: TMenuItem [11]
        Caption = '-'
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 568
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15252642
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 11032875
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15784893
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15451300
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16048336
      TextColor = clBlack
    end
    object stlGroupNode: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15253902
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object stlFixedBand: TcxStyle
      AssignedValues = [svColor]
      Color = 15322014
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle7
      Styles.ContentOdd = cxStyle6
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
  end
end
