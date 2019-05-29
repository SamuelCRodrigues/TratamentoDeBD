using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace RenomearBaseDeDados
{
    class Program
    {
        
        static void Main(string[] args)
        {
            var txtUnder = WriteDictionaryCols();

            //var txtUnder = tabelasInsertSelect();
            //var txtUnder = getScriptUnderlineLowerCase(".\\..\\..\\..\\dataOnly.sql"); ;



                // Do whatever you need to do with clipboardText
            


            Console.ReadKey();
        }

        public static string GetScriptUnderlineLowerCase(string path)
        {

            string txt = File.ReadAllText(path, Encoding.UTF8);

            var outpt = txt.ToUnderscoreCase();

            return outpt;
        }

        public static string TabelasInsertSelect()
        {
            string[] tables = {
                "AreaTelepreco"
                ,"AreaTeleprecoAuxiliar"
                ,"AreaTeleprecoFila"
                ,"AreaTeleprecoPontoAtendimento"
                ,"Atendimento"
                ,"AtendimentoItem"
                ,"AtendimentoItemDetalhes"
                ,"AtendimentoItemEstoque"
                ,"AtendimentoJustificativa"
                ,"AtendimentoObservacao"
                ,"AtendimentoObservacaoCadastral"
                ,"Cliente"
                ,"ClienteTipo"
                ,"CondicaoPagamento"
                ,"FormaPagamentoClienteTipo"
                ,"funcionario"
                ,"Funcionario"
                ,"GrupoPermissao"
                ,"GrupoUsuario"
                ,"LogErro"
                ,"Loja"
                ,"PecaFalta"
                ,"SolicitacaoOrcamento"
                ,"StatusAtendimento"
                ,"StatusSolicitacaoOrcamento"
                ,"Usuario"
                ,"UsuarioSessao"
            };

            StringBuilder sb = new StringBuilder();

            foreach (var tb in tables)
            {
                sb.AppendFormat("INSERT INTO {0}", tb.ToUnderscoreCase());
                sb.AppendLine();
                sb.AppendFormat("SELECT * FROM \"{0}\";", tb);
                sb.AppendLine();
                sb.AppendLine();
            }

            return sb.ToString();
        }

        public static string SubstituteByDictionary(string toSubstitute)
        {
            var dc = GetColDictionary();

            foreach (var k in dc)
            {
                toSubstitute = toSubstitute.Replace(k.Key, k.Value);
            }

            return toSubstitute;
        }

        public static string WriteDictionaryCols() {
            var cols = new string[]{ "Abastecido","AcaoId","AcaoNome","AreaTeleprecoAuxiliarId","AreaTeleprecoFilaId","AreaTeleprecoId","AreaTeleprecoPontoAtendimentoId","atendimento_id","AtendimentoId","AtendimentoItemId","AtendimentoObservacaoCadastralId","AtendimentoObservacaoId","Ativo","ClassName","cliente_carregado_u_r_a","ClienteCarregadoURA","cliente_id","ClienteId","ClienteTipoId","CodigoItem","condicao_pagamento_id","CondicaoPagamentoId","Cpf","CpfCnpj","Data","DataAceite","DataAtivacao","DataCadastro","DataCancelamento","DataChamada","DataChegada","DataContratacao","DataCriacao","data_inclusao","DataInclusao","DataOcorrencia","DataUltimaAlteracao","DataUltimoVeiculoPesquisado","data_vencimento","DataVencimento","Descricao","Email","Entrega","FabricanteCodigo","FabricanteCodigoReferencia","FabricanteDescricao","FabricanteId","Faturado","FormaPagamentoClienteTipoId","FormaPagamentoId","FormularioId","FormularioNome","FuncionarioId","GrupoPermissaoId","GrupoUsuarioId","HttpErroCode","HttpErrorMessage","Id","Key","LocalIpAddress","LogErroId","LogErrorIdMainException","Login","loja_id","LojaId","loja_interesse_id","LojaInteresseId","Matricula","Message","MotivoCancelamento","Nome","NomeAbreviado","NomeCompleto","numero","Numero","NumeroTotalParcelas","observacao_cliente","ObservacaoCliente","observacao_vendedor","ObservacaoVendedor","OperadorId","PecaCodigo","PecaDescricao","PecaFaltaId","PecaId","PessoaFisica","ProdutoCodigo","ProdutoDescricao","ProdutoId","Quantidade","RemoteIpAddress","SolicitacaoOrcamentoId","Source","StackTraceString","status_atendimento","StatusAtendimento","StatusId","Telefone","TelefoneCliente","Texto","tipo_atendimento","TipoAtendimento","TipoItem","TipoMotivo","UltimoAnoVeiculoPesquisado","UltimoVeiculoPesquisado","Url","Username","UsuarioAtivacaoId","UsuarioAuxiliarId","UsuarioCadastroId","UsuarioId","UsuarioInclusaoId","usuario_operador_id","UsuarioOperadorId","UsuarioSessaoId","UsuarioTelefonia","UsuarioUltimaAlteracaoId","Valor","ValorComissao","ValorItem","valor_total","ValorTotal"};

            var dc = new Dictionary<string, string>();


            var sb = new StringBuilder();
            foreach (var col in cols) {
                sb.AppendFormat("dc.Add(\"\\\"{0}\\\"\",\"\\\"{1}\\\"\");", col, col.ToUnderscoreCaseAll());
                sb.AppendLine();
            }

            var exit = sb.ToString();

            return exit;
        }



        public static Dictionary<string, string> GetColDictionary() {
            return new Dictionary<string, string>
            {
                { "\"Abastecido\"", "\"abastecido\"" },
                { "\"AcaoId\"", "\"acao_id\"" },
                { "\"AcaoNome\"", "\"acao_nome\"" },
                { "\"AreaTeleprecoAuxiliarId\"", "\"area_telepreco_auxiliar_id\"" },
                { "\"AreaTeleprecoFilaId\"", "\"area_telepreco_fila_id\"" },
                { "\"AreaTeleprecoId\"", "\"area_telepreco_id\"" },
                { "\"AreaTeleprecoPontoAtendimentoId\"", "\"area_telepreco_ponto_atendimento_id\"" },
                { "\"atendimento_id\"", "\"atendimento_id\"" },
                { "\"AtendimentoId\"", "\"atendimento_id\"" },
                { "\"AtendimentoItemId\"", "\"atendimento_item_id\"" },
                { "\"AtendimentoObservacaoCadastralId\"", "\"atendimento_observacao_cadastral_id\"" },
                { "\"AtendimentoObservacaoId\"", "\"atendimento_observacao_id\"" },
                { "\"Ativo\"", "\"ativo\"" },
                { "\"ClassName\"", "\"class_name\"" },
                { "\"cliente_carregado_u_r_a\"", "\"cliente_carregado_u_r_a\"" },
                { "\"ClienteCarregadoURA\"", "\"cliente_carregado_u_r_a\"" },
                { "\"cliente_id\"", "\"cliente_id\"" },
                { "\"ClienteId\"", "\"cliente_id\"" },
                { "\"ClienteTipoId\"", "\"cliente_tipo_id\"" },
                { "\"CodigoItem\"", "\"codigo_item\"" },
                { "\"condicao_pagamento_id\"", "\"condicao_pagamento_id\"" },
                { "\"CondicaoPagamentoId\"", "\"condicao_pagamento_id\"" },
                { "\"Cpf\"", "\"cpf\"" },
                { "\"CpfCnpj\"", "\"cpf_cnpj\"" },
                { "\"Data\"", "\"data\"" },
                { "\"DataAceite\"", "\"data_aceite\"" },
                { "\"DataAtivacao\"", "\"data_ativacao\"" },
                { "\"DataCadastro\"", "\"data_cadastro\"" },
                { "\"DataCancelamento\"", "\"data_cancelamento\"" },
                { "\"DataChamada\"", "\"data_chamada\"" },
                { "\"DataChegada\"", "\"data_chegada\"" },
                { "\"DataContratacao\"", "\"data_contratacao\"" },
                { "\"DataCriacao\"", "\"data_criacao\"" },
                { "\"data_inclusao\"", "\"data_inclusao\"" },
                { "\"DataInclusao\"", "\"data_inclusao\"" },
                { "\"DataOcorrencia\"", "\"data_ocorrencia\"" },
                { "\"DataUltimaAlteracao\"", "\"data_ultima_alteracao\"" },
                { "\"DataUltimoVeiculoPesquisado\"", "\"data_ultimo_veiculo_pesquisado\"" },
                { "\"data_vencimento\"", "\"data_vencimento\"" },
                { "\"DataVencimento\"", "\"data_vencimento\"" },
                { "\"Descricao\"", "\"descricao\"" },
                { "\"Email\"", "\"email\"" },
                { "\"Entrega\"", "\"entrega\"" },
                { "\"FabricanteCodigo\"", "\"fabricante_codigo\"" },
                { "\"FabricanteCodigoReferencia\"", "\"fabricante_codigo_referencia\"" },
                { "\"FabricanteDescricao\"", "\"fabricante_descricao\"" },
                { "\"FabricanteId\"", "\"fabricante_id\"" },
                { "\"Faturado\"", "\"faturado\"" },
                { "\"FormaPagamentoClienteTipoId\"", "\"forma_pagamento_cliente_tipo_id\"" },
                { "\"FormaPagamentoId\"", "\"forma_pagamento_id\"" },
                { "\"FormularioId\"", "\"formulario_id\"" },
                { "\"FormularioNome\"", "\"formulario_nome\"" },
                { "\"FuncionarioId\"", "\"funcionario_id\"" },
                { "\"GrupoPermissaoId\"", "\"grupo_permissao_id\"" },
                { "\"GrupoUsuarioId\"", "\"grupo_usuario_id\"" },
                { "\"HttpErroCode\"", "\"http_erro_code\"" },
                { "\"HttpErrorMessage\"", "\"http_error_message\"" },
                { "\"Id\"", "\"id\"" },
                { "\"Key\"", "\"key\"" },
                { "\"LocalIpAddress\"", "\"local_ip_address\"" },
                { "\"LogErroId\"", "\"log_erro_id\"" },
                { "\"LogErrorIdMainException\"", "\"log_error_id_main_exception\"" },
                { "\"Login\"", "\"login\"" },
                { "\"loja_id\"", "\"loja_id\"" },
                { "\"LojaId\"", "\"loja_id\"" },
                { "\"loja_interesse_id\"", "\"loja_interesse_id\"" },
                { "\"LojaInteresseId\"", "\"loja_interesse_id\"" },
                { "\"Matricula\"", "\"matricula\"" },
                { "\"Message\"", "\"message\"" },
                { "\"MotivoCancelamento\"", "\"motivo_cancelamento\"" },
                { "\"Nome\"", "\"nome\"" },
                { "\"NomeAbreviado\"", "\"nome_abreviado\"" },
                { "\"NomeCompleto\"", "\"nome_completo\"" },
                { "\"numero\"", "\"numero\"" },
                { "\"Numero\"", "\"numero\"" },
                { "\"NumeroTotalParcelas\"", "\"numero_total_parcelas\"" },
                { "\"observacao_cliente\"", "\"observacao_cliente\"" },
                { "\"ObservacaoCliente\"", "\"observacao_cliente\"" },
                { "\"observacao_vendedor\"", "\"observacao_vendedor\"" },
                { "\"ObservacaoVendedor\"", "\"observacao_vendedor\"" },
                { "\"OperadorId\"", "\"operador_id\"" },
                { "\"PecaCodigo\"", "\"peca_codigo\"" },
                { "\"PecaDescricao\"", "\"peca_descricao\"" },
                { "\"PecaFaltaId\"", "\"peca_falta_id\"" },
                { "\"PecaId\"", "\"peca_id\"" },
                { "\"PessoaFisica\"", "\"pessoa_fisica\"" },
                { "\"ProdutoCodigo\"", "\"produto_codigo\"" },
                { "\"ProdutoDescricao\"", "\"produto_descricao\"" },
                { "\"ProdutoId\"", "\"produto_id\"" },
                { "\"Quantidade\"", "\"quantidade\"" },
                { "\"RemoteIpAddress\"", "\"remote_ip_address\"" },
                { "\"SolicitacaoOrcamentoId\"", "\"solicitacao_orcamento_id\"" },
                { "\"Source\"", "\"source\"" },
                { "\"StackTraceString\"", "\"stack_trace_string\"" },
                { "\"status_atendimento\"", "\"status_atendimento\"" },
                { "\"StatusAtendimento\"", "\"status_atendimento\"" },
                { "\"StatusId\"", "\"status_id\"" },
                { "\"Telefone\"", "\"telefone\"" },
                { "\"TelefoneCliente\"", "\"telefone_cliente\"" },
                { "\"Texto\"", "\"texto\"" },
                { "\"tipo_atendimento\"", "\"tipo_atendimento\"" },
                { "\"TipoAtendimento\"", "\"tipo_atendimento\"" },
                { "\"TipoItem\"", "\"tipo_item\"" },
                { "\"TipoMotivo\"", "\"tipo_motivo\"" },
                { "\"UltimoAnoVeiculoPesquisado\"", "\"ultimo_ano_veiculo_pesquisado\"" },
                { "\"UltimoVeiculoPesquisado\"", "\"ultimo_veiculo_pesquisado\"" },
                { "\"Url\"", "\"url\"" },
                { "\"Username\"", "\"username\"" },
                { "\"UsuarioAtivacaoId\"", "\"usuario_ativacao_id\"" },
                { "\"UsuarioAuxiliarId\"", "\"usuario_auxiliar_id\"" },
                { "\"UsuarioCadastroId\"", "\"usuario_cadastro_id\"" },
                { "\"UsuarioId\"", "\"usuario_id\"" },
                { "\"UsuarioInclusaoId\"", "\"usuario_inclusao_id\"" },
                { "\"usuario_operador_id\"", "\"usuario_operador_id\"" },
                { "\"UsuarioOperadorId\"", "\"usuario_operador_id\"" },
                { "\"UsuarioSessaoId\"", "\"usuario_sessao_id\"" },
                { "\"UsuarioTelefonia\"", "\"usuario_telefonia\"" },
                { "\"UsuarioUltimaAlteracaoId\"", "\"usuario_ultima_alteracao_id\"" },
                { "\"Valor\"", "\"valor\"" },
                { "\"ValorComissao\"", "\"valor_comissao\"" },
                { "\"ValorItem\"", "\"valor_item\"" },
                { "\"valor_total\"", "\"valor_total\"" },
                { "\"ValorTotal\"", "\"valor_total\"" }
            };

        }
    }


    public static class ExtensionString
    {

        public static string ToUnderscoreCaseAll(this string str)
        {
            return string.Concat(str.Select((x, i) => i > 0 && char.IsUpper(x) ? "_" + x.ToString() : x.ToString())).ToLower();
        }
        public static string ToUnderscoreCase(this string str)
        {
            char last = ' ';
            var lastDenySubstitute = new char[] { ' ', '"' };

            char inner = '"';
            bool isInner = false;
            return string.Concat(str.Select((x, i) =>
            {
                if (inner.Equals(x))
                {
                    isInner = !isInner;
                }

                if (isInner)
                {
                    if (i > 0 && char.IsUpper(x) && !lastDenySubstitute.Contains(last))
                    {
                        last = x;
                        return "_" + x.ToString().ToLower();
                    }
                    else
                    {
                        last = x;
                        return x.ToString().ToLower();
                    }
                }
                last = x;
                return x.ToString();

            }));
        }
    }
}
