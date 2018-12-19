//************************************************************************************//
//  File created automatically by GenerateRecords.xls                                 //
//  Do not modify by hand                                                             //
//************************************************************************************//

private
  function GetItems(index: integer): TBaseRowColRecord;
  procedure SetItems(index: integer; const Value: TBaseRowColRecord);
public
  property Items[index: integer]: TBaseRowColRecord read GetItems write SetItems;  default;
  function Add(aRecord: TBaseRowColRecord):integer;
  procedure Insert(Index: integer; aRecord: TBaseRowColRecord);
