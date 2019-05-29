--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-05-28 16:12:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public."LogErro" DROP CONSTRAINT log_error_main_fk;
ALTER TABLE ONLY public."Atendimento" DROP CONSTRAINT fk_cliente_atendimento;
ALTER TABLE ONLY public."AtendimentoObservacao" DROP CONSTRAINT fk_atendimento_atendobs;
ALTER TABLE ONLY public."Atendimento" DROP CONSTRAINT "RefStatusAtendimento48";
ALTER TABLE ONLY public."AreaTeleprecoFila" DROP CONSTRAINT "RefOperador83";
ALTER TABLE ONLY public."AreaTeleprecoAuxiliar" DROP CONSTRAINT "RefOperador79";
ALTER TABLE ONLY public."AreaTelepreco" DROP CONSTRAINT "RefOperador78";
ALTER TABLE ONLY public."AreaTelepreco" DROP CONSTRAINT "RefOperador77";
ALTER TABLE ONLY public."AreaTelepreco" DROP CONSTRAINT "RefOperador76";
ALTER TABLE ONLY public."AtendimentoJustificativa" DROP CONSTRAINT "RefOperador22";
ALTER TABLE ONLY public."AtendimentoItemEstoque" DROP CONSTRAINT "RefLoja931";
ALTER TABLE ONLY public."PecaFalta" DROP CONSTRAINT "RefLoja29";
ALTER TABLE ONLY public."FormaPagamentoClienteTipo" DROP CONSTRAINT "RefClienteTipo63";
ALTER TABLE ONLY public."AtendimentoObservacao" DROP CONSTRAINT "RefAtendimentoObservacaoCadastral141";
ALTER TABLE ONLY public."AtendimentoItemEstoque" DROP CONSTRAINT "RefAtendimentoItem941";
ALTER TABLE ONLY public."AtendimentoItemDetalhes" DROP CONSTRAINT "RefAtendimentoItem89";
ALTER TABLE ONLY public."AtendimentoItem" DROP CONSTRAINT "RefAtendimento6";
ALTER TABLE ONLY public."SolicitacaoOrcamento" DROP CONSTRAINT "RefAtendimento34";
ALTER TABLE ONLY public."AtendimentoJustificativa" DROP CONSTRAINT "RefAtendimento24";
ALTER TABLE ONLY public."AreaTeleprecoFila" DROP CONSTRAINT "RefAreaTeleprecoPontoAtendimento82";
ALTER TABLE ONLY public."AreaTeleprecoFila" DROP CONSTRAINT "RefAreaTeleprecoAuxiliar81";
ALTER TABLE ONLY public."AreaTeleprecoPontoAtendimento" DROP CONSTRAINT "RefAreaTelepreco85";
ALTER TABLE ONLY public."AreaTeleprecoFila" DROP CONSTRAINT "RefAreaTelepreco84";
ALTER TABLE ONLY public."AreaTeleprecoAuxiliar" DROP CONSTRAINT "RefAreaTelepreco80";
ALTER TABLE ONLY public."Atendimento" DROP CONSTRAINT "FK_Operador_Atendimento";
ALTER TABLE ONLY public."Atendimento" DROP CONSTRAINT "FK_Loja_Atendimento";
ALTER TABLE ONLY public."Atendimento" DROP CONSTRAINT "FK_CondicaoPagto_Atendimento";
DROP INDEX public."FK_Operador_Atendimento";
DROP INDEX public."FK_Loja_Atendimento";
DROP INDEX public."FK_CondicaoPagto_Atendimento";
DROP INDEX public."AK_AtendimentoNumero";
ALTER TABLE ONLY public."ClienteTipo" DROP CONSTRAINT pk22;
ALTER TABLE ONLY public."UsuarioSessao" DROP CONSTRAINT "UsuarioSessao_pkey";
ALTER TABLE ONLY public."AtendimentoObservacao" DROP CONSTRAINT "Pk_AtendimentoObservacao";
ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "PK_Operador";
ALTER TABLE ONLY public."Loja" DROP CONSTRAINT "PK_Loja";
ALTER TABLE ONLY public."CondicaoPagamento" DROP CONSTRAINT "PK_CondicaoPagamento";
ALTER TABLE ONLY public."Cliente" DROP CONSTRAINT "PK_Cliente";
ALTER TABLE ONLY public."AtendimentoItem" DROP CONSTRAINT "PK_AtendimentoItem";
ALTER TABLE ONLY public."Atendimento" DROP CONSTRAINT "PK_Atendimento";
ALTER TABLE ONLY public."AtendimentoObservacaoCadastral" DROP CONSTRAINT "PK9";
ALTER TABLE ONLY public."GrupoUsuario" DROP CONSTRAINT "PK43";
ALTER TABLE ONLY public."GrupoPermissao" DROP CONSTRAINT "PK42";
ALTER TABLE ONLY public."AtendimentoItemEstoque" DROP CONSTRAINT "PK40";
ALTER TABLE ONLY public."AtendimentoItemDetalhes" DROP CONSTRAINT "PK38";
ALTER TABLE ONLY public."AreaTeleprecoAuxiliar" DROP CONSTRAINT "PK32";
ALTER TABLE ONLY public."AreaTeleprecoPontoAtendimento" DROP CONSTRAINT "PK31";
ALTER TABLE ONLY public."AreaTeleprecoFila" DROP CONSTRAINT "PK30";
ALTER TABLE ONLY public."AreaTelepreco" DROP CONSTRAINT "PK29";
ALTER TABLE ONLY public."FormaPagamentoClienteTipo" DROP CONSTRAINT "PK26";
ALTER TABLE ONLY public."Funcionario" DROP CONSTRAINT "PK24";
ALTER TABLE ONLY public."StatusAtendimento" DROP CONSTRAINT "PK19";
ALTER TABLE ONLY public."StatusSolicitacaoOrcamento" DROP CONSTRAINT "PK18";
ALTER TABLE ONLY public."SolicitacaoOrcamento" DROP CONSTRAINT "PK16";
ALTER TABLE ONLY public."PecaFalta" DROP CONSTRAINT "PK14";
ALTER TABLE ONLY public."AtendimentoJustificativa" DROP CONSTRAINT "PK12";
ALTER TABLE ONLY public."LogErro" DROP CONSTRAINT "LogErro_pkey";
DROP TABLE public.usuario_sessao;
DROP TABLE public.usuario;
DROP TABLE public.status_solicitacao_orcamento;
DROP TABLE public.status_atendimento;
DROP TABLE public.solicitacao_orcamento;
DROP TABLE public.peca_falta;
DROP TABLE public.loja;
DROP TABLE public.log_erro;
DROP SEQUENCE public.log_erro_id_seq;
DROP TABLE public.grupo_usuario;
DROP TABLE public.grupo_permissao;
DROP TABLE public.funcionario;
DROP TABLE public.forma_pagamento_cliente_tipo;
DROP TABLE public.condicao_pagamento;
DROP TABLE public.cliente_tipo;
DROP TABLE public.cliente;
DROP TABLE public.atendimento_observacao_cadastral;
DROP TABLE public.atendimento_observacao;
DROP TABLE public.atendimento_justificativa;
DROP TABLE public.atendimento_item_estoque;
DROP TABLE public.atendimento_item_detalhes;
DROP TABLE public.atendimento_item;
DROP TABLE public.atendimento;
DROP TABLE public.area_telepreco_ponto_atendimento;
DROP TABLE public.area_telepreco_fila;
DROP TABLE public.area_telepreco_auxiliar;
DROP TABLE public.area_telepreco;
DROP TABLE public."UsuarioSessao";
DROP TABLE public."Usuario";
DROP TABLE public."StatusSolicitacaoOrcamento";
DROP TABLE public."StatusAtendimento";
DROP TABLE public."SolicitacaoOrcamento";
DROP TABLE public."PecaFalta";
DROP TABLE public."Loja";
DROP TABLE public."LogErro";
DROP SEQUENCE public."LogErroId_seq";
DROP TABLE public."GrupoUsuario";
DROP TABLE public."GrupoPermissao";
DROP TABLE public."Funcionario";
DROP TABLE public."FormaPagamentoClienteTipo";
DROP TABLE public."CondicaoPagamento";
DROP TABLE public."ClienteTipo";
DROP TABLE public."Cliente";
DROP TABLE public."AtendimentoObservacaoCadastral";
DROP TABLE public."AtendimentoObservacao";
DROP TABLE public."AtendimentoJustificativa";
DROP TABLE public."AtendimentoItemEstoque";
DROP TABLE public."AtendimentoItemDetalhes";
DROP TABLE public."AtendimentoItem";
DROP TABLE public."Atendimento";
DROP TABLE public."AreaTeleprecoPontoAtendimento";
DROP TABLE public."AreaTeleprecoFila";
DROP TABLE public."AreaTeleprecoAuxiliar";
DROP TABLE public."AreaTelepreco";
SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 216 (class 1259 OID 98602)
-- Name: AreaTelepreco; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AreaTelepreco" (
    "AreaTeleprecoId" uuid NOT NULL,
    "LojaId" integer NOT NULL,
    "Nome" character varying(500) NOT NULL,
    "Ativo" boolean NOT NULL,
    "UsuarioAtivacaoId" integer NOT NULL,
    "DataAtivacao" timestamp without time zone NOT NULL,
    "UsuarioCadastroId" integer NOT NULL,
    "DataCadastro" timestamp without time zone NOT NULL,
    "UsuarioUltimaAlteracaoId" integer,
    "DataUltimaAlteracao" timestamp without time zone
);


