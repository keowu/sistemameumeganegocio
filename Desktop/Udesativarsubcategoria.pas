unit Udesativarsubcategoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Objects, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  Tfrmdesativarsubcategoria = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    lsdesativarsubcategoria: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure FormShow(Sender: TObject);
    procedure lsdesativarsubcategoriaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdesativarsubcategoria: Tfrmdesativarsubcategoria;

implementation

{$R *.fmx}

uses Umodulo, Ulogin, Umenu;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmdesativarsubcategoria.FormShow(Sender: TObject);
begin
dm.consultasubcategoria.Close;
dm.consultasubcategoria.SQL.Text := 'select * from subcategoria where subcatativa = 1';
dm.consultasubcategoria.Open;
end;

procedure Tfrmdesativarsubcategoria.lsdesativarsubcategoriaItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
      var
  comentario : string;
begin
dm.consultasubcategoria.RecNo := lsdesativarsubcategoria.Selected.Index + 1;
dm.desativarsubcategoria.Params.ParamByName('subcatcod').Value := dm.consultasubcategoriasubcatcod.AsInteger;
dm.desativarsubcategoria.Prepare;
dm.desativarsubcategoria.ExecSQL;
comentario := 'Subcategoria ' + dm.consultasubcategoriasubcatnome.AsString + ' desativada, pelo ' + frmlogin.nome_do_usuario_logado_para_proteger_integridade_do_sistema;
dm.inserelogalteracoes.Params.ParamByName('logcomentario').Value := comentario;
dm.inserelogalteracoes.Params.ParamByName('codemp').Value := frmmenu.empresarioid;
dm.inserelogalteracoes.Prepare;
dm.inserelogalteracoes.ExecSQL;
//ShowMessage('Subcategoria desativada com sucesso ::: ' + dm.consultasubcategoriasubcatnome.AsString);
mostraMensagem('Subcategoria desativada com sucesso ::: ' + dm.consultasubcategoriasubcatnome.AsString, 'Subcategoria desativada com sucesso ::: ' + dm.consultasubcategoriasubcatnome.AsString, 'OK');
dm.consultasubcategoria.Close;
dm.consultasubcategoria.Open;
end;

end.
