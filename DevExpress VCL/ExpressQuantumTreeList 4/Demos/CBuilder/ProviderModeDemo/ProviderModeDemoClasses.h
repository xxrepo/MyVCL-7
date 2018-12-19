//---------------------------------------------------------------------------

#ifndef ProviderModeDemoClassesH
#define ProviderModeDemoClassesH
//---------------------------------------------------------------------------
#include <Classes.hpp>;
#include "cxTL.hpp";
#include "cxTLData.hpp";
#include "cxCustomData.hpp";
class TcxProviderRecordHandle: public TObject
{
private:
  int FChildLevelCount;
  TList *FChildList;
  TDateTime FDate;
  bool FDataLoaded;
  bool FDeletion;
  int FIntValue;
  TcxProviderRecordHandle *FParent;
  int FKey;
  String FText;
  int _fastcall GetCount();
  TcxProviderRecordHandle* _fastcall GetItem(int Index);
  int _fastcall GetIndex();
  int _fastcall GetLevel();
  int _fastcall GetParentKey();
  int _fastcall GetTotalCount();
  void _fastcall ChangeParent(TcxProviderRecordHandle *AParent);
protected:
  __property bool Deletion = {read=FDeletion};
public:
  __fastcall TcxProviderRecordHandle(int AKey, TcxProviderRecordHandle *AParent);
  virtual __fastcall  ~TcxProviderRecordHandle();
  TcxProviderRecordHandle* _fastcall Add(int AKey);
  TcxProviderRecordHandle* _fastcall AddChild(int AKey);
  void _fastcall AddExistChild(TcxProviderRecordHandle* ARecordHandle);
  void _fastcall DeleteChildren();
  int _fastcall GetChildIndex(TcxProviderRecordHandle* ARecordHandle);
  void _fastcall NodeMoveTo(TcxProviderRecordHandle *AttachRecordHandle,
    TcxTreeListNodeAttachMode AttachMode, bool IsCopy);
  void _fastcall RemoveChild(TcxProviderRecordHandle* ARecordHandle);
  __property int ChildLevelCount = {read=FChildLevelCount};
  __property int Count = {read=GetCount};
  __property bool DataLoaded = {read=FDataLoaded, write=FDataLoaded};
  __property int Index = {read=GetIndex};
  __property int IntValue = {read=FIntValue, write=FIntValue};
  __property TcxProviderRecordHandle* Items[int Index] = {read=GetItem};
  __property int Key = {read=FKey};
  __property int ParentKey = {read=GetParentKey};
  __property TcxProviderRecordHandle *Parent = {read=FParent};
  __property TDateTime Date = {read=FDate, write=FDate};
  __property int Level = {read=GetLevel};
  __property String Text = {read=FText, write=FText};
  __property int TotalCount = {read=GetTotalCount};
};

class TcxCustomDemoDataSource : public TcxTreeListCustomDataSource
{
private:
  int FCurrentKey;
protected:
  TcxProviderRecordHandle *FRootHandle;
	virtual void * __fastcall AppendRecord(void);
	virtual void __fastcall DeleteRecord(void * ARecordHandle);
  void _fastcall GenerateChildRecords(TcxProviderRecordHandle *AParentHandle);
	virtual Variant __fastcall GetKeyValue(void * ARecordHandle);
	virtual Variant __fastcall GetParentKeyValue(void * ARecordHandle);
	virtual Variant __fastcall GetValue(void * ARecordHandle, void * AItemHandle);
	virtual void * __fastcall InsertRecord(void * ARecordHandle);
  virtual TcxProviderRecordHandle* __fastcall InsertRecordHandle(
    TcxProviderRecordHandle *AParentHandle, bool AIsChild);
	virtual void __fastcall NodeMoveTo(void * ARecordHandle, void * AttachRecordHandle,
    Cxtl::TcxTreeListNodeAttachMode AttachMode, bool IsCopy);
	virtual void __fastcall SetValue(void * ARecordHandle, void * AItemHandle,
    const Variant &AValue);
  __property TcxProviderRecordHandle *RootHandle = {read=FRootHandle};
public:
  __fastcall TcxCustomDemoDataSource(void);
  __fastcall virtual ~TcxCustomDemoDataSource(void);
};

class TcxSmartLoadDemoDataSource : public TcxCustomDemoDataSource
{
private:
  int __fastcall GetCountFromItem(TcxProviderRecordHandle *AItem);
  TcxDataRecordHandle __fastcall GetChildItemHandle(
    TcxProviderRecordHandle *AItem, int AChildIndex);
protected:
	virtual void * __fastcall AppendRecord(void);
	virtual int __fastcall GetChildCount(void * AParentHandle);
	virtual void * __fastcall GetChildRecordHandle(void * AParentHandle,
    int AChildIndex);
	virtual void * __fastcall GetRootRecordHandle(void);
public:
  __fastcall TcxSmartLoadDemoDataSource(void);
};

class TcxLoadAllRecordsDemoDataSource : public TcxCustomDemoDataSource
{
private:
  TList *FRecordsList;
  void __fastcall CreateAllRecords();
  void __fastcall DoCreateRecords(TcxProviderRecordHandle *AParent, int ALevel);
protected:
	virtual void __fastcall DeleteRecord(void * ARecordHandle);
	virtual int __fastcall GetRecordCount(void);
	virtual void * __fastcall GetRecordHandle(int ARecordIndex);
  virtual TcxProviderRecordHandle* __fastcall InsertRecordHandle(
    TcxProviderRecordHandle *AParentHandle, bool AIsChild);
public:
  __fastcall TcxLoadAllRecordsDemoDataSource(void);
  __fastcall virtual ~TcxLoadAllRecordsDemoDataSource(void);
};

const cxProviderDemoLevelCount = 5;
const cxProviderDemoRecordsPerLevel = 10;

void RecreateDemoDataSource(TcxVirtualTreeList *ATreeList);

#endif

