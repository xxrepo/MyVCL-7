inherited EBarMDIDemoAboutForm: TEBarMDIDemoAboutForm
  ClientWidth = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDemoName: TLabel
    Width = 103
    Caption = 'EBarMDIDemo'
  end
  inherited reDemoInfo: TRichEdit
    Width = 229
    Lines.Strings = (
      'In this demo, ExpressBars 6 is used in a '
      'standard rtf editor application.'
      ''
      'Load one or more files and note the difference '
      'made to the menu items enabled. Change the '
      'width of the form to see the smart truncation of '
      'the file path.'
      ''
      'Experiment with the different bar items - '
      'FontNameCombo, Combo, ColorCombo and '
      'Button.'
      ''
      'Examine the effect of changing the style '
      '(Standard, Enhanced, Flat, XP and Office11). '
      'In particular, see how the status bar changes.'
      ''
      'Note:  the images used in this demo have been '
      'provided by Glyfz - to purchase your copy or '
      'download free samples, please visit '
      'www.glyfz.com')
  end
end
