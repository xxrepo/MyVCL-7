inherited AggregateDemoMainForm: TAggregateDemoMainForm
  Width = 770
  Height = 665
  Caption = 'ExpressScheduler AggregateDemo '
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbDescrip: TLabel
    Width = 762
    Caption = 
      'This demo shows how events can be scheduled in the scheduler, us' +
      'ing the bound and unbound storage simultaneously. Click '#39'About t' +
      'his demo'#39' for more information.'
  end
  inherited Scheduler: TcxScheduler
    Width = 762
    Height = 443
    Storage = SchedulerAggregateStorage
    Splitters = {
      6A020000FB000000F90200000001000065020000010000006A020000BA010000}
    StoredClientBounds = {0100000001000000F9020000BA010000}
    inherited pnlControls: TPanel
      Height = 186
      inherited Memo1: TMemo
        Height = 186
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 143
        Height = 186
        Align = alClient
        TabOrder = 1
        DesignSize = (
          143
          186)
        object cxButton1: TcxButton
          Left = 8
          Top = 8
          Width = 127
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Generate 500 events'#13#10'in DB storage'
          TabOrder = 0
          OnClick = cxButton1Click
        end
        object cxButton2: TcxButton
          Left = 8
          Top = 60
          Width = 127
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Generate 500 events'#13#10'in Unbound storage'
          TabOrder = 1
          OnClick = cxButton2Click
        end
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 595
    Width = 762
    SimplePanel = False
  end
  object DBGrid1: TDBGrid [3]
    Left = 0
    Top = 475
    Width = 762
    Height = 120
    Align = alBottom
    DataSource = SchedulerDataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Caption'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Start'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Finish'
        Visible = True
      end>
  end
  object EventsTable: TTable
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ParentID'
        DataType = ftInteger
      end
      item
        Name = 'Type'
        DataType = ftInteger
      end
      item
        Name = 'Start'
        DataType = ftDateTime
      end
      item
        Name = 'Finish'
        DataType = ftDateTime
      end
      item
        Name = 'Options'
        DataType = ftInteger
      end
      item
        Name = 'Caption'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'RecurrenceIndex'
        DataType = ftInteger
      end
      item
        Name = 'RecurrenceInfo'
        DataType = ftBlob
      end
      item
        Name = 'ResourceID'
        DataType = ftBlob
      end
      item
        Name = 'Location'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Message'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ReminderDate'
        DataType = ftDateTime
      end
      item
        Name = 'ReminderMinutes'
        DataType = ftInteger
      end
      item
        Name = 'State'
        DataType = ftInteger
      end
      item
        Name = 'LabelColor'
        DataType = ftInteger
      end
      item
        Name = 'ActualStart'
        DataType = ftDateTime
      end
      item
        Name = 'ActualFinish'
        DataType = ftDateTime
      end
      item
        Name = 'SyncIDField'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'EventsTableIndex1'
        Fields = 'ID;ParentID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = '..\..\Data\cxSchedulerEvents.db'
    Left = 280
    Top = 80
  end
  object SchedulerDataSource: TDataSource
    DataSet = EventsTable
    Left = 248
    Top = 80
  end
  object SchedulerAggregateStorage: TcxSchedulerAggregateStorage
    CustomFields = <>
    Resources.Items = <>
    Links = <
      item
        Default = True
        Storage = SchedulerDBStorage
      end
      item
        Storage = SchedulerStorage
      end>
    OnEventInserting = SchedulerAggregateStorageEventInserting
    Left = 248
    Top = 144
  end
  object SchedulerStorage: TcxSchedulerStorage
    CustomFields = <>
    Reminders.Active = False
    Resources.Items = <>
    Left = 248
    Top = 112
  end
  object SchedulerDBStorage: TcxSchedulerDBStorage
    Reminders.Active = False
    Resources.Items = <>
    CustomFields = <>
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
    Left = 312
    Top = 80
  end
end
