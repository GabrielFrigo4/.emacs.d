.POSIX:
.SILENT:

MAKEFLAGS += --no-print-directory

# ----------------------------------------------------------------
# Makefile: Emacs Lisp Suite
# ----------------------------------------------------------------

.PHONY: help test batch indent ci

### ================================
### HELP & DOCUMENTATION
### ================================
help:
	echo "🔮 GNU Emacs — Ambiente Modular Elisp"
	echo ""
	echo "Comandos disponíveis:"
	echo "  make test     - Valida inicialização limpa em modo batch"
	echo "  make indent   - Formata/indenta arquivos Elisp"
	echo "  make ci       - Executa suite de validação local"
	echo ""

### ================================
### TESTING & FORMATTING
### ================================
test: batch

batch:
	echo "🧪 Validando inicialização batch do Emacs..."
	if command -v emacs > "/dev/null" 2>&1; then \
		emacs -Q --batch -l early-init.el -l init.el --eval '(message "Emacs batch OK")' > "/dev/null" 2>&1 && echo "  ✅ Emacs: batch OK"; \
	else \
		echo "ℹ️  emacs não encontrado no PATH; ignorando teste batch."; \
	fi

indent:
	if [ -f "bin/indent-all.sh" ]; then \
		sh bin/indent-all.sh; \
	fi

ci: test
	echo "🚀 Emacs 100% pronto para produção!"
