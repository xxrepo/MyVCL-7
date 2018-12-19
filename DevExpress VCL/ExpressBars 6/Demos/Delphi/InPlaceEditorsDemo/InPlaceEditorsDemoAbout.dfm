inherited frmAbout: TfrmAbout
  Left = 460
  Top = 228
  ClientWidth = 390
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDemoName: TLabel
    Width = 143
    Caption = 'InPlaceEditorsDemo'
  end
  inherited reDemoInfo: TRichEdit
    Width = 248
    Lines.Strings = (
      'This demo is built using all in-place editors from'
      'the ExpressEditors library (sold separately).'
      'These in-place editors are grouped into'
      'functional categories.'
      'You can click a category'#39's name to see in-place'
      'editors within the category.'
      ''
      'In this demo you can:'
      '- edit values using in-place editors located on'
      'toolbars and submenus;'
      '- switch the Ribbon UI on/off by toggling the'
      '"Ribbon style" option;'
      '- customize bar appearance settings by applying'
      'different paint styles, Ribbon color schemes, and'
      'font settings;'
      '- customize bar editor appearance settings'
      'using editor styles in the Styles category;'
      '- dock toolbars to any edge of the form to see'
      'how bar editors appear in horizontal and vertical'
      'bar layouts.')
    WordWrap = False
  end
end
