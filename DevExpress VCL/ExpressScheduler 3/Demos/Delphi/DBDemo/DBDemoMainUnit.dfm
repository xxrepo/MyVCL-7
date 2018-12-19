inherited DBDemoMainForm: TDBDemoMainForm
  Width = 658
  Height = 505
  Caption = 'ExpressScheduler DBDemo '
  OldCreateOrder = True
  OnClose = FormClose
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
    Height = 403
    Storage = SchedulerDBStorage
    Splitters = {
      D0010000FB0000008902000000010000CB01000001000000D001000092010000}
    StoredClientBounds = {01000000010000008902000092010000}
    inherited pnlControls: TPanel
      Width = 185
      Height = 146
      inherited Memo1: TMemo
        Width = 185
        Height = 146
        TabOrder = 1
        Visible = False
      end
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        PanelStyle.Active = True
        ParentColor = False
        Style.BorderStyle = ebsNone
        TabOrder = 0
        Height = 146
        Width = 185
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
    Top = 435
    Width = 650
    SimplePanel = False
  end
  object EventsTable: TTable
    TableName = '..\..\Data\cxSchedulerTable.db'
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
