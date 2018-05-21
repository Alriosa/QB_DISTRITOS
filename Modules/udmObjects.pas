unit udmObjects;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.DateUtils,
  Vcl.Dialogs, Vcl.ComCtrls, FireDAC.UI.Intf, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script, System.Variants;

type
  TdmObjects = class(TDataModule)
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    FDQuery4: TFDQuery;
    FDQuery5: TFDQuery;
    FDQuery6: TFDQuery;
    FDQuery7: TFDQuery;
    FDQuery8: TFDQuery;
    FDStoredProc1: TFDStoredProc;
    FDStoredProc2: TFDStoredProc;
    FDStoredProc3: TFDStoredProc;
    FDStoredProc4: TFDStoredProc;
    FDStoredProc5: TFDStoredProc;
    FDStoredProc6: TFDStoredProc;
    FDScript1: TFDScript;
    FDScript2: TFDScript;
    FDScript3: TFDScript;
    FDScript4: TFDScript;
    FDScript5: TFDScript;
    FDScript6: TFDScript;
    LocalFDQuery8: TFDQuery;
  private
    { Private declarations }
  public
    {$REGION 'General'}
    procedure DB_Asignar_Id(qry: TFDQuery; pTabla: string; ds: TFDMemTable;
      var pResultado: Integer; var pErrorM: string);
    function DB_Obtener_Ultimo(qry: TFDQuery; pTabla: string;
      var pResultado: Integer; var pErrorM: string): Integer; overload;
    function DB_Obtener_Ultimo(qry: TFDQuery; pTabla: string;
      pCampo: string; pWhere: string; var pResultado: Integer;
      var pErrorM: string): Integer; overload;
    procedure DB_DBToStruct(qry: TFDQuery; ds1: TFDMemTable;
      var pResultado: Integer; var pErrorM: string); overload;
    procedure DB_DBToStruct(qry: TFDQuery; ds1: TFDMemTable;
      var pCamposNombre: TStringList;
      var pResultado: Integer; var pErrorM: string); overload;
    procedure DB_StructToDB(qry: TFDQuery; ds1: TFDMemTable;
      pCampos: TStringList; var pResultado: Integer; var pErrorM: string);
    function DB_Obtener_ListaCampos(ds1: TFDMemTable): TStringList;
    function DB_Crear_SQL_Insert(pTabla: string; pCampos: string): string;
    function DB_Crear_SQL_Update(pTabla: string; pCampos: string): string;
    function DB_Obtener_SQL_ParametrosLista(
      pCampos: TStringList): string;
    procedure DB_Limpiar_Tag(ds1: TFDMemTable);
    procedure DB_Insert_Generico(qry1: TFDQuery; ds1: TFDMemTable;
      var pResultado: Integer; var pErrorM: string);
    procedure DB_Update_Generico(qry1: TFDQuery; ds1: TFDMemTable;
      pWhere: string; var pResultado: Integer; var pErrorM: string);
    procedure DB_Delete_Generico(qry1: TFDQuery; pTabla: string;
      pWhere: string; var pResultado: Integer; var pErrorM: string);
    procedure DB_Copiar_Estructura(dsOrigen: TFDMemTable;
      dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
    procedure DB_Copiar_Datos(dsOrigen: TFDMemTable;
      dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
    procedure DB_Consultar_Generico(qry1: TFDQuery; ds1: TFDMemTable;
      pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
      pSelect: string; var pCamposNombre: TStringList;
      var pResultado: Integer; var pErrorM: string);
    function GetNombreTab(pNombreFull: string; pNombreSimple: string): string;
    {$ENDREGION}

    {$REGION 'Skeleton'}
    procedure DB_Skeleton_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
      pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
      pTabla: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string);
    procedure DB_Skeleton_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
      pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
    procedure DB_Skeleton_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
      pWhere: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string);
    procedure DB_Skeleton_Eliminar(qry1: TFDQuery; pWhere: string;
      pTabla: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string);
    function DB_Skeleton_Existe_Id(qry1: TFDQuery; pWhere: string;
      pTabla: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string): Boolean;
    function DB_Skeleton_Obtener_Id(qry1: TFDQuery; pWhere: string;
      pTabla: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string): Integer;
    function DB_Skeleton_Existe_Campo(qry1: TFDQuery; pWhere: string;
      pTabla: string; pCampo: string; pClaseNombre: string;
      var pResultado: Integer; var pErrorM: string): Boolean;
    function DB_Skeleton_Obtener_Valor(qry1: TFDQuery; pWhere: string;
      pTabla: string; pCampo: string; pClaseNombre: string;
      var pResultado: Integer; var pErrorM: string): Variant;
    procedure DB_Skeleton_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
      pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
      var pResultado: Integer; var pErrorM: string);
    {$ENDREGION}

    //Declaracion Metodos
  {$REGION 'tb_clases'}
  procedure DB_tb_clases_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_clases_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_clases_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_clases_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_clases_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_clases_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_clases_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_clases_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_clases_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_clases_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_clientes'}
  procedure DB_tb_clientes_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_clientes_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_clientes_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_clientes_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_clientes_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_clientes_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_clientes_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_clientes_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_clientes_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_clientes_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_cuentas'}
  procedure DB_tb_cuentas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_cuentas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_cuentas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_cuentas_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_cuentas_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_cuentas_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_cuentas_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_cuentas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_cuentas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_cuentas_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_empresas'}
  procedure DB_tb_empresas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_empresas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_empresas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_empresas_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_empresas_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_empresas_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_empresas_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_empresas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_empresas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_empresas_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
    pIdEmpresa: Integer; pDirectorioLocal: string; pgb: TProgressBar;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_facturasdetalle'}
  procedure DB_tb_facturasdetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_facturasdetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_facturasdetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_facturasdetalle_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_facturasdetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_facturasdetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_facturasdetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_facturasdetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_facturasdetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_facturasencabezado'}
  procedure DB_tb_facturasencabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_facturasencabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_facturasencabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_facturasencabezado_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_facturasencabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_facturasencabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_facturasencabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_facturasencabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_facturasencabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_facturasencabezado_InsertarQB(qry1: TFDQuery;
    qry2: TFDQuery; ds1: TFDMemTable; dsEmpresas: TFDMemTable;
    dsClientes: TFDMemTable; dsProductos: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar; dsDetalle: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_monedas'}
  procedure DB_tb_monedas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_monedas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_monedas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_monedas_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_monedas_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_monedas_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_monedas_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_monedas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_monedas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_monedas_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_productos'}
  procedure DB_tb_productos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_productos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_productos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_productos_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_productos_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_productos_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_productos_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_productos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_productos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_productos_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_productos_Obtener_ListaDescuentos(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pLista: TStringList;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_sistema'}
  procedure DB_tb_sistema_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_sistema_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_sistema_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_sistema_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_sistema_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_sistema_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_sistema_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_sistema_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_sistema_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_sistema_Obtener_UltimaSincro(qry1: TFDQuery; pWhere: string;
    pTabla: string; var pFecha1: TDateTime; var pFecha2: TDateTime; pEstado: Integer;
    pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_usuarios'}
  procedure DB_tb_usuarios_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_usuarios_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_usuarios_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_usuarios_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_usuarios_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_usuarios_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_usuarios_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_usuarios_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_usuarios_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  function DB_tb_usuarios_Obtener_Clave(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): string;
  {$ENDREGION}

  {$REGION 'tb_bitacora'}
  procedure DB_tb_bitacora_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_bitacora_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_bitacora_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_bitacora_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_bitacora_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_bitacora_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_bitacora_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_bitacora_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_bitacora_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_acciones'}
  procedure DB_tb_acciones_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_acciones_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_acciones_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_acciones_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_acciones_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_acciones_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_acciones_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_acciones_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_acciones_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_opciones'}
  procedure DB_tb_opciones_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_opciones_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_opciones_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_opciones_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_opciones_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_opciones_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_opciones_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_opciones_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_opciones_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_EstadosHacienda'}
  procedure DB_tb_EstadosHacienda_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_EstadosHacienda_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_EstadosHacienda_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_EstadosHacienda_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_EstadosHacienda_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_EstadosHacienda_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_EstadosHacienda_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_EstadosHacienda_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_EstadosHacienda_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_Permisos'}
  procedure DB_tb_Permisos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Permisos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Permisos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Permisos_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_Permisos_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_Permisos_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_Permisos_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_Permisos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_Permisos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_EmailDefault'}
  procedure DB_tb_EmailDefault_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_EmailDefault_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_EmailDefault_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_EmailDefault_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_EmailDefault_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_EmailDefault_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_EmailDefault_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_EmailDefault_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_EmailDefault_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_notascreditodetalle'}
  procedure DB_tb_notascreditodetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_notascreditodetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_notascreditodetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_notascreditodetalle_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_notascreditodetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_notascreditodetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_notascreditodetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_notascreditodetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_notascreditodetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_notascreditoencabezado'}
  procedure DB_tb_notascreditoencabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_notascreditoencabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_notascreditoencabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_notascreditoencabezado_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_notascreditoencabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_notascreditoencabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_notascreditoencabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_notascreditoencabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_notascreditoencabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_notascreditoencabezado_InsertarQB(qry1: TFDQuery;
    qry2: TFDQuery; ds1: TFDMemTable; dsEmpresas: TFDMemTable;
    dsClientes: TFDMemTable; dsProductos: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar; dsDetalle: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_EstadosFacturas'}
  procedure DB_tb_EstadosFacturas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_EstadosFacturas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_EstadosFacturas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_EstadosFacturas_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_EstadosFacturas_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_EstadosFacturas_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_EstadosFacturas_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_EstadosFacturas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_EstadosFacturas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_Impuestos'}
  procedure DB_tb_Impuestos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Impuestos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Impuestos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Impuestos_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_Impuestos_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_Impuestos_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_Impuestos_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_Impuestos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_Impuestos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Impuestos_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_Terminos'}
  procedure DB_tb_Terminos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Terminos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Terminos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Terminos_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_Terminos_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_Terminos_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_Terminos_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_Terminos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_Terminos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Terminos_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
    pIdEmpresa: Integer; pgb: TProgressBar;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_Provincias'}
  procedure DB_tb_Provincias_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Provincias_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Provincias_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Provincias_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_Provincias_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_Provincias_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_Provincias_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_Provincias_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_Provincias_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_Cantones'}
  procedure DB_tb_Cantones_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Cantones_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Cantones_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Cantones_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_Cantones_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_Cantones_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_Cantones_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_Cantones_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_Cantones_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_Distritos'}
  procedure DB_tb_Distritos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Distritos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Distritos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Distritos_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_Distritos_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_Distritos_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_Distritos_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_Distritos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_Distritos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_Barrios'}
  procedure DB_tb_Barrios_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Barrios_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_Barrios_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_Barrios_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_Barrios_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_Barrios_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_Barrios_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_Barrios_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_Barrios_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_consecutivos'}
  procedure DB_tb_consecutivos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_consecutivos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_tb_consecutivos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_tb_consecutivos_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_tb_consecutivos_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_tb_consecutivos_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_tb_consecutivos_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_tb_consecutivos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_tb_consecutivos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  end;

var
  dmObjects: TdmObjects;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConnection;

const
  SaveLog = 1;

{$R *.dfm}

{$REGION 'Funciones General'}
procedure TdmObjects.DB_Asignar_Id(qry: TFDQuery; pTabla: string;
  ds: TFDMemTable; var pResultado: Integer; var pErrorM: string);
var
  mId: Integer;
begin
  try
    pResultado := 1;

    mId := dmObjects.DB_Obtener_Ultimo(qry, pTabla, pResultado, pErrorM);
    Inc(mId);
    with ds do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('Id').AsInteger := mId;
        Post;
        Inc(mId);
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

function TdmObjects.DB_Obtener_Ultimo(qry: TFDQuery; pTabla: string;
  var pResultado: Integer; var pErrorM: string): Integer;
var
  mUltimo: Integer;
begin
  try
    pResultado := 1;

    mUltimo := 0;
    with qry do
    begin
      SQL.Clear;
      SQL.Add('Select Max(Id)');
      SQL.Add('From ' + pTabla);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mUltimo := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;

  Result := mUltimo;
end;

function TdmObjects.DB_Obtener_Ultimo(qry: TFDQuery; pTabla: string;
  pCampo: string; pWhere: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mUltimo: Integer;
begin
  try
    pResultado := 1;

    mUltimo := 0;
    with qry do
    begin
      SQL.Clear;
      SQL.Add('Select Max(' + pCampo + ')');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mUltimo := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;

  Result := mUltimo;
end;

procedure TdmObjects.DB_DBToStruct(qry: TFDQuery; ds1: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
var
  mCantFields: Integer;
  mCols: Integer;
  CampoNombre: string;
begin
  try
    pResultado := 1;

    mCantFields := 0;
    with qry do
    begin
      Open();
      mCantFields := FieldCount;
      while not Eof do
      begin
        ds1.Append;
        for mCols := 0 to mCantFields - 1 do
        begin
          CampoNombre := FieldDefs[mCols].Name;
          ds1.FieldByName(CampoNombre).Value :=
            FieldByName(CampoNombre).Value;
        end;
        ds1.Post;

        Next;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
       pErrorM := E.Message;
       pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_DBToStruct(qry: TFDQuery; ds1: TFDMemTable;
  var pCamposNombre: TStringList; var pResultado: Integer; var pErrorM: string);
var
  mCantFields: Integer;
  mCols: Integer;
  CampoNombre: string;
begin
  try
    pResultado := 1;

    pCamposNombre.Clear;

    ds1.EmptyDataSet;
    ds1.Close;
    ds1.FieldDefs.Clear;

    mCantFields := 0;
    with qry do
    begin
      Open();
      mCantFields := FieldCount;
      for mCols := 0 to mCantFields - 1 do
      begin
        ds1.FieldDefs.Add(FieldDefs[mCols].Name,
          FieldDefs[mCols].DataType, FieldDefs[mCols].Size);
        pCamposNombre.Add(FieldDefs[mCols].Name);
      end;
      ds1.CreateDataSet;
      ds1.Open;

      while not Eof do
      begin
        ds1.Append;
        for mCols := 0 to mCantFields - 1 do
        begin
          CampoNombre := FieldDefs[mCols].Name;
          ds1.FieldByName(CampoNombre).Value :=
            FieldByName(CampoNombre).Value;
        end;
        ds1.Post;

        Next;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
       pErrorM := E.Message;
       pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_StructToDB(qry: TFDQuery; ds1: TFDMemTable;
  pCampos: TStringList; var pResultado: Integer; var pErrorM: string);
var
  mCantFields: Integer;
  mCols, mFila: Integer;
  CampoNombre: string;
begin
  try
    pResultado := 1;

    for mCols := 0 to pCampos.Count - 1 do
    begin
      with qry do
      begin
        Params.Items[mCols].Value :=
          ds1.Fields[mCols].Value;
      end;
    end;
    qry.ExecSQL;

    pResultado := 1;
  except
    on E: Exception do
    begin
       pErrorM := E.Message;
       pResultado := -1;
    end;
  end;
end;

function TdmObjects.DB_Obtener_ListaCampos(ds1: TFDMemTable): TStringList;
var
  mCampos: TStringList;
  mCols: Integer;
begin
  mCampos := TStringList.Create;

  mCampos.Clear;
  mCampos.Delimiter :=',';
  with ds1 do
  begin
    for mCols := 0 to FieldCount - 1 do
    begin
      if Fields[mCols].Tag = 1  then
        mCampos.Add(FieldDefs[mCols].Name);
    end;
  end;

  Result := mCampos;
end;

function TdmObjects.DB_Crear_SQL_Insert(pTabla: string; pCampos: string): string;
var
  mResultado: string;
begin
  mResultado := '';

  mResultado := 'Insert Into ' + pTabla;
  mResultado := mResultado + '(';
  mResultado := mResultado + pCampos;
  mResultado := mResultado + ')';

  Result := mResultado;
end;

function TdmObjects.DB_Crear_SQL_Update(pTabla: string;
  pCampos: string): string;
var
  mResultado: string;
begin
  mResultado := '';

  mResultado := 'Update  ' + pTabla + ' Set ';
  mResultado := mResultado + pCampos;

  Result := mResultado;
end;

function TdmObjects.DB_Obtener_SQL_ParametrosLista(
  pCampos: TStringList): string;
var
  mCountParams: Integer;
  Aux01: Integer;
  mParams: TStringList;
  mSQL: string;
begin
  mSQL := '';

  mCountParams := pCampos.Count - 1;
  mParams := TStringList.Create;
  mParams.Clear;
  mParams.Delimiter := ',';
  for Aux01 := 0 to mCountParams do
    mParams.Add(':' + pCampos.Strings[Aux01]);
  mSQL := 'Values(' + mParams.DelimitedText + ')';
  mParams.Free;

  Result := mSQL;
end;

procedure TdmObjects.DB_Limpiar_Tag(ds1: TFDMemTable);
var
  mCols: Integer;
begin
  with ds1 do
  begin
    for mCols := 0 to FieldCount - 1 do
      Fields[mCols].Tag := 0;
  end;
end;

procedure TdmObjects.DB_Insert_Generico(qry1: TFDQuery; ds1: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
var
  mCampos: TStringList;
  mSQL, mSQL1, mSQL2: string;
  mCols: Integer;
begin
  try
    pResultado := 1;

    mSQL1 := '';
    mSQL2 := '';

    mCampos := TStringList.Create;

    mCampos :=
      DB_Obtener_ListaCampos(ds1);

    mSQL1 :=
      DB_Crear_SQL_Insert(ds1.FileName, mCampos.DelimitedText);

    mSQL2 :=
      DB_Obtener_SQL_ParametrosLista(mCampos);

    qry1.SQL.Clear;
    mSQL := mSQL1 + ' ' + mSQL2;
    qry1.SQL.Add(mSQL);

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        qry1.SQL.Clear;
        qry1.SQL.Add(mSQL);

        for mCols := 0 to mCampos.Count - 1 do
          qry1.ParamByName(mCampos.Strings[mCols]).Value :=
          FieldByName(mCampos.Strings[mCols]).Value;

        qry1.ExecSQL;

        Next;
      end;
    end;
    mCampos.Free;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Update_Generico(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; var pResultado: Integer; var pErrorM: string);
var
  mCampos, mCamposParams: TStringList;
  mSQL, mSQL1, mSQL2: string;
  mCols: Integer;
  Aux01: Integer;
begin
  try
    pResultado := 1;

    mSQL1 := '';
    mSQL2 := '';

    mCampos := TStringList.Create;
    mCamposParams := TStringList.Create;

    mCampos :=
      DB_Obtener_ListaCampos(ds1);

    for Aux01 := 0 to mCampos.Count - 1 do
    begin
      if Aux01 < (mCampos.Count - 1) then
        mCamposParams.Add(mCampos.Strings[Aux01] + ' = :' +
          mCampos.Strings[Aux01] + ',')
      else
        mCamposParams.Add(mCampos.Strings[Aux01] + ' = :' +
          mCampos.Strings[Aux01]);
    end;
    mCampos.Delimiter := ',';
    mCamposParams.Delimiter := ',';

    mSQL1 :=
      DB_Crear_SQL_Update(ds1.FileName, mCamposParams.Text);

    qry1.SQL.Clear;
    mSQL := mSQL1 + ' ' + pWhere;
    qry1.SQL.Add(mSQL);

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        qry1.SQL.Clear;
        qry1.SQL.Add(mSQL);

        for mCols := 0 to mCampos.Count - 1 do
          qry1.ParamByName(mCampos.Strings[mCols]).Value :=
          FieldByName(mCampos.Strings[mCols]).Value;

        qry1.ExecSQL;

        Next;
      end;
    end;
    mCampos.Free;


    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Delete_Generico(qry1: TFDQuery; pTabla: string;
  pWhere: string; var pResultado: Integer; var pErrorM: string);
var
  mSQL: string;
begin
  try
    pResultado := 1;

    mSQL:= 'Delete From ' + pTabla + ' ' + pWhere;

    qry1.SQL.Clear;
    qry1.SQL.Add(mSQL);
    qry1.ExecSQL;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Copiar_Estructura(dsOrigen: TFDMemTable;
  dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
var
  Aux01: Integer;
begin
  try
    pResultado := 1;

    dsDestino.FileName := dsOrigen.FileName;
    dsDestino.FieldDefs.Clear;
    with dsOrigen do
    begin
      for Aux01 := 0 to FieldCount - 1 do
      begin
        dsDestino.FieldDefs.Add(FieldDefs[Aux01].Name,
          FieldDefs[Aux01].DataType, FieldDefs[Aux01].Size);
      end;
    end;
    dsDestino.CreateDataSet;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Copiar_Datos(dsOrigen: TFDMemTable;
  dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
var
  Aux01: Integer;
begin
  try
    pResultado := 1;

    dsDestino.FileName := dsOrigen.FileName;
    dsDestino.EmptyDataSet;
    with dsOrigen do
    begin
      First;
      while not Eof do
      begin
        dsDestino.Append;
        for Aux01 := 0 to FieldCount - 1 do
        begin
          dsDestino.Fields[Aux01].Value :=
            Fields[Aux01].Value;
        end;
        dsDestino.Post;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Consultar_Generico(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pSelect: string; var pCamposNombre: TStringList;
  var pResultado: Integer; var pErrorM: string);
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add(pSelect);
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);

      DB_DBToStruct(qry1, ds1, pCamposNombre, pResultado, pErrorM);

      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

function TdmObjects.GetNombreTab(pNombreFull: string; pNombreSimple: string): string;
var
  mResultado: string;
  mNombreFull: string;
  mLista: TStringList;
  mCount: Integer;
begin
  mResultado := '';
  mNombreFull := pNombreFull;

  ExtractStrings([':'], [':'], PChar(mNombreFull), mLista);
  mCount := mLista.Count;
  mCount := mCount * 2;
  mResultado := StringOfChar(' ', mCount) + pNombreSimple;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Skeleton'}
procedure TdmObjects.DB_Skeleton_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.*');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;

      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');

      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_Skeleton_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
      mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Insertar.sql');
      mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_Skeleton_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
      mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Modificar.sql');
      mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_Skeleton_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
      mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Eliminar.sql');
      mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_Skeleton_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From  ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_Skeleton_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From  ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_Skeleton_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ' + pCampo);
      SQL.Add('From  ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_Skeleton_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ' + pCampo);
      SQL.Add('From  ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_Skeleton_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + ' = ' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

//Implementacion Metodos
{$REGION 'tb_clases'}
procedure TdmObjects.DB_tb_clases_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.ListId,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.FullName,');
      SQL.Add('A.Nivel,');
      SQL.Add('A.Orden,');
      SQL.Add('A.Activo,');
      SQL.Add('A.LastLevel,');
      SQL.Add('A.ParentListId,');
      SQL.Add('A.ParentFullName,');
      SQL.Add('A.NombreTab');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_clases_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_clases_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_clases_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_clases_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_clases_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_clases_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_clases_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_clases_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_clases_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mListId: string;
  mEncontrado: Boolean;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        mListId := FieldByName('ListId').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where ListId=' + QuotedStr(mListId));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_Clases_Existe_Campo(qry1,
          mWhere.Text, 'tb_clases', 'ListId',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_clases');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('ListId,');
          qry1.SQL.Add('Nombre,');
          qry1.SQL.Add('FullName,');
          qry1.SQL.Add('Nivel,');
          qry1.SQL.Add('Orden,');
          qry1.SQL.Add('Activo,');
          qry1.SQL.Add('LastLevel,');
          qry1.SQL.Add('ParentListId,');
          qry1.SQL.Add('ParentFullName,');
          qry1.SQL.Add('NombreTab');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5,');
          qry1.SQL.Add(':Param6,');
          qry1.SQL.Add(':Param7,');
          qry1.SQL.Add(':Param8,');
          qry1.SQL.Add(':Param9,');
          qry1.SQL.Add(':Param10');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('FullName').AsString;
          qry1.Params.Items[4].AsInteger :=
            FieldByName('Nivel').AsInteger;
          qry1.Params.Items[5].AsInteger := 0;
          qry1.Params.Items[6].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[7].AsInteger := 0;
          qry1.Params.Items[8].AsString :=
            FieldByName('ParentListId').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('ParentFullName').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('NombreTab').AsString;
          qry1.ExecSQL;
        end;
        // Modificar
        if mEncontrado = True then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_clases');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('ListId =:Param0,');
          qry1.SQL.Add('Nombre =:Param1,');
          qry1.SQL.Add('FullName =:Param2,');
          qry1.SQL.Add('Nivel =:Param3,');
          qry1.SQL.Add('Orden =:Param4,');
          qry1.SQL.Add('Activo =:Param5,');
          qry1.SQL.Add('LastLevel =:Param6,');
          qry1.SQL.Add('ParentListId =:Param7,');
          qry1.SQL.Add('ParentFullName =:Param8,');
          qry1.SQL.Add('NombreTab =:Param9');
          qry1.SQL.Add('Where ListId =:Param10 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[1].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('FullName').AsString;
          qry1.Params.Items[3].AsInteger :=
            FieldByName('Nivel').AsInteger;
          qry1.Params.Items[4].AsInteger := 0;
          qry1.Params.Items[5].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[6].AsInteger := 0;
          qry1.Params.Items[7].AsString :=
            FieldByName('ParentListId').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('ParentFullName').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('NombreTab').AsString;
          qry1.Params.Items[10].AsString :=
            mListId;
          qry1.ExecSQL;
        end;

        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_clientes'}
procedure TdmObjects.DB_tb_clientes_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.ListId,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.FullName,');
      SQL.Add('A.Activo,');
      SQL.Add('A.NombreTab,');
      SQL.Add('A.Nivel,');
      SQL.Add('A.Cedula,');
      SQL.Add('A.Direccion,');
      SQL.Add('A.Telefono,');
      SQL.Add('A.Email,');
      SQL.Add('A.PROVINCIA,');
      SQL.Add('A.CANTON,');
      SQL.Add('A.DISTRITO,');
      SQL.Add('A.BARRIO,');
      SQL.Add('A.ProvinciaNombre,');
      SQL.Add('A.CantonNombre,');
      SQL.Add('A.DistritoNombre,');
      SQL.Add('A.BarrioNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_clientes_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_clientes_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_clientes_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_clientes_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_clientes_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_clientes_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_clientes_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_clientes_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_clientes_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mListId: string;
  mEncontrado: Boolean;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        mListId := FieldByName('ListId').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where ListId=' + QuotedStr(mListId));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_Clientes_Existe_Campo(qry1,
          mWhere.Text, 'tb_clientes', 'ListId',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_clientes');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('ListId,');
          qry1.SQL.Add('Nombre,');
          qry1.SQL.Add('FullName,');
          qry1.SQL.Add('Activo,');
          qry1.SQL.Add('NombreTab,');
          qry1.SQL.Add('Nivel,');
          qry1.SQL.Add('Cedula,');
          qry1.SQL.Add('Direccion,');
          qry1.SQL.Add('Telefono,');
          qry1.SQL.Add('Email,');
          qry1.SQL.Add('PROVINCIA,');
          qry1.SQL.Add('CANTON,');
          qry1.SQL.Add('DISTRITO,');
          qry1.SQL.Add('BARRIO,');
          qry1.SQL.Add('ProvinciaNombre,');
          qry1.SQL.Add('CantonNombre,');
          qry1.SQL.Add('DistritoNombre,');
          qry1.SQL.Add('BarrioNombre');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5,');
          qry1.SQL.Add(':Param6,');
          qry1.SQL.Add(':Param7,');
          qry1.SQL.Add(':Param8,');
          qry1.SQL.Add(':Param9,');
          qry1.SQL.Add(':Param10,');
          qry1.SQL.Add(':Param11,');
          qry1.SQL.Add(':Param12,');
          qry1.SQL.Add(':Param13,');
          qry1.SQL.Add(':Param14,');
          qry1.SQL.Add(':Param15,');
          qry1.SQL.Add(':Param16,');
          qry1.SQL.Add(':Param17,');
          qry1.SQL.Add(':Param18');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('FullName').AsString;
          qry1.Params.Items[4].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[5].AsString :=
            FieldByName('NombreTab').AsString;
          qry1.Params.Items[6].AsInteger :=
            FieldByName('Nivel').AsInteger;
          qry1.Params.Items[7].AsString :=
            FieldByName('Cedula').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('Direccion').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('Telefono').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('Email').AsString;
          qry1.Params.Items[11].AsString :=
            FieldByName('PROVINCIA').AsString;
          qry1.Params.Items[12].AsString :=
            FieldByName('CANTON').AsString;
          qry1.Params.Items[13].AsString :=
            FieldByName('DISTRITO').AsString;
          qry1.Params.Items[14].AsString :=
            FieldByName('BARRIO').AsString;
          qry1.Params.Items[15].AsString :=
            FieldByName('ProvinciaNombre').AsString;
          qry1.Params.Items[16].AsString :=
            FieldByName('CantonNombre').AsString;
          qry1.Params.Items[17].AsString :=
            FieldByName('DistritoNombre').AsString;
          qry1.Params.Items[18].AsString :=
            FieldByName('BarrioNombre').AsString;
          qry1.ExecSQL;
        end;
        // Modificar
        if mEncontrado = True then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_clientes');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('ListId =:Param0,');
          qry1.SQL.Add('Nombre =:Param1,');
          qry1.SQL.Add('FullName =:Param2,');
          qry1.SQL.Add('Activo =:Param3,');
          qry1.SQL.Add('NombreTab =:Param4,');
          qry1.SQL.Add('Nivel =:Param5,');
          qry1.SQL.Add('Cedula =:Param6,');
          qry1.SQL.Add('Direccion =:Param7,');
          qry1.SQL.Add('Telefono =:Param8,');
          qry1.SQL.Add('Email =:Param9,');
          qry1.SQL.Add('PROVINCIA =:Param10,');
          qry1.SQL.Add('CANTON =:Param11,');
          qry1.SQL.Add('DISTRITO =:Param12,');
          qry1.SQL.Add('BARRIO =:Param13,');
          qry1.SQL.Add('ProvinciaNombre =:Param14,');
          qry1.SQL.Add('CantonNombre =:Param15,');
          qry1.SQL.Add('DistritoNombre =:Param16,');
          qry1.SQL.Add('BarrioNombre =:Param17');
          qry1.SQL.Add('Where ListId =:Param18 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[1].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('FullName').AsString;
          qry1.Params.Items[3].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[4].AsString :=
            FieldByName('NombreTab').AsString;
          qry1.Params.Items[5].AsInteger :=
            FieldByName('Nivel').AsInteger;
          qry1.Params.Items[6].AsString :=
            FieldByName('Cedula').AsString;
          qry1.Params.Items[7].AsString :=
            FieldByName('Direccion').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('Telefono').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('Email').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('PROVINCIA').AsString;
          qry1.Params.Items[11].AsString :=
            FieldByName('CANTON').AsString;
          qry1.Params.Items[12].AsString :=
            FieldByName('DISTRITO').AsString;
          qry1.Params.Items[13].AsString :=
            FieldByName('BARRIO').AsString;
          qry1.Params.Items[14].AsString :=
            FieldByName('ProvinciaNombre').AsString;
          qry1.Params.Items[15].AsString :=
            FieldByName('CantonNombre').AsString;
          qry1.Params.Items[16].AsString :=
            FieldByName('DistritoNombre').AsString;
          qry1.Params.Items[17].AsString :=
            FieldByName('BarrioNombre').AsString;
          qry1.Params.Items[18].AsString :=
            mListId;
          qry1.ExecSQL;
        end;

        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_cuentas'}
procedure TdmObjects.DB_tb_cuentas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.ListId,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.FullName,');
      SQL.Add('A.Nivel,');
      SQL.Add('A.Orden,');
      SQL.Add('A.Activo,');
      SQL.Add('A.LastLevel,');
      SQL.Add('A.ParentListId,');
      SQL.Add('A.ParentFullName,');
      SQL.Add('A.NombreTab,');
      SQL.Add('A.Numero,');
      SQL.Add('A.Tipo,');
      SQL.Add('A.CurrencyFullName');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_cuentas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_cuentas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_cuentas_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_cuentas_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_cuentas_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_cuentas_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_cuentas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_cuentas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_cuentas_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mListId: string;
  mEncontrado: Boolean;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        mListId := FieldByName('ListId').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where ListId=' + QuotedStr(mListId));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_Cuentas_Existe_Campo(qry1,
          mWhere.Text, 'tb_cuentas', 'ListId',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_cuentas');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('ListId,');
          qry1.SQL.Add('Nombre,');
          qry1.SQL.Add('FullName,');
          qry1.SQL.Add('Nivel,');
          qry1.SQL.Add('Orden,');
          qry1.SQL.Add('Activo,');
          qry1.SQL.Add('LastLevel,');
          qry1.SQL.Add('ParentListId,');
          qry1.SQL.Add('ParentFullName,');
          qry1.SQL.Add('NombreTab,');
          qry1.SQL.Add('Numero,');
          qry1.SQL.Add('Tipo,');
          qry1.SQL.Add('CurrencyFullName');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5,');
          qry1.SQL.Add(':Param6,');
          qry1.SQL.Add(':Param7,');
          qry1.SQL.Add(':Param8,');
          qry1.SQL.Add(':Param9,');
          qry1.SQL.Add(':Param10,');
          qry1.SQL.Add(':Param11,');
          qry1.SQL.Add(':Param12,');
          qry1.SQL.Add(':Param13');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('FullName').AsString;
          qry1.Params.Items[4].AsInteger :=
            FieldByName('Nivel').AsInteger;
          qry1.Params.Items[5].AsInteger := 0;
          qry1.Params.Items[6].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[7].AsInteger := 0;
          qry1.Params.Items[8].AsString :=
            FieldByName('ParentListId').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('ParentFullName').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('NombreTab').AsString;
          qry1.Params.Items[11].AsString :=
            FieldByName('Numero').AsString;
          qry1.Params.Items[12].AsString :=
            FieldByName('Tipo').AsString;
          qry1.Params.Items[13].AsString :=
            FieldByName('CurrencyFullName').AsString;
          qry1.ExecSQL;
        end;
        // Modificar
        if mEncontrado = True then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_cuentas');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('ListId =:Param0,');
          qry1.SQL.Add('Nombre =:Param1,');
          qry1.SQL.Add('FullName =:Param2,');
          qry1.SQL.Add('Nivel =:Param3,');
          qry1.SQL.Add('Orden =:Param4,');
          qry1.SQL.Add('Activo =:Param5,');
          qry1.SQL.Add('LastLevel =:Param6,');
          qry1.SQL.Add('ParentListId =:Param7,');
          qry1.SQL.Add('ParentFullName =:Param8,');
          qry1.SQL.Add('NombreTab =:Param9,');
          qry1.SQL.Add('Numero =:Param10,');
          qry1.SQL.Add('Tipo =:Param11,');
          qry1.SQL.Add('CurrencyFullName =:Param12');
          qry1.SQL.Add('Where ListId =:Param13 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[1].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('FullName').AsString;
          qry1.Params.Items[3].AsInteger :=
            FieldByName('Nivel').AsInteger;
          qry1.Params.Items[4].AsInteger := 0;
          qry1.Params.Items[5].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[6].AsInteger := 0;
          qry1.Params.Items[7].AsString :=
            FieldByName('ParentListId').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('ParentFullName').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('NombreTab').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('Numero').AsString;
          qry1.Params.Items[11].AsString :=
            FieldByName('Tipo').AsString;
          qry1.Params.Items[12].AsString :=
            FieldByName('CurrencyFullName').AsString;
          qry1.Params.Items[13].AsString :=
            mListId;
          qry1.ExecSQL;
        end;

        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except

    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_empresas'}
procedure TdmObjects.DB_tb_empresas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.Direccion,');
      SQL.Add('A.Telefono,');
      SQL.Add('A.Email,');
      SQL.Add('A.Web,');
      SQL.Add('A.Servicio,');
      SQL.Add('A.Cedula,');
      SQL.Add('A.NombreComercial,');
      SQL.Add('A.Fax,');
      SQL.Add('A.AreaTelefono,');
      SQL.Add('A.AreaFax,');
      SQL.Add('A.Logo,');
      SQL.Add('A.ExtensionLogo,');
      SQL.Add('A.DirectorioCopiaLocal,');
      SQL.Add('A.NUMEROSUCURSAL,');
      SQL.Add('A.NUMEROTERMINAL,');
      SQL.Add('A.SucursalNombre,');
      SQL.Add('A.Provincia,');
      SQL.Add('A.Canton,');
      SQL.Add('A.Distrito,');
      SQL.Add('A.Barrio,');
      SQL.Add('A.ProvinciaNombre,');
      SQL.Add('A.CantonNombre,');
      SQL.Add('A.DistritoNombre,');
      SQL.Add('A.BarrioNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_empresas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_empresas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_empresas_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_empresas_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_empresas_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_empresas_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_empresas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_empresas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_empresas_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
  pIdEmpresa: Integer; pDirectorioLocal: string; pgb: TProgressBar;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mNombre: string;
  mEncontrado: Boolean;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        mNombre := FieldByName('Nombre').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where Nombre=' + QuotedStr(mNombre));
        mEncontrado := DB_tb_empresas_Existe_Campo(qry1,
          mWhere.Text, 'tb_empresas', 'Nombre',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_empresas');
          qry1.SQL.Add('(');
          qry1.SQL.Add('Nombre,');
          qry1.SQL.Add('Direccion,');
          qry1.SQL.Add('Telefono,');
          qry1.SQL.Add('Email,');
          qry1.SQL.Add('Web,');
          qry1.SQL.Add('Cedula,');
          qry1.SQL.Add('NombreComercial,');
          qry1.SQL.Add('Fax,');
          qry1.SQL.Add('AreaTelefono,');
          qry1.SQL.Add('AreaFax,');
          qry1.SQL.Add('ExtensionLogo,');
          qry1.SQL.Add('DirectorioCopiaLocal,');
          qry1.SQL.Add('NUMEROSUCURSAL,');
          qry1.SQL.Add('NUMEROTERMINAL,');
          qry1.SQL.Add('SucursalNombre,');
          qry1.SQL.Add('Provincia,');
          qry1.SQL.Add('Canton,');
          qry1.SQL.Add('Distrito,');
          qry1.SQL.Add('Barrio,');
          qry1.SQL.Add('ProvinciaNombre,');
          qry1.SQL.Add('CantonNombre,');
          qry1.SQL.Add('DistritoNombre,');
          qry1.SQL.Add('BarrioNombre');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5,');
          qry1.SQL.Add(':Param6,');
          qry1.SQL.Add(':Param7,');
          qry1.SQL.Add(':Param8,');
          qry1.SQL.Add(':Param9,');
          qry1.SQL.Add(':Param10,');
          qry1.SQL.Add(':Param11,');
          qry1.SQL.Add(':Param12,');
          qry1.SQL.Add(':Param13,');
          qry1.SQL.Add(':Param14,');
          qry1.SQL.Add(':Param15,');
          qry1.SQL.Add(':Param16,');
          qry1.SQL.Add(':Param17,');
          qry1.SQL.Add(':Param18,');
          qry1.SQL.Add(':Param19,');
          qry1.SQL.Add(':Param20,');
          qry1.SQL.Add(':Param21,');
          qry1.SQL.Add(':Param22');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[1].AsString :=
            FieldByName('Direccion').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Telefono').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('Email').AsString;
          qry1.Params.Items[4].AsString :=
            FieldByName('Web').AsString;
          qry1.Params.Items[5].AsString :=
            FieldByName('Cedula').AsString;
          qry1.Params.Items[6].AsString :=
            FieldByName('NombreComercial').AsString;
          qry1.Params.Items[7].AsString :=
            FieldByName('Fax').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('AreaTelefono').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('AreaFax').AsString;
          qry1.Params.Items[10].AsString := '';
          qry1.Params.Items[11].AsString :=
            pDirectorioLocal;
          qry1.Params.Items[12].AsString :=
            FieldByName('NUMEROSUCURSAL').AsString;
          qry1.Params.Items[13].AsString :=
            FieldByName('NUMEROTERMINAL').AsString;
          qry1.Params.Items[14].AsString :=
            FieldByName('SucursalNombre').AsString;
          qry1.Params.Items[15].AsString :=
            FieldByName('Provincia').AsString;
          qry1.Params.Items[16].AsString :=
            FieldByName('Canton').AsString;
          qry1.Params.Items[17].AsString :=
            FieldByName('Distrito').AsString;
          qry1.Params.Items[18].AsString :=
            FieldByName('Barrio').AsString;
          qry1.Params.Items[19].AsString :=
            FieldByName('ProvinciaNombre').AsString;
          qry1.Params.Items[20].AsString :=
            FieldByName('CantonNombre').AsString;
          qry1.Params.Items[21].AsString :=
            FieldByName('DistritoNombre').AsString;
          qry1.Params.Items[22].AsString :=
            FieldByName('BarrioNombre').AsString;
          qry1.ExecSQL;
        end;
        // Modificar
        if mEncontrado = True then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_empresas');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('Nombre =:Param0,');
          qry1.SQL.Add('Direccion =:Param1,');
          qry1.SQL.Add('Telefono =:Param2,');
          qry1.SQL.Add('Email =:Param3,');
          qry1.SQL.Add('Web =:Param4,');
          qry1.SQL.Add('Cedula =:Param5,');
          qry1.SQL.Add('NombreComercial =:Param6,');
          qry1.SQL.Add('Fax =:Param7,');
          qry1.SQL.Add('AreaTelefono =:Param8,');
          qry1.SQL.Add('AreaFax =:Param9,');
          qry1.SQL.Add('NUMEROSUCURSAL =:Param10,');
          qry1.SQL.Add('NUMEROTERMINAL =:Param11,');
          qry1.SQL.Add('SucursalNombre =:Param12,');
          qry1.SQL.Add('Provincia =:Param13,');
          qry1.SQL.Add('Canton =:Param14,');
          qry1.SQL.Add('Distrito =:Param15,');
          qry1.SQL.Add('Barrio =:Param16,');
          qry1.SQL.Add('ProvinciaNombre =:Param17,');
          qry1.SQL.Add('CantonNombre =:Param18,');
          qry1.SQL.Add('DistritoNombre =:Param19,');
          qry1.SQL.Add('BarrioNombre =:Param20');
          qry1.SQL.Add('Where Nombre =:Param21');
          qry1.Params.Items[0].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[1].AsString :=
            FieldByName('Direccion').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Telefono').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('Email').AsString;
          qry1.Params.Items[4].AsString :=
            FieldByName('Web').AsString;
          qry1.Params.Items[5].AsString :=
            FieldByName('Cedula').AsString;
          qry1.Params.Items[6].AsString :=
            FieldByName('NombreComercial').AsString;
          qry1.Params.Items[7].AsString :=
            FieldByName('Fax').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('AreaTelefono').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('AreaFax').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('NUMEROSUCURSAL').AsString;
          qry1.Params.Items[11].AsString :=
            FieldByName('NUMEROTERMINAL').AsString;
          qry1.Params.Items[12].AsString :=
            FieldByName('SucursalNombre').AsString;
          qry1.Params.Items[13].AsString :=
            FieldByName('Provincia').AsString;
          qry1.Params.Items[14].AsString :=
            FieldByName('Canton').AsString;
          qry1.Params.Items[15].AsString :=
            FieldByName('Distrito').AsString;
          qry1.Params.Items[16].AsString :=
            FieldByName('Barrio').AsString;
          qry1.Params.Items[17].AsString :=
            FieldByName('ProvinciaNombre').AsString;
          qry1.Params.Items[18].AsString :=
            FieldByName('CantonNombre').AsString;
          qry1.Params.Items[19].AsString :=
            FieldByName('DistritoNombre').AsString;
          qry1.Params.Items[20].AsString :=
            FieldByName('BarrioNombre').AsString;
          qry1.Params.Items[21].AsString :=
            mNombre;
          qry1.ExecSQL;
        end;

        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_facturasdetalle'}
procedure TdmObjects.DB_tb_facturasdetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEncabezado,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.TxnIdEncabezado,');
      SQL.Add('A.TxnLineID,');
      SQL.Add('A.ItemListId,');
      SQL.Add('A.ItemFullName,');
      SQL.Add('A.ItemDesc,');
      SQL.Add('A.Quantity,');
      SQL.Add('A.UnitOfMeasure,');
      SQL.Add('A.ClassListId,');
      SQL.Add('A.ClassFullName,');
      SQL.Add('A.Amount,');
      SQL.Add('A.TaxAmount,');
      SQL.Add('A.CodigoEstado,');
      SQL.Add('A.NroLinDet,');
      SQL.Add('A.Codigo,');
      SQL.Add('A.TpoCodigo,');
      SQL.Add('A.MontoTotal,');
      SQL.Add('A.MontoDescuento,');
      SQL.Add('A.PrecioUnitario,');
      SQL.Add('A.MONTOTOTALLINEA,');
      SQL.Add('A.SUBTOTAL,');
      SQL.Add('A.TaxCode,');
      SQL.Add('A.TaxListId,');
      SQL.Add('A.TaxPorcentaje,');
      SQL.Add('A.DesuentoPorcentaje');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_facturasdetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_facturasdetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_facturasdetalle_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_facturasdetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_facturasdetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_facturasdetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_facturasdetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_facturasdetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_facturasencabezado'}
procedure TdmObjects.DB_tb_facturasencabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.TxnID,');
      SQL.Add('A.TxnNumber,');
      SQL.Add('A.CustomerListId,');
      SQL.Add('A.CustomerFullName,');
      SQL.Add('A.ClassListId,');
      SQL.Add('A.ClassFullName,');
      SQL.Add('A.ARAccountListId,');
      SQL.Add('A.ARAccountFullName,');
      SQL.Add('A.TxnDate,');
      SQL.Add('A.TxnTime,');
      SQL.Add('A.RefNumber,');
      SQL.Add('A.Subtotal,');
      SQL.Add('A.CurrencyFullName,');
      SQL.Add('A.ExchangeRate,');
      SQL.Add('A.Memo,');
      SQL.Add('A.CodigoEstado,');
      SQL.Add('A.CodigoTipo,');
      SQL.Add('A.CodigoXMLTrans,');
      SQL.Add('A.DocXML,');
      SQL.Add('A.DocPDF,');
      SQL.Add('A.NumCedulaEmisor,');
      SQL.Add('A.NombreComercialEmisor,');
      SQL.Add('A.DireccionEmisor,');
      SQL.Add('A.NumeroAreaTelEmisor,');
      SQL.Add('A.NumeroTelEmisor,');
      SQL.Add('A.NumeroAreaFaxEmisor,');
      SQL.Add('A.NumeroFaxEmisor,');
      SQL.Add('A.EmailEmisor,');
      SQL.Add('A.NombreEmisor,');
      SQL.Add('A.NumCedulaReceptor,');
      SQL.Add('A.NombreReceptor,');
      SQL.Add('A.DireccionReceptor,');
      SQL.Add('A.NumeroTelReceptor,');
      SQL.Add('A.Moneda,');
      SQL.Add('A.TipoCambio,');
      SQL.Add('A.TotalSerGravados,');
      SQL.Add('A.TotalSerExentos,');
      SQL.Add('A.TotalMerGravadas,');
      SQL.Add('A.TotalMerExentas,');
      SQL.Add('A.TotalGravado,');
      SQL.Add('A.TotalExento,');
      SQL.Add('A.TotalVenta,');
      SQL.Add('A.Descuentos,');
      SQL.Add('A.TotalVentaNeta,');
      SQL.Add('A.MontoImpConsumo,');
      SQL.Add('A.MontoOtrosImp,');
      SQL.Add('A.TarifaImpuesto,');
      SQL.Add('A.MontoImpVentas,');
      SQL.Add('A.TotalFactura,');
      SQL.Add('A.Otros,');
      SQL.Add('A.firma,');
      SQL.Add('A.x509Certificado,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.CLAVE,');
      SQL.Add('A.CodigoMetodoPago,');
      SQL.Add('A.TermsList,');
      SQL.Add('A.CodigoCondicionesPago,');
      SQL.Add('A.EmailReceptor,');
      SQL.Add('A.ProvinciaEmisor,');
      SQL.Add('A.CantonEmisor,');
      SQL.Add('A.DistritoEmisor,');
      SQL.Add('A.BarrioEmisor,');
      SQL.Add('A.ProvinciaReceptor,');
      SQL.Add('A.CantonReceptor,');
      SQL.Add('A.DistritoReceptor,');
      SQL.Add('A.BarrioReceptor,');
      SQL.Add('A.NumeroFaxReceptor,');
      SQL.Add('B.Nombre As EstadoNombre,');
      SQL.Add('C.Nombre As EstadoHacienda,');
      SQL.Add('D.Nombre As CondicionPagoNombre,');
      SQL.Add('E.Nombre As MetodoPagoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join tb_estadosfacturas B On A.CodigoEstado=B.Id');
      SQL.Add('Left Join tb_estadoshacienda C On A.CodigoXMLTrans=C.Id');
      SQL.Add('Left Join tb_condicionespago D On A.CodigoCondicionesPago=D.Id');
      SQL.Add('Left Join tb_metodospago E On A.CodigoMetodoPago=E.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_facturasencabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_facturasencabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_facturasencabezado_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_facturasencabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_facturasencabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_facturasencabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_facturasencabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_facturasencabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_facturasencabezado_InsertarQB(qry1: TFDQuery;
  qry2: TFDQuery; ds1: TFDMemTable; dsEmpresas: TFDMemTable;
  dsClientes: TFDMemTable; dsProductos: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar; dsDetalle: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mTxnID, mTxnIDDetalle: string;
  mEncontrado, mEncontrado2: Boolean;
  mWhere: TStringList;
  mId: Integer;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        // Encabezado
        mTxnID := FieldByName('TxnID').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where TxnID=' + QuotedStr(mTxnID));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_FacturasEncabezado_Existe_Campo(qry1,
          mWhere.Text, 'tb_facturasencabezado', 'TxnID',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        mEncontrado2 :=
          dsClientes.Locate('ListId', FieldByName('CustomerListId').AsString, []);

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_facturasencabezado');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('TxnID,');
          qry1.SQL.Add('TxnNumber,');
          qry1.SQL.Add('CustomerListId,');
          qry1.SQL.Add('CustomerFullName,');
          qry1.SQL.Add('ClassListId,');
          qry1.SQL.Add('ClassFullName,');
          qry1.SQL.Add('ARAccountListId,');
          qry1.SQL.Add('ARAccountFullName,');
          qry1.SQL.Add('TxnDate,');
          qry1.SQL.Add('TxnTime,');
          qry1.SQL.Add('RefNumber,');
          qry1.SQL.Add('Subtotal,');
          qry1.SQL.Add('CurrencyFullName,');
          qry1.SQL.Add('ExchangeRate,');
          qry1.SQL.Add('Memo,');
          qry1.SQL.Add('CodigoEstado,');
          qry1.SQL.Add('CodigoTipo,');
          qry1.SQL.Add('CodigoXMLTrans,');
          qry1.SQL.Add('DocXML,');
          qry1.SQL.Add('NumCedulaEmisor,');
          qry1.SQL.Add('NombreComercialEmisor,');
          qry1.SQL.Add('DireccionEmisor,');
          qry1.SQL.Add('NumeroAreaTelEmisor,');
          qry1.SQL.Add('NumeroTelEmisor,');
          qry1.SQL.Add('NumeroAreaFaxEmisor,');
          qry1.SQL.Add('NumeroFaxEmisor,');
          qry1.SQL.Add('EmailEmisor,');
          qry1.SQL.Add('NombreEmisor,');
          qry1.SQL.Add('NumCedulaReceptor,');
          qry1.SQL.Add('NombreReceptor,');
          qry1.SQL.Add('DireccionReceptor,');
          qry1.SQL.Add('NumeroTelReceptor,');
          qry1.SQL.Add('Moneda,');
          qry1.SQL.Add('TipoCambio,');
          qry1.SQL.Add('TotalSerGravados,');
          qry1.SQL.Add('TotalSerExentos,');
          qry1.SQL.Add('TotalMerGravadas,');
          qry1.SQL.Add('TotalMerExentas,');
          qry1.SQL.Add('TotalGravado,');
          qry1.SQL.Add('TotalExento,');
          qry1.SQL.Add('TotalVenta,');
          qry1.SQL.Add('Descuentos,');
          qry1.SQL.Add('TotalVentaNeta,');
          qry1.SQL.Add('MontoImpConsumo,');
          qry1.SQL.Add('MontoOtrosImp,');
          qry1.SQL.Add('TarifaImpuesto,');
          qry1.SQL.Add('MontoImpVentas,');
          qry1.SQL.Add('TotalFactura,');
          qry1.SQL.Add('Otros,');
          qry1.SQL.Add('firma,');
          qry1.SQL.Add('x509Certificado,');
          qry1.SQL.Add('NUMERO,');
          qry1.SQL.Add('CLAVE,');
          qry1.SQL.Add('CodigoMetodoPago,');
          qry1.SQL.Add('TermsList,');
          qry1.SQL.Add('CodigoCondicionesPago,');
          qry1.SQL.Add('EmailReceptor,');
          qry1.SQL.Add('ProvinciaEmisor,');
          qry1.SQL.Add('CantonEmisor,');
          qry1.SQL.Add('DistritoEmisor,');
          qry1.SQL.Add('BarrioEmisor,');
          qry1.SQL.Add('ProvinciaReceptor,');
          qry1.SQL.Add('CantonReceptor,');
          qry1.SQL.Add('DistritoReceptor,');
          qry1.SQL.Add('BarrioReceptor,');
          qry1.SQL.Add('NumeroFaxReceptor');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5,');
          qry1.SQL.Add(':Param6,');
          qry1.SQL.Add(':Param7,');
          qry1.SQL.Add(':Param8,');
          qry1.SQL.Add(':Param9,');
          qry1.SQL.Add(':Param10,');
          qry1.SQL.Add(':Param11,');
          qry1.SQL.Add(':Param12,');
          qry1.SQL.Add(':Param13,');
          qry1.SQL.Add(':Param14,');
          qry1.SQL.Add(':Param15,');
          qry1.SQL.Add(':Param16,');
          qry1.SQL.Add(':Param17,');
          qry1.SQL.Add(':Param18,');
          qry1.SQL.Add(':Param19,');
          qry1.SQL.Add(':Param20,');
          qry1.SQL.Add(':Param21,');
          qry1.SQL.Add(':Param22,');
          qry1.SQL.Add(':Param23,');
          qry1.SQL.Add(':Param24,');
          qry1.SQL.Add(':Param25,');
          qry1.SQL.Add(':Param26,');
          qry1.SQL.Add(':Param27,');
          qry1.SQL.Add(':Param28,');
          qry1.SQL.Add(':Param29,');
          qry1.SQL.Add(':Param30,');
          qry1.SQL.Add(':Param31,');
          qry1.SQL.Add(':Param32,');
          qry1.SQL.Add(':Param33,');
          qry1.SQL.Add(':Param34,');
          qry1.SQL.Add(':Param35,');
          qry1.SQL.Add(':Param36,');
          qry1.SQL.Add(':Param37,');
          qry1.SQL.Add(':Param38,');
          qry1.SQL.Add(':Param39,');
          qry1.SQL.Add(':Param40,');
          qry1.SQL.Add(':Param41,');
          qry1.SQL.Add(':Param42,');
          qry1.SQL.Add(':Param43,');
          qry1.SQL.Add(':Param44,');
          qry1.SQL.Add(':Param45,');
          qry1.SQL.Add(':Param46,');
          qry1.SQL.Add(':Param47,');
          qry1.SQL.Add(':Param48,');
          qry1.SQL.Add(':Param49,');
          qry1.SQL.Add(':Param50,');
          qry1.SQL.Add(':Param51,');
          qry1.SQL.Add(':Param52,');
          qry1.SQL.Add(':Param53,');
          qry1.SQL.Add(':Param54,');
          qry1.SQL.Add(':Param55,');
          qry1.SQL.Add(':Param56,');
          qry1.SQL.Add(':Param57,');
          qry1.SQL.Add(':Param58,');
          qry1.SQL.Add(':Param59,');
          qry1.SQL.Add(':Param60,');
          qry1.SQL.Add(':Param61,');
          qry1.SQL.Add(':Param62,');
          qry1.SQL.Add(':Param63,');
          qry1.SQL.Add(':Param64,');
          qry1.SQL.Add(':Param65,');
          qry1.SQL.Add(':Param66');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsString :=
            FieldByName('TxnID').AsString;
          qry1.Params.Items[2].AsInteger :=
            FieldByName('TxnNumber').AsInteger;
          qry1.Params.Items[3].AsString :=
            FieldByName('CustomerListId').AsString;
          qry1.Params.Items[4].AsString :=
            FieldByName('CustomerFullName').AsString;
          qry1.Params.Items[5].AsString :=
            FieldByName('ClassListId').AsString;
          qry1.Params.Items[6].AsString :=
            FieldByName('ClassFullName').AsString;
          qry1.Params.Items[7].AsString :=
            FieldByName('ARAccountListId').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('ARAccountFullName').AsString;
          qry1.Params.Items[9].AsString :=
            FormatDateTime('yyyy-MM-dd',
            FieldByName('TxnDate').AsDateTime);
          qry1.Params.Items[10].AsString :=
            FieldByName('TxnTime').AsString;
          qry1.Params.Items[11].AsString :=
            FieldByName('RefNumber').AsString;
          qry1.Params.Items[12].AsFloat :=
            FieldByName('Subtotal').AsFloat;
          qry1.Params.Items[13].AsString :=
            FieldByName('CurrencyFullName').AsString;
          qry1.Params.Items[14].AsFloat :=
            FieldByName('ExchangeRate').AsFloat;
          qry1.Params.Items[15].AsString :=
            FieldByName('Memo').AsString;
          qry1.Params.Items[16].AsInteger :=
            FieldByName('CodigoEstado').AsInteger;
          qry1.Params.Items[17].AsInteger :=
            FieldByName('CodigoTipo').AsInteger;
          qry1.Params.Items[18].AsInteger := 1; //FieldByName('CodigoXMLTrans').AsInteger;
          qry1.Params.Items[19].AsString := '';
          if dsEmpresas.IsEmpty = False then
          begin
            qry1.Params.Items[20].AsString :=
              dsEmpresas.FieldByName('Cedula').AsString;
            qry1.Params.Items[21].AsString :=
              dsEmpresas.FieldByName('NombreComercial').AsString;
            qry1.Params.Items[22].AsString :=
              dsEmpresas.FieldByName('Direccion').AsString;
            qry1.Params.Items[23].AsString := '506';
            qry1.Params.Items[24].AsString :=
              dsEmpresas.FieldByName('Telefono').AsString;
            qry1.Params.Items[25].AsString := '506';
            qry1.Params.Items[26].AsString :=
              dsEmpresas.FieldByName('Fax').AsString;
            qry1.Params.Items[27].AsString :=
              dsEmpresas.FieldByName('Email').AsString;
            qry1.Params.Items[28].AsString :=
              dsEmpresas.FieldByName('Nombre').AsString;
          end
          else begin
            qry1.Params.Items[20].AsString := '';
            qry1.Params.Items[21].AsString := '';
            qry1.Params.Items[22].AsString := '';
            qry1.Params.Items[23].AsString := '';
            qry1.Params.Items[24].AsString := '';
            qry1.Params.Items[25].AsString := '';
            qry1.Params.Items[26].AsString := '';
            qry1.Params.Items[27].AsString := '';
            qry1.Params.Items[28].AsString := '';
          end;
          if mEncontrado2 = True then
          begin
            qry1.Params.Items[29].AsString :=
              dsClientes.FieldByName('Cedula').AsString;
            qry1.Params.Items[30].AsString :=
              dsClientes.FieldByName('Nombre').AsString;
            qry1.Params.Items[31].AsString :=
              dsClientes.FieldByName('Direccion').AsString;
            qry1.Params.Items[32].AsString :=
              dsClientes.FieldByName('Telefono').AsString;
          end
          else begin
            qry1.Params.Items[29].AsString := '';
            qry1.Params.Items[30].AsString := '';
            qry1.Params.Items[31].AsString := '';
            qry1.Params.Items[32].AsString := '';
          end;
          qry1.Params.Items[33].AsString :=
            FieldByName('Moneda').AsString;
          qry1.Params.Items[34].AsFloat :=
            FieldByName('TipoCambio').AsFloat;
          qry1.Params.Items[35].AsFloat :=
            FieldByName('TotalSerGravados').AsFloat;
          qry1.Params.Items[36].AsFloat :=
            FieldByName('TotalSerExentos').AsFloat;
          qry1.Params.Items[37].AsFloat :=
            FieldByName('TotalMerGravadas').AsFloat;
          qry1.Params.Items[38].AsFloat :=
            FieldByName('TotalMerExentas').AsFloat;
          qry1.Params.Items[39].AsFloat :=
            FieldByName('TotalGravado').AsFloat;
          qry1.Params.Items[40].AsFloat :=
            FieldByName('TotalExento').AsFloat;
          qry1.Params.Items[41].AsFloat :=
            FieldByName('TotalVenta').AsFloat;
          qry1.Params.Items[42].AsFloat :=
            FieldByName('Descuentos').AsFloat;
          qry1.Params.Items[43].AsFloat :=
            FieldByName('TotalVentaNeta').AsFloat;
          qry1.Params.Items[44].AsFloat :=
            FieldByName('MontoImpConsumo').AsFloat;
          qry1.Params.Items[45].AsFloat :=
            FieldByName('MontoOtrosImp').AsFloat;
          qry1.Params.Items[46].AsFloat :=
            FieldByName('TarifaImpuesto').AsFloat;
          qry1.Params.Items[47].AsFloat :=
            FieldByName('MontoImpVentas').AsFloat;
          qry1.Params.Items[48].AsFloat :=
            FieldByName('TotalFactura').AsFloat;
          qry1.Params.Items[49].AsString :=
            FieldByName('Otros').AsString;
          qry1.Params.Items[50].AsString :=
            FieldByName('firma').AsString;
          qry1.Params.Items[51].AsString :=
            FieldByName('x509Certificado').AsString;
          qry1.Params.Items[52].AsString :=
            FieldByName('NUMERO').AsString;
          qry1.Params.Items[53].AsString :=
            FieldByName('CLAVE').AsString;
          qry1.Params.Items[54].AsInteger :=
            FieldByName('CodigoMetodoPago').AsInteger;
          qry1.Params.Items[55].AsString :=
            FieldByName('TermsList').AsString;
          qry1.Params.Items[56].AsInteger :=
            FieldByName('CodigoCondicionesPago').AsInteger;
          qry1.Params.Items[57].AsString :=
            FieldByName('EmailReceptor').AsString;
          qry1.Params.Items[58].AsString :=
            FieldByName('ProvinciaEmisor').AsString;
          qry1.Params.Items[59].AsString :=
            FieldByName('CantonEmisor').AsString;
          qry1.Params.Items[60].AsString :=
            FieldByName('DistritoEmisor').AsString;
          qry1.Params.Items[61].AsString :=
            FieldByName('BarrioEmisor').AsString;
          qry1.Params.Items[62].AsString :=
            FieldByName('ProvinciaReceptor').AsString;
          qry1.Params.Items[63].AsString :=
            FieldByName('CantonReceptor').AsString;
          qry1.Params.Items[64].AsString :=
            FieldByName('DistritoReceptor').AsString;
          qry1.Params.Items[65].AsString :=
            FieldByName('BarrioReceptor').AsString;
          qry1.Params.Items[66].AsString :=
            FieldByName('NumeroFaxReceptor').AsString;
          qry1.ExecSQL;

          qry1.SQL.Clear;
          mId := DB_Obtener_Ultimo(qry1, 'tb_facturasencabezado', pResultado, pErrorM);
        end;
        // Modificar
        if mEncontrado = True then
        begin
        {  qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_facturasencabezado');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('TxnID =:Param0,');
          qry1.SQL.Add('TxnNumber =:Param1,');
          qry1.SQL.Add('CustomerListId =:Param2,');
          qry1.SQL.Add('CustomerFullName =:Param3,');
          qry1.SQL.Add('ClassListId =:Param4,');
          qry1.SQL.Add('ClassFullName =:Param5,');
          qry1.SQL.Add('ARAccountListId =:Param6,');
          qry1.SQL.Add('ARAccountFullName =:Param7,');
          qry1.SQL.Add('TxnDate =:Param8,');
          qry1.SQL.Add('TxnTime =:Param9,');
          qry1.SQL.Add('RefNumber =:Param10,');
          qry1.SQL.Add('Subtotal =:Param11,');
          qry1.SQL.Add('CurrencyFullName =:Param12,');
          qry1.SQL.Add('ExchangeRate =:Param13,');
          qry1.SQL.Add('Memo =:Param14');
          qry1.SQL.Add('Where TxnID =:Param15 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsString :=
            FieldByName('TxnID').AsString;
          qry1.Params.Items[1].AsInteger :=
            FieldByName('TxnNumber').AsInteger;
          qry1.Params.Items[2].AsString :=
            FieldByName('CustomerListId').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('CustomerFullName').AsString;
          qry1.Params.Items[4].AsString :=
            FieldByName('ClassListId').AsString;
          qry1.Params.Items[5].AsString :=
            FieldByName('ClassFullName').AsString;
          qry1.Params.Items[6].AsString :=
            FieldByName('ARAccountListId').AsString;
          qry1.Params.Items[7].AsString :=
            FieldByName('ARAccountFullName').AsString;
          qry1.Params.Items[8].AsString :=
            FormatDateTime('yyyy-MM-dd',
            FieldByName('TxnDate').AsDateTime);
          qry1.Params.Items[9].AsString :=
            FieldByName('TxnTime').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('RefNumber').AsString;
          qry1.Params.Items[11].AsFloat :=
            FieldByName('Subtotal').AsFloat;
          qry1.Params.Items[12].AsString :=
            FieldByName('CurrencyFullName').AsString;
          qry1.Params.Items[13].AsFloat :=
            FieldByName('ExchangeRate').AsFloat;
          qry1.Params.Items[14].AsString :=
            FieldByName('Memo').AsString;
          qry1.Params.Items[15].AsString :=
            mTxnID;
          qry1.ExecSQL; }

          qry1.SQL.Clear;
          mId := DB_tb_facturasencabezado_Obtener_Id(qry1, 'Where TxnID=' + QuotedStr(mTxnID) + ' And IdEmpresa=' + IntToStr(pIdEmpresa), 'tb_facturasencabezado', '', pResultado, pErrorM);
        end;

        // Detalle
        dsDetalle.Filtered := False;
        dsDetalle.Filter := 'TxnIdEncabezado=' + QuotedStr(mTxnID);
        dsDetalle.Filtered := True;

        dsDetalle.First;
        while not dsDetalle.Eof do
        begin
          mEncontrado2 :=
            dsProductos.Locate('ListId', dsDetalle.FieldByName('ItemListId').AsString, []);

          mTxnIDDetalle := dsDetalle.FieldByName('TxnLineID').AsString;

          mWhere := TStringList.Create;
          mWhere.Add('Where TxnLineID=' + QuotedStr(mTxnIDDetalle));
          mWhere.Add(' And ');
          mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
          mEncontrado := DB_tb_FacturasDetalle_Existe_Campo(qry1,
            mWhere.Text, 'tb_facturasdetalle', 'TxnIdEncabezado',
            pClaseNombre, pResultado, pErrorM);
          mWhere.Free;

          // Insertar
          if mEncontrado = False then
          begin
            qry1.SQL.Clear;
            qry1.SQL.Add('Insert Into tb_facturasdetalle');
            qry1.SQL.Add('(');
            qry1.SQL.Add('IdEncabezado,');
            qry1.SQL.Add('IdEmpresa,');
            qry1.SQL.Add('TxnIdEncabezado,');
            qry1.SQL.Add('TxnLineID,');
            qry1.SQL.Add('ItemListId,');
            qry1.SQL.Add('ItemFullName,');
            qry1.SQL.Add('ItemDesc,');
            qry1.SQL.Add('Quantity,');
            qry1.SQL.Add('UnitOfMeasure,');
            qry1.SQL.Add('ClassListId,');
            qry1.SQL.Add('ClassFullName,');
            qry1.SQL.Add('Amount,');
            qry1.SQL.Add('TaxAmount,');
            qry1.SQL.Add('CodigoEstado,');
            qry1.SQL.Add('NroLinDet,');
            qry1.SQL.Add('Codigo,');
            qry1.SQL.Add('TpoCodigo,');
            qry1.SQL.Add('MontoTotal,');
            qry1.SQL.Add('MontoDescuento,');
            qry1.SQL.Add('PrecioUnitario,');
            qry1.SQL.Add('MONTOTOTALLINEA,');
            qry1.SQL.Add('SUBTOTAL,');
            qry1.SQL.Add('TaxCode,');
            qry1.SQL.Add('TaxListId,');
            qry1.SQL.Add('TaxPorcentaje,');
            qry1.SQL.Add('DesuentoPorcentaje');
            qry1.SQL.Add(')');
            qry1.SQL.Add('Values(');
            qry1.SQL.Add(':Param0,');
            qry1.SQL.Add(':Param1,');
            qry1.SQL.Add(':Param2,');
            qry1.SQL.Add(':Param3,');
            qry1.SQL.Add(':Param4,');
            qry1.SQL.Add(':Param5,');
            qry1.SQL.Add(':Param6,');
            qry1.SQL.Add(':Param7,');
            qry1.SQL.Add(':Param8,');
            qry1.SQL.Add(':Param9,');
            qry1.SQL.Add(':Param10,');
            qry1.SQL.Add(':Param11,');
            qry1.SQL.Add(':Param12,');
            qry1.SQL.Add(':Param13,');
            qry1.SQL.Add(':Param14,');
            qry1.SQL.Add(':Param15,');
            qry1.SQL.Add(':Param16,');
            qry1.SQL.Add(':Param17,');
            qry1.SQL.Add(':Param18,');
            qry1.SQL.Add(':Param19,');
            qry1.SQL.Add(':Param20,');
            qry1.SQL.Add(':Param21,');
            qry1.SQL.Add(':Param22,');
            qry1.SQL.Add(':Param23,');
            qry1.SQL.Add(':Param24,');
            qry1.SQL.Add(':Param25');
            qry1.SQL.Add(')');
            qry1.Params.Items[0].AsInteger :=
              mId;
            qry1.Params.Items[1].AsInteger :=
              pIdEmpresa;
            qry1.Params.Items[2].AsString :=
              dsDetalle.FieldByName('TxnIdEncabezado').AsString;
            qry1.Params.Items[3].AsString :=
              dsDetalle.FieldByName('TxnLineID').AsString;
            qry1.Params.Items[4].AsString :=
              dsDetalle.FieldByName('ItemListId').AsString;
            qry1.Params.Items[5].AsString :=
              dsDetalle.FieldByName('ItemFullName').AsString;
            qry1.Params.Items[6].AsString :=
              dsDetalle.FieldByName('ItemDesc').AsString;
            qry1.Params.Items[7].AsFloat :=
              dsDetalle.FieldByName('Quantity').AsFloat;
            qry1.Params.Items[8].AsString :=
              dsDetalle.FieldByName('UnitOfMeasure').AsString;
            qry1.Params.Items[9].AsString :=
              dsDetalle.FieldByName('ClassListId').AsString;
            qry1.Params.Items[10].AsString :=
              dsDetalle.FieldByName('ClassFullName').AsString;
            qry1.Params.Items[11].AsFloat :=
              dsDetalle.FieldByName('Amount').AsFloat;
            qry1.Params.Items[12].AsFloat :=
              dsDetalle.FieldByName('TaxAmount').AsFloat;
            qry1.Params.Items[13].AsInteger :=
              dsDetalle.FieldByName('CodigoEstado').AsInteger;
            qry1.Params.Items[14].AsInteger := 1;
            if mEncontrado2 = True then
            begin
              qry1.Params.Items[15].AsString := ''; //Codigo
              qry1.Params.Items[16].AsInteger := 1; //TipoCodigo
              qry1.Params.Items[17].AsFloat := 0; // MontoToal
              qry1.Params.Items[18].AsFloat :=   //MontoDescuento
                dsDetalle.FieldByName('Amount').AsFloat;
              qry1.Params.Items[19].AsFloat :=
                dsProductos.FieldByName('Precio').AsFloat;
            end
            else begin
              qry1.Params.Items[15].AsString := '';
              qry1.Params.Items[16].AsInteger := 1;
              qry1.Params.Items[17].AsFloat := 0;
              qry1.Params.Items[18].AsFloat := 0;
              qry1.Params.Items[19].AsFloat := 0;
            end;
            qry1.Params.Items[20].AsFloat :=
              dsDetalle.FieldByName('MONTOTOTALLINEA').AsFloat;
            qry1.Params.Items[21].AsFloat :=
              dsDetalle.FieldByName('SUBTOTAL').AsFloat;
            qry1.Params.Items[22].AsString :=
              dsDetalle.FieldByName('TaxCode').AsString;
            qry1.Params.Items[23].AsString :=
              dsDetalle.FieldByName('TaxListId').AsString;
            qry1.Params.Items[24].AsFloat :=
              dsDetalle.FieldByName('TaxPorcentaje').AsFloat;
            qry1.Params.Items[25].AsFloat :=
              dsDetalle.FieldByName('DesuentoPorcentaje').AsFloat;
            qry1.ExecSQL;
          end;
          // Modificar
          if mEncontrado = True then
          begin
          {  qry1.SQL.Clear;
            qry1.SQL.Add('Update tb_facturasdetalle');
            qry1.SQL.Add('Set');
            qry1.SQL.Add('TxnIdEncabezado =:Param0,');
            qry1.SQL.Add('TxnLineID =:Param1,');
            qry1.SQL.Add('ItemListId =:Param2,');
            qry1.SQL.Add('ItemFullName =:Param3,');
            qry1.SQL.Add('ItemDesc =:Param4,');
            qry1.SQL.Add('Quantity =:Param5,');
            qry1.SQL.Add('UnitOfMeasure =:Param6,');
            qry1.SQL.Add('ClassListId =:Param7,');
            qry1.SQL.Add('ClassFullName =:Param8,');
            qry1.SQL.Add('Amount =:Param9,');
            qry1.SQL.Add('TaxAmount =:Param10');
            qry1.SQL.Add('Where TxnIdEncabezado =:Param11 And IdEmpresa=' + IntToStr(pIdEmpresa));
            qry1.Params.Items[0].AsString :=
              dsDetalle.FieldByName('TxnIdEncabezado').AsString;
            qry1.Params.Items[1].AsString :=
              dsDetalle.FieldByName('TxnLineID').AsString;
            qry1.Params.Items[2].AsString :=
              dsDetalle.FieldByName('ItemListId').AsString;
            qry1.Params.Items[3].AsString :=
              dsDetalle.FieldByName('ItemFullName').AsString;
            qry1.Params.Items[4].AsString :=
              dsDetalle.FieldByName('ItemDesc').AsString;
            qry1.Params.Items[5].AsFloat :=
              dsDetalle.FieldByName('Quantity').AsFloat;
            qry1.Params.Items[6].AsString :=
              dsDetalle.FieldByName('UnitOfMeasure').AsString;
            qry1.Params.Items[7].AsString :=
              dsDetalle.FieldByName('ClassListId').AsString;
            qry1.Params.Items[8].AsString :=
              dsDetalle.FieldByName('ClassFullName').AsString;
            qry1.Params.Items[9].AsFloat :=
              dsDetalle.FieldByName('Amount').AsFloat;
            qry1.Params.Items[10].AsFloat :=
              dsDetalle.FieldByName('TaxAmount').AsFloat;
            qry1.Params.Items[11].AsString :=
              mTxnID;
            qry1.ExecSQL;  }
          end;

          dsDetalle.Next;
        end;
        dsDetalle.Filtered := False;
        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
      mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
      mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_monedas'}
procedure TdmObjects.DB_tb_monedas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.ListId,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.Activo,');
      SQL.Add('A.Rate,');
      SQL.Add('A.Codigo');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_monedas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_monedas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_monedas_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_monedas_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_monedas_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_monedas_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_monedas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_monedas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_monedas_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mListId: string;
  mEncontrado: Boolean;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        mListId := FieldByName('ListId').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where ListId=' + QuotedStr(mListId));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_Monedas_Existe_Campo(qry1,
          mWhere.Text, 'tb_monedas', 'ListId',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_monedas');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('ListId,');
          qry1.SQL.Add('Nombre,');
          qry1.SQL.Add('Activo,');
          qry1.SQL.Add('Rate,');
          qry1.SQL.Add('Codigo');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[3].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[4].AsFloat :=
            FieldByName('Rate').AsFloat;
          qry1.Params.Items[5].AsString :=
            FieldByName('Codigo').AsString;
          qry1.ExecSQL;
        end;
        // Modificar
        if mEncontrado = True then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_monedas');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('ListId =:Param0,');
          qry1.SQL.Add('Nombre =:Param1,');
          qry1.SQL.Add('Activo =:Param2,');
          qry1.SQL.Add('Rate =:Param3,');
          qry1.SQL.Add('Codigo =:Param4');
          qry1.SQL.Add('Where ListId =:Param5 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[1].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[2].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[3].AsFloat :=
            FieldByName('Rate').AsFloat;
          qry1.Params.Items[4].AsString :=
            FieldByName('Codigo').AsString;
          qry1.Params.Items[5].AsString :=
            mListId;
          qry1.ExecSQL;
        end;

        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_productos'}
procedure TdmObjects.DB_tb_productos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.ListId,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.FullName,');
      SQL.Add('A.Precio,');
      SQL.Add('A.Grupo,');
      SQL.Add('A.Activo,');
      SQL.Add('A.AccountListId,');
      SQL.Add('A.AccountFullName,');
      SQL.Add('A.Tipo,');
      SQL.Add('A.UnitOfMeasure,');
      SQL.Add('A.Stock,');
      SQL.Add('A.TaxCode,');
      SQL.Add('A.Costo,');
      SQL.Add('A.Peso,');
      SQL.Add('A.ParentListId,');
      SQL.Add('A.ParentFullName,');
      SQL.Add('A.ClassListId,');
      SQL.Add('A.ClassFullName,');
      SQL.Add('A.Descripcion,');
      SQL.Add('A.NombreTab,');
      SQL.Add('A.Nivel,');
      SQL.Add('A.SubTipo1,');
      SQL.Add('A.SubTipo2');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_productos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_productos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_productos_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_productos_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_productos_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_productos_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_productos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_productos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_productos_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mListId: string;
  mEncontrado: Boolean;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        mListId := FieldByName('ListId').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where ListId=' + QuotedStr(mListId));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_Productos_Existe_Campo(qry1,
          mWhere.Text, 'tb_productos', 'ListId',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_productos');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('ListId,');
          qry1.SQL.Add('Nombre,');
          qry1.SQL.Add('FullName,');
          qry1.SQL.Add('Precio,');
          qry1.SQL.Add('Grupo,');
          qry1.SQL.Add('Activo,');
          qry1.SQL.Add('AccountListId,');
          qry1.SQL.Add('AccountFullName,');
          qry1.SQL.Add('Tipo,');
          qry1.SQL.Add('UnitOfMeasure,');
          qry1.SQL.Add('Stock,');
          qry1.SQL.Add('TaxCode,');
          qry1.SQL.Add('Costo,');
          qry1.SQL.Add('Peso,');
          qry1.SQL.Add('ParentListId,');
          qry1.SQL.Add('ParentFullName,');
          qry1.SQL.Add('ClassListId,');
          qry1.SQL.Add('ClassFullName,');
          qry1.SQL.Add('DESCRIPCION,');
          qry1.SQL.Add('NombreTab,');
          qry1.SQL.Add('Nivel,');
          qry1.SQL.Add('SubTipo1,');
          qry1.SQL.Add('SubTipo2');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5,');
          qry1.SQL.Add(':Param6,');
          qry1.SQL.Add(':Param7,');
          qry1.SQL.Add(':Param8,');
          qry1.SQL.Add(':Param9,');
          qry1.SQL.Add(':Param10,');
          qry1.SQL.Add(':Param11,');
          qry1.SQL.Add(':Param12,');
          qry1.SQL.Add(':Param13,');
          qry1.SQL.Add(':Param14,');
          qry1.SQL.Add(':Param15,');
          qry1.SQL.Add(':Param16,');
          qry1.SQL.Add(':Param17,');
          qry1.SQL.Add(':Param18,');
          qry1.SQL.Add(':Param19,');
          qry1.SQL.Add(':Param20,');
          qry1.SQL.Add(':Param21,');
          qry1.SQL.Add(':Param22,');
          qry1.SQL.Add(':Param23');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('FullName').AsString;
          qry1.Params.Items[4].AsFloat :=
            FieldByName('Precio').AsFloat;
          qry1.Params.Items[5].AsInteger :=
            FieldByName('Grupo').AsInteger;
          qry1.Params.Items[6].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[7].AsString :=
            FieldByName('AccountListId').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('AccountFullName').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('Tipo').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('UnitOfMeasure').AsString;
          qry1.Params.Items[11].AsFloat :=
            FieldByName('Stock').AsFloat;
          qry1.Params.Items[12].AsString :=
            FieldByName('TaxCode').AsString;
          qry1.Params.Items[13].AsFloat :=
            FieldByName('Costo').AsFloat;
          qry1.Params.Items[14].AsFloat :=
            FieldByName('Peso').AsFloat;
          qry1.Params.Items[15].AsString :=
            FieldByName('ParentListId').AsString;
          qry1.Params.Items[16].AsString :=
            FieldByName('ParentFullName').AsString;
          qry1.Params.Items[17].AsString :=
            FieldByName('ClassListId').AsString;
          qry1.Params.Items[18].AsString :=
            FieldByName('ClassFullName').AsString;
          qry1.Params.Items[19].AsString :=
            FieldByName('DESCRIPCION').AsString;
          qry1.Params.Items[20].AsString :=
            FieldByName('NombreTab').AsString;
          qry1.Params.Items[21].AsInteger :=
            FieldByName('Nivel').AsInteger;
          qry1.Params.Items[22].AsInteger :=
            FieldByName('SubTipo1').AsInteger;
          qry1.Params.Items[23].AsInteger :=
            FieldByName('SubTipo2').AsInteger;
          qry1.ExecSQL;
        end;
        // Modificar
        if mEncontrado = True then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_productos');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('ListId =:Param0,');
          qry1.SQL.Add('Nombre =:Param1,');
          qry1.SQL.Add('FullName =:Param2,');
          qry1.SQL.Add('Precio =:Param3,');
          qry1.SQL.Add('Grupo =:Param4,');
          qry1.SQL.Add('Activo =:Param5,');
          qry1.SQL.Add('AccountListId =:Param6,');
          qry1.SQL.Add('AccountFullName =:Param7,');
          qry1.SQL.Add('Tipo =:Param8,');
          qry1.SQL.Add('UnitOfMeasure =:Param9,');
          qry1.SQL.Add('Stock =:Param10,');
          qry1.SQL.Add('TaxCode =:Param11,');
          qry1.SQL.Add('Costo =:Param12,');
          qry1.SQL.Add('Peso =:Param13,');
          qry1.SQL.Add('ParentListId =:Param14,');
          qry1.SQL.Add('ParentFullName =:Param15,');
          qry1.SQL.Add('ClassListId =:Param16,');
          qry1.SQL.Add('ClassFullName =:Param17,');
          qry1.SQL.Add('DESCRIPCION =:Param18,');
          qry1.SQL.Add('NombreTab =:Param19,');
          qry1.SQL.Add('Nivel =:Param20,');
          qry1.SQL.Add('SubTipo1 =:Param21,');
          qry1.SQL.Add('SubTipo2 =:Param22');
          qry1.SQL.Add('Where ListId =:Param23 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[1].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('FullName').AsString;
          qry1.Params.Items[3].AsFloat :=
            FieldByName('Precio').AsFloat;
          qry1.Params.Items[4].AsInteger :=
            FieldByName('Grupo').AsInteger;
          qry1.Params.Items[5].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[6].AsString :=
            FieldByName('AccountListId').AsString;
          qry1.Params.Items[7].AsString :=
            FieldByName('AccountFullName').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('Tipo').AsString;
          qry1.Params.Items[9].AsString :=
            FieldByName('UnitOfMeasure').AsString;
          qry1.Params.Items[10].AsFloat :=
            FieldByName('Stock').AsFloat;
          qry1.Params.Items[11].AsString :=
            FieldByName('TaxCode').AsString;
          qry1.Params.Items[12].AsFloat :=
            FieldByName('Costo').AsFloat;
          qry1.Params.Items[13].AsFloat :=
            FieldByName('Peso').AsFloat;
          qry1.Params.Items[14].AsString :=
            FieldByName('ParentListId').AsString;
          qry1.Params.Items[15].AsString :=
            FieldByName('ParentFullName').AsString;
          qry1.Params.Items[16].AsString :=
            FieldByName('ClassListId').AsString;
          qry1.Params.Items[17].AsString :=
            FieldByName('ClassFullName').AsString;
          qry1.Params.Items[18].AsString :=
            FieldByName('DESCRIPCION').AsString;
          qry1.Params.Items[19].AsString :=
            FieldByName('NombreTab').AsString;
          qry1.Params.Items[20].AsInteger :=
            FieldByName('Nivel').AsInteger;
          qry1.Params.Items[21].AsInteger :=
            FieldByName('SubTipo1').AsInteger;
          qry1.Params.Items[22].AsInteger :=
            FieldByName('SubTipo2').AsInteger;
          qry1.Params.Items[23].AsString :=
            mListId;
          qry1.ExecSQL;
        end;

        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_productos_Obtener_ListaDescuentos(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pLista: TStringList;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    pLista.Clear;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ListId');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      while not Eof do
      begin
        pLista.Add(FieldByName('ListId').AsString);
        Next;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_ListaDescuentos.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_sistema'}
procedure TdmObjects.DB_tb_sistema_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.FechaSincro,');
      SQL.Add('A.HoraSincro,');
      SQL.Add('A.LogSincro,');
      SQL.Add('A.PlantillaFactura,');
      SQL.Add('A.PlantillaNotaCredito,');
      SQL.Add('A.PlantillaNotaDebito,');
      SQL.Add('A.PlantillaTiquete,');
      SQL.Add('A.FechaDesde,');
      SQL.Add('A.FechaHasta');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_sistema_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_sistema_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_sistema_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_sistema_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_sistema_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_sistema_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_sistema_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_sistema_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_sistema_Obtener_UltimaSincro(qry1: TFDQuery; pWhere: string;
  pTabla: string; var pFecha1: TDateTime; var pFecha2: TDateTime; pEstado: Integer;
  pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    pFecha1 := StrToDate('01/01/2000');
    pFecha2 := StrToDate('01/01/2000');
    pEstado := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select FechaDesde, FechaHasta');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
        begin
          pEstado := 1;
          pFecha1 := Fields[0].AsDateTime;
          pFecha2 := Fields[1].AsDateTime
        end;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_usuarios'}
procedure TdmObjects.DB_tb_usuarios_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.Usuario,');
      SQL.Add('A.Clave,');
      SQL.Add('A.NombreCompleto,');
      SQL.Add('A.Email,');
      SQL.Add('A.CodigoEstado,');
      SQL.Add('A.CodigoPuesto,');
      SQL.Add('A.CodigoRol,');
      SQL.Add('A.EsVisible,');
      SQL.Add('A.CodigoNivel');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_usuarios_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_usuarios_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_usuarios_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_usuarios_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_usuarios_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_usuarios_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_usuarios_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_usuarios_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

function TdmObjects.DB_tb_usuarios_Obtener_Clave(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): string;
var
  mResultado: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    mResultado := '';

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Clave');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Clave.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'tb_bitacora'}
procedure TdmObjects.DB_tb_bitacora_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.IdUsuario,');
      SQL.Add('A.Fecha,');
      SQL.Add('A.Hora,');
      SQL.Add('A.CodigoTabla,');
      SQL.Add('A.CodigoAccion,');
      SQL.Add('A.Notas,');
      SQL.Add('A.CodigoAlerta,');
      SQL.Add('A.IdTabla,');
      SQL.Add('A.RegistroAnterior,');
      SQL.Add('A.RegistroNuevo,');
      SQL.Add('A.RegistroEliminado,');
      SQL.Add('A.Descripcion,');
      SQL.Add('A.IP,');
      SQL.Add('A.MAC,');
      SQL.Add('A.CodigoCierre,');
      SQL.Add('B.Nombre As TablaNombre,');
      SQL.Add('C.Nombre As AccionNombre,');
      SQL.Add('D.Usuario As UsuariosUsuario');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join tb_tablas B On A.CodigoTabla=B.Id');
      SQL.Add('Left Join tb_acciones C On A.CodigoAccion=C.Id');
      SQL.Add('Left Join tb_usuarios D On A.IdUsuario=D.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_bitacora_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_bitacora_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_bitacora_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_bitacora_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_bitacora_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_bitacora_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_bitacora_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_bitacora_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_acciones'}
procedure TdmObjects.DB_tb_acciones_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Nombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_acciones_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_acciones_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_acciones_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_acciones_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_acciones_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_acciones_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_acciones_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_acciones_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_opciones'}
procedure TdmObjects.DB_tb_opciones_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.PlantillaFactura,');
      SQL.Add('A.PlantillaNotaCredito,');
      SQL.Add('A.PlantillaNotaDebito,');
      SQL.Add('A.PlantillaTiquete');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_opciones_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_opciones_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_opciones_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_opciones_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_opciones_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_opciones_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_opciones_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_opciones_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_EstadosHacienda'}
procedure TdmObjects.DB_tb_EstadosHacienda_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Nombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EstadosHacienda_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EstadosHacienda_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EstadosHacienda_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_EstadosHacienda_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EstadosHacienda_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EstadosHacienda_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EstadosHacienda_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_EstadosHacienda_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_Permisos'}
procedure TdmObjects.DB_tb_Permisos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdUsuario,');
      SQL.Add('A.IdOpcion,');
      SQL.Add('A.Permitido');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Permisos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Permisos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Permisos_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_Permisos_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Permisos_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Permisos_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Permisos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_Permisos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_EmailDefault'}
procedure TdmObjects.DB_tb_EmailDefault_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.Direccion,');
      SQL.Add('A.Asunto,');
      SQL.Add('A.Mensaje,');
      SQL.Add('A.Servidor,');
      SQL.Add('A.Puerto,');
      SQL.Add('A.Usuario,');
      SQL.Add('A.Clave');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EmailDefault_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EmailDefault_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EmailDefault_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_EmailDefault_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EmailDefault_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EmailDefault_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EmailDefault_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_EmailDefault_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_notascreditodetalle'}
procedure TdmObjects.DB_tb_notascreditodetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEncabezado,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.TxnIdEncabezado,');
      SQL.Add('A.TxnLineID,');
      SQL.Add('A.ItemListId,');
      SQL.Add('A.ItemFullName,');
      SQL.Add('A.ItemDesc,');
      SQL.Add('A.Quantity,');
      SQL.Add('A.UnitOfMeasure,');
      SQL.Add('A.ClassListId,');
      SQL.Add('A.ClassFullName,');
      SQL.Add('A.Amount,');
      SQL.Add('A.TaxAmount,');
      SQL.Add('A.CodigoEstado,');
      SQL.Add('A.NroLinDet,');
      SQL.Add('A.Codigo,');
      SQL.Add('A.TpoCodigo,');
      SQL.Add('A.MontoTotal,');
      SQL.Add('A.MontoDescuento,');
      SQL.Add('A.PrecioUnitario,');
      SQL.Add('A.MONTOTOTALLINEA,');
      SQL.Add('A.SUBTOTAL,');
      SQL.Add('A.TaxCode,');
      SQL.Add('A.TaxListId,');
      SQL.Add('A.TaxPorcentaje,');
      SQL.Add('A.DesuentoPorcentaje');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_notascreditodetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_notascreditodetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_notascreditodetalle_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_notascreditodetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_notascreditodetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_notascreditodetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_notascreditodetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_notascreditodetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_notascreditoencabezado'}
procedure TdmObjects.DB_tb_notascreditoencabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.TxnID,');
      SQL.Add('A.TxnNumber,');
      SQL.Add('A.CustomerListId,');
      SQL.Add('A.CustomerFullName,');
      SQL.Add('A.ClassListId,');
      SQL.Add('A.ClassFullName,');
      SQL.Add('A.ARAccountListId,');
      SQL.Add('A.ARAccountFullName,');
      SQL.Add('A.TxnDate,');
      SQL.Add('A.TxnTime,');
      SQL.Add('A.RefNumber,');
      SQL.Add('A.Subtotal,');
      SQL.Add('A.CurrencyFullName,');
      SQL.Add('A.ExchangeRate,');
      SQL.Add('A.Memo,');
      SQL.Add('A.CodigoEstado,');
      SQL.Add('A.CodigoTipo,');
      SQL.Add('A.CodigoXMLTrans,');
      SQL.Add('A.DocXML,');
      SQL.Add('A.DocPDF,');
      SQL.Add('A.NumCedulaEmisor,');
      SQL.Add('A.NombreComercialEmisor,');
      SQL.Add('A.DireccionEmisor,');
      SQL.Add('A.NumeroAreaTelEmisor,');
      SQL.Add('A.NumeroTelEmisor,');
      SQL.Add('A.NumeroAreaFaxEmisor,');
      SQL.Add('A.NumeroFaxEmisor,');
      SQL.Add('A.EmailEmisor,');
      SQL.Add('A.NombreEmisor,');
      SQL.Add('A.NumCedulaReceptor,');
      SQL.Add('A.NombreReceptor,');
      SQL.Add('A.DireccionReceptor,');
      SQL.Add('A.NumeroTelReceptor,');
      SQL.Add('A.Moneda,');
      SQL.Add('A.TipoCambio,');
      SQL.Add('A.TotalSerGravados,');
      SQL.Add('A.TotalSerExentos,');
      SQL.Add('A.TotalMerGravadas,');
      SQL.Add('A.TotalMerExentas,');
      SQL.Add('A.TotalGravado,');
      SQL.Add('A.TotalExento,');
      SQL.Add('A.TotalVenta,');
      SQL.Add('A.Descuentos,');
      SQL.Add('A.TotalVentaNeta,');
      SQL.Add('A.MontoImpConsumo,');
      SQL.Add('A.MontoOtrosImp,');
      SQL.Add('A.TarifaImpuesto,');
      SQL.Add('A.MontoImpVentas,');
      SQL.Add('A.TotalFactura,');
      SQL.Add('A.Otros,');
      SQL.Add('A.firma,');
      SQL.Add('A.x509Certificado,');
      SQL.Add('A.idfactura,');
      SQL.Add('A.Numero,');
      SQL.Add('A.Clave,');
      SQL.Add('A.CodigoMetodoPago,');
      SQL.Add('A.TermsList,');
      SQL.Add('A.CodigoCondicionesPago,');
      SQL.Add('A.EmailReceptor,');
      SQL.Add('A.ProvinciaEmisor,');
      SQL.Add('A.CantonEmisor,');
      SQL.Add('A.DistritoEmisor,');
      SQL.Add('A.BarrioEmisor,');
      SQL.Add('A.ProvinciaReceptor,');
      SQL.Add('A.CantonReceptor,');
      SQL.Add('A.DistritoReceptor,');
      SQL.Add('A.BarrioReceptor,');
      SQL.Add('A.NumeroFaxReceptor,');
      SQL.Add('B.Nombre As EstadoNombre,');
      SQL.Add('C.Nombre As EstadoHacienda,');
      SQL.Add('D.Nombre As CondicionPagoNombre,');
      SQL.Add('E.Nombre As MetodoPagoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join tb_estadosfacturas B On A.CodigoEstado=B.Id');
      SQL.Add('Left Join tb_estadoshacienda C On A.CodigoXMLTrans=C.Id');
      SQL.Add('Left Join tb_condicionespago D On A.CodigoCondicionesPago=D.Id');
      SQL.Add('Left Join tb_metodospago E On A.CodigoMetodoPago=E.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_notascreditoencabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_notascreditoencabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_notascreditoencabezado_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_notascreditoencabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_notascreditoencabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_notascreditoencabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_notascreditoencabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_notascreditoencabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_notascreditoencabezado_InsertarQB(qry1: TFDQuery;
  qry2: TFDQuery; ds1: TFDMemTable; dsEmpresas: TFDMemTable;
  dsClientes: TFDMemTable; dsProductos: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar; dsDetalle: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mTxnID, mTxnIDDetalle: string;
  mEncontrado, mEncontrado2: Boolean;
  mWhere: TStringList;
  mId: Integer;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        // Encabezado
        mTxnID := FieldByName('TxnID').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where TxnID=' + QuotedStr(mTxnID));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_NotasCreditoEncabezado_Existe_Campo(qry1,
          mWhere.Text, 'tb_notascreditoencabezado', 'TxnID',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        mEncontrado2 :=
          dsClientes.Locate('ListId', FieldByName('CustomerListId').AsString, []);

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_notascreditoencabezado');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('TxnID,');
          qry1.SQL.Add('TxnNumber,');
          qry1.SQL.Add('CustomerListId,');
          qry1.SQL.Add('CustomerFullName,');
          qry1.SQL.Add('ClassListId,');
          qry1.SQL.Add('ClassFullName,');
          qry1.SQL.Add('ARAccountListId,');
          qry1.SQL.Add('ARAccountFullName,');
          qry1.SQL.Add('TxnDate,');
          qry1.SQL.Add('TxnTime,');
          qry1.SQL.Add('RefNumber,');
          qry1.SQL.Add('Subtotal,');
          qry1.SQL.Add('CurrencyFullName,');
          qry1.SQL.Add('ExchangeRate,');
          qry1.SQL.Add('Memo,');
          qry1.SQL.Add('CodigoEstado,');
          qry1.SQL.Add('CodigoTipo,');
          qry1.SQL.Add('CodigoXMLTrans,');
          qry1.SQL.Add('DocXML,');
          qry1.SQL.Add('NumCedulaEmisor,');
          qry1.SQL.Add('NombreComercialEmisor,');
          qry1.SQL.Add('DireccionEmisor,');
          qry1.SQL.Add('NumeroAreaTelEmisor,');
          qry1.SQL.Add('NumeroTelEmisor,');
          qry1.SQL.Add('NumeroAreaFaxEmisor,');
          qry1.SQL.Add('NumeroFaxEmisor,');
          qry1.SQL.Add('EmailEmisor,');
          qry1.SQL.Add('NombreEmisor,');
          qry1.SQL.Add('NumCedulaReceptor,');
          qry1.SQL.Add('NombreReceptor,');
          qry1.SQL.Add('DireccionReceptor,');
          qry1.SQL.Add('NumeroTelReceptor,');
          qry1.SQL.Add('Moneda,');
          qry1.SQL.Add('TipoCambio,');
          qry1.SQL.Add('TotalSerGravados,');
          qry1.SQL.Add('TotalSerExentos,');
          qry1.SQL.Add('TotalMerGravadas,');
          qry1.SQL.Add('TotalMerExentas,');
          qry1.SQL.Add('TotalGravado,');
          qry1.SQL.Add('TotalExento,');
          qry1.SQL.Add('TotalVenta,');
          qry1.SQL.Add('Descuentos,');
          qry1.SQL.Add('TotalVentaNeta,');
          qry1.SQL.Add('MontoImpConsumo,');
          qry1.SQL.Add('MontoOtrosImp,');
          qry1.SQL.Add('TarifaImpuesto,');
          qry1.SQL.Add('MontoImpVentas,');
          qry1.SQL.Add('TotalFactura,');
          qry1.SQL.Add('Otros,');
          qry1.SQL.Add('firma,');
          qry1.SQL.Add('x509Certificado,');
          qry1.SQL.Add('NUMERO,');
          qry1.SQL.Add('CLAVE,');
          qry1.SQL.Add('CodigoMetodoPago,');
          qry1.SQL.Add('TermsList,');
          qry1.SQL.Add('CodigoCondicionesPago,');
          qry1.SQL.Add('EmailReceptor,');
          qry1.SQL.Add('ProvinciaEmisor,');
          qry1.SQL.Add('CantonEmisor,');
          qry1.SQL.Add('DistritoEmisor,');
          qry1.SQL.Add('BarrioEmisor,');
          qry1.SQL.Add('ProvinciaReceptor,');
          qry1.SQL.Add('CantonReceptor,');
          qry1.SQL.Add('DistritoReceptor,');
          qry1.SQL.Add('BarrioReceptor,');
          qry1.SQL.Add('NumeroFaxReceptor');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5,');
          qry1.SQL.Add(':Param6,');
          qry1.SQL.Add(':Param7,');
          qry1.SQL.Add(':Param8,');
          qry1.SQL.Add(':Param9,');
          qry1.SQL.Add(':Param10,');
          qry1.SQL.Add(':Param11,');
          qry1.SQL.Add(':Param12,');
          qry1.SQL.Add(':Param13,');
          qry1.SQL.Add(':Param14,');
          qry1.SQL.Add(':Param15,');
          qry1.SQL.Add(':Param16,');
          qry1.SQL.Add(':Param17,');
          qry1.SQL.Add(':Param18,');
          qry1.SQL.Add(':Param19,');
          qry1.SQL.Add(':Param20,');
          qry1.SQL.Add(':Param21,');
          qry1.SQL.Add(':Param22,');
          qry1.SQL.Add(':Param23,');
          qry1.SQL.Add(':Param24,');
          qry1.SQL.Add(':Param25,');
          qry1.SQL.Add(':Param26,');
          qry1.SQL.Add(':Param27,');
          qry1.SQL.Add(':Param28,');
          qry1.SQL.Add(':Param29,');
          qry1.SQL.Add(':Param30,');
          qry1.SQL.Add(':Param31,');
          qry1.SQL.Add(':Param32,');
          qry1.SQL.Add(':Param33,');
          qry1.SQL.Add(':Param34,');
          qry1.SQL.Add(':Param35,');
          qry1.SQL.Add(':Param36,');
          qry1.SQL.Add(':Param37,');
          qry1.SQL.Add(':Param38,');
          qry1.SQL.Add(':Param39,');
          qry1.SQL.Add(':Param40,');
          qry1.SQL.Add(':Param41,');
          qry1.SQL.Add(':Param42,');
          qry1.SQL.Add(':Param43,');
          qry1.SQL.Add(':Param44,');
          qry1.SQL.Add(':Param45,');
          qry1.SQL.Add(':Param46,');
          qry1.SQL.Add(':Param47,');
          qry1.SQL.Add(':Param48,');
          qry1.SQL.Add(':Param49,');
          qry1.SQL.Add(':Param50,');
          qry1.SQL.Add(':Param51,');
          qry1.SQL.Add(':Param52,');
          qry1.SQL.Add(':Param53,');
          qry1.SQL.Add(':Param54,');
          qry1.SQL.Add(':Param55,');
          qry1.SQL.Add(':Param56,');
          qry1.SQL.Add(':Param57,');
          qry1.SQL.Add(':Param58,');
          qry1.SQL.Add(':Param59,');
          qry1.SQL.Add(':Param60,');
          qry1.SQL.Add(':Param61,');
          qry1.SQL.Add(':Param62,');
          qry1.SQL.Add(':Param63,');
          qry1.SQL.Add(':Param64,');
          qry1.SQL.Add(':Param65,');
          qry1.SQL.Add(':Param66');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsString :=
            FieldByName('TxnID').AsString;
          qry1.Params.Items[2].AsInteger :=
            FieldByName('TxnNumber').AsInteger;
          qry1.Params.Items[3].AsString :=
            FieldByName('CustomerListId').AsString;
          qry1.Params.Items[4].AsString :=
            FieldByName('CustomerFullName').AsString;
          qry1.Params.Items[5].AsString :=
            FieldByName('ClassListId').AsString;
          qry1.Params.Items[6].AsString :=
            FieldByName('ClassFullName').AsString;
          qry1.Params.Items[7].AsString :=
            FieldByName('ARAccountListId').AsString;
          qry1.Params.Items[8].AsString :=
            FieldByName('ARAccountFullName').AsString;
          qry1.Params.Items[9].AsString :=
            FormatDateTime('yyyy-MM-dd',
            FieldByName('TxnDate').AsDateTime);
          qry1.Params.Items[10].AsString :=
            FieldByName('TxnTime').AsString;
          qry1.Params.Items[11].AsString :=
            FieldByName('RefNumber').AsString;
          qry1.Params.Items[12].AsFloat :=
            FieldByName('Subtotal').AsFloat;
          qry1.Params.Items[13].AsString :=
            FieldByName('CurrencyFullName').AsString;
          qry1.Params.Items[14].AsFloat :=
            FieldByName('ExchangeRate').AsFloat;
          qry1.Params.Items[15].AsString :=
            FieldByName('Memo').AsString;
          qry1.Params.Items[16].AsInteger :=
            FieldByName('CodigoEstado').AsInteger;
          qry1.Params.Items[17].AsInteger :=
            FieldByName('CodigoTipo').AsInteger;
          qry1.Params.Items[18].AsInteger := 1; //FieldByName('CodigoXMLTrans').AsInteger;
          qry1.Params.Items[19].AsString := '';
          if dsEmpresas.IsEmpty = False then
          begin
            qry1.Params.Items[20].AsString :=
              dsEmpresas.FieldByName('Cedula').AsString;
            qry1.Params.Items[21].AsString :=
              dsEmpresas.FieldByName('NombreComercial').AsString;
            qry1.Params.Items[22].AsString :=
              dsEmpresas.FieldByName('Direccion').AsString;
            qry1.Params.Items[23].AsString := '506';
            qry1.Params.Items[24].AsString :=
              dsEmpresas.FieldByName('Telefono').AsString;
            qry1.Params.Items[25].AsString := '506';
            qry1.Params.Items[26].AsString :=
              dsEmpresas.FieldByName('Fax').AsString;
            qry1.Params.Items[27].AsString :=
              dsEmpresas.FieldByName('Email').AsString;
            qry1.Params.Items[28].AsString :=
              dsEmpresas.FieldByName('Nombre').AsString;
          end
          else begin
            qry1.Params.Items[20].AsString := '';
            qry1.Params.Items[21].AsString := '';
            qry1.Params.Items[22].AsString := '';
            qry1.Params.Items[23].AsString := '';
            qry1.Params.Items[24].AsString := '';
            qry1.Params.Items[25].AsString := '';
            qry1.Params.Items[26].AsString := '';
            qry1.Params.Items[27].AsString := '';
            qry1.Params.Items[28].AsString := '';
          end;
          if mEncontrado2 = True then
          begin
            qry1.Params.Items[29].AsString :=
              dsClientes.FieldByName('Cedula').AsString;
            qry1.Params.Items[30].AsString :=
              dsClientes.FieldByName('Nombre').AsString;
            qry1.Params.Items[31].AsString :=
              dsClientes.FieldByName('Direccion').AsString;
            qry1.Params.Items[32].AsString :=
              dsClientes.FieldByName('Telefono').AsString;
          end
          else begin
            qry1.Params.Items[29].AsString := '';
            qry1.Params.Items[30].AsString := '';
            qry1.Params.Items[31].AsString := '';
            qry1.Params.Items[32].AsString := '';
          end;
          qry1.Params.Items[33].AsString :=
            FieldByName('Moneda').AsString;
          qry1.Params.Items[34].AsFloat :=
            FieldByName('TipoCambio').AsFloat;
          qry1.Params.Items[35].AsFloat :=
            FieldByName('TotalSerGravados').AsFloat;
          qry1.Params.Items[36].AsFloat :=
            FieldByName('TotalSerExentos').AsFloat;
          qry1.Params.Items[37].AsFloat :=
            FieldByName('TotalMerGravadas').AsFloat;
          qry1.Params.Items[38].AsFloat :=
            FieldByName('TotalMerExentas').AsFloat;
          qry1.Params.Items[39].AsFloat :=
            FieldByName('TotalGravado').AsFloat;
          qry1.Params.Items[40].AsFloat :=
            FieldByName('TotalExento').AsFloat;
          qry1.Params.Items[41].AsFloat :=
            FieldByName('TotalVenta').AsFloat;
          qry1.Params.Items[42].AsFloat :=
            FieldByName('Descuentos').AsFloat;
          qry1.Params.Items[43].AsFloat :=
            FieldByName('TotalVentaNeta').AsFloat;
          qry1.Params.Items[44].AsFloat :=
            FieldByName('MontoImpConsumo').AsFloat;
          qry1.Params.Items[45].AsFloat :=
            FieldByName('MontoOtrosImp').AsFloat;
          qry1.Params.Items[46].AsFloat :=
            FieldByName('TarifaImpuesto').AsFloat;
          qry1.Params.Items[47].AsFloat :=
            FieldByName('MontoImpVentas').AsFloat;
          qry1.Params.Items[48].AsFloat :=
            FieldByName('TotalFactura').AsFloat;
          qry1.Params.Items[49].AsString :=
            FieldByName('Otros').AsString;
          qry1.Params.Items[50].AsString :=
            FieldByName('firma').AsString;
          qry1.Params.Items[51].AsString :=
            FieldByName('x509Certificado').AsString;
          qry1.Params.Items[52].AsString :=
            FieldByName('NUMERO').AsString;
          qry1.Params.Items[53].AsString :=
            FieldByName('CLAVE').AsString;
          qry1.Params.Items[54].AsInteger :=
            FieldByName('CodigoMetodoPago').AsInteger;
          qry1.Params.Items[55].AsString :=
            FieldByName('TermsList').AsString;
          qry1.Params.Items[56].AsInteger :=
            FieldByName('CodigoCondicionesPago').AsInteger;
          qry1.Params.Items[57].AsString :=
            FieldByName('EmailReceptor').AsString;
          qry1.Params.Items[58].AsString :=
            FieldByName('ProvinciaEmisor').AsString;
          qry1.Params.Items[59].AsString :=
            FieldByName('CantonEmisor').AsString;
          qry1.Params.Items[60].AsString :=
            FieldByName('DistritoEmisor').AsString;
          qry1.Params.Items[61].AsString :=
            FieldByName('BarrioEmisor').AsString;
          qry1.Params.Items[62].AsString :=
            FieldByName('ProvinciaReceptor').AsString;
          qry1.Params.Items[63].AsString :=
            FieldByName('CantonReceptor').AsString;
          qry1.Params.Items[64].AsString :=
            FieldByName('DistritoReceptor').AsString;
          qry1.Params.Items[65].AsString :=
            FieldByName('BarrioReceptor').AsString;
          qry1.Params.Items[66].AsString :=
            FieldByName('NumeroFaxReceptor').AsString;
          qry1.ExecSQL;

          qry1.SQL.Clear;
          mId := DB_Obtener_Ultimo(qry1, 'tb_notascreditoencabezado', pResultado, pErrorM);
        end;
        // Modificar
        if mEncontrado = True then
        begin
        {  qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_facturasencabezado');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('TxnID =:Param0,');
          qry1.SQL.Add('TxnNumber =:Param1,');
          qry1.SQL.Add('CustomerListId =:Param2,');
          qry1.SQL.Add('CustomerFullName =:Param3,');
          qry1.SQL.Add('ClassListId =:Param4,');
          qry1.SQL.Add('ClassFullName =:Param5,');
          qry1.SQL.Add('ARAccountListId =:Param6,');
          qry1.SQL.Add('ARAccountFullName =:Param7,');
          qry1.SQL.Add('TxnDate =:Param8,');
          qry1.SQL.Add('TxnTime =:Param9,');
          qry1.SQL.Add('RefNumber =:Param10,');
          qry1.SQL.Add('Subtotal =:Param11,');
          qry1.SQL.Add('CurrencyFullName =:Param12,');
          qry1.SQL.Add('ExchangeRate =:Param13,');
          qry1.SQL.Add('Memo =:Param14');
          qry1.SQL.Add('Where TxnID =:Param15 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsString :=
            FieldByName('TxnID').AsString;
          qry1.Params.Items[1].AsInteger :=
            FieldByName('TxnNumber').AsInteger;
          qry1.Params.Items[2].AsString :=
            FieldByName('CustomerListId').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('CustomerFullName').AsString;
          qry1.Params.Items[4].AsString :=
            FieldByName('ClassListId').AsString;
          qry1.Params.Items[5].AsString :=
            FieldByName('ClassFullName').AsString;
          qry1.Params.Items[6].AsString :=
            FieldByName('ARAccountListId').AsString;
          qry1.Params.Items[7].AsString :=
            FieldByName('ARAccountFullName').AsString;
          qry1.Params.Items[8].AsString :=
            FormatDateTime('yyyy-MM-dd',
            FieldByName('TxnDate').AsDateTime);
          qry1.Params.Items[9].AsString :=
            FieldByName('TxnTime').AsString;
          qry1.Params.Items[10].AsString :=
            FieldByName('RefNumber').AsString;
          qry1.Params.Items[11].AsFloat :=
            FieldByName('Subtotal').AsFloat;
          qry1.Params.Items[12].AsString :=
            FieldByName('CurrencyFullName').AsString;
          qry1.Params.Items[13].AsFloat :=
            FieldByName('ExchangeRate').AsFloat;
          qry1.Params.Items[14].AsString :=
            FieldByName('Memo').AsString;
          qry1.Params.Items[15].AsString :=
            mTxnID;
          qry1.ExecSQL; }

          qry1.SQL.Clear;
          mId := DB_tb_NotasCreditoencabezado_Obtener_Id(qry1, 'Where TxnID=' + QuotedStr(mTxnID) + ' And IdEmpresa=' + IntToStr(pIdEmpresa), 'tb_notascreditoencabezado', '', pResultado, pErrorM);
        end;

        // Detalle
        dsDetalle.Filtered := False;
        dsDetalle.Filter := 'TxnIdEncabezado=' + QuotedStr(mTxnID);
        dsDetalle.Filtered := True;

        dsDetalle.First;
        while not dsDetalle.Eof do
        begin
          mEncontrado2 :=
            dsProductos.Locate('ListId', dsDetalle.FieldByName('ItemListId').AsString, []);

          mTxnIDDetalle := dsDetalle.FieldByName('TxnLineID').AsString;

          mWhere := TStringList.Create;
          mWhere.Add('Where TxnLineID=' + QuotedStr(mTxnIDDetalle));
          mWhere.Add(' And ');
          mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
          mEncontrado := DB_tb_NotasCreditoDetalle_Existe_Campo(qry1,
            mWhere.Text, 'tb_notascreditodetalle', 'TxnIdEncabezado',
            pClaseNombre, pResultado, pErrorM);
          mWhere.Free;

          // Insertar
          if mEncontrado = False then
          begin
            qry1.SQL.Clear;
            qry1.SQL.Add('Insert Into tb_notascreditodetalle');
            qry1.SQL.Add('(');
            qry1.SQL.Add('IdEncabezado,');
            qry1.SQL.Add('IdEmpresa,');
            qry1.SQL.Add('TxnIdEncabezado,');
            qry1.SQL.Add('TxnLineID,');
            qry1.SQL.Add('ItemListId,');
            qry1.SQL.Add('ItemFullName,');
            qry1.SQL.Add('ItemDesc,');
            qry1.SQL.Add('Quantity,');
            qry1.SQL.Add('UnitOfMeasure,');
            qry1.SQL.Add('ClassListId,');
            qry1.SQL.Add('ClassFullName,');
            qry1.SQL.Add('Amount,');
            qry1.SQL.Add('TaxAmount,');
            qry1.SQL.Add('CodigoEstado,');
            qry1.SQL.Add('NroLinDet,');
            qry1.SQL.Add('Codigo,');
            qry1.SQL.Add('TpoCodigo,');
            qry1.SQL.Add('MontoTotal,');
            qry1.SQL.Add('MontoDescuento,');
            qry1.SQL.Add('PrecioUnitario,');
            qry1.SQL.Add('MONTOTOTALLINEA,');
            qry1.SQL.Add('SUBTOTAL,');
            qry1.SQL.Add('TaxCode,');
            qry1.SQL.Add('TaxListId,');
            qry1.SQL.Add('TaxPorcentaje,');
            qry1.SQL.Add('DesuentoPorcentaje');
            qry1.SQL.Add(')');
            qry1.SQL.Add('Values(');
            qry1.SQL.Add(':Param0,');
            qry1.SQL.Add(':Param1,');
            qry1.SQL.Add(':Param2,');
            qry1.SQL.Add(':Param3,');
            qry1.SQL.Add(':Param4,');
            qry1.SQL.Add(':Param5,');
            qry1.SQL.Add(':Param6,');
            qry1.SQL.Add(':Param7,');
            qry1.SQL.Add(':Param8,');
            qry1.SQL.Add(':Param9,');
            qry1.SQL.Add(':Param10,');
            qry1.SQL.Add(':Param11,');
            qry1.SQL.Add(':Param12,');
            qry1.SQL.Add(':Param13,');
            qry1.SQL.Add(':Param14,');
            qry1.SQL.Add(':Param15,');
            qry1.SQL.Add(':Param16,');
            qry1.SQL.Add(':Param17,');
            qry1.SQL.Add(':Param18,');
            qry1.SQL.Add(':Param19,');
            qry1.SQL.Add(':Param20,');
            qry1.SQL.Add(':Param21,');
            qry1.SQL.Add(':Param22,');
            qry1.SQL.Add(':Param23,');
            qry1.SQL.Add(':Param24,');
            qry1.SQL.Add(':Param25');
            qry1.SQL.Add(')');
            qry1.Params.Items[0].AsInteger :=
              mId;
            qry1.Params.Items[1].AsInteger :=
              pIdEmpresa;
            qry1.Params.Items[2].AsString :=
              dsDetalle.FieldByName('TxnIdEncabezado').AsString;
            qry1.Params.Items[3].AsString :=
              dsDetalle.FieldByName('TxnLineID').AsString;
            qry1.Params.Items[4].AsString :=
              dsDetalle.FieldByName('ItemListId').AsString;
            qry1.Params.Items[5].AsString :=
              dsDetalle.FieldByName('ItemFullName').AsString;
            qry1.Params.Items[6].AsString :=
              dsDetalle.FieldByName('ItemDesc').AsString;
            qry1.Params.Items[7].AsFloat :=
              dsDetalle.FieldByName('Quantity').AsFloat;
            qry1.Params.Items[8].AsString :=
              dsDetalle.FieldByName('UnitOfMeasure').AsString;
            qry1.Params.Items[9].AsString :=
              dsDetalle.FieldByName('ClassListId').AsString;
            qry1.Params.Items[10].AsString :=
              dsDetalle.FieldByName('ClassFullName').AsString;
            qry1.Params.Items[11].AsFloat :=
              dsDetalle.FieldByName('Amount').AsFloat;
            qry1.Params.Items[12].AsFloat :=
              dsDetalle.FieldByName('TaxAmount').AsFloat;
            qry1.Params.Items[13].AsInteger :=
              dsDetalle.FieldByName('CodigoEstado').AsInteger;
            qry1.Params.Items[14].AsInteger := 1;
            if mEncontrado2 = True then
            begin
              qry1.Params.Items[15].AsString := ''; //Codigo
              qry1.Params.Items[16].AsInteger := 1; //TipoCodigo
              qry1.Params.Items[17].AsFloat := 0; // MontoToal
              qry1.Params.Items[18].AsFloat :=   //MontoDescuento
                dsDetalle.FieldByName('Amount').AsFloat;
              qry1.Params.Items[19].AsFloat :=
                dsProductos.FieldByName('Precio').AsFloat;
            end
            else begin
              qry1.Params.Items[15].AsString := '';
              qry1.Params.Items[16].AsInteger := 1;
              qry1.Params.Items[17].AsFloat := 0;
              qry1.Params.Items[18].AsFloat := 0;
              qry1.Params.Items[19].AsFloat := 0;
            end;
            qry1.Params.Items[20].AsFloat :=
              dsDetalle.FieldByName('MONTOTOTALLINEA').AsFloat;
            qry1.Params.Items[21].AsFloat :=
              dsDetalle.FieldByName('SUBTOTAL').AsFloat;
            qry1.Params.Items[22].AsString :=
              dsDetalle.FieldByName('TaxCode').AsString;
            qry1.Params.Items[23].AsString :=
              dsDetalle.FieldByName('TaxListId').AsString;
            qry1.Params.Items[24].AsFloat :=
              dsDetalle.FieldByName('TaxPorcentaje').AsFloat;
            qry1.Params.Items[25].AsFloat :=
              dsDetalle.FieldByName('DesuentoPorcentaje').AsFloat;
            qry1.ExecSQL;
          end;
          // Modificar
          if mEncontrado = True then
          begin
          {  qry1.SQL.Clear;
            qry1.SQL.Add('Update tb_facturasdetalle');
            qry1.SQL.Add('Set');
            qry1.SQL.Add('TxnIdEncabezado =:Param0,');
            qry1.SQL.Add('TxnLineID =:Param1,');
            qry1.SQL.Add('ItemListId =:Param2,');
            qry1.SQL.Add('ItemFullName =:Param3,');
            qry1.SQL.Add('ItemDesc =:Param4,');
            qry1.SQL.Add('Quantity =:Param5,');
            qry1.SQL.Add('UnitOfMeasure =:Param6,');
            qry1.SQL.Add('ClassListId =:Param7,');
            qry1.SQL.Add('ClassFullName =:Param8,');
            qry1.SQL.Add('Amount =:Param9,');
            qry1.SQL.Add('TaxAmount =:Param10');
            qry1.SQL.Add('Where TxnIdEncabezado =:Param11 And IdEmpresa=' + IntToStr(pIdEmpresa));
            qry1.Params.Items[0].AsString :=
              dsDetalle.FieldByName('TxnIdEncabezado').AsString;
            qry1.Params.Items[1].AsString :=
              dsDetalle.FieldByName('TxnLineID').AsString;
            qry1.Params.Items[2].AsString :=
              dsDetalle.FieldByName('ItemListId').AsString;
            qry1.Params.Items[3].AsString :=
              dsDetalle.FieldByName('ItemFullName').AsString;
            qry1.Params.Items[4].AsString :=
              dsDetalle.FieldByName('ItemDesc').AsString;
            qry1.Params.Items[5].AsFloat :=
              dsDetalle.FieldByName('Quantity').AsFloat;
            qry1.Params.Items[6].AsString :=
              dsDetalle.FieldByName('UnitOfMeasure').AsString;
            qry1.Params.Items[7].AsString :=
              dsDetalle.FieldByName('ClassListId').AsString;
            qry1.Params.Items[8].AsString :=
              dsDetalle.FieldByName('ClassFullName').AsString;
            qry1.Params.Items[9].AsFloat :=
              dsDetalle.FieldByName('Amount').AsFloat;
            qry1.Params.Items[10].AsFloat :=
              dsDetalle.FieldByName('TaxAmount').AsFloat;
            qry1.Params.Items[11].AsString :=
              mTxnID;
            qry1.ExecSQL;  }
          end;

          dsDetalle.Next;
        end;
        dsDetalle.Filtered := False;
        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
      mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
      mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_EstadosFacturas'}
procedure TdmObjects.DB_tb_EstadosFacturas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Nombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EstadosFacturas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EstadosFacturas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_EstadosFacturas_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_EstadosFacturas_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EstadosFacturas_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EstadosFacturas_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_EstadosFacturas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_EstadosFacturas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_Impuestos'}
procedure TdmObjects.DB_tb_Impuestos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.ListId,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.Activo,');
      SQL.Add('A.Codigo,');
      SQL.Add('A.IsTaxable');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Impuestos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Impuestos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Impuestos_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_Impuestos_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Impuestos_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Impuestos_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Impuestos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_Impuestos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Impuestos_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mListId: string;
  mEncontrado: Boolean;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        mListId := FieldByName('ListId').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where ListId=' + QuotedStr(mListId));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_Impuestos_Existe_Campo(qry1,
          mWhere.Text, 'tb_Impuestos', 'ListId',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_Impuestos');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('ListId,');
          qry1.SQL.Add('Nombre,');
          qry1.SQL.Add('Activo,');
          qry1.SQL.Add('Codigo,');
          qry1.SQL.Add('IsTaxable');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[3].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[4].AsString :=
            FieldByName('Codigo').AsString;
          qry1.Params.Items[5].AsInteger :=
            FieldByName('IsTaxable').AsInteger;
          qry1.ExecSQL;
        end;
        // Modificar
        if mEncontrado = True then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_Impuestos');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('ListId =:Param0,');
          qry1.SQL.Add('Nombre =:Param1,');
          qry1.SQL.Add('Activo =:Param2,');
          qry1.SQL.Add('Codigo =:Param3,');
          qry1.SQL.Add('IsTaxable =:Param4');
          qry1.SQL.Add('Where ListId =:Param5 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[1].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[2].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[3].AsString :=
            FieldByName('Codigo').AsString;
          qry1.Params.Items[4].AsInteger :=
            FieldByName('IsTaxable').AsInteger;
          qry1.Params.Items[5].AsString :=
            mListId;
          qry1.ExecSQL;
        end;

        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_Terminos'}
procedure TdmObjects.DB_tb_Terminos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.Tipo,');
      SQL.Add('A.ListId,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.Activo,');
      SQL.Add('A.StdDueDays,');
      SQL.Add('A.StdDiscountDays,');
      SQL.Add('A.DiscountPct');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Terminos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Terminos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Terminos_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_Terminos_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Terminos_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Terminos_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Terminos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_Terminos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Terminos_InsertarQB(qry1: TFDQuery; ds1: TFDMemTable;
  pIdEmpresa: Integer; pgb: TProgressBar;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mListId: string;
  mEncontrado: Boolean;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      if pgb <> nil then
        pgb.Max := RecordCount;

      First;
      while not Eof do
      begin
        mListId := FieldByName('ListId').AsString;
        mWhere := TStringList.Create;
        mWhere.Add('Where ListId=' + QuotedStr(mListId));
        mWhere.Add(' And ');
        mWhere.Add('IdEmpresa=' + IntToStr(pIdEmpresa));
        mEncontrado := DB_tb_Terminos_Existe_Campo(qry1,
          mWhere.Text, 'tb_Terminos', 'ListId',
          pClaseNombre, pResultado, pErrorM);
        mWhere.Free;

        // Insertar
        if mEncontrado = False then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Insert Into tb_Terminos');
          qry1.SQL.Add('(');
          qry1.SQL.Add('IdEmpresa,');
          qry1.SQL.Add('Tipo,');
          qry1.SQL.Add('ListId,');
          qry1.SQL.Add('Nombre,');
          qry1.SQL.Add('Activo,');
          qry1.SQL.Add('StdDueDays,');
          qry1.SQL.Add('StdDiscountDays,');
          qry1.SQL.Add('DiscountPct');
          qry1.SQL.Add(')');
          qry1.SQL.Add('Values(');
          qry1.SQL.Add(':Param0,');
          qry1.SQL.Add(':Param1,');
          qry1.SQL.Add(':Param2,');
          qry1.SQL.Add(':Param3,');
          qry1.SQL.Add(':Param4,');
          qry1.SQL.Add(':Param5,');
          qry1.SQL.Add(':Param6,');
          qry1.SQL.Add(':Param7');
          qry1.SQL.Add(')');
          qry1.Params.Items[0].AsInteger :=
            pIdEmpresa;
          qry1.Params.Items[1].AsInteger :=
            FieldByName('Tipo').AsInteger;
          qry1.Params.Items[2].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[3].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[4].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[5].AsInteger :=
            FieldByName('StdDueDays').AsInteger;
          qry1.Params.Items[6].AsInteger :=
            FieldByName('StdDiscountDays').AsInteger;
          qry1.Params.Items[7].AsFloat :=
            FieldByName('DiscountPct').AsFloat;
          qry1.ExecSQL;
        end;
        // Modificar
        if mEncontrado = True then
        begin
          qry1.SQL.Clear;
          qry1.SQL.Add('Update tb_Terminos');
          qry1.SQL.Add('Set');
          qry1.SQL.Add('Tipo =:Param0,');
          qry1.SQL.Add('ListId =:Param1,');
          qry1.SQL.Add('Nombre =:Param2,');
          qry1.SQL.Add('Activo =:Param3,');
          qry1.SQL.Add('StdDueDays =:Param4,');
          qry1.SQL.Add('StdDiscountDays =:Param5,');
          qry1.SQL.Add('DiscountPct =:Param6');
          qry1.SQL.Add('Where ListId =:Param7 And IdEmpresa=' + IntToStr(pIdEmpresa));
          qry1.Params.Items[0].AsInteger :=
            FieldByName('Tipo').AsInteger;
          qry1.Params.Items[1].AsString :=
            FieldByName('ListId').AsString;
          qry1.Params.Items[2].AsString :=
            FieldByName('Nombre').AsString;
          qry1.Params.Items[3].AsInteger :=
            FieldByName('Activo').AsInteger;
          qry1.Params.Items[4].AsInteger :=
            FieldByName('StdDueDays').AsInteger;
          qry1.Params.Items[5].AsInteger :=
            FieldByName('StdDiscountDays').AsInteger;
          qry1.Params.Items[6].AsFloat :=
            FieldByName('DiscountPct').AsFloat;
          qry1.Params.Items[7].AsString :=
            mListId;
          qry1.ExecSQL;
        end;

        Next;

        if pgb <> nil then
        begin
          Sleep(1);
          pgb.StepIt;
          pgb.Repaint;
        end;
      end;
    end;

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_Provincias'}
procedure TdmObjects.DB_tb_Provincias_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Codigo,');
      SQL.Add('A.Nombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Provincias_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Provincias_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Provincias_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_Provincias_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Provincias_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Provincias_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Provincias_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_Provincias_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_Cantones'}
procedure TdmObjects.DB_tb_Cantones_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Codigo,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.CodigoProvincia');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Cantones_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Cantones_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Cantones_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_Cantones_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Cantones_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Cantones_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Cantones_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_Cantones_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_Distritos'}
procedure TdmObjects.DB_tb_Distritos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Codigo,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.CodigoProvincia,');
      SQL.Add('A.CodigoCanton');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Distritos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Distritos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Distritos_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_Distritos_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Distritos_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Distritos_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Distritos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_Distritos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_Barrios'}
procedure TdmObjects.DB_tb_Barrios_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Codigo,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.CodigoProvincia,');
      SQL.Add('A.CodigoCanton,');
      SQL.Add('A.CodigoDistrito');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Barrios_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Barrios_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_Barrios_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_Barrios_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Barrios_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Barrios_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_Barrios_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_Barrios_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_consecutivos'}
procedure TdmObjects.DB_tb_consecutivos_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.IdEmpresa,');
      SQL.Add('A.Factura,');
      SQL.Add('A.NotaCredito');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_tb_consecutivos_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_consecutivos_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_tb_consecutivos_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_tb_consecutivos_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_consecutivos_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_consecutivos_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_tb_consecutivos_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_tb_consecutivos_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

end.