ALTER TABLE public."AreaTelepreco" OWNER TO desenv;

--
-- TOC entry 217 (class 1259 OID 98610)
-- Name: AreaTeleprecoAuxiliar; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AreaTeleprecoAuxiliar" (
    "AreaTeleprecoAuxiliarId" uuid NOT NULL,
    "AreaTeleprecoId" uuid NOT NULL,
    "LojaId" integer NOT NULL,
    "UsuarioAuxiliarId" integer NOT NULL
);


ALTER TABLE public."AreaTeleprecoAuxiliar" OWNER TO desenv;

--
-- TOC entry 218 (class 1259 OID 98615)
-- Name: AreaTeleprecoFila; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AreaTeleprecoFila" (
    "AreaTeleprecoFilaId" uuid NOT NULL,
    "AreaTeleprecoId" uuid NOT NULL,
    "LojaId" integer NOT NULL,
    "UsuarioOperadorId" integer NOT NULL,
    "AreaTeleprecoPontoAtendimentoId" uuid NOT NULL,
    "DataChamada" timestamp without time zone NOT NULL,
    "DataCancelamento" timestamp without time zone,
    "AreaTeleprecoAuxiliarId" uuid,
    "DataAceite" timestamp without time zone,
    "DataChegada" timestamp without time zone
);


ALTER TABLE public."AreaTeleprecoFila" OWNER TO desenv;

--
-- TOC entry 219 (class 1259 OID 98620)
-- Name: AreaTeleprecoPontoAtendimento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AreaTeleprecoPontoAtendimento" (
    "AreaTeleprecoPontoAtendimentoId" uuid NOT NULL,
    "AreaTeleprecoId" uuid NOT NULL,
    "LojaId" integer NOT NULL,
    "Numero" integer NOT NULL
);


ALTER TABLE public."AreaTeleprecoPontoAtendimento" OWNER TO desenv;

--
-- TOC entry 196 (class 1259 OID 49181)
-- Name: Atendimento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."Atendimento" (
    "LojaId" integer NOT NULL,
    "StatusAtendimento" integer NOT NULL,
    "TipoAtendimento" integer NOT NULL,
    "ValorTotal" numeric(10,3),
    "CondicaoPagamentoId" integer,
    "ObservacaoVendedor" character varying(2000),
    "ObservacaoCliente" character varying(2000),
    "ClienteCarregadoURA" boolean NOT NULL,
    "UsuarioOperadorId" integer NOT NULL,
    "DataInclusao" timestamp without time zone NOT NULL,
    "Numero" integer NOT NULL,
    "LojaInteresseId" integer,
    "ClienteId" uuid NOT NULL,
    "AtendimentoId" uuid NOT NULL,
    "DataVencimento" date
);


ALTER TABLE public."Atendimento" OWNER TO desenv;

--
-- TOC entry 205 (class 1259 OID 90138)
-- Name: AtendimentoItem; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AtendimentoItem" (
    "AtendimentoItemId" uuid NOT NULL,
    "AtendimentoId" uuid NOT NULL,
    "TipoItem" integer NOT NULL,
    "CodigoItem" integer,
    "Quantidade" integer NOT NULL,
    "ValorItem" numeric(10,3) NOT NULL,
    "ValorTotal" numeric(10,3) NOT NULL,
    "ValorComissao" numeric(10,3)
);


ALTER TABLE public."AtendimentoItem" OWNER TO desenv;

--
-- TOC entry 214 (class 1259 OID 98567)
-- Name: AtendimentoItemDetalhes; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AtendimentoItemDetalhes" (
    "AtendimentoItemId" uuid NOT NULL,
    "FabricanteCodigo" character(10) NOT NULL,
    "FabricanteDescricao" character varying(80) NOT NULL,
    "FabricanteCodigoReferencia" character varying(20),
    "ProdutoCodigo" character(4) NOT NULL,
    "ProdutoDescricao" character varying(25) NOT NULL,
    "PecaCodigo" character(4) NOT NULL,
    "PecaDescricao" character varying(45) NOT NULL
);


ALTER TABLE public."AtendimentoItemDetalhes" OWNER TO desenv;

