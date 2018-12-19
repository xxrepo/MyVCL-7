//************************************************************************************//
//  File created automatically by GenerateRecords.xls                                 //
//  Do not modify by hand                                                             //
//************************************************************************************//

private
  function GetItems(index: integer): TChart;
  procedure SetItems(index: integer; const Value: TChart);
public
  property Items[index: integer]: TChart read GetItems write SetItems;  default;
  function Add(aRecord: TChart):integer;
  procedure Insert(Index: integer; aRecord: TChart);
