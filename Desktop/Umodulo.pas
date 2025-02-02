unit Umodulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs;

type
  Tdm = class(TDataModule)
    meumeganegocio: TFDConnection;
    qlogin: TFDQuery;
    dslogin: TDataSource;
    qloginempcod: TFDAutoIncField;
    qloginempnome: TStringField;
    qloginempsenha: TStringField;
    qloginempfuncionario: TBooleanField;
    inserecliente: TFDQuery;
    consultacliente: TFDQuery;
    dsconsultacli: TDataSource;
    alteracliente: TFDQuery;
    consultaclienteclicod: TFDAutoIncField;
    consultaclienteclinome: TStringField;
    consultaclienteclifone: TStringField;
    consultaclientecliendereco: TStringField;
    consultaclienteclicpf: TStringField;
    consultaclientecliativo: TBooleanField;
    inserecategoria: TFDQuery;
    alteracategoria: TFDQuery;
    consultacategoria: TFDQuery;
    dscategoria: TDataSource;
    consultacategoriacatecod: TFDAutoIncField;
    consultacategoriacatenome: TStringField;
    consultacategoriacatedescricao: TStringField;
    consultacategoriacateativo: TBooleanField;
    inseresubcategoria: TFDQuery;
    alterasubcategoria: TFDQuery;
    consultasubcategoria: TFDQuery;
    dssubcategoria: TDataSource;
    consultasubcategoriasubcatcod: TFDAutoIncField;
    consultasubcategoriasubcatnome: TStringField;
    consultasubcategoriasubcatdescricao: TStringField;
    consultasubcategoriacatid: TIntegerField;
    consultasubcategoriasubcatativa: TBooleanField;
    inserevenda: TFDQuery;
    alteravenda: TFDQuery;
    consultavenda: TFDQuery;
    dsvenda: TDataSource;
    insereproduto: TFDQuery;
    alteraproduto: TFDQuery;
    consultaproduto: TFDQuery;
    dsproduto: TDataSource;
    consultaprodutoprodcod: TFDAutoIncField;
    consultaprodutoprodnome: TStringField;
    consultaprodutoprodvalor: TFloatField;
    consultaprodutoprodquantidade: TIntegerField;
    consultaprodutoproimagurloudir: TStringField;
    consultaprodutoprodlucro: TFloatField;
    consultaprodutoprodativo: TBooleanField;
    consultaprodutoprodsubcategoria: TIntegerField;
    abrecaixa: TFDQuery;
    fechacaixa: TFDQuery;
    consultacaixa: TFDQuery;
    dscaixa: TDataSource;
    insereitensvenda: TFDQuery;
    alteraitensvenda: TFDQuery;
    consultaitensvenda: TFDQuery;
    dsitensvenda: TDataSource;
    inseremetodopag: TFDQuery;
    alterametodopag: TFDQuery;
    consultametodopag: TFDQuery;
    dspagamento: TDataSource;
    consultametodopagtipoid: TFDAutoIncField;
    consultametodopagtiponome: TStringField;
    excluiitensvenda: TFDQuery;
    excluivenda: TFDQuery;
    viewexibedetalhesvendas: TFDQuery;
    consultaempresario: TFDQuery;
    alteraempresario: TFDQuery;
    insereempresario: TFDQuery;
    consultaempresarioempnome: TStringField;
    consultaempresarioempsenha: TStringField;
    consultaempresarioempcargo: TStringField;
    consultaparaanalytics: TFDQuery;
    dsanalytics: TDataSource;
    viewexibedetalhesvendasvencod: TFDAutoIncField;
    viewexibedetalhesvendasvenclicod: TIntegerField;
    viewexibedetalhesvendasvenempcod: TIntegerField;
    viewexibedetalhesvendasvencaicod: TIntegerField;
    viewexibedetalhesvendasvendataven: TSQLTimeStampField;
    viewexibedetalhesvendasventotal: TFloatField;
    viewexibedetalhesvendasvendesconto: TFloatField;
    viewexibedetalhesvendasclinome: TStringField;
    viewexibedetalhesvendasempnome: TStringField;
    consultavendavencod: TFDAutoIncField;
    consultavendavendataven: TSQLTimeStampField;
    consultavendaventotal: TFloatField;
    consultavendavendesconto: TFloatField;
    consultavendavenclicod: TIntegerField;
    consultavendavencaicod: TIntegerField;
    consultavendavenempcod: TIntegerField;
    inserepagamentos: TFDQuery;
    alterapagamentos: TFDQuery;
    consultapagamentos: TFDQuery;
    dspagamentos: TDataSource;
    excluirpagamentos: TFDQuery;
    consultapagamentospagid: TFDAutoIncField;
    consultapagamentospagcodven: TIntegerField;
    consultapagamentospagvlr: TFloatField;
    consultapagamentosnomepagamento: TStringField;
    convenfechvenda: TFDQuery;
    dsconsvenfechcai: TDataSource;
    convenfechvendatotal: TFloatField;
    consultacaixacaicod: TFDAutoIncField;
    consultacaixacaiemp: TIntegerField;
    consultacaixacaivlrabert: TFloatField;
    consultacaixacaivlrfech: TFloatField;
    consultacaixacaiaberto: TSQLTimeStampField;
    consultacaixacaifech: TStringField;
    inserefornecedor: TFDQuery;
    alterafornecedor: TFDQuery;
    consultafornecedor: TFDQuery;
    dsfornecedores: TDataSource;
    consultafornecedorforcod: TFDAutoIncField;
    consultafornecedorfornome: TStringField;
    consultafornecedorforendereco: TStringField;
    consultafornecedorfortelefone: TStringField;
    consultafornecedorforcelular: TStringField;
    consultafornecedorforcomentarios: TStringField;
    dbsqlite_meumeganegocio: TFDConnection;
    insererelatorio: TFDQuery;
    excluirrelatorio: TFDQuery;
    consultarelatorio: TFDQuery;
    dsrelatorios: TDataSource;
    consultarelatoriorelatorioid: TFDAutoIncField;
    consultarelatoriorelatorionome: TStringField;
    consultarelatoriorelatoriodir: TStringField;
    consultarelatoriorelatoriotipo: TStringField;
    subtraiestoque: TFDQuery;
    consultaitensvendaprodnome: TStringField;
    consultaitensvendaitequant: TIntegerField;
    consultaitensvendaitevalunit: TFloatField;
    consultaitensvendaitevalortotal: TFloatField;
    consultaitensvendaitenvenda: TIntegerField;
    retornaestoquevendacancel: TFDQuery;
    retornaestoquevendacancelitecodprod: TIntegerField;
    retornaestoquevendacancelitequant: TIntegerField;
    retornaestoquevendacancelitevalunit: TFloatField;
    retornaestoquevendacancelitevalortotal: TFloatField;
    retornaestoquevendacancelitenvenda: TIntegerField;
    consultaestoquemenuprincipal: TFDQuery;
    consultaestoquemenuprincipalprodcod: TFDAutoIncField;
    consultaestoquemenuprincipalprodnome: TStringField;
    consultaestoquemenuprincipalprodvalor: TFloatField;
    consultaestoquemenuprincipalprodquantidade: TIntegerField;
    consultaestoquemenuprincipalproimagurloudir: TStringField;
    consultaestoquemenuprincipalprodlucro: TFloatField;
    consultaestoquemenuprincipalprodativo: TBooleanField;
    consultaestoquemenuprincipalprodsubcategoria: TIntegerField;
    consultalogalteracoes: TFDQuery;
    consultalogalteracoeslogcod: TFDAutoIncField;
    consultalogalteracoeslogdataehora: TSQLTimeStampField;
    consultalogalteracoeslogcomentario: TStringField;
    consultalogalteracoescodemp: TIntegerField;
    desativaprodutos: TFDQuery;
    ativaprodutos: TFDQuery;
    inserelogalteracoes: TFDQuery;
    ativacategorias: TFDQuery;
    desativarcategorias: TFDQuery;
    ativarsubcategoria: TFDQuery;
    desativarsubcategoria: TFDQuery;
    ativarfuncionario: TFDQuery;
    desativarfuncionario: TFDQuery;
    consulta_funcio_auditoria: TFDQuery;
    consulta_funcio_auditoriaempcod: TFDAutoIncField;
    consulta_funcio_auditoriaempnome: TStringField;
    consulta_funcio_auditoriaempsenha: TStringField;
    consulta_funcio_auditoriaempativo: TBooleanField;
    consulta_funcio_auditoriaempfuncionario: TBooleanField;
    insereempresario_primeiroacesso: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
