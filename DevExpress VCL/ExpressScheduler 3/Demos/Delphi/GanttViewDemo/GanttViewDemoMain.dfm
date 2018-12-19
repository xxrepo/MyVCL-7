inherited GanttViewDemoMainForm: TGanttViewDemoMainForm
  Left = 199
  Top = 124
  Width = 835
  Height = 597
  Caption = 'ExpressScheduler GanttView Demo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDescrip: TLabel
    Width = 827
    Height = 16
    Caption = 
      'This demo shows how dependent tasks can be scheduled and linked,' +
      ' in order to provide a task summary plan.'
  end
  inherited Scheduler: TcxScheduler
    Top = 16
    Width = 827
    Height = 511
    DateNavigator.RowCount = 3
    ViewDay.Active = False
    ViewGantt.Active = True
    ViewGantt.Scales.MajorUnit = suMonth
    ViewGantt.Scales.MinorUnit = suDay
    ViewWeek.HideWeekEnd = True
    ViewWeeks.HideWeekEnd = True
    OptionsView.GroupingKind = gkByDate
    OptionsView.ResourceHeaders.MultilineCaptions = True
    OptionsView.ResourceHeaders.ImagePosition = ipTop
    OptionsView.ResourcesPerPage = 3
    Storage = SchedulerStorage
    Selection = 1
    Splitters = {
      AB020000780100003A0300007D010000A602000001000000AB020000FE010000}
    StoredClientBounds = {01000000010000003A030000FE010000}
    inherited pnlControls: TPanel
      Height = 129
      inherited Memo1: TMemo
        Height = 129
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 527
    Width = 827
  end
  inherited mmMain: TMainMenu
    Left = 440
    Top = 32
    inherited Resources1: TMenuItem
      inherited GroupBy1: TMenuItem
        inherited miGroupByResources: TMenuItem
          Checked = False
        end
        inherited miGroupByDate: TMenuItem
          Checked = True
        end
      end
    end
    object askOptions1: TMenuItem [5]
      Caption = 'Task Options'
      object miHotTrack: TMenuItem
        AutoCheck = True
        Caption = 'HotTrack'
        Checked = True
        OnClick = miHotTrackClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object miShowAsProgress: TMenuItem
        AutoCheck = True
        Caption = 'Show As Progress'
        OnClick = miShowAsProgressClick
      end
      object miShowTotalProgress: TMenuItem
        AutoCheck = True
        Caption = 'Show Total Progress'
        Enabled = False
        OnClick = miShowTotalProgressClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miShowExpandButtons: TMenuItem
        AutoCheck = True
        Caption = 'Show Expand Buttons'
        OnClick = miShowExpandButtonsClick
      end
    end
  end
  inherited Timer1: TTimer
    Left = 480
    Top = 32
  end
  inherited SaveDialog: TSaveDialog
    Left = 520
    Top = 32
  end
  object SchedulerStorage: TcxSchedulerStorage
    CustomFields = <
      item
        Name = 'IconIndex'
        ValueType = 'Integer'
      end
      item
        Name = 'SyncIDField'
      end>
    Reminders.ReminderWindowLookAndFeel.Kind = lfOffice11
    Resources.Items = <
      item
        Name = 'Tasks'
        ResourceID = 0
      end>
    Left = 408
    Top = 32
  end
end
