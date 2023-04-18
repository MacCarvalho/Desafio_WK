object dmConexao: TdmConexao
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=wk'
      'User_Name=root'
      'Password=Kdz102030'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 168
    Top = 136
  end
  object MySQLDLL: TFDPhysMySQLDriverLink
    Left = 408
    Top = 152
  end
end