--
-- TOC entry 215 (class 1259 OID 98587)
-- Name: AtendimentoItemEstoque; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AtendimentoItemEstoque" (
    "AtendimentoItemId" uuid NOT NULL,
    "LojaId" integer NOT NULL,
    "Quantidade" integer,
    "Valor" numeric(10,0),
    "Entrega" character varying(12),
    "Abastecido" boolean
);


ALTER TABLE public."AtendimentoItemEstoque" OWNER TO desenv;

--
-- TOC entry 203 (class 1259 OID 73807)
-- Name: AtendimentoJustificativa; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AtendimentoJustificativa" (
    "Id" uuid NOT NULL,
    "AtendimentoId" uuid,
    "UsuarioOperadorId" integer NOT NULL,
    "TipoMotivo" integer NOT NULL,
    "TelefoneCliente" character varying(15),
    "Texto" character varying(500) NOT NULL,
    "Data" timestamp without time zone NOT NULL
);


ALTER TABLE public."AtendimentoJustificativa" OWNER TO desenv;

--
-- TOC entry 201 (class 1259 OID 57399)
-- Name: AtendimentoObservacao; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AtendimentoObservacao" (
    "AtendimentoObservacaoCadastralId" integer NOT NULL,
    "AtendimentoId" uuid NOT NULL,
    "AtendimentoObservacaoId" uuid NOT NULL
);


ALTER TABLE public."AtendimentoObservacao" OWNER TO desenv;

--
-- TOC entry 202 (class 1259 OID 57404)
-- Name: AtendimentoObservacaoCadastral; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."AtendimentoObservacaoCadastral" (
    "AtendimentoObservacaoCadastralId" integer NOT NULL,
    "Descricao" character varying(50) NOT NULL,
    "Ativo" boolean NOT NULL
);


ALTER TABLE public."AtendimentoObservacaoCadastral" OWNER TO desenv;

--
-- TOC entry 200 (class 1259 OID 57371)
-- Name: Cliente; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."Cliente" (
    "Nome" character varying(150),
    "CpfCnpj" character varying(14),
    "Telefone" character varying(15),
    "Email" character varying(100),
    "ClienteId" uuid NOT NULL,
    "UltimoVeiculoPesquisado" integer,
    "UltimoAnoVeiculoPesquisado" integer,
    "DataUltimoVeiculoPesquisado" date,
    "FuncionarioId" integer,
    "ClienteTipoId" integer NOT NULL
);


ALTER TABLE public."Cliente" OWNER TO desenv;

--
-- TOC entry 209 (class 1259 OID 98409)
-- Name: ClienteTipo; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."ClienteTipo" (
    "ClienteTipoId" integer NOT NULL,
    "PessoaFisica" boolean NOT NULL,
    "Descricao" character varying(70) NOT NULL
);


ALTER TABLE public."ClienteTipo" OWNER TO desenv;

--
-- TOC entry 197 (class 1259 OID 49199)
-- Name: CondicaoPagamento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."CondicaoPagamento" (
    "CondicaoPagamentoId" integer NOT NULL,
    "Descricao" character(50) NOT NULL,
    "NumeroTotalParcelas" integer,
    "FormaPagamentoId" integer NOT NULL,
    "LojaId" integer NOT NULL,
    "Faturado" boolean NOT NULL
);


ALTER TABLE public."CondicaoPagamento" OWNER TO desenv;

--
-- TOC entry 211 (class 1259 OID 98427)
-- Name: FormaPagamentoClienteTipo; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."FormaPagamentoClienteTipo" (
    "FormaPagamentoClienteTipoId" integer NOT NULL,
    "FormaPagamentoId" integer NOT NULL,
    "ClienteTipoId" integer NOT NULL
);


ALTER TABLE public."FormaPagamentoClienteTipo" OWNER TO desenv;

--
-- TOC entry 210 (class 1259 OID 98414)
-- Name: Funcionario; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."Funcionario" (
    "FuncionarioId" integer NOT NULL,
    "NomeCompleto" character varying(151) NOT NULL,
    "NomeAbreviado" character varying(50) NOT NULL,
    "DataContratacao" timestamp without time zone,
    "Cpf" character varying(11) NOT NULL
);


ALTER TABLE public."Funcionario" OWNER TO desenv;

--
-- TOC entry 221 (class 1259 OID 98698)
-- Name: GrupoPermissao; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."GrupoPermissao" (
    "Id" integer NOT NULL,
    "GrupoPermissaoId" integer NOT NULL,
    "GrupoUsuarioId" integer NOT NULL,
    "FormularioId" integer NOT NULL,
    "FormularioNome" character varying(250) NOT NULL,
    "AcaoId" integer NOT NULL,
    "AcaoNome" character varying(50) NOT NULL,
    "Url" character varying(250)
);


ALTER TABLE public."GrupoPermissao" OWNER TO desenv;

--
-- TOC entry 220 (class 1259 OID 98692)
-- Name: GrupoUsuario; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."GrupoUsuario" (
    "Id" integer NOT NULL,
    "UsuarioId" integer NOT NULL,
    "GrupoUsuarioId" integer NOT NULL,
    "LojaId" integer NOT NULL
);


ALTER TABLE public."GrupoUsuario" OWNER TO desenv;

--
-- TOC entry 212 (class 1259 OID 98478)
-- Name: LogErroId_seq; Type: SEQUENCE; Schema: public; Owner: desenv
--

CREATE SEQUENCE public."LogErroId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public."LogErroId_seq" OWNER TO desenv;

--
-- TOC entry 213 (class 1259 OID 98480)
-- Name: LogErro; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."LogErro" (
    "LogErroId" integer DEFAULT nextval('public."LogErroId_seq"'::regclass) NOT NULL,
    "DataOcorrencia" timestamp without time zone NOT NULL,
    "LocalIpAddress" character varying(100),
    "RemoteIpAddress" character varying(100),
    "HttpErroCode" integer,
    "HttpErrorMessage" character varying(500),
    "ClassName" character varying(500),
    "Message" character varying(2000),
    "StackTraceString" character varying(4000),
    "Source" character varying(500),
    "LogErrorIdMainException" bigint
);


ALTER TABLE public."LogErro" OWNER TO desenv;

--
-- TOC entry 198 (class 1259 OID 49204)
-- Name: Loja; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."Loja" (
    "LojaId" integer NOT NULL,
    "Nome" character varying(70) NOT NULL
);


ALTER TABLE public."Loja" OWNER TO desenv;

--
-- TOC entry 204 (class 1259 OID 81936)
-- Name: PecaFalta; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."PecaFalta" (
    "PecaFaltaId" uuid NOT NULL,
    "LojaId" integer NOT NULL,
    "FabricanteId" integer,
    "ProdutoId" integer,
    "PecaId" integer,
    "UsuarioInclusaoId" integer NOT NULL,
    "Descricao" character varying(100),
    "Quantidade" integer NOT NULL,
    "DataInclusao" timestamp without time zone NOT NULL
);


