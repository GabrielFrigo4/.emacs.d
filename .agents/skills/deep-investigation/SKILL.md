---
name: deep-investigation
description: >-
    Deep root-cause technical investigation and primary sources research for Universal Environment.
    Use when diagnosing Git submodule issues, cross-repo synchronization failures,
    Makefile orchestration problems, and GitHub API/CLI interactions.
---

# Deep Investigation — Hub Diagnostics & Cross-Repo Analysis

Esta skill define o protocolo de investigação técnica de excelência no repositório **Universal Environment** (hub orquestrador).

Quando nos deparamos com falhas de submódulos, inconsistências de documentação entre repos, problemas no Makefile ou erros de GitHub CLI, **nunca devemos recorrer a adivinhações superficiais**.

---

## 1. Regra de Ouro: Fontes Primárias Atuais

1. **Git Submodules:** Documentação oficial do Git (`git-scm.com/docs/git-submodule`).
2. **GitHub CLI (`gh`):** Documentação oficial do GitHub CLI (`cli.github.com/manual`).
3. **Makefile / GNU Make:** Manual oficial do GNU Make.

---

## 2. Hierarquia de Fontes Primárias

```text
Nível 1: Documentação Oficial e Man Pages
   ↳ git-submodule, git-remote, gh, GNU Make.

Nível 2: Repositórios Upstream do Ecossistema
   ↳ Setup, Shell, Vault, Profile — seus READMEs e PRINCIPLES.md.

Nível 3: Estado Local do Git
   ↳ git submodule status, git log, git diff.
```

---

## 3. Protocolo de Diagnóstico

1. **Isolar o Erro:** `git submodule status` para verificar estado dos submódulos.
2. **Verificar Sincronização:** Comparar hashes de `ENVIRONMENT.md` entre repos.
3. **Validar Makefile:** Executar `make status` e `make --dry-run clone`.
