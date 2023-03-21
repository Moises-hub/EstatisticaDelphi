unit UColiseuEstatistica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  FireDAC.Phys.FBDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.StorageBin;

type
  TColiseuEstatistica = class(TService)
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ColiseuEstatistica: TColiseuEstatistica;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ColiseuEstatistica.Controller(CtrlCode);
end;

function TColiseuEstatistica.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

end.
