program QB_DISTRITO;

uses
  Vcl.Forms,
  qbdistritos in 'qbdistritos.pas' {Form1},
  FrmDivisiones01 in 'FrmDivisiones01.pas' {FormDivisiones01},
  uDL_DBConexion in 'Data_Layer\uDL_DBConexion.pas',
  uDL_tb_Barrios in 'Data_Layer\uDL_tb_Barrios.pas',
  uDL_tb_Cantones in 'Data_Layer\uDL_tb_Cantones.pas',
  uDL_tb_Distritos in 'Data_Layer\uDL_tb_Distritos.pas',
  uDL_tb_Provincias in 'Data_Layer\uDL_tb_Provincias.pas',
  BS_DBConexion in 'Business_Layer\BS_DBConexion.pas',
  ufunciones in 'Functions\ufunciones.pas',
  uSistema in 'Functions\uSistema.pas',
  udmConnection in 'Modules\udmConnection.pas' {dmConnection: TDataModule},
  udmObjects in 'Modules\udmObjects.pas' {dmObjects: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormDivisiones01, FormDivisiones01);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TdmObjects, dmObjects);
  Application.Run;
end.
