object FeatureChildForm: TFeatureChildForm
  Left = 218
  Top = 298
  Width = 629
  Height = 422
  Caption = 'FeatureChildForm'
  Color = clBtnFace
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000000000000000000000F08F8F8F8F8F000080F8F8F8F8F80000F0
    888888888F000080F8F8F8F8F80000F0888888888F000080F8F8F8F8F80000F0
    888888888F000080F8F8F8F8F80000F0888888888F000080F8F8F8F8F8000000
    00000000000000808F8F8F8F8F0000000000000000000000000000000000FFFF
    0000800100008001000080010000800100008001000080010000800100008001
    0000800100008001000080010000800100008001000080010000FFFF0000}
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxSpreadBook: TcxSpreadSheetBook
    Left = 0
    Top = 0
    Width = 621
    Height = 388
    Align = alClient
    DefaultStyle.Brush.BackgroundColor = 57
    DefaultStyle.Brush.ForegroundColor = 57
    DefaultStyle.Font.Name = 'Tahoma'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    OnEditing = cxSpreadBookEditing
    OnEndEdit = cxSpreadBookEndEdit
    OnSheetPopupMenu = cxSpreadBookSheetPopupMenu
    OnContextPopup = cxSpreadBookContextPopup
  end
end
