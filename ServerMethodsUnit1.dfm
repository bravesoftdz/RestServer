object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 235
  Width = 465
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Gabriel\Desktop\BancoDeDados.accdb'
      'ConnectionDef=Access_Demo')
    LoginPrompt = False
    Left = 120
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from clientes')
    Left = 40
    Top = 24
  end
  object FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink
    ODBCDriver = 'Microsoft Access Driver (*.mdb, *.accdb)'
    Left = 288
    Top = 24
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 168
    Top = 128
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 360
    Top = 120
  end
end
