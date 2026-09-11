# 🔮 Emacs Configuration (.emacs.d) — AI Agent Briefing

> Este é o repositório da **configuração do Emacs** de Gabriel Frigo, integrante da **Suíte de Editores** do ecossistema [Universal Environment](https://github.com/GabrielFrigo4/environment).

---

## 🧭 Identidade e Papel

O repositório `.emacs.d` provê um ambiente de desenvolvimento extensível, centrado no GNU Emacs, com suporte modular a Org-mode, LSP (Eglot), Elpaca package manager, EAF e integrações com IA.

---

## 📁 Estrutura Canônica de Diretórios

- **`init.el`**: Ponto de entrada principal, feature toggles com suporte a variáveis de ambiente (`EMACS_AI`, `EMACS_LSP`, etc.) e caminhos do sistema.
- **`early-init.el`**: Otimizações de inicialização precoce e redirecionamento de cache native-comp.
- **`lib/core.el`**: Macros de detecção de SO (Linux, FreeBSD, macOS, Windows) e funções de indentação.
- **`etc/init/`**: Inicialização de pacotes (Elpaca), interface gráfica, atalhos globais e configurações de sessão.
- **`etc/editor/`**: Módulos de edição (`completion.el`, `lsp.el`, `scroll.el`, `treesit.el`, `utils.el`).
- **`etc/apps/`**: Aplicações integradas (`ai.el`, `apps.el`, `eaf.el`, `org.el`).
- **`etc/lang/`**: Modos de linguagens (`latex.el`, `lisp.el`, `markdown.el`, `lang.el`).
- **`etc/tools/`**: Ferramentas externas (`git.el`, `github.el`, `mandoc.el`, `shell.el`, `tools.el`).
- **`bin/`**: Utilitários auxiliares (`indent-all.sh` POSIX, `indent-all.ps1`, `indent-all.cmd`).

---

## ⚠️ Invariantes Críticas para Agentes de IA

1. **Fail-Safe & Graceful Degradation:** Toda biblioteca opcional ou chamada de pacote DEVE degradar graciosamente caso a rede esteja indisponível, a ferramenta não esteja instalada ou a flag correspondente esteja desativada. O Emacs NUNCA deve travar na inicialização.
2. **Zero Comentários Narrativos:** Use a arquitetura de comentários em 3 camadas (`#` ou `;;` com régua de 64 `-` no topo, 32 `=` para seções e 32 `-` para subseções).
3. **Zero Secrets:** Credenciais e chaves de API NUNCA são salvas neste repositório. Use `auth-source` ou variáveis de ambiente injetadas pelo [Vault](https://github.com/GabrielFrigo4/vault).
4. **Independência Git:** Este repositório é um Git Submodule no Environment. Commits feitos aqui pertencem ao repositório `.emacs.d`.

---

## 📖 Referências Obrigatórias

- **[ENVIRONMENT.md](ENVIRONMENT.md)**: Arquitetura global do ecossistema
- **[PRINCIPLES.md](PRINCIPLES.md)**: Os 18 Princípios de Engenharia UNIX + Clean Code
- **[.agents/rules/principles.md](.agents/rules/principles.md)**: Regras específicas de engenharia Elisp
- **[.agents/skills/](.agents/skills/)**: Runbooks operacionais do Emacs
