program Coliseu_Estatistica;

uses
  Vcl.SvcMgr,
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  UColiseuEstatistica in 'UColiseuEstatistica.pas' {ColiseuEstatistica: TService},
  Controller.Cliente in '..\vcl\controller\Controller.Cliente.pas',
  Model.LancaAtendimento in '..\vcl\model\Model.LancaAtendimento.pas',
  Model.LancaOcorrencia in '..\vcl\model\Model.LancaOcorrencia.pas',
  Model.LancaAtualizacao in '..\vcl\model\Model.LancaAtualizacao.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
  Application.Initialize;
  Application.CreateForm(TColiseuEstatistica, ColiseuEstatistica);
  Controller.cliente.Registry;
  THorse.Use(Jhonson());
  THorse.Use(CORS);
  THorse.Listen(9000);
  Application.Run;
end.
