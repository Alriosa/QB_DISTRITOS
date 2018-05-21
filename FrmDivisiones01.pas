unit FrmDivisiones01;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFormDivisiones01 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbProvincia: TComboBoxEx;
    cbCanton: TComboBoxEx;
    cbDistrito: TComboBoxEx;
    cbBarrio: TComboBoxEx;
    btnCerrar: TBitBtn;
    edtResultado: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCerrarClick(Sender: TObject);
    procedure cbProvinciaChange(Sender: TObject);
    procedure cbCantonChange(Sender: TObject);
    procedure cbDistritoChange(Sender: TObject);
    procedure cbBarrioChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDivisiones01: TFormDivisiones01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Cerrar;
  procedure LlenarProvincia(cb: TComboBoxEx);
  procedure LlenarCanton(cb: TComboBoxEx; mIdProvincia: Integer);
  procedure LlenarDistrito(cb: TComboBoxEx; mIdProvincia: Integer; mIdCanton: Integer);
  procedure LlenarBarrio(cb: TComboBoxEx; mIdProvincia: Integer; mIdCanton: Integer; mIdDistrito: Integer);
  function Obtener_Resultado: string;

implementation
uses
  uDL_tb_Provincias, uDL_tb_Cantones, uDL_tb_Distritos, uDL_tb_Barrios,
  uSistema, ufunciones;

{$R *.dfm}

var
  Forma01: TFormDivisiones01;
  mPasaForma: Boolean;

{$REGION 'Funciones Forma'}
procedure TFormDivisiones01.FormShow(Sender: TObject);
begin
  mPasaForma := False;

  Forma01 := FormDivisiones01;

  InicializarForma;
end;

procedure TFormDivisiones01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormDivisiones01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormDivisiones01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormDivisiones01.cbProvinciaChange(Sender: TObject);
begin
  if mPasaForma = True then
  begin
    mPasaForma := False;
    LlenarCanton(cbCanton, GetCombo(cbProvincia));
    LlenarDistrito(cbDistrito, GetCombo(cbProvincia), GetCombo(cbCanton));
    LlenarBarrio(cbBarrio, GetCombo(cbProvincia), GetCombo(cbCanton), GetCombo(cbDistrito));
    cbCanton.ItemIndex := 0;
    cbDistrito.ItemIndex := 0;
    cbBarrio.ItemIndex := 0;
    edtResultado.Text := Obtener_Resultado;
    mPasaForma := True;
  end;
end;

procedure TFormDivisiones01.cbCantonChange(Sender: TObject);
begin
  if mPasaForma = True then
  begin
    mPasaForma := False;
    LlenarDistrito(cbDistrito, GetCombo(cbProvincia), GetCombo(cbCanton));
    LlenarBarrio(cbBarrio, GetCombo(cbProvincia), GetCombo(cbCanton), GetCombo(cbDistrito));
    cbDistrito.ItemIndex := 0;
    cbBarrio.ItemIndex := 0;
    edtResultado.Text := Obtener_Resultado;
    mPasaForma := True;
  end;
end;

procedure TFormDivisiones01.cbDistritoChange(Sender: TObject);
begin
  if mPasaForma = True then
  begin
    mPasaForma := False;
    LlenarBarrio(cbBarrio, GetCombo(cbProvincia), GetCombo(cbCanton), GetCombo(cbDistrito));
    cbBarrio.ItemIndex := 0;
    edtResultado.Text := Obtener_Resultado;
    mPasaForma := True;
  end;
end;

procedure TFormDivisiones01.cbBarrioChange(Sender: TObject);
begin
  if mPasaForma = True then
  begin
    mPasaForma := False;
    edtResultado.Text := Obtener_Resultado;
    mPasaForma := True;
  end;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      LlenarProvincia(cbProvincia);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarCanton(cbCanton, 0);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarDistrito(cbDistrito, 0, 0);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarBarrio(cbBarrio, 0, 0, 0);
      if _Resultado = -1 then
        raise Exception.Create('');

      LimpiarCampos;

      mPasaForma := True;
    except
    end;

  end;
end;

procedure FinalizarForma;
begin
  with Forma01 do
  begin

    try

    except
    end;

  end;
end;

procedure KeyDownForma(var Key: Word; Shift: TShiftState);
begin
  with Forma01 do
  begin

    if Key = VK_ESCAPE then
    begin
      Key := 0;
      Close;
    end;

  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    cbProvincia.ItemIndex := 0;
    cbCanton.ItemIndex := 0;
    cbDistrito.ItemIndex := 0;
    cbBarrio.ItemIndex := 0;
    edtResultado.Clear;

  end;
end;

