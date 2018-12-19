unit pmTree;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebTV, cxWebMenus, cxWebMainMenu, cxWebImgList;
  

type
  TTree = class(TcxWebPageModule)
    TreeView: TcxWebTreeView;
    StyleController: TcxWebStyleController;
    Tree: TcxWebStyleItem;
    TreeItem: TcxWebStyleItem;
    ImageList: TcxWebImageList;
    TreeHover: TcxWebStyleItem;
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    { Private declarations }
    procedure FillTree;
  public
    { Public declarations }
  end;

function Tree: TTree;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, UCategory, ActiveX, ComObj;

function Tree: TTree;
begin
  Result := TTree(WebContext.FindModuleClass(TTree));
end;

procedure TTree.cxWebPageModuleActivate(Sender: TObject);
begin
 if IsFirstRequest then
   FillTree;
end;

procedure TTree.FillTree;
var
  ACategory: TCategory;
  I: Integer;
  ATreeItem: TcxWebTreeItem;
begin
  ACategory := TCategory.Create;
  try
    ACategory.Connection := DM.Connection;
    ACategory.RestoreForTree;
    for I := 0 to ACategory.Count - 1 do
    begin
      if ACategory.ParentId = -1 then
        ATreeItem := TreeView.AddItem
      else ATreeItem := TreeView.ItemByName('TIN' + IntToStr(ACategory.ParentId)).AddChild;
      ATreeItem.Name := 'TIN' + IntToStr(ACategory.Id);
      ATreeItem.Text := '&nbsp;' + ACategory.Name;
      ATreeItem.URL.Href := 'IntroList?cid=' + IntToStr(ACategory.Id);
      ATreeItem.URL.Target := 'info';
      ACategory.CurrentRow := ACategory.CurrentRow + 1;
    end;
  finally
    ACategory.Free;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TTree, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
