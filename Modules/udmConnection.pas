unit udmConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Phys.ODBCDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.ODBC,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, FireDAC.Phys.MSAccDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.MSSQL, FireDAC.Phys.SQLite, FireDAC.Phys.MSAcc,
  FireDAC.Phys.OracleDef, FireDAC.Phys.Oracle, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Dialogs;

type
  TTypeConection = (Main, Local, Type3, Type4);

  TdmConnection = class(TDataModule)
    FDMainConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDPhysODBCDriverLink1: TFDPhysODBCDriverLink;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDTable1: TFDTable;
    FDLocalConnection: TFDConnection;
    FDType3Connection: TFDConnection;
    FDType4Connection: TFDConnection;
  private
    { Private declarations }
  public
    {$REGION 'Funciones Generales'}
    FTypeConection: TTypeConection;
    procedure DB_Conectar(pTFDConnection: TFDConnection;
      pDriver: string; pServidor: string; pBaseDatos: string;
      pUsuario: string; pClave: string; pPuerto: Integer;
      pOtros: string; var pResultado: Integer; var pErrorM: string);
    procedure DB_Desconectar(pTFDConnection: TFDConnection;
      var pResultado: Integer; var pErrorM: string);
    function DB_EstaConectado(pTFDConnection: TFDConnection;
      var pResultado: Integer; var pErrorM: string): Boolean;
    procedure DB_Iniciar_Transaccion(pTFDConnection: TFDConnection;
      var pResultado: Integer; var pErrorM: string);
    procedure DB_Aceptar_Transaccion(pTFDConnection: TFDConnection;
      var pResultado: Integer; var pErrorM: string);
    procedure DB_Rechazar_Transaccion(pTFDConnection: TFDConnection;
      var pResultado: Integer; var pErrorM: string);
    function DB_ListaBasesDatos(pTFDConnection: TFDConnection): TStringList;
    function DB_ListaTablas(pTFDConnection: TFDConnection): TStringList;
    function DB_ListaCampos(pTFDConnection: TFDConnection;
      pTabla: string): TStringList; overload;
    procedure DB_ListaCampos(ds: TFDMemTable;
      pTabla: string); overload;
    function DB_ListaIndices(pTFDConnection: TFDConnection;
      pTabla: string): TStringList;
    function DB_ListaCamposLlave(pTFDConnection: TFDConnection;
      pTabla: string): TStringList;
    function DB_ListaProcedimientosAlmacenados(pTFDConnection: TFDConnection
      ): TStringList;
    {$ENDREGION}
  end;

var
  dmConnection: TdmConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConnection }

{$REGION 'Funciones Generales'}
procedure TdmConnection.DB_Conectar(pTFDConnection: TFDConnection; pDriver,
  pServidor, pBaseDatos, pUsuario, pClave: string; pPuerto: Integer;
  pOtros: string; var pResultado: Integer; var pErrorM: string);
begin
  try
    pResultado := 1;

    with dmConnection.FDMainConnection do
    begin
      try
        Close;
      except
      end;
      Params.Clear;
      Params.Add('DriverId=' + pDriver);
      if pServidor <> '' then
        Params.Add('Server=' + pServidor);
      if pBaseDatos <> '' then
        Params.Add('Database=' + pBaseDatos);
      if pUsuario <> '' then
        Params.Add('User_name=' + pUsuario);
      if pClave <> '' then
        Params.Add('Password=' + pClave);
      if pPuerto <> 0 then
        Params.Add('Port=' + IntToStr(pPuerto));
      if pOtros <> '' then
      Params.Add(pOtros);

      if pBaseDatos = '' then
      begin
        pResultado := 0;
        pErrorM := 'Base de datos sin seleccionar';
        raise Exception.Create('');
      end;
      Open();
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      if pResultado <> 0 then
        pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmConnection.DB_Desconectar(pTFDConnection: TFDConnection;
  var pResultado: Integer; var pErrorM: string);
