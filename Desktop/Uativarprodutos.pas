unit Uativarprodutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Objects, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  Tfrmativarprodutos = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    lsativarproduto: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure FormShow(Sender: TObject);
    procedure lsativarprodutoItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmativarprodutos: Tfrmativarprodutos;

implementation

{$R *.fmx}

uses Umodulo, Ulogin, Umenu;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmativarprodutos.FormShow(Sender: TObject);
begin
dm.consultaproduto.Close;
dm.consultaproduto.SQL.Text := 'select * from produtos where prodativo = 0';
dm.consultaproduto.Open;
end;

procedure Tfrmativarprodutos.lsativarprodutoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
  var
  comentario : string;
begin
dm.consultaproduto.RecNo := lsativarproduto.Selected.Index + 1;
dm.ativaprodutos.Params.ParamByName('prodcod').Value := dm.consultaprodutoprodcod.AsInteger;
dm.ativaprodutos.Prepare;
dm.ativaprodutos.ExecSQL;
comentario := 'Produto ' + dm.consultaprodutoprodnome.AsString + ' ativado, pelo ' + frmlogin.nome_do_usuario_logado_para_proteger_integridade_do_sistema;
dm.inserelogalteracoes.Params.ParamByName('logcomentario').Value := comentario;
dm.inserelogalteracoes.Params.ParamByName('codemp').Value := frmmenu.empresarioid;
dm.inserelogalteracoes.Prepare;
dm.inserelogalteracoes.ExecSQL;
//ShowMessage('Produto ativado com sucesso ::: ' + dm.consultaprodutoprodnome.AsString);
mostraMensagem('Produto ativado com sucesso ::: ' + dm.consultaprodutoprodnome.AsString, 'Produto ativado com sucesso ::: ' + dm.consultaprodutoprodnome.AsString, 'OK');
dm.consultaproduto.Close;
dm.consultaproduto.Open;
end;

end.
