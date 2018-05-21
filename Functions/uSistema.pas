unit uSistema;

interface

uses
  INIFiles, System.Classes, Windows, SysUtils, Forms, Vcl.Dialogs;

type
  TGlobal = class
    PathAplicacion: string;
    PathTemp: string;
    PathLogs: string;
    PathLogsXML: string;
    PathRespaldo: string;
    QB_Company: string;
    QB_File: string;
    Aplicacion: string;
    Instalado: Integer;
    Usuario_NombreCompleto: string;
    Usuario_Id: Integer;
    Usuario_Nivel: Integer;
    Usuario_Email: string;
    Usuario_CodigoRol: Integer;
    Usuario_CodigoClase: Integer;
    Usuario_Usuario: string;
    Version: string;
    TerminalIP: string;
    TerminalMAC: string;

    DB_Driver: string;
    DB_Tipo: Integer;
    DB_Servidor: string;
    DB_BaseDatos: string;
    DB_Usuario: string;
    DB_Clave: string;
    DB_Puerto: Integer;
    DB_Varios: string;

    DB_DriverExterno: string;
    DB_TipoExterno: Integer;
    DB_ServidorExterno: string;
    DB_BaseDatosExterno: string;
    DB_UsuarioExterno: string;
    DB_ClaveExterno: string;
    DB_PuertoExterno: Integer;
    DB_VariosExterno: string;

    EmpresaCodigo: Integer;
    SucursalCodigo: Integer;
    EmpresaCodigoDefault: Integer;
    SucursalCodigoDefault: Integer;
    EmpresaNombre: string;
    SucursalNombre: string;
    EmpresaEmail: string;

    FTP_Host: string;
    FTP_Username: string;
    FTP_Password: string;
    FTP_Port: Integer;
    FTP_Pasive: Integer;
    FTP_DirEjecutable: string;
    FTP_DirActualizador: string;
    Estilo: Integer;
    Licencia: string;
    SO: string;
    IP: string;
    SubirTemplate: Integer;
    FechaInicio: string;
    FechaFin: string;
    Nmerosucursal: string;
    NumeroTerminal: string;
    NombreSucursal: string;
  end;

var
  Global: TGlobal;
  _Resultado: Integer;
  _ErrorM: string;

  procedure InicialiarSistema;
  procedure FinalizarSistema;

implementation

procedure InicialiarSistema;
var
  mLen: Integer;
begin
  Global := TGlobal.Create;

  Global.PathAplicacion := ExtractFilePath(Application.ExeName);
  mLen := Length(Global.PathAplicacion);
  if Global.PathAplicacion[mLen] = '\' then
    Global.PathAplicacion := Copy(Global.PathAplicacion, 1, mLen -1);

  Global.PathTemp := Global.PathAplicacion + '\Temp';
  Global.PathLogs :=  Global.PathAplicacion + '\Logs';
  Global.PathLogsXML :=  Global.PathLogs + '\LogsXML' ;
  Global.PathRespaldo :=  Global.PathAplicacion + '\Respaldo';
  Global.Aplicacion := '';
  Global.EmpresaCodigo := 0;
  Global.SucursalCodigo := 0;
  Global.EmpresaCodigoDefault := 0;
  Global.SucursalCodigoDefault := 0;
end;

procedure FinalizarSistema;
begin
  Global.Destroy;
end;

end.
