object frmDemoBaisicMain: TfrmDemoBaisicMain
  Left = 162
  Top = 128
  AutoScroll = False
  Caption = 'Express PivotGrid DemoBasic form'
  ClientHeight = 544
  ClientWidth = 807
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 807
    Height = 32
    Align = alTop
    Caption = 'Brief purpose of the demo'#10#13'That'#39's it'
    Color = 4707838
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object mmMain: TMainMenu
    Left = 616
    object miFile: TMenuItem
      Caption = '&File'
      object miExport: TMenuItem
        Caption = 'Export'
        object miExportToExcel: TMenuItem
          Tag = 1
          Caption = 'Excel'
          OnClick = miExportToClick
        end
        object miExportToText: TMenuItem
          Tag = 2
          Caption = 'Text'
          OnClick = miExportToClick
        end
        object miExportToHtml: TMenuItem
          Tag = 3
          Caption = 'Html'
          OnClick = miExportToClick
        end
        object miExportToXml: TMenuItem
          Tag = 4
          Caption = 'Xml'
          OnClick = miExportToClick
        end
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = 'Options'
      object miTotalsPosition: TMenuItem
        Caption = 'Totals Location'
        object miColumnTotalsPosition: TMenuItem
          Caption = 'Column'
          object miColumnTotalsPositionFar: TMenuItem
            Caption = 'Far'
            Checked = True
            GroupIndex = 4
            OnClick = miTotalsLocationClick
          end
          object miColumnTotalsPositionNear: TMenuItem
            Tag = 1
            Caption = 'Near'
            GroupIndex = 4
            OnClick = miTotalsLocationClick
          end
        end
        object miRowTotalsPosition: TMenuItem
          Caption = 'Row'
          object miRowTotalsPositionFar: TMenuItem
            Tag = 2
            Caption = 'Far'
            Checked = True
            GroupIndex = 5
            OnClick = miTotalsLocationClick
          end
          object miRowTotalsPositionNear: TMenuItem
            Tag = 3
            Caption = 'Near'
            GroupIndex = 5
            OnClick = miTotalsLocationClick
          end
        end
      end
      object miTotalsVisibility: TMenuItem
        Caption = 'Totals Visibility'
        object miShowColumnTotals: TMenuItem
          Caption = 'ShowColumnTotals'
          OnClick = miTotalsVisibilityClick
        end
        object miShowRowTotals: TMenuItem
          Tag = 1
          Caption = 'ShowRowTotals'
          OnClick = miTotalsVisibilityClick
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object miShowColumnGrandTotals: TMenuItem
          Tag = 2
          Caption = 'ShowColumnGrandTotals'
          OnClick = miTotalsVisibilityClick
        end
        object miShowRowGrandTotals: TMenuItem
          Tag = 3
          Caption = 'ShowRowGrandTotals'
          OnClick = miTotalsVisibilityClick
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object miShowTotalsForSingleValues: TMenuItem
          Tag = 4
          Caption = 'ShowTotalsForSingleValues'
          OnClick = miTotalsVisibilityClick
        end
        object miShowGrandTotalsForSingleValues: TMenuItem
          Tag = 5
          Caption = 'ShowGrandTotalsForSingleValues'
          OnClick = miTotalsVisibilityClick
        end
      end
      object miElementsVisibility: TMenuItem
        Caption = 'Elements Visibility'
        object miShowColumnFields: TMenuItem
          Caption = 'ShowColumnFields'
          OnClick = miElementsVisibilityClick
        end
        object miShowDataFields: TMenuItem
          Tag = 1
          Caption = 'ShowDataFields'
          OnClick = miElementsVisibilityClick
        end
        object miShowFilterFields: TMenuItem
          Tag = 2
          Caption = 'ShowFilterFields'
          OnClick = miElementsVisibilityClick
        end
        object miShowFilterSeparator: TMenuItem
          Tag = 3
          Caption = 'ShowFilterSeparator'
          OnClick = miElementsVisibilityClick
        end
        object miShowRowFields: TMenuItem
          Tag = 4
          Caption = 'ShowRowFields'
          OnClick = miElementsVisibilityClick
        end
      end
      object miSelection: TMenuItem
        Caption = 'Selection'
        object miIncludeCells: TMenuItem
          Caption = 'Include Cells'
          object miCrossCells: TMenuItem
            Caption = 'Cross Cells'
            Checked = True
            OnClick = IncludeCellsClick
          end
          object miGrandTotalsCells: TMenuItem
            Tag = 1
            Caption = 'Grand Totals Cells'
            Checked = True
            OnClick = IncludeCellsClick
          end
          object miTotalsCells: TMenuItem
            Tag = 2
            Caption = 'Totals Cells'
            Checked = True
            OnClick = IncludeCellsClick
          end
        end
        object miMultiSelect: TMenuItem
          Caption = 'Multi select'
          OnClick = miMultiSelectClick
        end
        object miHideFocusRect: TMenuItem
          Caption = 'Hide Focus Rect when Inactive'
          OnClick = miHideFocusRectClick
        end
        object miHideSelection: TMenuItem
          Caption = 'Hide Selection when Inactive'
          OnClick = miHideSelectionClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object SaveDialog: TSaveDialog
    Left = 648
  end
  object lfController: TcxLookAndFeelController
    Left = 680
  end
end
