inherited ESBarDemoAboutForm: TESBarDemoAboutForm
  ClientWidth = 293
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDemoName: TLabel
    Width = 86
    Caption = 'ESBarDemo'
  end
  inherited reDemoInfo: TRichEdit
    Width = 157
    Lines.Strings = (
      'This is the SideBar feature '
      'demo.'
      ''
      'Experiment with adding, '
      'deleting and renaming groups.'
      ''
      'Drag a tree node into the '
      'SideBar to add an item into a '
      'group.'
      ''
      'Try different SideBar paint '
      'styles - Flat, Standard, W2k '
      'and XP'
      '')
  end
end