procedure Cerrar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure LlenarProvincia(cb: TComboBoxEx);
var
  mtb_Provincias: TDL_tb_Provincias;
  mWhere: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mtb_Provincias := TDL_tb_Provincias.Create;
      mtb_Provincias.Consultar(_Resultado, _ErrorM, mWhere.Text);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mtb_Provincias.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(FieldByName('Codigo').AsString + ' ' +
            FieldByName('Nombre').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      mtb_Provincias.Destroy;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarCanton(cb: TComboBoxEx; mIdProvincia: Integer);
var
  mtb_Cantones: TDL_tb_Cantones;
  mWhere: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mWhere.Add('CodigoProvincia = ' + IntToStr(mIdProvincia));
      mtb_Cantones := TDL_tb_Cantones.Create;
      mtb_Cantones.Consultar(_Resultado, _ErrorM, mWhere.Text);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mtb_Cantones.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(FieldByName('Codigo').AsString + ' ' +
            FieldByName('Nombre').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      mtb_Cantones.Destroy;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarDistrito(cb: TComboBoxEx; mIdProvincia: Integer; mIdCanton: Integer);
var
  mtb_Distritos: TDL_tb_Distritos;
  mWhere: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mWhere.Add('CodigoProvincia = ' + IntToStr(mIdProvincia));
      mWhere.Add(' And ');
      mWhere.Add('CodigoCanton = ' + IntToStr(mIdCanton));
      mtb_Distritos := TDL_tb_Distritos.Create;
      mtb_Distritos.Consultar(_Resultado, _ErrorM, mWhere.Text);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mtb_Distritos.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(FieldByName('Codigo').AsString + ' ' +
            FieldByName('Nombre').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      mtb_Distritos.Destroy;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarBarrio(cb: TComboBoxEx; mIdProvincia: Integer; mIdCanton: Integer; mIdDistrito: Integer);
var
  mtb_Barrios: TDL_tb_Barrios;
  mWhere: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mWhere.Add('CodigoProvincia = ' + IntToStr(mIdProvincia));
      mWhere.Add(' And ');
      mWhere.Add('CodigoCanton = ' + IntToStr(mIdCanton));
      mWhere.Add(' And ');
      mWhere.Add('CodigoDistrito = ' + IntToStr(mIdDistrito));
      mtb_Barrios := TDL_tb_Barrios.Create;
      mtb_Barrios.Consultar(_Resultado, _ErrorM, mWhere.Text);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mtb_Barrios.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(FieldByName('Codigo').AsString + ' ' +
            FieldByName('Nombre').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      mtb_Barrios.Destroy;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

function Obtener_Resultado: string;
var
  mWhere: TStringList;
  mIdProvincia, mIdCanton, mIdDistrito, mIdBarrio: Integer;
  mtb_Provincias: TDL_tb_Provincias;
  mtb_Cantones: TDL_tb_Cantones;
  mtb_Distritos: TDL_tb_Distritos;
  mtb_Barrios: TDL_tb_Barrios;
  mCodigoProvincia, mCodigoCanton, mCodigoDistrito, mCodigoBarrio: string;
  mResultado: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mResultado := '';
      mIdProvincia := GetCombo(cbProvincia);
      mIdCanton := GetCombo(cbCanton);
      mIdDistrito := GetCombo(cbDistrito);
      mIdBarrio := GetCombo(cbBarrio);

      mtb_Provincias :=  TDL_tb_Provincias.Create;
      mCodigoProvincia :=
        mtb_Provincias.Obtener_Valor('Id=' + IntToStr(mIdProvincia), 'Codigo',
          _Resultado, _ErrorM);
      mtb_Provincias.Destroy;

      mtb_Cantones := TDL_tb_Cantones.Create;
      mCodigoCanton :=
        mtb_Cantones.Obtener_Valor('Id=' + IntToStr(mIdCanton), 'Codigo',
          _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mtb_Cantones.Destroy;

      mtb_Distritos := TDL_tb_Distritos.Create;
      mCodigoDistrito :=
        mtb_Distritos.Obtener_Valor('Id=' + IntToStr(mIdDistrito), 'Codigo',
          _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mtb_Distritos.Destroy;

      mtb_Barrios := TDL_tb_Barrios.Create;
      mCodigoBarrio :=
        mtb_Barrios.Obtener_Valor('Id=' + IntToStr(mIdBarrio), 'Codigo',
          _Resultado, _ErrorM);
      mtb_Barrios.Destroy;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

    mResultado := mCodigoProvincia + ';' + mCodigoCanton + ';' + mCodigoDistrito + ';' + mCodigoBarrio;
    Result := mResultado;

  end;
end;
{$ENDREGION}

end.