begin
  try
    pResultado := 1;

    with pTFDConnection do
      Close;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

function TdmConnection.DB_EstaConectado(pTFDConnection: TFDConnection;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
begin

  try
    pResultado := 1;

    mResultado := pTFDConnection.Connected;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;

  Result := mResultado;
end;

procedure TdmConnection.DB_Iniciar_Transaccion(pTFDConnection: TFDConnection;
  var pResultado: Integer; var pErrorM: string);
begin

  try
    pResultado := 1;

    pTFDConnection.StartTransaction;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmConnection.DB_Aceptar_Transaccion(pTFDConnection: TFDConnection;
  var pResultado: Integer; var pErrorM: string);
begin

  try
    pResultado := 1;

    pTFDConnection.Commit;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmConnection.DB_Rechazar_Transaccion(pTFDConnection: TFDConnection;
  var pResultado: Integer; var pErrorM: string);
begin

  try
    pResultado := 1;

    pTFDConnection.Rollback;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

function TdmConnection.DB_ListaBasesDatos(pTFDConnection: TFDConnection): TStringList;
var
  mLista: TStringList;
begin
  try
    mLista := TStringList.Create;
    pTFDConnection.GetSchemaNames('', '', mLista);
  except
  end;

  Result := mLista;
end;

function TdmConnection.DB_ListaTablas(pTFDConnection: TFDConnection): TStringList;
var
  mLista: TStringList;
  mFila: Integer;
  Aux01, Aux02: string;
begin
  try
    mLista := TStringList.Create;
    pTFDConnection.GetTableNames('', '', '', mLista);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := mLista.Strings[mFila];
      Aux02 := Copy(Aux01, Pos('.', Aux01) + 1, Length(Aux01));
      mLista.Strings[mFila] := Aux02;
    end;
  except
  end;

  Result := mLista;
end;

function TdmConnection.DB_ListaCampos(pTFDConnection: TFDConnection;
  pTabla: string): TStringList;
var
  mLista: TStringList;
begin
  try
    mLista := TStringList.Create;
    pTFDConnection.GetFieldNames('', '', pTabla, '', mLista);
  except
  end;

  Result := mLista;
end;

procedure TdmConnection.DB_ListaCampos(ds: TFDMemTable;
  pTabla: string);
var
  mFila: Integer;
begin
  try
    FDTable1.TableName := pTabla;
    FDTable1.Open();
    for mFila := 0 to FDTable1.FieldCount - 1 do
    begin
      ds.Append;
      ds.FieldByName('TablaNombre').AsString :=
        pTabla;
      ds.FieldByName('Nombre').AsString :=
        FDTable1.Fields[mFila].FieldName;
      if FDTable1.Fields[mFila].DataType = ftString then
        ds.FieldByName('Tipo').AsString := 'ftString';
      if FDTable1.Fields[mFila].DataType = ftSmallint then
        ds.FieldByName('Tipo').AsString := 'ftSmallint';
      if FDTable1.Fields[mFila].DataType = ftInteger then
        ds.FieldByName('Tipo').AsString := 'ftInteger';
      if FDTable1.Fields[mFila].DataType = ftWord then
        ds.FieldByName('Tipo').AsString := 'ftWord';
      if FDTable1.Fields[mFila].DataType = ftBoolean then
        ds.FieldByName('Tipo').AsString := 'ftBoolean';
      if FDTable1.Fields[mFila].DataType = ftFloat then
        ds.FieldByName('Tipo').AsString := 'ftFloat';
      if FDTable1.Fields[mFila].DataType = ftCurrency then
        ds.FieldByName('Tipo').AsString := 'ftCurrency';
      if FDTable1.Fields[mFila].DataType = ftBCD then
        ds.FieldByName('Tipo').AsString := 'ftBCD';
      if FDTable1.Fields[mFila].DataType = ftDate then
        ds.FieldByName('Tipo').AsString := 'ftDate';
      if FDTable1.Fields[mFila].DataType = ftTime then
        ds.FieldByName('Tipo').AsString := 'ftTime';
      if FDTable1.Fields[mFila].DataType = ftDateTime then
        ds.FieldByName('Tipo').AsString := 'ftDateTime';
      if FDTable1.Fields[mFila].DataType = ftBytes then
        ds.FieldByName('Tipo').AsString := 'ftBytes';
      if FDTable1.Fields[mFila].DataType = ftVarBytes then
        ds.FieldByName('Tipo').AsString := 'ftVarBytes';
      if FDTable1.Fields[mFila].DataType = ftAutoInc then
        ds.FieldByName('Tipo').AsString := 'ftAutoInc';
      if FDTable1.Fields[mFila].DataType = ftBlob then
        ds.FieldByName('Tipo').AsString := 'ftBlob';
      if FDTable1.Fields[mFila].DataType = ftMemo then
        ds.FieldByName('Tipo').AsString := 'ftMemo';
      if FDTable1.Fields[mFila].DataType = ftGraphic then
        ds.FieldByName('Tipo').AsString := 'ftGraphic';
      if FDTable1.Fields[mFila].DataType = ftFmtMemo then
        ds.FieldByName('Tipo').AsString := 'ftFmtMemo';
      if FDTable1.Fields[mFila].DataType = ftFixedChar then
        ds.FieldByName('Tipo').AsString := 'ftFixedChar';
      if FDTable1.Fields[mFila].DataType = ftWideString then
        ds.FieldByName('Tipo').AsString := 'ftWideString';
      if FDTable1.Fields[mFila].DataType = ftLargeint then
        ds.FieldByName('Tipo').AsString := 'ftLargeint';
      if FDTable1.Fields[mFila].DataType = ftVariant then
        ds.FieldByName('Tipo').AsString := 'ftVariant';
      if FDTable1.Fields[mFila].DataType = ftTimeStamp then
        ds.FieldByName('Tipo').AsString := 'ftTimeStamp';
      if FDTable1.Fields[mFila].DataType = ftLongWord then
        ds.FieldByName('Tipo').AsString := 'ftLongWord';
      if FDTable1.Fields[mFila].DataType = ftShortint then
        ds.FieldByName('Tipo').AsString := 'ftShortint';
      if FDTable1.Fields[mFila].DataType = ftSingle then
        ds.FieldByName('Tipo').AsString := 'ftSingle';
      ds.FieldByName('Longitud').AsInteger :=
        FDTable1.Fields[mFila].Size;
      ds.FieldByName('EsLlave').AsInteger := 0;
      ds.FieldByName('Procesar').AsInteger := 1;
      ds.Post;
    end;
    FDTable1.Close;
  except
  end;
end;

function TdmConnection.DB_ListaIndices(pTFDConnection: TFDConnection;
  pTabla: string): TStringList;
var
  mLista: TStringList;
begin
  try
    mLista := TStringList.Create;
   // pTFDConnection.GetIndexNames('', '', pTabla, '', mLista);
  except
  end;

  Result := mLista;
end;

function TdmConnection.DB_ListaCamposLlave(pTFDConnection: TFDConnection;
  pTabla: string): TStringList;
var
  mLista: TStringList;
begin
  try
    mLista := TStringList.Create;
    pTFDConnection.GetKeyFieldNames('', '', pTabla, '', mLista);
  except
  end;

  Result := mLista;
end;

function TdmConnection.DB_ListaProcedimientosAlmacenados(pTFDConnection: TFDConnection
  ): TStringList;
var
  mLista: TStringList;
begin
  try
    mLista := TStringList.Create;
    pTFDConnection.GetStoredProcNames('', '', '', '', mLista);
  except
  end;

  Result := mLista;
end;
{$ENDREGION}

end.
