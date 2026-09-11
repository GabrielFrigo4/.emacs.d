---
name: proactive-guardian
description: >-
    Proactive code health guardian and autonomous quality enforcement for Universal Environment.
    Use to continuously audit documentation consistency, submodule state, Makefile integrity,
    and cross-repo synchronization of ENVIRONMENT.md and PRINCIPLES.md.
---

# Proactive Guardian — Autonomous Hub Quality Enforcement

Esta skill define as diretrizes operacionais para atuação **proativa** de qualidade no repositório **Universal Environment** (hub orquestrador).

O agente nunca deve agir de forma passiva diante de inconsistências entre documentação canônica e cópias nos sub-repos, submódulos desatualizados, ou comandos do Makefile quebrados. Se um desvio for detectado, o agente deve assumir a responsabilidade de auditar, propor e corrigir imediatamente.

---

## 1. Filosofia de Ação Proativa

1. **Sincronização de Documentação:**
    - Se `ENVIRONMENT.md` ou `PRINCIPLES.md` diferirem entre o Environment e os sub-repos, **alerte e proponha sincronização**.
2. **Estado dos Submódulos:**
    - Se os submódulos estiverem atrás do upstream, proponha `git submodule update --remote --merge`.
3. **Vault Defensivo:**
    - NUNCA tente forçar o clone do Vault em ambientes sem chave SSH autorizada.

---

## 2. Checklist de Auditoria Proativa

- [ ] **Submódulos Atualizados:** Setup, Shell e Profile no commit mais recente.
- [ ] **ENVIRONMENT.md Sincronizado:** Conteúdo idêntico em todos os 5 repos.
- [ ] **PRINCIPLES.md Sincronizado:** Conteúdo idêntico (adaptado) em todos os 5 repos.
- [ ] **Makefile Funcional:** `make status` retorna sem erros.
- [ ] **Vault Ignorado:** `Vault/` presente no `.gitignore`.
- [ ] **AGENTS.md Presente:** Existe em todos os 5 repos.

---

## 3. Fluxo de Entrega

Antes de finalizar qualquer modificação:

1. `git diff --check`
2. `git status` (nada de sub-repos rastreados indevidamente)
3. `make status`