ALTER TABLE public."PecaFalta" OWNER TO desenv;

--
-- TOC entry 206 (class 1259 OID 98333)
-- Name: SolicitacaoOrcamento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."SolicitacaoOrcamento" (
    "SolicitacaoOrcamentoId" uuid NOT NULL,
    "ClienteId" uuid NOT NULL,
    "LojaInteresseId" integer,
    "OperadorId" integer,
    "AtendimentoId" uuid,
    "DataCriacao" timestamp without time zone NOT NULL,
    "StatusId" integer,
    "Descricao" character varying(8000) NOT NULL,
    "MotivoCancelamento" character varying(500),
    "DataUltimaAlteracao" timestamp without time zone
);


ALTER TABLE public."SolicitacaoOrcamento" OWNER TO desenv;

--
-- TOC entry 207 (class 1259 OID 98352)
-- Name: StatusAtendimento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."StatusAtendimento" (
    "Id" integer NOT NULL,
    "Descricao" character varying(20) NOT NULL
);


ALTER TABLE public."StatusAtendimento" OWNER TO desenv;

--
-- TOC entry 208 (class 1259 OID 98362)
-- Name: StatusSolicitacaoOrcamento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."StatusSolicitacaoOrcamento" (
    "Id" integer NOT NULL,
    "Descricao" character varying(20) NOT NULL
);


ALTER TABLE public."StatusSolicitacaoOrcamento" OWNER TO desenv;

--
-- TOC entry 199 (class 1259 OID 57360)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."Usuario" (
    "UsuarioId" integer NOT NULL,
    "Nome" character varying(150) NOT NULL,
    "NomeAbreviado" character varying(50) NOT NULL,
    "Matricula" integer NOT NULL,
    "FuncionarioId" integer NOT NULL,
    "UsuarioTelefonia" character varying(40),
    "Login" character varying(40)
);


ALTER TABLE public."Usuario" OWNER TO desenv;

--
-- TOC entry 222 (class 1259 OID 99969)
-- Name: UsuarioSessao; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public."UsuarioSessao" (
    "UsuarioSessaoId" uuid NOT NULL,
    "UsuarioId" integer NOT NULL,
    "Key" character varying(200) NOT NULL,
    "Username" character varying(50) NOT NULL
);


ALTER TABLE public."UsuarioSessao" OWNER TO desenv;

--
-- TOC entry 223 (class 1259 OID 100132)
-- Name: area_telepreco; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.area_telepreco (
    area_telepreco_id uuid NOT NULL,
    loja_id integer NOT NULL,
    nome character varying(500) NOT NULL,
    ativo boolean NOT NULL,
    usuario_ativacao_id integer NOT NULL,
    data_ativacao timestamp without time zone NOT NULL,
    usuario_cadastro_id integer NOT NULL,
    data_cadastro timestamp without time zone NOT NULL,
    usuario_ultima_alteracao_id integer,
    data_ultima_alteracao timestamp without time zone
);


ALTER TABLE public.area_telepreco OWNER TO desenv;

--
-- TOC entry 224 (class 1259 OID 100138)
-- Name: area_telepreco_auxiliar; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.area_telepreco_auxiliar (
    area_telepreco_auxiliar_id uuid NOT NULL,
    area_telepreco_id uuid NOT NULL,
    loja_id integer NOT NULL,
    usuario_auxiliar_id integer NOT NULL
);


ALTER TABLE public.area_telepreco_auxiliar OWNER TO desenv;

--
-- TOC entry 225 (class 1259 OID 100141)
-- Name: area_telepreco_fila; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.area_telepreco_fila (
    area_telepreco_fila_id uuid NOT NULL,
    area_telepreco_id uuid NOT NULL,
    loja_id integer NOT NULL,
    usuario_operador_id integer NOT NULL,
    area_telepreco_ponto_atendimento_id uuid NOT NULL,
    data_chamada timestamp without time zone NOT NULL,
    data_cancelamento timestamp without time zone,
    area_telepreco_auxiliar_id uuid,
    data_aceite timestamp without time zone,
    data_chegada timestamp without time zone
);


ALTER TABLE public.area_telepreco_fila OWNER TO desenv;

--
-- TOC entry 226 (class 1259 OID 100144)
-- Name: area_telepreco_ponto_atendimento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.area_telepreco_ponto_atendimento (
    area_telepreco_ponto_atendimento_id uuid NOT NULL,
    area_telepreco_id uuid NOT NULL,
    loja_id integer NOT NULL,
    numero integer NOT NULL
);


ALTER TABLE public.area_telepreco_ponto_atendimento OWNER TO desenv;

--
-- TOC entry 227 (class 1259 OID 100147)
-- Name: atendimento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.atendimento (
    loja_id integer NOT NULL,
    status_atendimento integer NOT NULL,
    tipo_atendimento integer NOT NULL,
    valor_total numeric(10,3),
    condicao_pagamento_id integer,
    observacao_vendedor character varying(2000),
    observacao_cliente character varying(2000),
    cliente_carregado_u_r_a boolean NOT NULL,
    usuario_operador_id integer NOT NULL,
    data_inclusao timestamp without time zone NOT NULL,
    numero integer NOT NULL,
    loja_interesse_id integer,
    cliente_id uuid NOT NULL,
    atendimento_id uuid NOT NULL,
    data_vencimento date
);


ALTER TABLE public.atendimento OWNER TO desenv;

--
-- TOC entry 228 (class 1259 OID 100153)
-- Name: atendimento_item; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.atendimento_item (
    atendimento_item_id uuid NOT NULL,
    atendimento_id uuid NOT NULL,
    tipo_item integer NOT NULL,
    codigo_item integer,
    quantidade integer NOT NULL,
    valor_item numeric(10,3) NOT NULL,
    valor_total numeric(10,3) NOT NULL,
    valor_comissao numeric(10,3)
);


ALTER TABLE public.atendimento_item OWNER TO desenv;

--
-- TOC entry 229 (class 1259 OID 100156)
-- Name: atendimento_item_detalhes; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.atendimento_item_detalhes (
    atendimento_item_id uuid NOT NULL,
    fabricante_codigo character(10) NOT NULL,
    fabricante_descricao character varying(80) NOT NULL,
    fabricante_codigo_referencia character varying(20),
    produto_codigo character(4) NOT NULL,
    produto_descricao character varying(25) NOT NULL,
    peca_codigo character(4) NOT NULL,
    peca_descricao character varying(45) NOT NULL
);


ALTER TABLE public.atendimento_item_detalhes OWNER TO desenv;

--
-- TOC entry 230 (class 1259 OID 100159)
-- Name: atendimento_item_estoque; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.atendimento_item_estoque (
    atendimento_item_id uuid NOT NULL,
    loja_id integer NOT NULL,
    quantidade integer,
    valor numeric(10,0),
    entrega character varying(12),
    abastecido boolean
);


ALTER TABLE public.atendimento_item_estoque OWNER TO desenv;

