# 🔮 GNU Emacs Configuration

> Configuração modular, declarativa e resiliente do GNU Emacs para desenvolvimento, edição modal, LSP e Org-mode.

[![Environment](https://img.shields.io/badge/🏛️_Environment-Hub-blue)](https://github.com/GabrielFrigo4/environment)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![POSIX](https://img.shields.io/badge/shell-POSIX-orange)](bin/indent-all.sh)

---

## 🧭 Visão Geral

Este repositório contém a configuração pessoal do **GNU Emacs** de Gabriel Frigo, integrando a **Suíte de Editores** do [Universal Environment](https://github.com/GabrielFrigo4/environment). A arquitetura prioriza:

- **Startup Instantâneo & Resiliente:** Feature toggles defensivos e isolamento de módulos com `condition-case`.
- **Controle Dinâmico:** Flags customizáveis via variáveis de ambiente (`EMACS_AI`, `EMACS_LSP`, `EMACS_TREESIT`).
- **LSP Integrado:** Eglot nativo de alta performance para linguagens compiladas e interpretadas.
- **Gerenciador Elpaca:** Gestão assíncrona e declarativa de pacotes.

---

## 📁 Catálogo da Estrutura

| Diretório / Arquivo                      | Descrição                                                   |
| :--------------------------------------- | :---------------------------------------------------------- |
| [`init.el`](init.el)                     | Ponto de entrada, feature toggles e carregamento central    |
| [`early-init.el`](early-init.el)         | Otimizações de boot e caminhos do native-comp cache         |
| [`lib/core.el`](lib/core.el)             | Macros de detecção de SO e rotinas de auto-indentação       |
| [`etc/init/`](etc/init/)                 | Bootstrap do Elpaca, atalhos globais e interface visual     |
| [`etc/editor/`](etc/editor/)             | Módulos de LSP, scroll suave, tree-sitter e conclusão       |
| [`etc/apps/`](etc/apps/)                 | Extensões opcionais: Org-mode, IA (gptel/ellama), EAF       |
| [`etc/lang/`](etc/lang/)                 | Configurações específicas para LaTeX, Lisp, Markdown        |
| [`etc/tools/`](etc/tools/)               | Ferramentas de Git, GitHub, manpages e shell interativo     |
| [`bin/indent-all.sh`](bin/indent-all.sh) | Script POSIX de auto-indentação de arquivos de configuração |

---

## 🚀 Instalação e Uso Rápido

### 1. Clonar ou Vincular via Profile

```sh
# Via Profile do Universal Environment
make sync

# Ou link direto manual
ln -sf "$(pwd)" "${HOME}/.emacs.d"
```

### 2. Executar com Recursos Customizados

```sh
# Boot padrão (mínimo e ultra-rápido)
emacs

# Habilitar IA sob demanda
EMACS_AI=1 emacs

# Modo diagnóstico e teste de sintaxe
emacs -Q --batch -l early-init.el -l init.el --eval '(message "Boot OK")'
```
