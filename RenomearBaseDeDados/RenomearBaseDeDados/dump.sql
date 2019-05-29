--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-05-28 15:39:03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- TOC entry 3699 (class 2606 OID 98488)
-- Name: LogErro LogErro_pkey; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."LogErro"
    ADD CONSTRAINT "LogErro_pkey" PRIMARY KEY ("LogErroId");


--
-- TOC entry 3681 (class 2606 OID 73814)
-- Name: AtendimentoJustificativa PK12; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoJustificativa"
    ADD CONSTRAINT "PK12" PRIMARY KEY ("Id");


--
-- TOC entry 3683 (class 2606 OID 81940)
-- Name: PecaFalta PK14; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."PecaFalta"
    ADD CONSTRAINT "PK14" PRIMARY KEY ("PecaFaltaId");


--
-- TOC entry 3687 (class 2606 OID 98340)
-- Name: SolicitacaoOrcamento PK16; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."SolicitacaoOrcamento"
    ADD CONSTRAINT "PK16" PRIMARY KEY ("SolicitacaoOrcamentoId");


--
-- TOC entry 3691 (class 2606 OID 98366)
-- Name: StatusSolicitacaoOrcamento PK18; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."StatusSolicitacaoOrcamento"
    ADD CONSTRAINT "PK18" PRIMARY KEY ("Id");


--
-- TOC entry 3689 (class 2606 OID 98356)
-- Name: StatusAtendimento PK19; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."StatusAtendimento"
    ADD CONSTRAINT "PK19" PRIMARY KEY ("Id");


--
-- TOC entry 3695 (class 2606 OID 98418)
-- Name: Funcionario PK24; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Funcionario"
    ADD CONSTRAINT "PK24" PRIMARY KEY ("FuncionarioId");


--
-- TOC entry 3697 (class 2606 OID 98431)
-- Name: FormaPagamentoClienteTipo PK26; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."FormaPagamentoClienteTipo"
    ADD CONSTRAINT "PK26" PRIMARY KEY ("FormaPagamentoClienteTipoId");


--
-- TOC entry 3705 (class 2606 OID 98609)
-- Name: AreaTelepreco PK29; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTelepreco"
    ADD CONSTRAINT "PK29" PRIMARY KEY ("AreaTeleprecoId");


--
-- TOC entry 3709 (class 2606 OID 98619)
-- Name: AreaTeleprecoFila PK30; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "PK30" PRIMARY KEY ("AreaTeleprecoFilaId");


--
-- TOC entry 3711 (class 2606 OID 98624)
-- Name: AreaTeleprecoPontoAtendimento PK31; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoPontoAtendimento"
    ADD CONSTRAINT "PK31" PRIMARY KEY ("AreaTeleprecoPontoAtendimentoId");


--
-- TOC entry 3707 (class 2606 OID 98614)
-- Name: AreaTeleprecoAuxiliar PK32; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoAuxiliar"
    ADD CONSTRAINT "PK32" PRIMARY KEY ("AreaTeleprecoAuxiliarId");


--
-- TOC entry 3701 (class 2606 OID 98571)
-- Name: AtendimentoItemDetalhes PK38; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemDetalhes"
    ADD CONSTRAINT "PK38" PRIMARY KEY ("AtendimentoItemId");


--
-- TOC entry 3703 (class 2606 OID 98591)
-- Name: AtendimentoItemEstoque PK40; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemEstoque"
    ADD CONSTRAINT "PK40" PRIMARY KEY ("AtendimentoItemId", "LojaId");


--
-- TOC entry 3715 (class 2606 OID 98705)
-- Name: GrupoPermissao PK42; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."GrupoPermissao"
    ADD CONSTRAINT "PK42" PRIMARY KEY ("Id");


--
-- TOC entry 3713 (class 2606 OID 98696)
-- Name: GrupoUsuario PK43; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."GrupoUsuario"
    ADD CONSTRAINT "PK43" PRIMARY KEY ("Id");


--
-- TOC entry 3679 (class 2606 OID 57408)
-- Name: AtendimentoObservacaoCadastral PK9; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoObservacaoCadastral"
    ADD CONSTRAINT "PK9" PRIMARY KEY ("AtendimentoObservacaoCadastralId");


--
-- TOC entry 3667 (class 2606 OID 73783)
-- Name: Atendimento PK_Atendimento; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "PK_Atendimento" PRIMARY KEY ("AtendimentoId");


--
-- TOC entry 3685 (class 2606 OID 90142)
-- Name: AtendimentoItem PK_AtendimentoItem; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItem"
    ADD CONSTRAINT "PK_AtendimentoItem" PRIMARY KEY ("AtendimentoItemId");


