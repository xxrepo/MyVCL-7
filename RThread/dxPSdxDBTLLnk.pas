{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressPrinting System(tm) COMPONENT SUITE                  }
{                                                                   }
{       Copyright (C) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSPRINTINGSYSTEM AND            }
{   ALL ACCOMPANYING VCL CONTROLS AS PART OF AN                     }
{   EXECUTABLE PROGRAM ONLY.                                        }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxPSdxDBTLLnk;

interface

{$I dxPSVer.inc}

uses
  dxDBTL, dxPSdxTLLnk, dxPSdxDBCtrlLnk;

type
  TdxDBTreeListReportLink = class(TdxDBTreeListControlReportLink)
  private
    function GetDBTreeList: TdxDBTreeList;
  protected
    function GetPrevGridMode: Boolean; override;
    procedure InternalRestoreDefaults; override;
    function NeedLoadAllRecords: Boolean; override;
    procedure TryLoadAllRecords; override;
    procedure UnloadAllRecords; override;
  public
    function IsDBGridLink: Boolean; override;
    function IsDBTreeListLink: Boolean; override;
  
    property DBTreeList: TdxDBTreeList read GetDBTreeList;
  published
    property OnCustomDrawBandCell;
    property OnCustomDrawCell;
    property OnCustomDrawFooterCell;
    property OnCustomDrawHeaderCell;
    property OnCustomDrawPreviewCell;
    property OnCustomDrawRowFooterCell;
  end;

const
  dxDefaultDBTreeListPaintOptions: TdxTreeListPaintOptions =
    [tlpoBands, tlpoHeaders, tlpoFooters, tlpoRowFooters, tlpoPreview, 
     tlpoPreviewGrid, tlpoGrid, tlpoFlatCheckmarks, tlpoSoft3D, tlpoRowFooterGrid];

implementation

uses
  dxPSCore;
  
function TdxDBTreeListReportLink.GetDBTreeList: TdxDBTreeList;
begin
  Result := TdxDBTreeList(Component);
end;

procedure TdxDBTreeListReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  Options := dxDefaultDBTreeListPaintOptions;
end;

function TdxDBTreeListReportLink.IsDBGridLink: Boolean;
begin
  Result := False;
end;

function TdxDBTreeListReportLink.IsDBTreeListLink: Boolean;
begin
  Result := True;
end;

function TdxDBTreeListReportLink.GetPrevGridMode: Boolean;
begin
  Result := not (etoLoadAllRecords in DBTreeList.OptionsDB);
end;

function TdxDBTreeListReportLink.NeedLoadAllRecords: Boolean;
begin
  Result := AutoNodesExpand;
end;    

procedure TdxDBTreeListReportLink.TryLoadAllRecords;
begin
  DBTreeList.OptionsDB := DBTreeList.OptionsDB + [etoLoadAllRecords];
end;

procedure TdxDBTreeListReportLink.UnloadAllRecords;
begin
  DBTreeList.OptionsDB := DBTreeList.OptionsDB - [etoLoadAllRecords];
end;

initialization

  dxPSRegisterReportLink(TdxDBTreeListReportLink, TdxDBTreeList, TdxTLReportLinkDesignWindow);

finalization
  dxPSUnregisterReportLink(TdxDBTreeListReportLink, TdxDBTreeList, TdxTLReportLinkDesignWindow);

end.

