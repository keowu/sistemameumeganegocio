object dm: Tdm
  OldCreateOrder = False
  Height = 791
  Width = 1893
  object meumeganegocio: TFDConnection
    Params.Strings = (
      'Database=meumeganegocio'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    Left = 56
    Top = 24
  end
  object qlogin: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from empresario')
    Left = 32
    Top = 104
    object qloginempcod: TFDAutoIncField
      FieldName = 'empcod'
      Origin = 'empcod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qloginempnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'empnome'
      Origin = 'empnome'
      Size = 100
    end
    object qloginempsenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'empsenha'
      Origin = 'empsenha'
      Size = 100
    end
    object qloginempfuncionario: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'empfuncionario'
      Origin = 'empfuncionario'
    end
  end
  object dslogin: TDataSource
    DataSet = qlogin
    Left = 40
    Top = 320
  end
  object inserecliente: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into clientes(clinome, clifone, cliendereco, clicpf) valu' +
        'es (:clinome, :clifone, :cliendereco, :clicpf)')
    Left = 112
    Top = 104
    ParamData = <
      item
        Name = 'CLINOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CLIFONE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CLIENDERECO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CLICPF'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultacliente: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from clientes')
    Left = 112
    Top = 216
    object consultaclienteclicod: TFDAutoIncField
      FieldName = 'clicod'
      Origin = 'clicod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultaclienteclinome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'clinome'
      Origin = 'clinome'
      Size = 100
    end
    object consultaclienteclifone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'clifone'
      Origin = 'clifone'
    end
    object consultaclientecliendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliendereco'
      Origin = 'cliendereco'
      Size = 100
    end
    object consultaclienteclicpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'clicpf'
      Origin = 'clicpf'
      Size = 50
    end
    object consultaclientecliativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cliativo'
      Origin = 'cliativo'
    end
  end
  object dsconsultacli: TDataSource
    DataSet = consultacliente
    Left = 112
    Top = 272
  end
  object alteracliente: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update clientes set clinome = :clinome, clifone = :clifone, clie' +
        'ndereco = :cliendereco, clicpf = :clicpf where clicod = :clicod')
    Left = 112
    Top = 160
    ParamData = <
      item
        Name = 'CLINOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CLIFONE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CLIENDERECO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CLICPF'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CLICOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object inserecategoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into categorias(catenome, catedescricao) values (:catenom' +
        'e, :catedescricao)')
    Left = 200
    Top = 104
    ParamData = <
      item
        Name = 'CATENOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CATEDESCRICAO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object alteracategoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update categorias set catenome = :catenome, catedescricao = :cat' +
        'edescricao where catecod = :catecod')
    Left = 200
    Top = 160
    ParamData = <
      item
        Name = 'CATENOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CATEDESCRICAO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CATECOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultacategoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from categorias')
    Left = 200
    Top = 216
    object consultacategoriacatecod: TFDAutoIncField
      FieldName = 'catecod'
      Origin = 'catecod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultacategoriacatenome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'catenome'
      Origin = 'catenome'
      Size = 100
    end
    object consultacategoriacatedescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'catedescricao'
      Origin = 'catedescricao'
      Size = 200
    end
    object consultacategoriacateativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cateativo'
      Origin = 'cateativo'
    end
  end
  object dscategoria: TDataSource
    DataSet = consultacategoria
    Left = 200
    Top = 272
  end
  object inseresubcategoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into subcategoria(subcatnome, subcatdescricao, catid) val' +
        'ues (:subcatnome, :subcatdescricao, :catid)')
    Left = 296
    Top = 104
    ParamData = <
      item
        Name = 'SUBCATNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'SUBCATDESCRICAO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CATID'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object alterasubcategoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update subcategoria set subcatnome = :subcatnome, subcatdescrica' +
        'o = :subcatdescricao, catid = :catid where subcatcod = :subcatco' +
        'd')
    Left = 296
    Top = 160
    ParamData = <
      item
        Name = 'SUBCATNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'SUBCATDESCRICAO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CATID'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'SUBCATCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultasubcategoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from subcategoria')
    Left = 296
    Top = 216
    object consultasubcategoriasubcatcod: TFDAutoIncField
      FieldName = 'subcatcod'
      Origin = 'subcatcod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultasubcategoriasubcatnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'subcatnome'
      Origin = 'subcatnome'
      Size = 100
    end
    object consultasubcategoriasubcatdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'subcatdescricao'
      Origin = 'subcatdescricao'
      Size = 200
    end
    object consultasubcategoriacatid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'catid'
      Origin = 'catid'
    end
    object consultasubcategoriasubcatativa: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'subcatativa'
      Origin = 'subcatativa'
    end
  end
  object dssubcategoria: TDataSource
    DataSet = consultasubcategoria
    Left = 296
    Top = 272
  end
  object inserevenda: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into vendas(ventotal, vendesconto, venclicod, vencaicod, ' +
        'venempcod) values (:ventotal, :vendesconto, :venclicod, :vencaic' +
        'od, :venempcod)')
    Left = 384
    Top = 104
    ParamData = <
      item
        Name = 'VENTOTAL'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'VENDESCONTO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'VENCLICOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'VENCAICOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'VENEMPCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object alteravenda: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update vendas set ventotal = :ventotal, vendesconto = :vendescon' +
        'to where vencod = :vencod')
    Left = 384
    Top = 160
    ParamData = <
      item
        Name = 'VENTOTAL'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'VENDESCONTO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'VENCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultavenda: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from vendas')
    Left = 384
    Top = 272
    object consultavendavencod: TFDAutoIncField
      FieldName = 'vencod'
      Origin = 'vencod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultavendavendataven: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'vendataven'
      Origin = 'vendataven'
    end
    object consultavendaventotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ventotal'
      Origin = 'ventotal'
    end
    object consultavendavendesconto: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vendesconto'
      Origin = 'vendesconto'
    end
    object consultavendavenclicod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'venclicod'
      Origin = 'venclicod'
    end
    object consultavendavencaicod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vencaicod'
      Origin = 'vencaicod'
    end
    object consultavendavenempcod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'venempcod'
      Origin = 'venempcod'
    end
  end
  object dsvenda: TDataSource
    DataSet = consultavenda
    Left = 384
    Top = 376
  end
  object insereproduto: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into produtos(prodnome, prodvalor, prodquantidade, prodlu' +
        'cro, prodsubcategoria) values (:prodnome, :prodvalor, :prodquant' +
        'idade, :prodlucro, :prodsubcategoria)')
    Left = 472
    Top = 104
    ParamData = <
      item
        Name = 'PRODNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODVALOR'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODQUANTIDADE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODLUCRO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODSUBCATEGORIA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object alteraproduto: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update produtos set prodnome = :prodnome, prodvalor = :prodvalor' +
        ', prodquantidade = :prodquantidade, prodlucro = :prodlucro, prod' +
        'ativo = :prodativo, prodsubcategoria = :prodsubcategoria where p' +
        'rodcod = :prodcod ')
    Left = 472
    Top = 160
    ParamData = <
      item
        Name = 'PRODNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODVALOR'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODQUANTIDADE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODLUCRO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODATIVO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODSUBCATEGORIA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultaproduto: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from produtos')
    Left = 472
    Top = 216
    object consultaprodutoprodcod: TFDAutoIncField
      FieldName = 'prodcod'
      Origin = 'prodcod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultaprodutoprodnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prodnome'
      Origin = 'prodnome'
      Size = 100
    end
    object consultaprodutoprodvalor: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'prodvalor'
      Origin = 'prodvalor'
    end
    object consultaprodutoprodquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'prodquantidade'
      Origin = 'prodquantidade'
    end
    object consultaprodutoproimagurloudir: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'proimagurloudir'
      Origin = 'proimagurloudir'
      Size = 200
    end
    object consultaprodutoprodlucro: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'prodlucro'
      Origin = 'prodlucro'
    end
    object consultaprodutoprodativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'prodativo'
      Origin = 'prodativo'
    end
    object consultaprodutoprodsubcategoria: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'prodsubcategoria'
      Origin = 'prodsubcategoria'
    end
  end
  object dsproduto: TDataSource
    DataSet = consultaproduto
    Left = 472
    Top = 272
  end
  object abrecaixa: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into caixas(caiemp, caifech, caivlrabert) values (:caiemp' +
        ', :caifech, :caivlrabert)')
    Left = 536
    Top = 104
    ParamData = <
      item
        Name = 'CAIEMP'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CAIFECH'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CAIVLRABERT'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object fechacaixa: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update caixas set caiemp = :caiemp, caifech = :caifech, caivlrfe' +
        'ch = :caivlrfech where caicod = :caicod')
    Left = 536
    Top = 160
    ParamData = <
      item
        Name = 'CAIEMP'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CAIFECH'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CAIVLRFECH'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CAICOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultacaixa: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from caixas')
    Left = 536
    Top = 312
    object consultacaixacaicod: TFDAutoIncField
      FieldName = 'caicod'
      Origin = 'caicod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultacaixacaiemp: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'caiemp'
      Origin = 'caiemp'
    end
    object consultacaixacaivlrabert: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'caivlrabert'
      Origin = 'caivlrabert'
    end
    object consultacaixacaivlrfech: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'caivlrfech'
      Origin = 'caivlrfech'
    end
    object consultacaixacaiaberto: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'caiaberto'
      Origin = 'caiaberto'
    end
    object consultacaixacaifech: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'caifech'
      Origin = 'caifech'
      Size = 100
    end
  end
  object dscaixa: TDataSource
    DataSet = consultacaixa
    Left = 536
    Top = 368
  end
  object insereitensvenda: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into itensdevenda(itecodprod, itevalunit, itequant, iteva' +
        'lortotal, itenvenda) values (:itecodprod, :itevalunit, :itequant' +
        ', :itevalortotal, :itenvenda)')
    Left = 624
    Top = 104
    ParamData = <
      item
        Name = 'ITECODPROD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ITEVALUNIT'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ITEQUANT'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ITEVALORTOTAL'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'ITENVENDA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object alteraitensvenda: TFDQuery
    Connection = meumeganegocio
    Left = 624
    Top = 160
  end
  object consultaitensvenda: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'select prodnome, itequant, itevalunit, itevalortotal, itenvenda ' +
        'from itensdevenda, produtos WHERE itecodprod = prodcod')
    Left = 624
    Top = 272
    object consultaitensvendaprodnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prodnome'
      Origin = 'prodnome'
      Size = 100
    end
    object consultaitensvendaitequant: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'itequant'
      Origin = 'itequant'
    end
    object consultaitensvendaitevalunit: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'itevalunit'
      Origin = 'itevalunit'
    end
    object consultaitensvendaitevalortotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'itevalortotal'
      Origin = 'itevalortotal'
    end
    object consultaitensvendaitenvenda: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'itenvenda'
      Origin = 'itenvenda'
    end
  end
  object dsitensvenda: TDataSource
    DataSet = consultaitensvenda
    Left = 624
    Top = 336
  end
  object inseremetodopag: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'insert into tiposdepagamentos(tiponome) values (:tiponome)')
    Left = 720
    Top = 104
    ParamData = <
      item
        Name = 'TIPONOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object alterametodopag: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update tiposdepagamentos set tiponome = :tiponome where tipoid =' +
        ' :tipoid')
    Left = 720
    Top = 160
    ParamData = <
      item
        Name = 'TIPONOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'TIPOID'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultametodopag: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from tiposdepagamentos')
    Left = 720
    Top = 216
    object consultametodopagtipoid: TFDAutoIncField
      FieldName = 'tipoid'
      Origin = 'tipoid'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultametodopagtiponome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tiponome'
      Origin = 'tiponome'
      Size = 100
    end
  end
  object dspagamento: TDataSource
    DataSet = consultametodopag
    Left = 720
    Top = 272
  end
  object excluiitensvenda: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'DELETE FROM itensdevenda WHERE itenvenda = :itenvenda')
    Left = 624
    Top = 216
    ParamData = <
      item
        Name = 'ITENVENDA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object excluivenda: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'DELETE FROM vendas WHERE vencod = :vencod')
    Left = 384
    Top = 216
    ParamData = <
      item
        Name = 'VENCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object viewexibedetalhesvendas: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from exibedetalhesvendas where ventotal > 0')
    Left = 384
    Top = 328
    object viewexibedetalhesvendasvencod: TFDAutoIncField
      FieldName = 'vencod'
      Origin = 'vencod'
      ReadOnly = True
    end
    object viewexibedetalhesvendasvenclicod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'venclicod'
      Origin = 'venclicod'
    end
    object viewexibedetalhesvendasvenempcod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'venempcod'
      Origin = 'venempcod'
    end
    object viewexibedetalhesvendasvencaicod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vencaicod'
      Origin = 'vencaicod'
    end
    object viewexibedetalhesvendasvendataven: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'vendataven'
      Origin = 'vendataven'
    end
    object viewexibedetalhesvendasventotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ventotal'
      Origin = 'ventotal'
    end
    object viewexibedetalhesvendasvendesconto: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vendesconto'
      Origin = 'vendesconto'
    end
    object viewexibedetalhesvendasclinome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'clinome'
      Origin = 'clinome'
      Size = 100
    end
    object viewexibedetalhesvendasempnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'empnome'
      Origin = 'empnome'
      Size = 100
    end
  end
  object consultaempresario: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'SELECT empnome, empsenha, CASE empfuncionario WHEN 1 THEN '#39'Funci' +
        'on'#225'rio'#39' ELSE '#39'Gerente'#39' END AS '#39'empcargo'#39' FROM empresario where e' +
        'mpativo = 1')
    Left = 32
    Top = 272
    object consultaempresarioempnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'empnome'
      Origin = 'empnome'
      Size = 100
    end
    object consultaempresarioempsenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'empsenha'
      Origin = 'empsenha'
      Size = 100
    end
    object consultaempresarioempcargo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'empcargo'
      Origin = 'empcargo'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
  end
  object alteraempresario: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update empresario set empnome = :empnome, empsenha = md5(:empsen' +
        'ha), empfuncionario = :empfuncionario where empcod = :empcod')
    Left = 32
    Top = 216
    ParamData = <
      item
        Name = 'EMPNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'EMPSENHA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'EMPFUNCIONARIO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'EMPCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object insereempresario: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into empresario(empnome, empsenha, empfuncionario) values' +
        ' (:empnome, md5(:empsenha), :empfuncionario)')
    Left = 32
    Top = 160
    ParamData = <
      item
        Name = 'EMPNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'EMPSENHA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'EMPFUNCIONARIO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultaparaanalytics: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from vendas')
    Left = 824
    Top = 216
  end
  object dsanalytics: TDataSource
    DataSet = consultaparaanalytics
    Left = 824
    Top = 272
  end
  object inserepagamentos: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into pagamentos(pagcodven, pagvlr, tipopag) values (:pagc' +
        'odven, :pagvlr, :tipopag)')
    Left = 928
    Top = 104
    ParamData = <
      item
        Name = 'PAGCODVEN'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PAGVLR'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'TIPOPAG'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object alterapagamentos: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update pagamentos set pagcodven = :pagcodven, pagvlr = :pagvlr, ' +
        'tipopag = :tipopag where pagid = :pagid')
    Left = 928
    Top = 168
    ParamData = <
      item
        Name = 'PAGCODVEN'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PAGVLR'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'TIPOPAG'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PAGID'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultapagamentos: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'select pagid, pagcodven, pagvlr, tiponome as '#39'nomepagamento'#39' fro' +
        'm pagamentos inner join tiposdepagamentos on tipopag = tipoid')
    Left = 928
    Top = 280
    object consultapagamentospagid: TFDAutoIncField
      FieldName = 'pagid'
      Origin = 'pagid'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultapagamentospagcodven: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pagcodven'
      Origin = 'pagcodven'
    end
    object consultapagamentospagvlr: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'pagvlr'
      Origin = 'pagvlr'
    end
    object consultapagamentosnomepagamento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomepagamento'
      Origin = 'tiponome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dspagamentos: TDataSource
    DataSet = consultapagamentos
    Left = 928
    Top = 336
  end
  object excluirpagamentos: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'delete from pagamentos where pagid = :pagid')
    Left = 928
    Top = 224
    ParamData = <
      item
        Name = 'PAGID'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object convenfechvenda: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select sum(ventotal) as '#39'total'#39' from vendas')
    Left = 544
    Top = 216
    object convenfechvendatotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsconsvenfechcai: TDataSource
    DataSet = convenfechvenda
    Left = 544
    Top = 272
  end
  object inserefornecedor: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into fornecedores(fornome, forendereco, fortelefone, forc' +
        'elular, forcomentarios) values (:fornome, :forendereco, :fortele' +
        'fone, :forcelular, :forcomentarios)')
    Left = 1032
    Top = 104
    ParamData = <
      item
        Name = 'FORNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORENDERECO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORTELEFONE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORCELULAR'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORCOMENTARIOS'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object alterafornecedor: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update fornecedores set fornome = :fornome, forendereco = :foren' +
        'dereco, fortelefone = :fortelefone, forcelular = :forcelular, fo' +
        'rcomentarios =:forcomentarios where forcod = :forcod')
    Left = 1032
    Top = 168
    ParamData = <
      item
        Name = 'FORNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORENDERECO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORTELEFONE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORCELULAR'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORCOMENTARIOS'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'FORCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultafornecedor: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from fornecedores')
    Left = 1032
    Top = 232
    object consultafornecedorforcod: TFDAutoIncField
      FieldName = 'forcod'
      Origin = 'forcod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultafornecedorfornome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fornome'
      Origin = 'fornome'
      Size = 100
    end
    object consultafornecedorforendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'forendereco'
      Origin = 'forendereco'
      Size = 200
    end
    object consultafornecedorfortelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fortelefone'
      Origin = 'fortelefone'
      Size = 50
    end
    object consultafornecedorforcelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'forcelular'
      Origin = 'forcelular'
      Size = 50
    end
    object consultafornecedorforcomentarios: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'forcomentarios'
      Origin = 'forcomentarios'
      Size = 200
    end
  end
  object dsfornecedores: TDataSource
    DataSet = consultafornecedor
    Left = 1032
    Top = 296
  end
  object dbsqlite_meumeganegocio: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Joao\Desktop\TCC\MEU MEGA NEG'#211'CIO V2\Desktop\m' +
        'eumegadblite.db'
      'DriverID=SQLite')
    Left = 56
    Top = 488
  end
  object insererelatorio: TFDQuery
    Connection = dbsqlite_meumeganegocio
    SQL.Strings = (
      
        'insert into relatorios(relatorionome, relatoriodir, relatoriotip' +
        'o)'
      'values'
      '(:relatorionome, :relatoriodir, :relatoriotipo)')
    Left = 56
    Top = 552
    ParamData = <
      item
        Name = 'RELATORIONOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'RELATORIODIR'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'RELATORIOTIPO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object excluirrelatorio: TFDQuery
    Connection = dbsqlite_meumeganegocio
    SQL.Strings = (
      'delete from relatorios where relatorioid = :relatorioid')
    Left = 56
    Top = 616
    ParamData = <
      item
        Name = 'RELATORIOID'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consultarelatorio: TFDQuery
    Connection = dbsqlite_meumeganegocio
    SQL.Strings = (
      'select * from relatorios')
    Left = 56
    Top = 680
    object consultarelatoriorelatorioid: TFDAutoIncField
      FieldName = 'relatorioid'
      Origin = 'relatorioid'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultarelatoriorelatorionome: TStringField
      FieldName = 'relatorionome'
      Origin = 'relatorionome'
      Size = 100
    end
    object consultarelatoriorelatoriodir: TStringField
      FieldName = 'relatoriodir'
      Origin = 'relatoriodir'
      Size = 600
    end
    object consultarelatoriorelatoriotipo: TStringField
      FieldName = 'relatoriotipo'
      Origin = 'relatoriotipo'
      Size = 100
    end
  end
  object dsrelatorios: TDataSource
    DataSet = consultarelatorio
    Left = 56
    Top = 736
  end
  object subtraiestoque: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update produtos set prodquantidade = :prodquantidade where prodc' +
        'od = :prodcod')
    Left = 1160
    Top = 112
    ParamData = <
      item
        Name = 'PRODQUANTIDADE'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PRODCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object retornaestoquevendacancel: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'select itecodprod, itequant, itevalunit, itevalortotal, itenvend' +
        'a from itensdevenda, produtos WHERE itecodprod = prodcod')
    Left = 1160
    Top = 168
    object retornaestoquevendacancelitecodprod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'itecodprod'
      Origin = 'itecodprod'
    end
    object retornaestoquevendacancelitequant: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'itequant'
      Origin = 'itequant'
    end
    object retornaestoquevendacancelitevalunit: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'itevalunit'
      Origin = 'itevalunit'
    end
    object retornaestoquevendacancelitevalortotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'itevalortotal'
      Origin = 'itevalortotal'
    end
    object retornaestoquevendacancelitenvenda: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'itenvenda'
      Origin = 'itenvenda'
    end
  end
  object consultaestoquemenuprincipal: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from produtos where prodquantidade < 5')
    Left = 1160
    Top = 232
    object consultaestoquemenuprincipalprodcod: TFDAutoIncField
      FieldName = 'prodcod'
      Origin = 'prodcod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultaestoquemenuprincipalprodnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prodnome'
      Origin = 'prodnome'
      Size = 100
    end
    object consultaestoquemenuprincipalprodvalor: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'prodvalor'
      Origin = 'prodvalor'
    end
    object consultaestoquemenuprincipalprodquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'prodquantidade'
      Origin = 'prodquantidade'
    end
    object consultaestoquemenuprincipalproimagurloudir: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'proimagurloudir'
      Origin = 'proimagurloudir'
      Size = 200
    end
    object consultaestoquemenuprincipalprodlucro: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'prodlucro'
      Origin = 'prodlucro'
    end
    object consultaestoquemenuprincipalprodativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'prodativo'
      Origin = 'prodativo'
    end
    object consultaestoquemenuprincipalprodsubcategoria: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'prodsubcategoria'
      Origin = 'prodsubcategoria'
    end
  end
  object consultalogalteracoes: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from logalteracoes')
    Left = 1288
    Top = 288
    object consultalogalteracoeslogcod: TFDAutoIncField
      FieldName = 'logcod'
      Origin = 'logcod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consultalogalteracoeslogdataehora: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'logdataehora'
      Origin = 'logdataehora'
    end
    object consultalogalteracoeslogcomentario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'logcomentario'
      Origin = 'logcomentario'
      Size = 150
    end
    object consultalogalteracoescodemp: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codemp'
      Origin = 'codemp'
    end
  end
  object desativaprodutos: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'update produtos set prodativo = 0 where prodcod = :prodcod')
    Left = 1288
    Top = 232
    ParamData = <
      item
        Name = 'PRODCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object ativaprodutos: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'update produtos set prodativo = 1 where prodcod = :prodcod')
    Left = 1288
    Top = 168
    ParamData = <
      item
        Name = 'PRODCOD'
        ParamType = ptInput
      end>
  end
  object inserelogalteracoes: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into logalteracoes(logcomentario, codemp) values (:logcom' +
        'entario, :codemp) ')
    Left = 1288
    Top = 352
    ParamData = <
      item
        Name = 'LOGCOMENTARIO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'CODEMP'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object ativacategorias: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'update categorias set cateativo = 1 where catecod = :catecod')
    Left = 1392
    Top = 168
    ParamData = <
      item
        Name = 'CATECOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object desativarcategorias: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'update categorias set cateativo = 0 where catecod = :catecod')
    Left = 1392
    Top = 232
    ParamData = <
      item
        Name = 'CATECOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object ativarsubcategoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update subcategoria set subcatativa = 1 where subcatcod = :subca' +
        'tcod')
    Left = 1504
    Top = 168
    ParamData = <
      item
        Name = 'SUBCATCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object desativarsubcategoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'update subcategoria set subcatativa = 0 where subcatcod = :subca' +
        'tcod')
    Left = 1504
    Top = 232
    ParamData = <
      item
        Name = 'SUBCATCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object ativarfuncionario: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'update empresario set empativo = 1 where empcod = :empcod')
    Left = 1616
    Top = 168
    ParamData = <
      item
        Name = 'EMPCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object desativarfuncionario: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'update empresario set empativo = 0 where empcod = :empcod')
    Left = 1616
    Top = 232
    ParamData = <
      item
        Name = 'EMPCOD'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object consulta_funcio_auditoria: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      'select * from empresario')
    Left = 1616
    Top = 288
    object consulta_funcio_auditoriaempcod: TFDAutoIncField
      FieldName = 'empcod'
      Origin = 'empcod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object consulta_funcio_auditoriaempnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'empnome'
      Origin = 'empnome'
      Size = 100
    end
    object consulta_funcio_auditoriaempsenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'empsenha'
      Origin = 'empsenha'
      Size = 100
    end
    object consulta_funcio_auditoriaempativo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'empativo'
      Origin = 'empativo'
    end
    object consulta_funcio_auditoriaempfuncionario: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'empfuncionario'
      Origin = 'empfuncionario'
    end
  end
  object insereempresario_primeiroacesso: TFDQuery
    Connection = meumeganegocio
    SQL.Strings = (
      
        'insert into empresario(empnome, empsenha, empfuncionario) values' +
        ' (:empnome, md5(:empsenha), :empfuncionario)')
    Left = 1752
    Top = 168
    ParamData = <
      item
        Name = 'EMPNOME'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'EMPSENHA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'EMPFUNCIONARIO'
        DataType = ftWideString
        ParamType = ptInput
        Value = '0'
      end>
  end
end