--
-- TOC entry 231 (class 1259 OID 100162)
-- Name: atendimento_justificativa; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.atendimento_justificativa (
    id uuid NOT NULL,
    atendimento_id uuid,
    usuario_operador_id integer NOT NULL,
    tipo_motivo integer NOT NULL,
    telefone_cliente character varying(15),
    texto character varying(500) NOT NULL,
    data timestamp without time zone NOT NULL
);


ALTER TABLE public.atendimento_justificativa OWNER TO desenv;

--
-- TOC entry 232 (class 1259 OID 100168)
-- Name: atendimento_observacao; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.atendimento_observacao (
    atendimento_observacao_cadastral_id integer NOT NULL,
    atendimento_id uuid NOT NULL,
    atendimento_observacao_id uuid NOT NULL
);


ALTER TABLE public.atendimento_observacao OWNER TO desenv;

--
-- TOC entry 233 (class 1259 OID 100171)
-- Name: atendimento_observacao_cadastral; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.atendimento_observacao_cadastral (
    atendimento_observacao_cadastral_id integer NOT NULL,
    descricao character varying(50) NOT NULL,
    ativo boolean NOT NULL
);


ALTER TABLE public.atendimento_observacao_cadastral OWNER TO desenv;

--
-- TOC entry 234 (class 1259 OID 100174)
-- Name: cliente; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.cliente (
    nome character varying(150),
    cpf_cnpj character varying(14),
    telefone character varying(15),
    email character varying(100),
    cliente_id uuid NOT NULL,
    ultimo_veiculo_pesquisado integer,
    ultimo_ano_veiculo_pesquisado integer,
    data_ultimo_veiculo_pesquisado date,
    funcionario_id integer,
    cliente_tipo_id integer NOT NULL
);


ALTER TABLE public.cliente OWNER TO desenv;

--
-- TOC entry 235 (class 1259 OID 100177)
-- Name: cliente_tipo; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.cliente_tipo (
    cliente_tipo_id integer NOT NULL,
    pessoa_fisica boolean NOT NULL,
    descricao character varying(70) NOT NULL
);


ALTER TABLE public.cliente_tipo OWNER TO desenv;

--
-- TOC entry 236 (class 1259 OID 100180)
-- Name: condicao_pagamento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.condicao_pagamento (
    condicao_pagamento_id integer NOT NULL,
    descricao character(50) NOT NULL,
    numero_total_parcelas integer,
    forma_pagamento_id integer NOT NULL,
    loja_id integer NOT NULL,
    faturado boolean NOT NULL
);


ALTER TABLE public.condicao_pagamento OWNER TO desenv;

--
-- TOC entry 237 (class 1259 OID 100183)
-- Name: forma_pagamento_cliente_tipo; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.forma_pagamento_cliente_tipo (
    forma_pagamento_cliente_tipo_id integer NOT NULL,
    forma_pagamento_id integer NOT NULL,
    cliente_tipo_id integer NOT NULL
);


ALTER TABLE public.forma_pagamento_cliente_tipo OWNER TO desenv;

--
-- TOC entry 238 (class 1259 OID 100186)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.funcionario (
    funcionario_id integer NOT NULL,
    nome_completo character varying(151) NOT NULL,
    nome_abreviado character varying(50) NOT NULL,
    data_contratacao timestamp without time zone,
    cpf character varying(11) NOT NULL
);


ALTER TABLE public.funcionario OWNER TO desenv;

--
-- TOC entry 239 (class 1259 OID 100189)
-- Name: grupo_permissao; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.grupo_permissao (
    id integer NOT NULL,
    grupo_permissao_id integer NOT NULL,
    grupo_usuario_id integer NOT NULL,
    formulario_id integer NOT NULL,
    formulario_nome character varying(250) NOT NULL,
    acao_id integer NOT NULL,
    acao_nome character varying(50) NOT NULL,
    url character varying(250)
);


ALTER TABLE public.grupo_permissao OWNER TO desenv;

--
-- TOC entry 240 (class 1259 OID 100195)
-- Name: grupo_usuario; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.grupo_usuario (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    grupo_usuario_id integer NOT NULL,
    loja_id integer NOT NULL
);


ALTER TABLE public.grupo_usuario OWNER TO desenv;

--
-- TOC entry 241 (class 1259 OID 100198)
-- Name: log_erro_id_seq; Type: SEQUENCE; Schema: public; Owner: desenv
--

CREATE SEQUENCE public.log_erro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.log_erro_id_seq OWNER TO desenv;

--
-- TOC entry 242 (class 1259 OID 100200)
-- Name: log_erro; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.log_erro (
    log_erro_id integer DEFAULT nextval('public.log_erro_id_seq'::regclass) NOT NULL,
    data_ocorrencia timestamp without time zone NOT NULL,
    local_ip_address character varying(100),
    remote_ip_address character varying(100),
    http_erro_code integer,
    http_error_message character varying(500),
    class_name character varying(500),
    message character varying(2000),
    stack_trace_string character varying(4000),
    source character varying(500),
    log_error_id_main_exception bigint
);


ALTER TABLE public.log_erro OWNER TO desenv;

--
-- TOC entry 243 (class 1259 OID 100207)
-- Name: loja; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.loja (
    loja_id integer NOT NULL,
    nome character varying(70) NOT NULL
);


ALTER TABLE public.loja OWNER TO desenv;

--
-- TOC entry 244 (class 1259 OID 100210)
-- Name: peca_falta; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.peca_falta (
    peca_falta_id uuid NOT NULL,
    loja_id integer NOT NULL,
    fabricante_id integer,
    produto_id integer,
    peca_id integer,
    usuario_inclusao_id integer NOT NULL,
    descricao character varying(100),
    quantidade integer NOT NULL,
    data_inclusao timestamp without time zone NOT NULL
);


ALTER TABLE public.peca_falta OWNER TO desenv;

--
-- TOC entry 245 (class 1259 OID 100213)
-- Name: solicitacao_orcamento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.solicitacao_orcamento (
    solicitacao_orcamento_id uuid NOT NULL,
    cliente_id uuid NOT NULL,
    loja_interesse_id integer,
    operador_id integer,
    atendimento_id uuid,
    data_criacao timestamp without time zone NOT NULL,
    status_id integer,
    descricao character varying(8000) NOT NULL,
    motivo_cancelamento character varying(500),
    data_ultima_alteracao timestamp without time zone
);


ALTER TABLE public.solicitacao_orcamento OWNER TO desenv;

--
-- TOC entry 246 (class 1259 OID 100219)
-- Name: status_atendimento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.status_atendimento (
    id integer NOT NULL,
    descricao character varying(20) NOT NULL
);


ALTER TABLE public.status_atendimento OWNER TO desenv;

--
-- TOC entry 247 (class 1259 OID 100222)
-- Name: status_solicitacao_orcamento; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.status_solicitacao_orcamento (
    id integer NOT NULL,
    descricao character varying(20) NOT NULL
);


