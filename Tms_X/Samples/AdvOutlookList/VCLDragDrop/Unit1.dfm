object Form1: TForm1
  Left = 417
  Top = 34
  Caption = 'Form1'
  ClientHeight = 319
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 295
    Width = 334
    Height = 13
    Caption = 
      'Drag && drop items from the listbox to the AdvOutlookList and vi' +
      'ce versa'
  end
  object AdvOutlookList1: TAdvOutlookList
    Left = 8
    Top = 8
    Width = 313
    Height = 281
    Columns = <
      item
        Caption = 'Group'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Color = clWhite
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        HeaderColorTo = clSilver
        SortType = stNone
      end
      item
        Caption = 'Incl.'
        Width = 65
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Color = clWhite
        Alignment = taCenter
        ColumnType = ctCheckBox
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWhite
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = [fsBold]
        HeaderColor = 16572875
        HeaderColorTo = 14722429
        HeaderImageIndex = 0
        SortType = stBoolean
      end
      item
        Caption = 'Name'
        Width = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Color = clWhite
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWhite
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = [fsBold]
        HeaderColor = 16572875
        HeaderColorTo = 14722429
        HeaderImageIndex = 1
        HeaderHint = 'Subject'
        HeaderShowHint = True
        Hint = 'Text Col'
        ShowHint = True
      end>
    Color = clWhite
    GroupItemHeight = 34
    GroupShowCount = True
    HeaderBorderColor = clBlack
    HideSelection = True
    Images = ImageList1
    DragType = dtVCL
    LookUp.Method = lmDirect
    GroupColumnDisplay = gdHidden
    PreviewSettings.Column = 2
    PreviewSettings.Font.Charset = DEFAULT_CHARSET
    PreviewSettings.Font.Color = clBlue
    PreviewSettings.Font.Height = -11
    PreviewSettings.Font.Name = 'MS Sans Serif'
    PreviewSettings.Font.Style = []
    GroupFont.Charset = DEFAULT_CHARSET
    GroupFont.Color = 12150839
    GroupFont.Height = -11
    GroupFont.Name = 'Tahoma'
    GroupFont.Style = [fsBold]
    GroupCountFont.Charset = DEFAULT_CHARSET
    GroupCountFont.Color = clBlack
    GroupCountFont.Height = -11
    GroupCountFont.Name = 'Tahoma'
    GroupCountFont.Style = []
    ShowHint = True
    ShowNodes = True
    SortSettings.GlyphUp.Data = {
      AA040000424DAA04000000000000360000002800000013000000130000000100
      18000000000074040000C40E0000C40E00000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000000000
      00000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
      0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000808000808000
      808000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400000080800080800080800000
      0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000808000808000808000000000C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8
      D0D4000000000000000000000000808000808000808000000000000000000000
      000000C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4000000808000808000808000808000808000808000808000000000C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      000000808000808000808000808000808000000000C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
      0000808000808000808000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000
      00808000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
      0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4000000}
    SortSettings.GlyphDown.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
      0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4000000808000000000C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400000080800080
      8000808000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4000000808000808000808000808000808000000000C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400000080800080800080800080
      8000808000808000808000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      0000000000000000000000008080008080008080000000000000000000000000
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400000080800080
      8000808000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4000000808000808000808000000000C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400000080800080
      8000808000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4000000000000000000000000000000C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
    SortSettings.SortGroups = False
    TabOrder = 0
    URLSettings.FontStyle = [fsUnderline]
    Version = '1.7.3.2'
    OnDragDrop = AdvOutlookList1DragDrop
    OnDragOver = AdvOutlookList1DragOver
  end
  object ListBox1: TListBox
    Left = 348
    Top = 44
    Width = 257
    Height = 197
    DragMode = dmAutomatic
    ItemHeight = 13
    Items.Strings = (
      'TAdvStringGrid'
      'TAdvOutlookList'
      'TPlanner'
      'TEdit'
      'TAdvEdit'
      'TListBox'
      'TLabel')
    TabOrder = 1
    OnDragDrop = ListBox1DragDrop
    OnDragOver = ListBox1DragOver
  end
  object ImageList1: TImageList
    Left = 348
    Top = 256
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000033B8A00033D9000013D9500023B9100033A8900033A89000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000357
      D3000147B2000051D000035CE0000763E300035CE000004ED3000042B700023A
      8F00023A8F000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C60084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000650BA000357
      D3002781F20078B4F700CAE2FC00E9F4FF00DCEDFF009CC7FA003F8FF2000155
      DD000140A40004367D0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000075DD7000762E10055A0
      F700F3F8FE00FFFFFF00E9F3FC00C6DEFA00D9E9FC00FFFFFF00FFFFFF0099C5
      F800055DE7000040A30002398B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000075DD700529EF700FEFE
      FF00F0F7FE005CA3F3001E78EB00A1C9F7000D65E3002D7AE900BAD7F800FFFF
      FF009CC9F8000355DE0002398B00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000455C900207DF000E1EFFE00FFFF
      FF00358CF3000F6EEE00C7E0FB00FFFFFF002F83EA00004ADE000559E100BAD8
      F800FFFFFF003E8FF2000043B700033E96008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000085FDA0056A1FA00FFFFFF009ECB
      FB002D88F400D4E9FC00FCFEFE00D7E9FC008ABDF6000058E200004FE0002A7B
      E700FFFFFF009FCBFA000050D400033E96008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F6BE6008BC1FC00FFFFFF0056A4
      FC0097C7FC00F8FBFF004B9AF6002882F200D9EAFC001975EB00005AE500015A
      E200D9E9FB00DEEFFF000560E20002409C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001B76ED00A4CFFC00FFFFFF0050A0
      FF002586FE00358FFA000E70F600096AF20089BFFA006AABF600025FEA000159
      E500C7E1FA00EBF6FF000C68E6000141A1008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000207AEB00A5CFFE00FFFFFF0075B6
      FF001278FF001A7DFE00187AFB001173F7001979F40082BBFA000E6CEE000E6C
      EB00EFF6FE00CEE5FE000763E20003419E008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000146FE7009ACAFC00FFFFFF00D8EB
      FF001F81FF001B7EFF001E81FF001A7BFC001173F700368EF7002983F40063A9
      F600FFFFFF0081BAF8000258D800033E96008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000237BEB00EDF6FF00FFFF
      FF0098CAFF001F81FF001379FF00167AFF001276FB000A6EF80054A0F800F0F8
      FF00F2F8FE003089F400024FC000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000237BEB00BFDEFF00F3F8
      FF00FFFFFF00D7EAFF0074B6FF0053A3FE005EA9FF00A3CFFE00FFFFFF00FFFF
      FF005DA6F7000860DE00024FC000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004997F300C7E3
      FF00F7FBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0EFFE005CA5
      F8000E6BE7000552C20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002D82
      EB0091C5FB00CCE6FF00D9EDFF00DCEDFE00C4E0FE0086BFFC00348BF4000A65
      E1000A65E1000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000247BEB004696F3004A98F4002F87F000116CE600075FDC000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F81FE3FF00000000E007E07F00000000
      C003EF9F00000000800180E30000000080017F7C000000000000437C00000000
      00007F7C000000000000437C0000000000007F7C000000000000437C00000000
      00007F7C000000008001557C000000008001AAF000000000C003D5F500000000
      E007EFF300000000F81FE0070000000000000000000000000000000000000000
      000000000000}
  end
end