--
-- TOC entry 3675 (class 2606 OID 73762)
-- Name: Cliente PK_Cliente; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "PK_Cliente" PRIMARY KEY ("ClienteId");


--
-- TOC entry 3669 (class 2606 OID 49203)
-- Name: CondicaoPagamento PK_CondicaoPagamento; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."CondicaoPagamento"
    ADD CONSTRAINT "PK_CondicaoPagamento" PRIMARY KEY ("CondicaoPagamentoId");


--
-- TOC entry 3671 (class 2606 OID 49208)
-- Name: Loja PK_Loja; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Loja"
    ADD CONSTRAINT "PK_Loja" PRIMARY KEY ("LojaId");


--
-- TOC entry 3673 (class 2606 OID 57364)
-- Name: Usuario PK_Operador; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "PK_Operador" PRIMARY KEY ("UsuarioId");


--
-- TOC entry 3677 (class 2606 OID 73828)
-- Name: AtendimentoObservacao Pk_AtendimentoObservacao; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoObservacao"
    ADD CONSTRAINT "Pk_AtendimentoObservacao" PRIMARY KEY ("AtendimentoObservacaoId");


--
-- TOC entry 3717 (class 2606 OID 99973)
-- Name: UsuarioSessao UsuarioSessao_pkey; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."UsuarioSessao"
    ADD CONSTRAINT "UsuarioSessao_pkey" PRIMARY KEY ("UsuarioSessaoId");


--
-- TOC entry 3693 (class 2606 OID 98413)
-- Name: ClienteTipo pk22; Type: CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."ClienteTipo"
    ADD CONSTRAINT pk22 PRIMARY KEY ("ClienteTipoId");


--
-- TOC entry 3662 (class 1259 OID 73776)
-- Name: AK_AtendimentoNumero; Type: INDEX; Schema: public; Owner: desenv
--

CREATE UNIQUE INDEX "AK_AtendimentoNumero" ON public."Atendimento" USING btree ("Numero");


--
-- TOC entry 3663 (class 1259 OID 49216)
-- Name: FK_CondicaoPagto_Atendimento; Type: INDEX; Schema: public; Owner: desenv
--

CREATE INDEX "FK_CondicaoPagto_Atendimento" ON public."Atendimento" USING btree ("CondicaoPagamentoId");


--
-- TOC entry 3664 (class 1259 OID 49214)
-- Name: FK_Loja_Atendimento; Type: INDEX; Schema: public; Owner: desenv
--

CREATE INDEX "FK_Loja_Atendimento" ON public."Atendimento" USING btree ("LojaId");


--
-- TOC entry 3665 (class 1259 OID 49217)
-- Name: FK_Operador_Atendimento; Type: INDEX; Schema: public; Owner: desenv
--

CREATE INDEX "FK_Operador_Atendimento" ON public."Atendimento" USING btree ("UsuarioOperadorId");


--
-- TOC entry 3718 (class 2606 OID 49224)
-- Name: Atendimento FK_CondicaoPagto_Atendimento; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "FK_CondicaoPagto_Atendimento" FOREIGN KEY ("CondicaoPagamentoId") REFERENCES public."CondicaoPagamento"("CondicaoPagamentoId");


--
-- TOC entry 3719 (class 2606 OID 49229)
-- Name: Atendimento FK_Loja_Atendimento; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "FK_Loja_Atendimento" FOREIGN KEY ("LojaId") REFERENCES public."Loja"("LojaId");