ALTER TABLE public.status_solicitacao_orcamento OWNER TO desenv;

--
-- TOC entry 248 (class 1259 OID 100225)
-- Name: usuario; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.usuario (
    usuario_id integer NOT NULL,
    nome character varying(150) NOT NULL,
    nome_abreviado character varying(50) NOT NULL,
    matricula integer NOT NULL,
    funcionario_id integer NOT NULL,
    usuario_telefonia character varying(40),
    login character varying(40)
);


ALTER TABLE public.usuario OWNER TO desenv;

--
-- TOC entry 249 (class 1259 OID 100228)
-- Name: usuario_sessao; Type: TABLE; Schema: public; Owner: desenv
--

CREATE TABLE public.usuario_sessao (
    usuario_sessao_id uuid NOT NULL,
    usuario_id integer NOT NULL,
    key character varying(200) NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.usuario_sessao OWNER TO desenv;

--
-- TOC entry 3812 (class 2606 OID 98488)
-- Name: LogErro LogErro_pkey; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."LogErro"
    ADD CONSTRAINT "LogErro_pkey" PRIMARY KEY ("LogErroId");


--
-- TOC entry 3794 (class 2606 OID 73814)
-- Name: AtendimentoJustificativa PK12; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoJustificativa"
    ADD CONSTRAINT "PK12" PRIMARY KEY ("Id");


--
-- TOC entry 3796 (class 2606 OID 81940)
-- Name: PecaFalta PK14; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."PecaFalta"
    ADD CONSTRAINT "PK14" PRIMARY KEY ("PecaFaltaId");


--
-- TOC entry 3800 (class 2606 OID 98340)
-- Name: SolicitacaoOrcamento PK16; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."SolicitacaoOrcamento"
    ADD CONSTRAINT "PK16" PRIMARY KEY ("SolicitacaoOrcamentoId");


--
-- TOC entry 3804 (class 2606 OID 98366)
-- Name: StatusSolicitacaoOrcamento PK18; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."StatusSolicitacaoOrcamento"
    ADD CONSTRAINT "PK18" PRIMARY KEY ("Id");


--
-- TOC entry 3802 (class 2606 OID 98356)
-- Name: StatusAtendimento PK19; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."StatusAtendimento"
    ADD CONSTRAINT "PK19" PRIMARY KEY ("Id");


--
-- TOC entry 3808 (class 2606 OID 98418)
-- Name: Funcionario PK24; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Funcionario"
    ADD CONSTRAINT "PK24" PRIMARY KEY ("FuncionarioId");


--
-- TOC entry 3810 (class 2606 OID 98431)
-- Name: FormaPagamentoClienteTipo PK26; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."FormaPagamentoClienteTipo"
    ADD CONSTRAINT "PK26" PRIMARY KEY ("FormaPagamentoClienteTipoId");


--
-- TOC entry 3818 (class 2606 OID 98609)
-- Name: AreaTelepreco PK29; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTelepreco"
    ADD CONSTRAINT "PK29" PRIMARY KEY ("AreaTeleprecoId");


--
-- TOC entry 3822 (class 2606 OID 98619)
-- Name: AreaTeleprecoFila PK30; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "PK30" PRIMARY KEY ("AreaTeleprecoFilaId");


--
-- TOC entry 3824 (class 2606 OID 98624)
-- Name: AreaTeleprecoPontoAtendimento PK31; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoPontoAtendimento"
    ADD CONSTRAINT "PK31" PRIMARY KEY ("AreaTeleprecoPontoAtendimentoId");


--
-- TOC entry 3820 (class 2606 OID 98614)
-- Name: AreaTeleprecoAuxiliar PK32; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoAuxiliar"
    ADD CONSTRAINT "PK32" PRIMARY KEY ("AreaTeleprecoAuxiliarId");


--
-- TOC entry 3814 (class 2606 OID 98571)
-- Name: AtendimentoItemDetalhes PK38; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemDetalhes"
    ADD CONSTRAINT "PK38" PRIMARY KEY ("AtendimentoItemId");


--
-- TOC entry 3816 (class 2606 OID 98591)
-- Name: AtendimentoItemEstoque PK40; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemEstoque"
    ADD CONSTRAINT "PK40" PRIMARY KEY ("AtendimentoItemId", "LojaId");


--
-- TOC entry 3828 (class 2606 OID 98705)
-- Name: GrupoPermissao PK42; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."GrupoPermissao"
    ADD CONSTRAINT "PK42" PRIMARY KEY ("Id");


--
-- TOC entry 3826 (class 2606 OID 98696)
-- Name: GrupoUsuario PK43; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."GrupoUsuario"
    ADD CONSTRAINT "PK43" PRIMARY KEY ("Id");


--
-- TOC entry 3792 (class 2606 OID 57408)
-- Name: AtendimentoObservacaoCadastral PK9; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoObservacaoCadastral"
    ADD CONSTRAINT "PK9" PRIMARY KEY ("AtendimentoObservacaoCadastralId");


--
-- TOC entry 3780 (class 2606 OID 73783)
-- Name: Atendimento PK_Atendimento; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "PK_Atendimento" PRIMARY KEY ("AtendimentoId");


--
-- TOC entry 3798 (class 2606 OID 90142)
-- Name: AtendimentoItem PK_AtendimentoItem; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItem"
    ADD CONSTRAINT "PK_AtendimentoItem" PRIMARY KEY ("AtendimentoItemId");


--
-- TOC entry 3788 (class 2606 OID 73762)
-- Name: Cliente PK_Cliente; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "PK_Cliente" PRIMARY KEY ("ClienteId");


--
-- TOC entry 3782 (class 2606 OID 49203)
-- Name: CondicaoPagamento PK_CondicaoPagamento; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."CondicaoPagamento"
    ADD CONSTRAINT "PK_CondicaoPagamento" PRIMARY KEY ("CondicaoPagamentoId");


--
-- TOC entry 3784 (class 2606 OID 49208)
-- Name: Loja PK_Loja; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Loja"
    ADD CONSTRAINT "PK_Loja" PRIMARY KEY ("LojaId");


--
-- TOC entry 3786 (class 2606 OID 57364)
-- Name: Usuario PK_Operador; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "PK_Operador" PRIMARY KEY ("UsuarioId");


--
-- TOC entry 3790 (class 2606 OID 73828)
-- Name: AtendimentoObservacao Pk_AtendimentoObservacao; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoObservacao"
    ADD CONSTRAINT "Pk_AtendimentoObservacao" PRIMARY KEY ("AtendimentoObservacaoId");


--
-- TOC entry 3830 (class 2606 OID 99973)
-- Name: UsuarioSessao UsuarioSessao_pkey; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."UsuarioSessao"
    ADD CONSTRAINT "UsuarioSessao_pkey" PRIMARY KEY ("UsuarioSessaoId");


--
-- TOC entry 3806 (class 2606 OID 98413)
-- Name: ClienteTipo pk22; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."ClienteTipo"
    ADD CONSTRAINT pk22 PRIMARY KEY ("ClienteTipoId");


--
-- TOC entry 3775 (class 1259 OID 73776)
-- Name: AK_AtendimentoNumero; Type: INDEX; Schema: public; Owner: desenv
--

CREATE UNIQUE INDEX "AK_AtendimentoNumero" ON public."Atendimento" USING btree ("Numero");


--
-- TOC entry 3776 (class 1259 OID 49216)
-- Name: FK_CondicaoPagto_Atendimento; Type: INDEX; Schema: public; Owner: desenv
--

CREATE INDEX "FK_CondicaoPagto_Atendimento" ON public."Atendimento" USING btree ("CondicaoPagamentoId");


--
-- TOC entry 3777 (class 1259 OID 49214)
-- Name: FK_Loja_Atendimento; Type: INDEX; Schema: public; Owner: desenv
--

CREATE INDEX "FK_Loja_Atendimento" ON public."Atendimento" USING btree ("LojaId");


--
-- TOC entry 3778 (class 1259 OID 49217)
-- Name: FK_Operador_Atendimento; Type: INDEX; Schema: public; Owner: desenv
--

CREATE INDEX "FK_Operador_Atendimento" ON public."Atendimento" USING btree ("UsuarioOperadorId");


--
-- TOC entry 3831 (class 2606 OID 49224)
-- Name: Atendimento FK_CondicaoPagto_Atendimento; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "FK_CondicaoPagto_Atendimento" FOREIGN KEY ("CondicaoPagamentoId") REFERENCES public."CondicaoPagamento"("CondicaoPagamentoId");


--
-- TOC entry 3832 (class 2606 OID 49229)
-- Name: Atendimento FK_Loja_Atendimento; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "FK_Loja_Atendimento" FOREIGN KEY ("LojaId") REFERENCES public."Loja"("LojaId");


--
-- TOC entry 3833 (class 2606 OID 57365)
-- Name: Atendimento FK_Operador_Atendimento; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "FK_Operador_Atendimento" FOREIGN KEY ("UsuarioOperadorId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3852 (class 2606 OID 98645)
-- Name: AreaTeleprecoAuxiliar RefAreaTelepreco80; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoAuxiliar"
    ADD CONSTRAINT "RefAreaTelepreco80" FOREIGN KEY ("AreaTeleprecoId") REFERENCES public."AreaTelepreco"("AreaTeleprecoId");


--
-- TOC entry 3856 (class 2606 OID 98665)
-- Name: AreaTeleprecoFila RefAreaTelepreco84; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "RefAreaTelepreco84" FOREIGN KEY ("AreaTeleprecoId") REFERENCES public."AreaTelepreco"("AreaTeleprecoId");


--
-- TOC entry 3857 (class 2606 OID 98670)
-- Name: AreaTeleprecoPontoAtendimento RefAreaTelepreco85; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoPontoAtendimento"
    ADD CONSTRAINT "RefAreaTelepreco85" FOREIGN KEY ("AreaTeleprecoId") REFERENCES public."AreaTelepreco"("AreaTeleprecoId");


--
-- TOC entry 3853 (class 2606 OID 98650)
-- Name: AreaTeleprecoFila RefAreaTeleprecoAuxiliar81; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "RefAreaTeleprecoAuxiliar81" FOREIGN KEY ("AreaTeleprecoAuxiliarId") REFERENCES public."AreaTeleprecoAuxiliar"("AreaTeleprecoAuxiliarId");


--
-- TOC entry 3854 (class 2606 OID 98655)
-- Name: AreaTeleprecoFila RefAreaTeleprecoPontoAtendimento82; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "RefAreaTeleprecoPontoAtendimento82" FOREIGN KEY ("AreaTeleprecoPontoAtendimentoId") REFERENCES public."AreaTeleprecoPontoAtendimento"("AreaTeleprecoPontoAtendimentoId");


--
-- TOC entry 3839 (class 2606 OID 73820)
-- Name: AtendimentoJustificativa RefAtendimento24; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoJustificativa"
    ADD CONSTRAINT "RefAtendimento24" FOREIGN KEY ("AtendimentoId") REFERENCES public."Atendimento"("AtendimentoId");


--
-- TOC entry 3842 (class 2606 OID 98341)
-- Name: SolicitacaoOrcamento RefAtendimento34; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."SolicitacaoOrcamento"
    ADD CONSTRAINT "RefAtendimento34" FOREIGN KEY ("AtendimentoId") REFERENCES public."Atendimento"("AtendimentoId");


--
-- TOC entry 3841 (class 2606 OID 90143)
-- Name: AtendimentoItem RefAtendimento6; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItem"
    ADD CONSTRAINT "RefAtendimento6" FOREIGN KEY ("AtendimentoId") REFERENCES public."Atendimento"("AtendimentoId");


--
-- TOC entry 3845 (class 2606 OID 98572)
-- Name: AtendimentoItemDetalhes RefAtendimentoItem89; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemDetalhes"
    ADD CONSTRAINT "RefAtendimentoItem89" FOREIGN KEY ("AtendimentoItemId") REFERENCES public."AtendimentoItem"("AtendimentoItemId");


--
-- TOC entry 3847 (class 2606 OID 98597)
-- Name: AtendimentoItemEstoque RefAtendimentoItem941; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemEstoque"
    ADD CONSTRAINT "RefAtendimentoItem941" FOREIGN KEY ("AtendimentoItemId") REFERENCES public."AtendimentoItem"("AtendimentoItemId");


--
-- TOC entry 3836 (class 2606 OID 57409)
-- Name: AtendimentoObservacao RefAtendimentoObservacaoCadastral141; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoObservacao"
    ADD CONSTRAINT "RefAtendimentoObservacaoCadastral141" FOREIGN KEY ("AtendimentoObservacaoCadastralId") REFERENCES public."AtendimentoObservacaoCadastral"("AtendimentoObservacaoCadastralId");


--
-- TOC entry 3843 (class 2606 OID 98432)
-- Name: FormaPagamentoClienteTipo RefClienteTipo63; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."FormaPagamentoClienteTipo"
    ADD CONSTRAINT "RefClienteTipo63" FOREIGN KEY ("ClienteTipoId") REFERENCES public."ClienteTipo"("ClienteTipoId");


--
-- TOC entry 3840 (class 2606 OID 81946)
-- Name: PecaFalta RefLoja29; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."PecaFalta"
    ADD CONSTRAINT "RefLoja29" FOREIGN KEY ("LojaId") REFERENCES public."Loja"("LojaId");


--
-- TOC entry 3846 (class 2606 OID 98592)
-- Name: AtendimentoItemEstoque RefLoja931; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemEstoque"
    ADD CONSTRAINT "RefLoja931" FOREIGN KEY ("LojaId") REFERENCES public."Loja"("LojaId");


--
-- TOC entry 3838 (class 2606 OID 73815)
-- Name: AtendimentoJustificativa RefOperador22; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoJustificativa"
    ADD CONSTRAINT "RefOperador22" FOREIGN KEY ("UsuarioOperadorId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3848 (class 2606 OID 98625)
-- Name: AreaTelepreco RefOperador76; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTelepreco"
    ADD CONSTRAINT "RefOperador76" FOREIGN KEY ("UsuarioCadastroId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3849 (class 2606 OID 98630)
-- Name: AreaTelepreco RefOperador77; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTelepreco"
    ADD CONSTRAINT "RefOperador77" FOREIGN KEY ("UsuarioUltimaAlteracaoId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3850 (class 2606 OID 98635)
-- Name: AreaTelepreco RefOperador78; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTelepreco"
    ADD CONSTRAINT "RefOperador78" FOREIGN KEY ("UsuarioAtivacaoId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3851 (class 2606 OID 98640)
-- Name: AreaTeleprecoAuxiliar RefOperador79; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoAuxiliar"
    ADD CONSTRAINT "RefOperador79" FOREIGN KEY ("UsuarioAuxiliarId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3855 (class 2606 OID 98660)
-- Name: AreaTeleprecoFila RefOperador83; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "RefOperador83" FOREIGN KEY ("UsuarioOperadorId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3835 (class 2606 OID 98357)
-- Name: Atendimento RefStatusAtendimento48; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "RefStatusAtendimento48" FOREIGN KEY ("StatusAtendimento") REFERENCES public."StatusAtendimento"("Id");


--
-- TOC entry 3837 (class 2606 OID 73802)
-- Name: AtendimentoObservacao fk_atendimento_atendobs; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoObservacao"
    ADD CONSTRAINT fk_atendimento_atendobs FOREIGN KEY ("AtendimentoId") REFERENCES public."Atendimento"("AtendimentoId") MATCH FULL;


--
-- TOC entry 3834 (class 2606 OID 73763)
-- Name: Atendimento fk_cliente_atendimento; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT fk_cliente_atendimento FOREIGN KEY ("ClienteId") REFERENCES public."Cliente"("ClienteId") MATCH FULL;


--
-- TOC entry 3844 (class 2606 OID 98489)
-- Name: LogErro log_error_main_fk; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."LogErro"
    ADD CONSTRAINT log_error_main_fk FOREIGN KEY ("LogErrorIdMainException") REFERENCES public."LogErro"("LogErroId");


--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE "AreaTelepreco"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AreaTelepreco" TO PUBLIC;


--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE "AreaTeleprecoAuxiliar"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AreaTeleprecoAuxiliar" TO PUBLIC;


--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "AreaTeleprecoFila"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AreaTeleprecoFila" TO PUBLIC;


--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "AreaTeleprecoPontoAtendimento"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AreaTeleprecoPontoAtendimento" TO PUBLIC;


--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE "AtendimentoItem"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoItem" TO PUBLIC;


--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE "AtendimentoItemDetalhes"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoItemDetalhes" TO PUBLIC;


--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE "AtendimentoItemEstoque"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoItemEstoque" TO PUBLIC;


--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE "AtendimentoJustificativa"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoJustificativa" TO PUBLIC;


--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE "AtendimentoObservacao"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoObservacao" TO PUBLIC;


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE "AtendimentoObservacaoCadastral"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoObservacaoCadastral" TO PUBLIC;


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE "Cliente"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."Cliente" TO PUBLIC;


--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE "ClienteTipo"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."ClienteTipo" TO PUBLIC;


--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE "FormaPagamentoClienteTipo"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."FormaPagamentoClienteTipo" TO PUBLIC;


--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE "Funcionario"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."Funcionario" TO PUBLIC;


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE "GrupoPermissao"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."GrupoPermissao" TO PUBLIC;


--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "GrupoUsuario"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."GrupoUsuario" TO PUBLIC;


--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE "LogErro"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."LogErro" TO PUBLIC;


--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE "PecaFalta"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."PecaFalta" TO PUBLIC;


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE "SolicitacaoOrcamento"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."SolicitacaoOrcamento" TO PUBLIC;


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE "StatusAtendimento"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."StatusAtendimento" TO PUBLIC;


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE "StatusSolicitacaoOrcamento"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."StatusSolicitacaoOrcamento" TO PUBLIC;


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "UsuarioSessao"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."UsuarioSessao" TO PUBLIC;


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE area_telepreco; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.area_telepreco TO PUBLIC;


--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE area_telepreco_auxiliar; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.area_telepreco_auxiliar TO PUBLIC;


--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE area_telepreco_fila; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.area_telepreco_fila TO PUBLIC;


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE area_telepreco_ponto_atendimento; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.area_telepreco_ponto_atendimento TO PUBLIC;


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE atendimento; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.atendimento TO PUBLIC;


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE atendimento_item; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.atendimento_item TO PUBLIC;


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE atendimento_item_detalhes; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.atendimento_item_detalhes TO PUBLIC;


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE atendimento_item_estoque; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.atendimento_item_estoque TO PUBLIC;


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE atendimento_justificativa; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.atendimento_justificativa TO PUBLIC;


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE atendimento_observacao; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.atendimento_observacao TO PUBLIC;


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE atendimento_observacao_cadastral; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.atendimento_observacao_cadastral TO PUBLIC;


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE cliente; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.cliente TO PUBLIC;


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE cliente_tipo; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.cliente_tipo TO PUBLIC;


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE condicao_pagamento; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.condicao_pagamento TO PUBLIC;


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE forma_pagamento_cliente_tipo; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.forma_pagamento_cliente_tipo TO PUBLIC;


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE funcionario; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.funcionario TO PUBLIC;


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE grupo_permissao; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.grupo_permissao TO PUBLIC;


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE grupo_usuario; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.grupo_usuario TO PUBLIC;


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE log_erro; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.log_erro TO PUBLIC;


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE loja; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.loja TO PUBLIC;


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE peca_falta; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.peca_falta TO PUBLIC;


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE solicitacao_orcamento; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.solicitacao_orcamento TO PUBLIC;


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE status_atendimento; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.status_atendimento TO PUBLIC;


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE status_solicitacao_orcamento; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.status_solicitacao_orcamento TO PUBLIC;


--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE usuario; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.usuario TO PUBLIC;


--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE usuario_sessao; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public.usuario_sessao TO PUBLIC;


--
-- TOC entry 1895 (class 826 OID 57370)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: desenv
--

ALTER DEFAULT PRIVILEGES FOR ROLE desenv IN SCHEMA public REVOKE ALL ON TABLES  FROM desenv;
ALTER DEFAULT PRIVILEGES FOR ROLE desenv IN SCHEMA public GRANT ALL ON TABLES  TO PUBLIC;


-- Completed on 2019-05-28 16:12:25

--
-- PostgreSQL database dump complete
--

