object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 235
  Width = 465
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Gabriel\Desktop\BancoDeDados1.accdb'
      'ConnectionDef=Access_Demo')
    Connected = True
    LoginPrompt = False
    Left = 120
    Top = 24
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from clientes')
    Left = 40
    Top = 24
  end
  object FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink
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
