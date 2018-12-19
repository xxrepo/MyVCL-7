unit UArticle;

interface

uses Classes, DBPersistent;

type

  TArticle = class(TDBPersistent)
  private
    FFilterValue: string;

    property FilterValue: string read FFilterValue write FFilterValue;
    function GetArticleId: Integer;
    function GetSubject: string;
    procedure SetArticleId(const Value: Integer);
    procedure SetSubject(const Value: string);
  protected  
    function GetFieldsCount: Integer; override;
    function GetFilter: string; override;
    function GetTableName: string; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    function RestoreLast(AUserId: Integer): Integer;
    function RestoreById(AArticleId: Integer): Integer;

    property Id: Integer read GetArticleId write SetArticleId;
    property Subject: string read GetSubject write SetSubject;
  end;

implementation

uses
  SysUtils;

const
  FieldNames: array[0..10] of string = ('ARTICLEID', 'EXPERTID', 'EDITORID',
    'SOURCE', 'SUBJECT', 'BODY', 'ORIGINAL', 'DATE', 'PLATFORM', 'PRODUCTS', 'UPDATED');
  FilterValues: array[1..2] of string = ('WHERE ARTICLEID=%d',
    'a, USERVISIT b WHERE a.EDITORID IS NOT NULL AND a.DATE >= b.BEFORE AND b.USERID = %d');


{ TArticle }

constructor TArticle.Create;
begin
  inherited;

  InitItems(FieldNames);
end;

destructor TArticle.Destroy;
begin

  inherited;
end;

function TArticle.GetArticleId: Integer;
begin
  Result := Value['ARTICLEID'];
end;

function TArticle.GetFieldsCount: Integer;
begin
  Result := High(FieldNames) - Low(FieldNames) + 1;
end;

function TArticle.GetFilter: string;
begin
  Result := FilterValue;
end;

function TArticle.GetSubject: string;
begin
  Result := Value['SUBJECT'];
end;

function TArticle.GetTableName: string;
begin
  Result := 'ARTICLES';
end;

function TArticle.RestoreById(AArticleId: Integer): Integer;
begin
  FilterValue := Format(FilterValues[1], [AArticleId]);
  Result := Restore;
end;

function TArticle.RestoreLast(AUserId: Integer): Integer;
begin
  FilterValue := Format(FilterValues[2], [AUserId]);
  Result := Restore;
end;

procedure TArticle.SetArticleId(const Value: Integer);
begin
  ChangeItem('ARTICLEID', Value);
end;

procedure TArticle.SetSubject(const Value: string);
begin
  ChangeItem('SUBJECT', Value);
end;

end.
