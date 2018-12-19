inherited DBDemoMainForm: TDBDemoMainForm
  Width = 658
  Height = 505
  Caption = 'ExpressScheduler DBDemo '
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDescrip: TLabel
    Width = 650
    Caption = 
      'This demo shows how the scheduler works when it'#39's connected to a' +
      ' DataSource. Click '#39'About this demo'#39' for more information.'
  end
  inherited Scheduler: TcxScheduler
    Width = 650
    Height = 400
    Storage = SchedulerDBStorage
    Splitters = {
      FA010000FB0000008902000000010000F501000001000000FA0100008F010000}
    inherited pnlControls: TPanel
      Height = 143
      inherited Memo1: TMemo
        Height = 143
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 143
        Height = 143
        Align = alClient
        TabOrder = 1
        object cxButton1: TcxButton
          Left = 9
          Top = 13
          Width = 122
          Height = 22
          Caption = 'Generate 5000 events'
          TabOrder = 0
          OnClick = cxButton1Click
        end
        object cxCheckBox1: TcxCheckBox
          Left = 9
          Top = 38
          Caption = 'Smart refresh'
          TabOrder = 1
          OnClick = chDataModeClick
          Width = 121
        end
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 432
    Width = 650
    SimplePanel = False
  end
  object EventsTable: TTable
    Active = True
    TableName = '..\Data\cxSchedulerTable.db'
    Left = 280
    Top = 80
  end
  object SchedulerDataSource: TDataSource
    DataSet = EventsTable
    Left = 248
    Top = 80
  end
  object SchedulerDBStorage: TcxSchedulerDBStorage
    UseActualTimeRange = True
    Resources.Items = <>
    Resources.ResourceID = 'ResourceID'
    Resources.ResourceName = 'ResourceName'
    CustomFields = <
      item
        FieldName = 'SyncIDField'
      end>
    DataSource = SchedulerDataSource
    FieldNames.ActualFinish = 'ActualFinish'
    FieldNames.ActualStart = 'ActualStart'
    FieldNames.Caption = 'Caption'
    FieldNames.EventType = 'Type'
    FieldNames.Finish = 'Finish'
    FieldNames.ID = 'ID'
    FieldNames.LabelColor = 'LabelColor'
    FieldNames.Location = 'Location'
    FieldNames.Message = 'Message'
    FieldNames.Options = 'Options'
    FieldNames.ParentID = 'ParentID'
    FieldNames.RecurrenceIndex = 'RecurrenceIndex'
    FieldNames.RecurrenceInfo = 'RecurrenceInfo'
    FieldNames.ReminderDate = 'ReminderDate'
    FieldNames.ReminderMinutesBeforeStart = 'ReminderMinutes'
    FieldNames.ResourceID = 'ResourceID'
    FieldNames.Start = 'Start'
    FieldNames.State = 'State'
    Left = 216
    Top = 80
  end
end
