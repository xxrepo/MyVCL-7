unit Asgunit;

interface

{$DEFINE USEROTATED}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, AdvGrid, StdCtrls, Buttons, ExtCtrls,
  Menus, ClipBrd, asprev, asabout, asfind, ComCtrls, ImgList;

type
  TDemo = class(TForm)
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Loaddata1: TMenuItem;
    Loadfromfile1: TMenuItem;
    Savetofile1: TMenuItem;
    SavetoHTML1: TMenuItem;
    SavetoCSV1: TMenuItem;
    SaveasXLS1: TMenuItem;
    Clipboard1: TMenuItem;
    Print1: TMenuItem;
    Copytoclipboard2: TMenuItem;
    Pastefromclipboard2: TMenuItem;
    Copyselectiontoclipboard1: TMenuItem;
    Print2: TMenuItem;
    Printpreview1: TMenuItem;
    Setselection1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Pastefromclipboard1: TMenuItem;
    LoadfromCSV1: TMenuItem;
    LoadfromXLS1: TMenuItem;
    Hide1: TMenuItem;
    Column11: TMenuItem;
    Column21: TMenuItem;
    Column31: TMenuItem;
    Column41: TMenuItem;
    Search1: TMenuItem;
    Findfirst1: TMenuItem;
    Findnext1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    AdvStringGrid2: TAdvStringGrid;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button8: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Button6: TButton;
    RadioGroup1: TRadioGroup;
    fixedsort: TCheckBox;
    multiline: TCheckBox;
    colro: TCheckBox;
    AdvStringGrid1: TAdvStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SavetoASCII1: TMenuItem;
    TabSheet3: TTabSheet;
    editgrid: TAdvStringGrid;
    Label6: TLabel;
    Column51: TMenuItem;
    Column61: TMenuItem;
    Column71: TMenuItem;
    ImageList1: TImageList;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label8: TLabel;
    PrintDialog1: TPrintDialog;
    TabSheet4: TTabSheet;
    AdvStringGrid3: TAdvStringGrid;
    SavetoDOC1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    RadioGroup2: TRadioGroup;
    Exit1: TMenuItem;
    CheckBox7: TCheckBox;
    SavetoXML1: TMenuItem;
    colfix: TCheckBox;
    Memo1: TMemo;
    Printpreviewwithgraphics1: TMenuItem;
    Printwithgraphics1: TMenuItem;
    procedure Button3Click(Sender: TObject);
    procedure AdvStringGrid1GetAlignment(Sender: TObject; ARow,
      ACol: Longint; var AAlignment: TAlignment);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure AdvStringGrid1GetCellColor(Sender: TObject; ARow,
      ACol: Longint; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure FormCreate(Sender: TObject);
    procedure AdvStringGrid1GridHint(Sender: TObject; Arow, Acol: Longint;
      var hintstr: string);
    procedure Loadfromfile1Click(Sender: TObject);
    procedure Savetofile1Click(Sender: TObject);
    procedure SavetoHTML1Click(Sender: TObject);
    procedure SavetoCSV1Click(Sender: TObject);
    procedure AdvStringGrid1AutoInsertRow(Sender: TObject; ARow: Longint);
    procedure AdvStringGrid1AutoDeleteRow(Sender: TObject; aRow: Longint);
    procedure AdvStringGrid1ClickSort(Sender: TObject; aCol: Longint);
    procedure CopytoExcel1Click(Sender: TObject);
    procedure SaveasXLS1Click(Sender: TObject);
    procedure Copytoclipboard2Click(Sender: TObject);
    procedure Pastefromclipboard2Click(Sender: TObject);
    procedure Print2Click(Sender: TObject);
    procedure Printpreview1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Setselection1Click(Sender: TObject);
    procedure fixedsortClick(Sender: TObject);
    procedure Copyselectiontoclipboard1Click(Sender: TObject);
    procedure Pastefromclipboard1Click(Sender: TObject);
    procedure LoadfromCSV1Click(Sender: TObject);
    procedure LoadfromXLS1Click(Sender: TObject);
    procedure AdvStringGrid1PrintPage(Sender: TObject; Canvas: TCanvas;
      pagenr, pagexsize, pageysize: Integer);
    procedure Column11Click(Sender: TObject);
    procedure Findfirst1Click(Sender: TObject);
    procedure Findnext1Click(Sender: TObject);
    procedure multilineClick(Sender: TObject);
    procedure AdvStringGrid1CanEditCell(Sender: TObject; Arow,
      Acol: Integer; var canedit: Boolean);
    procedure AdvStringGrid1CellValidate(Sender: TObject; Col,
      Row: Integer; var Value: String; var Valid: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvStringGrid2GetAlignment(Sender: TObject; ARow,
      ACol: Integer; var AAlignment: TAlignment);
    procedure SavetoASCII1Click(Sender: TObject);
    procedure editgridGetEditorType(Sender: TObject; aCol, aRow: Integer;
      var aEditor: TEditorType);
    procedure editgridEllipsClick(Sender: TObject; aCol, aRow: Integer;
      var S: String);
    procedure AdvStringGrid1GetFormat(Sender: TObject; ACol: Integer;
      var AStyle: TSortStyle; var aPrefix, aPostfix: String);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure AdvStringGrid1PrintStart(Sender: TObject; NrOfPages: Integer;
      var FromPage, ToPage: Integer);
    procedure SavetoDOC1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SavetoXML1Click(Sender: TObject);
    procedure AdvStringGrid1IsFixedCell(Sender: TObject; Arow,
      Acol: Integer; var isfixed: Boolean);
    procedure colfixClick(Sender: TObject);
    procedure AdvStringGrid1CanSort(Sender: TObject; aCol: Integer;
      var dosort: Boolean);
    procedure Printpreviewwithgraphics1Click(Sender: TObject);
    procedure Printwithgraphics1Click(Sender: TObject);
  private
     bitmap1,bitmap2,bitmap3,bitmap4,bitmap5:tbitmap;
     icon1,icon2,icon3,icon4,icon5:ticon;
     procedure InitGraphicGrid;
     procedure SetPrintOptions;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.DFM}
{$R iehand.res}
{$R icons.res}     

procedure TDemo.Button3Click(Sender: TObject);
begin
 advstringgrid1.autosize:=true;
end;

procedure TDemo.AdvStringGrid1GetAlignment(Sender: TObject; ARow,
  ACol: Longint; var AAlignment: TAlignment);
begin
 if acol in [3,4] then aAlignment:=taRightJustify;
end;

procedure TDemo.Button6Click(Sender: TObject);
begin
 if radiogroup1.itemindex=0 then
   advstringgrid1.sortdirection:=sdAscending
 else
   advstringgrid1.sortdirection:=sdDescending;
 advstringgrid1.sortcolumn:=1;
 advstringgrid1.QSort;
end;

procedure TDemo.Button7Click(Sender: TObject);
var
 pagepreview:tpagepreview;
begin
 advstringgrid1.printsettings.titlelines.Assign(memo1.lines);

 if checkbox2.checked then
    advstringgrid1.printsettings.time:=ppTopLeft
 else
    advstringgrid1.printsettings.time:=ppNone;

 if checkbox2.checked then
    advstringgrid1.printsettings.date:=ppTopRight
 else
    advstringgrid1.printsettings.date:=ppNone;

 if checkbox3.checked then
    advstringgrid1.printsettings.pagenr:=ppBottomCenter
 else
    advstringgrid1.printsettings.pagenr:=ppNone;

 if checkbox4.checked then
    advstringgrid1.printsettings.borders:=pbSingle
 else
    advstringgrid1.printsettings.borders:=pbNoborder;

{
 advstringgrid1.print;
}

{
 advstringgrid1.printpreview(paintbox1.canvas);
}

 pagepreview:=tpagepreview.create(self,advstringgrid1);
 try
  pagepreview.showmodal;
 finally
  pagepreview.free;
 end;

end;

procedure TDemo.Button8Click(Sender: TObject);
begin
 fontdialog1.font:=advstringgrid1.printsettings.font;
 if fontdialog1.execute then
   advstringgrid1.printsettings.font:=fontdialog1.font;
end;

procedure TDemo.AdvStringGrid1GetCellColor(Sender: TObject; ARow,
  ACol: Longint; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
 if (acol=1) and (arow>0) and (arow<advstringgrid1.rowcount-advstringgrid1.fixedfooters) and (not(gdSelected in AState) or (gdFocused in AState)) then
   begin
    abrush.color:=clYellow;
    afont.color:=clRed;
   end;
 if (arow=0) then
    begin
     afont.style:=[fsBold];
    end;
end;

procedure TDemo.InitGraphicGrid;
begin
  icon1:=ticon.create;
  icon1.handle:=loadicon(hinstance,'ICON_1');
  icon2:=ticon.create;
  icon2.handle:=loadicon(hinstance,'ICON_2');
  icon3:=ticon.create;
  icon3.handle:=loadicon(hinstance,'ICON_3');
  icon4:=ticon.create;
  icon4.handle:=loadicon(hinstance,'ICON_4');
  icon5:=ticon.create;
  icon5.handle:=loadicon(hinstance,'ICON_5');

  with advstringgrid2 do
   begin
    addicon(1,1,icon1,haCenter,vaAboveText);
    addicon(1,2,icon2,haCenter,vaAboveText);
    addicon(1,3,icon3,haCenter,vaAboveText);
    addicon(1,4,icon4,haCenter,vaAboveText);
    addicon(1,5,icon5,haCenter,vaAboveText);

    {$IFDEF USEROTATED}
    addrotated(1,0,90,'Icons');
    {$ENDIF}

    cells[1,1]:='cpu';
    cells[1,2]:='trashcan';
    cells[1,3]:='icon';
    cells[1,4]:='floppy';
    cells[1,5]:='audio';


    addimageidx(2,1,0,habeforetext,vaCenter);
    addimageidx(2,2,1,haBeforeText,vaCenter);
    addimageidx(2,3,2,haBeforeText,vaCenter);
    addimageidx(2,4,3,haBeforeText,vaCenter);
    addimageidx(2,5,4,haBeforeText,vaCenter);

    {$IFDEF USEROTATED}
    addrotated(2,0,90,'Imagelist');
    {$ENDIF}

    cells[2,1]:='mail';
    cells[2,2]:='note';
    cells[2,3]:='cancel';
    cells[2,4]:='home';
    cells[2,5]:='web';

    bitmap1:=tbitmap.create;
    bitmap1.handle:=loadbitmap(hinstance,'BITMAP_1');
    bitmap2:=tbitmap.create;
    bitmap2.handle:=loadbitmap(hinstance,'BITMAP_2');
    bitmap3:=tbitmap.create;
    bitmap3.handle:=loadbitmap(hinstance,'BITMAP_3');
    bitmap4:=tbitmap.create;
    bitmap4.handle:=loadbitmap(hinstance,'BITMAP_4');
    bitmap5:=tbitmap.create;
    bitmap5.handle:=loadbitmap(hinstance,'BITMAP_5');

    addbitmap(3,1,bitmap1,false,haright,vabottom);
    addbitmap(3,2,bitmap2,false,haright,vabottom);
    addbitmap(3,3,bitmap3,false,haright,vabottom);
    addbitmap(3,4,bitmap4,false,haright,vabottom);
    addbitmap(3,5,bitmap5,false,haright,vabottom);

    cells[3,1]:='';
    cells[3,2]:='';
    cells[3,3]:='';
    cells[3,4]:='';
    cells[3,5]:='';

    autonumbercol(0);

    {$IFDEF USEROTATED}
    addrotated(3,0,90,'Bitmaps');

    addrotated(4,0,90,'Text');

    addrotated(4,1,45,'One');

    addrotated(4,2,135,'Two');

    addrotated(4,3,225,'Three');

    addrotated(4,4,315,'Four');

    addrotated(4,5,180,'Five');

    addrotated(5,0,90,'Multi Image');

    addrotated(6,0,90,'Rich text');
    {$ENDIF}

    addmultiimage(5,1,0,haBeforeText,vaCenter);

    with CellImages [5,1] do
      begin
       Add(0);
       Add(1);
      end;

    addmultiimage(5,2,0,haBeforeText,vaCenter);

    with CellImages [5,2] do
      begin
       Add(2);
       Add(3);
       Add(4);
      end;

    addmultiimage(5,3,0,haBeforeText,vaCenter);

    with CellImages [5,3] do
      begin
       Add(0);
      end;

    addmultiimage(5,4,0,haBeforeText,vaCenter);

    with CellImages [5,4] do
      begin
       Add(1);
       Add(3);
       Add(4);
       Add(2);
      end;

    addmultiimage(5,5,0,haBeforeText,vaCenter);

    with CellImages [5,5] do
      begin
       Add(4);
       Add(1);
      end;

    richedit.text:='Rich text';
    richedit.selstart:=0;
    richedit.sellength:=4;
    richedit.selattributes.color:=clRed;
    richedit.selattributes.style:=[fsBold];
    richedit.selstart:=5;
    richedit.sellength:=4;
    richedit.selattributes.color:=clBlue;
    richedit.selattributes.style:=[fsItalic];
    richtocell(6,1,richedit);


    richedit.Clear;
    richedit.selattributes.style:=[];
    richedit.selattributes.color:=clBlack;

    richedit.text:='Superscript';

    richedit.selstart:=0;
    richedit.sellength:=5;
    richedit.selsuperscript;
    richedit.selattributes.color:=clBlue;

    richtocell(6,2,richedit);

    richedit.Clear;
    richedit.selattributes.style:=[];
    richedit.selattributes.color:=clBlack;

    richedit.text:='Subscript';
    richedit.selstart:=0;
    richedit.sellength:=3;
    richedit.selsubscript;
    richedit.selattributes.color:=clBlue;

    richtocell(6,3,richedit);

    richedit.Clear;
    richedit.selattributes.style:=[];
    richedit.selattributes.color:=clBlack;
    richedit.selnormal;

    richedit.text:='One'#13'Two'#13'Three';
    richedit.paragraph.Numbering := nsBullet;

    richtocell(6,4,richedit);

   end;
end;

procedure TDemo.FormCreate(Sender: TObject);
var
 stream:tresourcestream;
 i:integer;
begin
 advstringgrid1.Clear;
 advstringgrid1.loadfromfile('test.txt');
 advstringgrid3.loadfromfile('test.txt');

 advstringgrid1.SortColumn :=1;


 editgrid.Clear;
 editgrid.loadfromfile('test.txt');

 editgrid.ClearComboString;
 editgrid.AddComboString('BMW');
 editgrid.AddComboString('Mercedes Benz');
 editgrid.AddComboString('Audi');
 editgrid.AddComboString('Porsche');
 editgrid.AddComboString('Ferrari');
 editgrid.AddComboString('Opel');
 editgrid.AddComboString('Lamborghini');
 editgrid.Combobox.sorted:=true;

 InitgraphicGrid;

 for i:=1 to editgrid.rowcount-1 do
  begin
   editgrid.addcheckbox(5,i,false,false);
  end;

 editgrid.datetimepicker.calcolors.titlebackcolor:=clRed;
 editgrid.datetimepicker.calcolors.monthbackcolor:=clYellow;
 editgrid.spinedit.minvalue:=0;
 editgrid.spinedit.maxvalue:=100;
 editgrid.spinedit.increment:=2;

 with advstringgrid3 do
  begin
   fixedcols:=0;
   fixedcolwidth:=20;
   addnode(2,4);
   addnode(7,2);
   addnode(13,4);
  end;


end;

procedure TDemo.AdvStringGrid1GridHint(Sender: TObject; Arow,
  Acol: Longint; var hintstr: string);
begin
 case acol of
 1:hintstr:='Name of car company';
 2:hintstr:='Car model';
 3:hintstr:='# of cylinders';
 4:hintstr:='Year of introduction';
 5:hintstr:='Engine power';
 6:hintstr:='Price';
 7:hintstr:='Website';
 end;
end;

procedure TDemo.Loadfromfile1Click(Sender: TObject);
begin
 advstringgrid1.Clear;
 advstringgrid1.loadfromfile('test.txt');
end;

procedure TDemo.Savetofile1Click(Sender: TObject);
begin
advstringgrid1.savetofile('test.txt');
end;

procedure TDemo.SavetoHTML1Click(Sender: TObject);
begin
 advstringgrid1.Savetohtml('test.htm');
end;

procedure TDemo.SavetoCSV1Click(Sender: TObject);
begin
 advstringgrid1.savefixedcells:=false;
 advstringgrid1.Savetocsv('test.csv');
end;

procedure TDemo.LoadfromCSV1Click(Sender: TObject);
begin
 advstringgrid1.savefixedcells:=false;
 advstringgrid1.loadfromcsv('test.csv');
end;

procedure TDemo.AdvStringGrid1AutoInsertRow(Sender: TObject;
  ARow: Longint);
begin
 advstringgrid1.autonumbercol(0);
end;

procedure TDemo.AdvStringGrid1AutoDeleteRow(Sender: TObject;
  aRow: Longint);
begin
 advstringgrid1.autonumbercol(0);
end;

procedure TDemo.AdvStringGrid1ClickSort(Sender: TObject; aCol: Longint);
begin
 if not advstringgrid1.sortfixedcols then
 advstringgrid1.autonumbercol(0);
end;

procedure TDemo.CopytoExcel1Click(Sender: TObject);
begin
 Advstringgrid1.savetoxls('test.xls');
end;

procedure TDemo.SaveasXLS1Click(Sender: TObject);
begin
 advstringgrid1.savetoxls('text.xls');
end;

procedure TDemo.Copytoclipboard2Click(Sender: TObject);
begin
 advstringgrid1.copytoclipboard;
end;

procedure TDemo.Copyselectiontoclipboard1Click(Sender: TObject);
begin
 advstringgrid1.copyselectiontoclipboard;
end;

procedure TDemo.Pastefromclipboard2Click(Sender: TObject);
begin
 advstringgrid1.pasteselectionfromclipboard;
end;

procedure TDemo.Pastefromclipboard1Click(Sender: TObject);
begin
 advstringgrid1.pastefromclipboard;
end;

procedure TDemo.SetPrintOptions;
begin
 advstringgrid1.printsettings.titlelines.Assign(memo1.lines);

 if checkbox2.checked then
    advstringgrid1.printsettings.time:=ppTopLeft
 else
    advstringgrid1.printsettings.time:=ppNone;

 if checkbox1.checked then
    advstringgrid1.printsettings.date:=ppTopRight
 else
    advstringgrid1.printsettings.date:=ppNone;

 if checkbox3.checked then
    advstringgrid1.printsettings.pagenr:=ppBottomCenter
 else
    advstringgrid1.printsettings.pagenr:=ppNone;

 if checkbox4.checked then
   begin
     if radiobutton1.checked then
       advstringgrid1.PrintSettings.Borders :=advgrid.pbVertical;
     if radiobutton2.checked then
       advstringgrid1.PrintSettings.Borders :=advgrid.pbHorizontal;
     if radiobutton3.checked then
       advstringgrid1.PrintSettings.Borders :=advgrid.pbSingle;
   end
 else
    advstringgrid1.printsettings.borders:=advgrid.pbNoborder;

  if checkbox5.checked then
    advstringgrid1.printsettings.FitToPage := fpAlways
  else
    advstringgrid1.printsettings.FitToPage := fpNever;

  advstringgrid1.printsettings.NoAutoSize:=not checkbox7.checked;

  advstringgrid1.printsettings.Centered :=checkbox6.checked;
end;

procedure TDemo.Print2Click(Sender: TObject);
begin
 SetPrintOptions;
 advstringgrid1.print;
end;

procedure TDemo.Printpreview1Click(Sender: TObject);
var
 pagepreview:tpagepreview;
begin
 SetPrintOptions;
 advstringgrid1.previewpage:=1;
 pagepreview:=tpagepreview.create(self,advstringgrid1);
 try
  pagepreview.showmodal;
 finally
  pagepreview.free;
 end;
end;

procedure TDemo.About1Click(Sender: TObject);
var
 About:tAbout;
begin
 About:=tAbout.Create(self);
 try
  About.showmodal;
 finally
  about.free;
 end;
end;

procedure TDemo.Setselection1Click(Sender: TObject);
var
 gridrect:tgridrect;
begin
 gridrect.left:=1;
 gridrect.top:=5;
 gridrect.right:=advstringgrid1.colcount-1;
 gridrect.bottom:=advstringgrid1.rowcount-1;
 advstringgrid1.printrect(gridrect);
end;

procedure TDemo.fixedsortClick(Sender: TObject);
begin
 advstringgrid1.sortfixedcols:=fixedsort.checked;
end;

procedure TDemo.LoadfromXLS1Click(Sender: TObject);
begin
 advstringgrid1.loadfromxls('test.xls');
end;

procedure TDemo.AdvStringGrid1PrintPage(Sender: TObject; Canvas: TCanvas;
  pagenr, pagexsize, pageysize: Integer);
var
 savefont:tfont;
 ts,tw:integer;

const
 myowntitle:string='Your company name can go here using custom drawing';

begin
 if advstringgrid1.PrintColStart <>0 then exit;
 with canvas do
  begin

    savefont:=tfont.create;
    savefont.assign(font);

    font.name:='Arial';
    font.style:=[fsBold];
    font.height:=advstringgrid1.mapfontheight(14);
    font.color:=clRed;

    ts:=advstringgrid1.printcoloffset[0];
    tw:=advstringgrid1.printpagewidth;

    moveto(ts,-5);
    lineto(ts+tw,-5);
    lineto(ts+tw,-advstringgrid1.printsettings.headersize+5);
    lineto(ts,-advstringgrid1.printsettings.headersize+5);
    lineto(ts,-5);

    ts:=ts+ ((tw-textwidth(myowntitle)) shr 1);

    textout(ts,-10,myowntitle);

    font.assign(savefont);
    savefont.free;
  end;

end;

procedure TDemo.Column11Click(Sender: TObject);
var
 acol:longint;
begin
  acol:=(sender as tmenuitem).tag;
  with advstringgrid1 do
   begin
    if ishiddencolumn(acol) then unhidecolumn(acol)
    else hidecolumn(acol);
    (sender as tmenuitem).checked:=ishiddencolumn(acol);
   end;
end;

procedure TDemo.Findfirst1Click(Sender: TObject);
var
 res:tpoint;
 finddlg:tfinddlg;
 findparams:tfindparams;

begin
 finddlg:=tfinddlg.create(self);
 try
  if (finddlg.showmodal=mrOk) then
   begin
    findparams:=[];
    if finddlg.chkcase.checked then findparams:=findparams + [fnMatchCase];
    if finddlg.chkfull.checked then findparams:=findparams + [fnMatchFull];
    if finddlg.chkregular.checked then findparams:=findparams + [fnMatchRegular];
    if finddlg.dir.itemindex=1 then findparams:=findparams + [fnDirectionLeftRight];
    if finddlg.where.itemindex=1 then findparams:=findparams + [fnFindInCurrentCol];
    if finddlg.where.itemindex=2 then findparams:=findparams + [fnFindInCurrentRow];
    res:=advstringgrid1.findfirst(finddlg.findtext.text,findparams);
    if res.x>=0 then
     begin
      advstringgrid1.col:=res.x;
      advstringgrid1.row:=res.y;
     end
    else
      messagedlg('Text not found',mtinformation,[mbOK],0);
   end;
 finally
  finddlg.free;
 end;

end;

procedure TDemo.Findnext1Click(Sender: TObject);
var
 res:tpoint;
begin
 res:=advstringgrid1.findnext;
 if (res.x>=0) and (res.y>=0) then
   begin
    advstringgrid1.col:=res.x;
    advstringgrid1.row:=res.y;
   end
 else
  messagedlg('Text not found',mtinformation,[mbOK],0);
end;

procedure TDemo.multilineClick(Sender: TObject);
var
 i:integer;
begin

 if multiline.checked then
   advstringgrid1.defaultrowheight:=28
 else
   advstringgrid1.defaultrowheight:=16;

 advstringgrid1.multilinecells:=multiline.checked;

{
 if multiline.checked then
  begin
   for i:=1 to advstringgrid1.rowcount-1 do
    begin
     advstringgrid1.cells[2,i]:=advstringgrid1.cells[2,i]+#13#10+'line 2';
    end;
  end;
} 
end;

procedure TDemo.AdvStringGrid1CanEditCell(Sender: TObject; Arow,
  Acol: Integer; var canedit: Boolean);
begin
 canedit:=(acol<>3) or (colro.checked=false);
end;

procedure TDemo.AdvStringGrid1CellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var
 code,i:integer;
begin
{
 if (col>=3) then
  begin
    val(value,i,code);
    valid:=(code=0) and (i>0);
    if not valid then messagedlg('Validation example'#13#10'Input should be a number > 0',mtinformation,[mbok],0);
  end;
}
end;

procedure TDemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 icon1.free;
 icon2.free;
 icon3.free;
 icon4.free;
 icon5.free;

 bitmap1.free;
 bitmap2.free;
 bitmap3.free;
 bitmap4.free;
 bitmap5.free;
end;

procedure TDemo.AdvStringGrid2GetAlignment(Sender: TObject; ARow,
  ACol: Integer; var AAlignment: TAlignment);
begin
 if (acol<>2) {and (acol<>4)} then Aalignment:=taCenter;
 if (arow=0) then Aalignment:=taCenter;

end;


procedure TDemo.SavetoASCII1Click(Sender: TObject);
begin
 advstringgrid1.savetoascii('test.asc');
end;

procedure TDemo.editgridGetEditorType(Sender: TObject; aCol, aRow: Integer;
  var aEditor: TEditorType);
begin
 case acol of
 1:aEditor:=edComboList;
 2:aEditor:=edEditBtn;
 3:aEditor:=edSpinEdit;
 4:aEditor:=edDateEdit;
 end;
end;

procedure TDemo.editgridEllipsClick(Sender: TObject; aCol, aRow: Integer;
  var S: String);
var
 tmp:string;
begin
 tmp:=s;
 if inputquery('Edit ('+inttostr(aCol)+':'+inttostr(aRow)+')','Cell value',tmp) then
  s:=tmp;

end;



procedure TDemo.AdvStringGrid1GetFormat(Sender: TObject; ACol: Integer;
  var AStyle: TSortStyle; var aPrefix, aPostfix: String);
begin
  case acol of
  3:AStyle:=ssNumeric;
  4:AStyle:=ssDate;
  5:begin
     AStyle:=ssNumeric;
     apostfix:='pk';
    end;
  6:begin
     AStyle:=ssNumeric;
     aprefix:='$ ';
    end;
  end;
end;

procedure TDemo.RadioButton1Click(Sender: TObject);
begin
 radiobutton3.checked:=false;
 radiobutton2.checked:=false;
 radiobutton1.checked:=true;
end;

procedure TDemo.RadioButton3Click(Sender: TObject);
begin
 radiobutton2.checked:=false;
 radiobutton1.checked:=false;
 radiobutton3.checked:=true;
end;

procedure TDemo.RadioButton2Click(Sender: TObject);
begin
 radiobutton1.checked:=false;
 radiobutton3.checked:=false;
 radiobutton2.checked:=true;
end;

procedure TDemo.AdvStringGrid1PrintStart(Sender: TObject;
  NrOfPages: Integer; var FromPage, ToPage: Integer);
begin
 printdialog1.FromPage :=frompage;
 printdialog1.ToPage:= toPage;
 printdialog1.Maxpage:=toPage;
 printdialog1.minpage:=1;

 if printdialog1.execute then
  begin
   frompage:=printdialog1.FromPage;
   topage:=printdialog1.ToPage;
  end
 else
  begin
   frompage:=0;
   topage:=0;
  end;


end;

procedure TDemo.SavetoDOC1Click(Sender: TObject);
begin
 advstringgrid1.SavetoDOC('test.doc');
end;

procedure TDemo.Button1Click(Sender: TObject);
begin
 advstringgrid3.expandall;
end;

procedure TDemo.Button2Click(Sender: TObject);
begin
 advstringgrid3.contractall;
end;

procedure TDemo.RadioGroup2Click(Sender: TObject);
begin
 case radiogroup2.itemindex of
 0:advstringgrid3.cellnode.nodetype:=cnFlat;
 1:advstringgrid3.cellnode.nodetype:=cn3D;
 2:advstringgrid3.cellnode.nodetype:=cnGlyph;
 end;
end;

procedure TDemo.Exit1Click(Sender: TObject);
begin
self.Close;
end;

procedure TDemo.SavetoXML1Click(Sender: TObject);
var
 sl:tstringlist;
begin
 sl:=tstringlist.Create;
 sl.add('Nr');
 sl.add('Car');
 sl.add('Type');
 sl.add('Cylinders');
 sl.add('Intro');
 sl.add('Power');
 sl.add('Price');
 sl.add('Web');

 advstringgrid1.Savetoxml('test.xml','CARLIST','CAR',sl);
 sl.free;
end;

procedure TDemo.AdvStringGrid1IsFixedCell(Sender: TObject; Arow,
  Acol: Integer; var isfixed: Boolean);
begin
 isfixed:=colfix.checked and (acol=3);
end;

procedure TDemo.colfixClick(Sender: TObject);
begin
 colro.checked:=true;
 advstringgrid1.repaint;
end;

procedure TDemo.AdvStringGrid1CanSort(Sender: TObject; aCol: Integer;
  var dosort: Boolean);
begin
 dosort:=not ((acol=3) and colfix.checked);
end;

procedure TDemo.Printpreviewwithgraphics1Click(Sender: TObject);
begin
 advstringgrid2.previewpage:=1;

 pagepreview:=tpagepreview.create(self,advstringgrid2);
 try
  pagepreview.showmodal;
 finally
  pagepreview.free;
 end;

end;

procedure TDemo.Printwithgraphics1Click(Sender: TObject);
begin
 advstringgrid2.printerdriverfix:=true;
 advstringgrid2.print;
end;

end.
