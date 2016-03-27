COLOR_INFO := \\033[36m[INFO]
COLOR_WARN := \\033[33m[WARN]
COLOR_ERROR := \\033[31m[ERRO]
COLOR_RESET := \\033[m

define LOG_INFO
	@echo $(COLOR_INFO) $1$(COLOR_RESET)
endef

define LOG_WARN
	@echo $(COLOR_WARN) $1$(COLOR_RESET)
endef

define LOG_ERROR
	@echo $(COLOR_ERROR) $1$(COLOR_RESET)
endef

.PHONY: log_test
log_test:
	$(call LOG_INFO, brew already installed.)
	$(call LOG_WARN, brew already installed.)
	$(call LOG_ERROR, brew already installed.)
