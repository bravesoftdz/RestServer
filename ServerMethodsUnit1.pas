unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  Data.DB, FireDAC.Comp.DataSet, Data.FireDACJSONReflect,
  FireDAC.Stan.StorageBin;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDMemTable1: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Soma(a,b:integer):string;
    function ListarClientes(CodigoCliente:string = ''):TFDJSONDataSets;

  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ListarClientes(CodigoCliente: string): TFDJSONDataSets;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  if CodigoCliente = '' then
   FDQuery1.SQL.Add('select * from clientes')
  else
  FDQuery1.SQL.Add('select * from clientes where Código = '+CodigoCliente);

  FDQuery1.Open();
  Result:= TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, FDQuery1);

end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.Soma(a, b: integer): string;
begin
  Result:= inttostr(a+b);
end;

end.