--
-- TOC entry 3720 (class 2606 OID 57365)
-- Name: Atendimento FK_Operador_Atendimento; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "FK_Operador_Atendimento" FOREIGN KEY ("UsuarioOperadorId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3739 (class 2606 OID 98645)
-- Name: AreaTeleprecoAuxiliar RefAreaTelepreco80; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoAuxiliar"
    ADD CONSTRAINT "RefAreaTelepreco80" FOREIGN KEY ("AreaTeleprecoId") REFERENCES public."AreaTelepreco"("AreaTeleprecoId");


--
-- TOC entry 3743 (class 2606 OID 98665)
-- Name: AreaTeleprecoFila RefAreaTelepreco84; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "RefAreaTelepreco84" FOREIGN KEY ("AreaTeleprecoId") REFERENCES public."AreaTelepreco"("AreaTeleprecoId");


--
-- TOC entry 3744 (class 2606 OID 98670)
-- Name: AreaTeleprecoPontoAtendimento RefAreaTelepreco85; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoPontoAtendimento"
    ADD CONSTRAINT "RefAreaTelepreco85" FOREIGN KEY ("AreaTeleprecoId") REFERENCES public."AreaTelepreco"("AreaTeleprecoId");


--
-- TOC entry 3740 (class 2606 OID 98650)
-- Name: AreaTeleprecoFila RefAreaTeleprecoAuxiliar81; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "RefAreaTeleprecoAuxiliar81" FOREIGN KEY ("AreaTeleprecoAuxiliarId") REFERENCES public."AreaTeleprecoAuxiliar"("AreaTeleprecoAuxiliarId");


--
-- TOC entry 3741 (class 2606 OID 98655)
-- Name: AreaTeleprecoFila RefAreaTeleprecoPontoAtendimento82; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "RefAreaTeleprecoPontoAtendimento82" FOREIGN KEY ("AreaTeleprecoPontoAtendimentoId") REFERENCES public."AreaTeleprecoPontoAtendimento"("AreaTeleprecoPontoAtendimentoId");


--
-- TOC entry 3726 (class 2606 OID 73820)
-- Name: AtendimentoJustificativa RefAtendimento24; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoJustificativa"
    ADD CONSTRAINT "RefAtendimento24" FOREIGN KEY ("AtendimentoId") REFERENCES public."Atendimento"("AtendimentoId");


--
-- TOC entry 3729 (class 2606 OID 98341)
-- Name: SolicitacaoOrcamento RefAtendimento34; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."SolicitacaoOrcamento"
    ADD CONSTRAINT "RefAtendimento34" FOREIGN KEY ("AtendimentoId") REFERENCES public."Atendimento"("AtendimentoId");


--
-- TOC entry 3728 (class 2606 OID 90143)
-- Name: AtendimentoItem RefAtendimento6; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItem"
    ADD CONSTRAINT "RefAtendimento6" FOREIGN KEY ("AtendimentoId") REFERENCES public."Atendimento"("AtendimentoId");


--
-- TOC entry 3732 (class 2606 OID 98572)
-- Name: AtendimentoItemDetalhes RefAtendimentoItem89; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemDetalhes"
    ADD CONSTRAINT "RefAtendimentoItem89" FOREIGN KEY ("AtendimentoItemId") REFERENCES public."AtendimentoItem"("AtendimentoItemId");


--
-- TOC entry 3734 (class 2606 OID 98597)
-- Name: AtendimentoItemEstoque RefAtendimentoItem941; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemEstoque"
    ADD CONSTRAINT "RefAtendimentoItem941" FOREIGN KEY ("AtendimentoItemId") REFERENCES public."AtendimentoItem"("AtendimentoItemId");


--
-- TOC entry 3723 (class 2606 OID 57409)
-- Name: AtendimentoObservacao RefAtendimentoObservacaoCadastral141; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoObservacao"
    ADD CONSTRAINT "RefAtendimentoObservacaoCadastral141" FOREIGN KEY ("AtendimentoObservacaoCadastralId") REFERENCES public."AtendimentoObservacaoCadastral"("AtendimentoObservacaoCadastralId");


--
-- TOC entry 3730 (class 2606 OID 98432)
-- Name: FormaPagamentoClienteTipo RefClienteTipo63; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."FormaPagamentoClienteTipo"
    ADD CONSTRAINT "RefClienteTipo63" FOREIGN KEY ("ClienteTipoId") REFERENCES public."ClienteTipo"("ClienteTipoId");


--
-- TOC entry 3727 (class 2606 OID 81946)
-- Name: PecaFalta RefLoja29; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."PecaFalta"
    ADD CONSTRAINT "RefLoja29" FOREIGN KEY ("LojaId") REFERENCES public."Loja"("LojaId");


--
-- TOC entry 3733 (class 2606 OID 98592)
-- Name: AtendimentoItemEstoque RefLoja931; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoItemEstoque"
    ADD CONSTRAINT "RefLoja931" FOREIGN KEY ("LojaId") REFERENCES public."Loja"("LojaId");


--
-- TOC entry 3725 (class 2606 OID 73815)
-- Name: AtendimentoJustificativa RefOperador22; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoJustificativa"
    ADD CONSTRAINT "RefOperador22" FOREIGN KEY ("UsuarioOperadorId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3735 (class 2606 OID 98625)
-- Name: AreaTelepreco RefOperador76; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTelepreco"
    ADD CONSTRAINT "RefOperador76" FOREIGN KEY ("UsuarioCadastroId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3736 (class 2606 OID 98630)
-- Name: AreaTelepreco RefOperador77; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTelepreco"
    ADD CONSTRAINT "RefOperador77" FOREIGN KEY ("UsuarioUltimaAlteracaoId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3737 (class 2606 OID 98635)
-- Name: AreaTelepreco RefOperador78; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTelepreco"
    ADD CONSTRAINT "RefOperador78" FOREIGN KEY ("UsuarioAtivacaoId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3738 (class 2606 OID 98640)
-- Name: AreaTeleprecoAuxiliar RefOperador79; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoAuxiliar"
    ADD CONSTRAINT "RefOperador79" FOREIGN KEY ("UsuarioAuxiliarId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3742 (class 2606 OID 98660)
-- Name: AreaTeleprecoFila RefOperador83; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AreaTeleprecoFila"
    ADD CONSTRAINT "RefOperador83" FOREIGN KEY ("UsuarioOperadorId") REFERENCES public."Usuario"("UsuarioId");


--
-- TOC entry 3722 (class 2606 OID 98357)
-- Name: Atendimento RefStatusAtendimento48; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT "RefStatusAtendimento48" FOREIGN KEY ("StatusAtendimento") REFERENCES public."StatusAtendimento"("Id");


--
-- TOC entry 3724 (class 2606 OID 73802)
-- Name: AtendimentoObservacao fk_atendimento_atendobs; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."AtendimentoObservacao"
    ADD CONSTRAINT fk_atendimento_atendobs FOREIGN KEY ("AtendimentoId") REFERENCES public."Atendimento"("AtendimentoId") MATCH FULL;


--
-- TOC entry 3721 (class 2606 OID 73763)
-- Name: Atendimento fk_cliente_atendimento; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."Atendimento"
    ADD CONSTRAINT fk_cliente_atendimento FOREIGN KEY ("ClienteId") REFERENCES public."Cliente"("ClienteId") MATCH FULL;


--
-- TOC entry 3731 (class 2606 OID 98489)
-- Name: LogErro log_error_main_fk; Type: FK CONSTRAINT; Schema: public; Owner: desenv
--

ALTER TABLE ONLY public."LogErro"
    ADD CONSTRAINT log_error_main_fk FOREIGN KEY ("LogErrorIdMainException") REFERENCES public."LogErro"("LogErroId");


--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE "AreaTelepreco"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AreaTelepreco" TO PUBLIC;


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE "AreaTeleprecoAuxiliar"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AreaTeleprecoAuxiliar" TO PUBLIC;


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "AreaTeleprecoFila"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AreaTeleprecoFila" TO PUBLIC;


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "AreaTeleprecoPontoAtendimento"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AreaTeleprecoPontoAtendimento" TO PUBLIC;


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE "AtendimentoItem"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoItem" TO PUBLIC;


--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE "AtendimentoItemDetalhes"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoItemDetalhes" TO PUBLIC;


--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE "AtendimentoItemEstoque"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoItemEstoque" TO PUBLIC;


--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE "AtendimentoJustificativa"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoJustificativa" TO PUBLIC;


--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE "AtendimentoObservacao"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoObservacao" TO PUBLIC;


--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE "AtendimentoObservacaoCadastral"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."AtendimentoObservacaoCadastral" TO PUBLIC;


--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE "Cliente"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."Cliente" TO PUBLIC;


--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE "ClienteTipo"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."ClienteTipo" TO PUBLIC;


--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE "FormaPagamentoClienteTipo"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."FormaPagamentoClienteTipo" TO PUBLIC;


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE "Funcionario"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."Funcionario" TO PUBLIC;


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE "GrupoPermissao"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."GrupoPermissao" TO PUBLIC;


--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "GrupoUsuario"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."GrupoUsuario" TO PUBLIC;


--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE "LogErro"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."LogErro" TO PUBLIC;


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE "PecaFalta"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."PecaFalta" TO PUBLIC;


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE "SolicitacaoOrcamento"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."SolicitacaoOrcamento" TO PUBLIC;


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE "StatusAtendimento"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."StatusAtendimento" TO PUBLIC;


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE "StatusSolicitacaoOrcamento"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."StatusSolicitacaoOrcamento" TO PUBLIC;


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "UsuarioSessao"; Type: ACL; Schema: public; Owner: desenv
--

GRANT ALL ON TABLE public."UsuarioSessao" TO PUBLIC;


--
-- TOC entry 1783 (class 826 OID 57370)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: desenv
--

ALTER DEFAULT PRIVILEGES FOR ROLE desenv IN SCHEMA public REVOKE ALL ON TABLES  FROM desenv;
ALTER DEFAULT PRIVILEGES FOR ROLE desenv IN SCHEMA public GRANT ALL ON TABLES  TO PUBLIC;


-- Completed on 2019-05-28 15:39:03

--
-- PostgreSQL database dump complete
--

