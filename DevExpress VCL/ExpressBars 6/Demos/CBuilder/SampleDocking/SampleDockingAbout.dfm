inherited SampleDockingAboutForm: TSampleDockingAboutForm
  ClientWidth = 447
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDemoName: TLabel
    Width = 111
    Caption = 'SampleDocking'
  end
  inherited reDemoInfo: TRichEdit
    Width = 309
    Lines.Strings = (
      'The following dock panel schemes are demonstrated within this '
      'application:'
      ''
      'Scheme1: two tabbed containers'
      ''
      'Scheme2: single tabbed container with internal side container'
      ''
      'Scheme3: single panel with auto hide set'
      ''
      'Scheme4: floating tabbed container'
      ''
      
        'Scheme5: vertical site container within horizontal site containe' +
        'r'
      ''
      
        'Experiment with docking to different sites and see the effect of' +
        ' '
      'floating the various panels. You can also modify styles via the '
      'View menu.'
      '')
  end
end
