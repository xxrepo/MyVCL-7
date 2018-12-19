inherited EBar2000DemoAboutForm: TEBar2000DemoAboutForm
  ClientWidth = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDemoName: TLabel
    Width = 108
    Caption = 'EBar2000Demo'
  end
  inherited reDemoInfo: TRichEdit
    Width = 308
    Lines.Strings = (
      'This demo shows formatting options provided by ExpressBars 6.'
      ''
      'Experiment by changing options in the group boxes. In particular:'
      ''
      '- see the way a button is displayed when using different styles when Down=True (Align Left button).'
      ''
      '- move the mouse over toolbar buttons to see the effect of the hot image support.'
      ''
      '- display complete toolbars by dragging them into floating windows or by checking the Multiline options.'
      ''
      '- floating toolbars can be made invisible or partially transparent by using the AlphaBlend trackbars.'
      ''
      'Note:  the images used in the toolbars and a few of the menu '
      'items in this demo have been provided by Glyfz - to purchase '
      'your copy or download free samples, please visit www.glyfz.com')
  end
end
