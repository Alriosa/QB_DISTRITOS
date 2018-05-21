unit BS_DBConexion;

interface
uses
  uSistema, uDL_DBConexion, Vcl.Dialogs;

var
  _MainConexion: TBS_DBConexion;

  procedure BS_DBConexion_Conectar_Main(pDriver: string);
  procedure BS_DBConexion_Desonectar_Main;
  procedure BS_Iniciar_Transaccion_Main(var pResultado: Integer;
    var pErrorM: string);
  procedure BS_Aceptar_Transaccion_Main(var pResultado: Integer;
    var pErrorM: string);
  procedure BS_Rechazar_Transaccion_Main(var pResultado: Integer;
      var pErrorM: string);

implementation

procedure BS_DBConexion_Conectar_Main(pDriver: string);
begin
  try
    _MainConexion := TBS_DBConexion.Create;
    _MainConexion.Server :=
      Global.DB_Servidor;
    _MainConexion.Database :=
      Global.DB_BaseDatos;
    _MainConexion.User :=
      Global.DB_Usuario;
    _MainConexion.Password :=
      Global.DB_Clave;
    _MainConexion.Port :=
      Global.DB_Puerto;
    _MainConexion.Conectar(pDriver, _Resultado, _ErrorM);
  except
  end;
end;

procedure BS_DBConexion_Desonectar_Main;
begin
  try
    _MainConexion.Destroy;
  except
  end;
end;

procedure BS_Iniciar_Transaccion_Main(var pResultado: Integer;
  var pErrorM: string);
begin
  _MainConexion.Iniciar_Transaccion(pResultado, pErrorM);
end;

procedure BS_Aceptar_Transaccion_Main(var pResultado: Integer;
  var pErrorM: string);
begin
  _MainConexion.Aceptar_Transaccion(pResultado, pErrorM);
end;

procedure BS_Rechazar_Transaccion_Main(var pResultado: Integer;
  var pErrorM: string);
begin
  _MainConexion.Rechazar_Transaccion(pResultado, pErrorM);
end;

end.
