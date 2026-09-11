---
name: universal-emacs
description: >-
    Operational runbook for maintaining, testing, and debugging Gabriel Frigo's Emacs configuration.
    Use when updating Elpaca packages, tweaking LSP/Eglot, configuring Org-mode, or validating batch startup.
---

# Universal Emacs — Operational Runbook

Este guia detalha o fluxo operacional para gerenciar, auditar e testar a configuração do GNU Emacs.

---

## 1. Testes de Inicialização em Modo Batch

Sempre valide a integridade sintática e o boot do Emacs antes de commitar:

```sh
emacs -Q --batch -l early-init.el -l init.el --eval '(message "Emacs init OK")'
```

---

## 2. Auto-Indentação de Arquivos de Configuração

Para reformatar todos os arquivos `.el` rastreados pelo Git:

```sh
sh bin/indent-all.sh
```

---

## 3. Controle de Recursos por Variáveis de Ambiente

Teste recursos pontuais sem editar `init.el`:

```sh
EMACS_AI=1 emacs          # Inicia com recursos de IA habilitados
EMACS_LSP=0 emacs         # Inicia com LSP desativado (modo ultra-leve)
EMACS_TREESIT=1 emacs     # Inicia com tree-sitter habilitado
```
