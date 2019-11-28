program Pmeumeganegocio;

uses
  System.StartUpCopy,
  FMX.Forms,
  Ulogin in 'Ulogin.pas' {frmlogin},
  Umodulo in 'Umodulo.pas' {dm: TDataModule},
  Umenu in 'Umenu.pas' {frmmenu},
  Uconsultaclientes in 'Uconsultaclientes.pas' {frmconsultaclientes},
  Uconsultacategorias in 'Uconsultacategorias.pas' {frmconsultacategoria},
  Uconsultasubcategorias in 'Uconsultasubcategorias.pas' {frmconsultasubcategoria},
  Uconsultavendas in 'Uconsultavendas.pas' {frmconsultarvendas},
  Uconsultaprodutos in 'Uconsultaprodutos.pas' {frmconsultaproduto},
  Ucadcliente in 'Ucadcliente.pas' {frmcadcliente},
  Ucadcategoria in 'Ucadcategoria.pas' {frmcadcategorias},
  Ucadsubcategoria in 'Ucadsubcategoria.pas' {frmcadsubcategoria},
  Ucadprodutos in 'Ucadprodutos.pas' {frmcadprodutos},
  Uvenda in 'Uvenda.pas' {frmvenda},
  Uconfiguracoes in 'Uconfiguracoes.pas' {frmconfiguracoes},
  Ugerenciametodospag in 'Ugerenciametodospag.pas' {frmmetodopag},
  Ufechavenda in 'Ufechavenda.pas' {frmfechavenda},
  Udetalhesvenda in 'Udetalhesvenda.pas' {frmdetalhesdavenda},
  Ugerenciafuncionarios in 'Ugerenciafuncionarios.pas' {frmgerfuncionarios},
  UvalidaCPF in 'UvalidaCPF.pas',
  Uvinculametodoparafecharvenda in 'Uvinculametodoparafecharvenda.pas' {frmvinculametodopagemtnovenda},
  SynPdf in 'SynPdf.pas',
  UGerenciafornecedor in 'UGerenciafornecedor.pas' {frmgerenciafornecedores},
  Ucadfornecedores in 'Ucadfornecedores.pas' {frmcadfornecedor},
  Uconsultafornecedor in 'Uconsultafornecedor.pas' {frmconsultafornecedor},
  Ucarregapdf in 'Ucarregapdf.pas' {frmcarregapdf},
  Ugraficosdosistema in 'Ugraficosdosistema.pas' {frmgraficosdosistema},
  Urelatorios in 'Urelatorios.pas' {frmrelatorios},
  Urelatoriossalvos in 'Urelatoriossalvos.pas' {frmrelatoriossalvos},
  Uacoesrelatorio in 'Uacoesrelatorio.pas' {frmacoesrelatorio},
  Ugerarrelatorio in 'Ugerarrelatorio.pas' {frmgerarrelatorio},
  Uauditoria in 'Uauditoria.pas' {frmauditoria},
  Ulogalteracoes in 'Ulogalteracoes.pas' {frmlogalteracoes},
  Uauditoriaprodutosmenu in 'Uauditoriaprodutosmenu.pas' {frmauditoriaprodutos},
  Udesativarprodutos in 'Udesativarprodutos.pas' {frmdesativarproduto},
  Uativarprodutos in 'Uativarprodutos.pas' {frmativarprodutos},
  Uauditoriacategoriasmenu in 'Uauditoriacategoriasmenu.pas' {frmauditoriacategorias},
  Uativarcategoria in 'Uativarcategoria.pas' {frmativarcategorias},
  Udesativarcategoria in 'Udesativarcategoria.pas' {frmdesativarcategoria},
  Uauditoriasubcategoriasmenu in 'Uauditoriasubcategoriasmenu.pas' {frmauditoriasubcategorias},
  Uativarsubcategoria in 'Uativarsubcategoria.pas' {frmativarsubcategoria},
  Udesativarsubcategoria in 'Udesativarsubcategoria.pas' {frmdesativarsubcategoria},
  Uauditoriafuncionariosmenu in 'Uauditoriafuncionariosmenu.pas' {frmauditoriafuncionarios},
  Udesativarfuncionario in 'Udesativarfuncionario.pas' {frmdesativarfuncionario},
  Uativarfuncionario in 'Uativarfuncionario.pas' {frmativarfuncionario},
  Uconfiguracaoinicialsistema in 'Uconfiguracaoinicialsistema.pas' {frmconfiguracoesiniciais},
  Uvinculaclientevenda in 'Uvinculaclientevenda.pas' {frmvinculaclientevenda},
  Ugerenciaestoque in 'Ugerenciaestoque.pas' {frmgerenciaestoque};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmlogin, frmlogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfrmmenu, frmmenu);
  Application.CreateForm(Tfrmconsultaclientes, frmconsultaclientes);
  Application.CreateForm(Tfrmconsultacategoria, frmconsultacategoria);
  Application.CreateForm(Tfrmconsultasubcategoria, frmconsultasubcategoria);
  Application.CreateForm(Tfrmconsultarvendas, frmconsultarvendas);
  Application.CreateForm(Tfrmconsultaproduto, frmconsultaproduto);
  Application.CreateForm(Tfrmcadcliente, frmcadcliente);
  Application.CreateForm(Tfrmcadcategorias, frmcadcategorias);
  Application.CreateForm(Tfrmcadsubcategoria, frmcadsubcategoria);
  Application.CreateForm(Tfrmcadprodutos, frmcadprodutos);
  Application.CreateForm(Tfrmvenda, frmvenda);
  Application.CreateForm(Tfrmconfiguracoes, frmconfiguracoes);
  Application.CreateForm(Tfrmmetodopag, frmmetodopag);
  Application.CreateForm(Tfrmfechavenda, frmfechavenda);
  Application.CreateForm(Tfrmdetalhesdavenda, frmdetalhesdavenda);
  Application.CreateForm(Tfrmgerfuncionarios, frmgerfuncionarios);
  Application.CreateForm(Tfrmvinculametodopagemtnovenda, frmvinculametodopagemtnovenda);
  Application.CreateForm(Tfrmgerenciafornecedores, frmgerenciafornecedores);
  Application.CreateForm(Tfrmcadfornecedor, frmcadfornecedor);
  Application.CreateForm(Tfrmconsultafornecedor, frmconsultafornecedor);
  Application.CreateForm(Tfrmcarregapdf, frmcarregapdf);
  Application.CreateForm(Tfrmgraficosdosistema, frmgraficosdosistema);
  Application.CreateForm(Tfrmrelatorios, frmrelatorios);
  Application.CreateForm(Tfrmrelatoriossalvos, frmrelatoriossalvos);
  Application.CreateForm(Tfrmacoesrelatorio, frmacoesrelatorio);
  Application.CreateForm(Tfrmgerarrelatorio, frmgerarrelatorio);
  Application.CreateForm(Tfrmauditoria, frmauditoria);
  Application.CreateForm(Tfrmlogalteracoes, frmlogalteracoes);
  Application.CreateForm(Tfrmauditoriaprodutos, frmauditoriaprodutos);
  Application.CreateForm(Tfrmdesativarproduto, frmdesativarproduto);
  Application.CreateForm(Tfrmativarprodutos, frmativarprodutos);
  Application.CreateForm(Tfrmauditoriacategorias, frmauditoriacategorias);
  Application.CreateForm(Tfrmativarcategorias, frmativarcategorias);
  Application.CreateForm(Tfrmdesativarcategoria, frmdesativarcategoria);
  Application.CreateForm(Tfrmauditoriasubcategorias, frmauditoriasubcategorias);
  Application.CreateForm(Tfrmativarsubcategoria, frmativarsubcategoria);
  Application.CreateForm(Tfrmdesativarsubcategoria, frmdesativarsubcategoria);
  Application.CreateForm(Tfrmauditoriafuncionarios, frmauditoriafuncionarios);
  Application.CreateForm(Tfrmdesativarfuncionario, frmdesativarfuncionario);
  Application.CreateForm(Tfrmativarfuncionario, frmativarfuncionario);
  Application.CreateForm(Tfrmconfiguracoesiniciais, frmconfiguracoesiniciais);
  Application.CreateForm(Tfrmvinculaclientevenda, frmvinculaclientevenda);
  Application.CreateForm(Tfrmgerenciaestoque, frmgerenciaestoque);
  Application.Run;
end.
