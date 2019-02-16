unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
  DataSnap.DSProviderDataModuleAdapter,
  DataSnap.DSServer, DataSnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB, Data.FireDACJSONReflect,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.ConsoleUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TMetodos = class(TDSServerModule)
    FDConnection1: TFDConnection;
    q: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qLogin: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    Function ListarClientes: TFDJSONDataSets;
    function ValidaLogin(Email, Senha:string):Boolean;
  end;

implementation

{$R *.dfm}

uses System.StrUtils, Data.dbxplatform;

function TMetodos.EchoString(Value: string): string;
begin
  Result := Value;
end;

Function TMetodos.ListarClientes: TFDJSONDataSets;
begin
  q.Active := False;

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, q);

end;

function TMetodos.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TMetodos.ValidaLogin(Email, Senha: string): Boolean;
begin
 qLogin.Close;
 qLogin.SQL.Clear;
 qLogin.SQL.Add('select * from login where email=:email and senha=:senha');
 qLogin.Params.ParamByName('email').Value:= Email;
 qLogin.Params.ParamByName('senha').Value:= Senha;
 qLogin.Prepare;
 qLogin.Open();

 if not qLogin.IsEmpty then
  Result:= true
 else
 Result:= false;
end;

end.
