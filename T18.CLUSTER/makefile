SHELL := /bin/bash
LOCALPATH := $(CURDIR)/$(PROJECT)
PYTHONPATH := $(LOCALPATH)/


help:
	@echo "    executa"
	@echo "    Processa o arquivo arquivosaida no diretorio corrente."
	
all: 	executa

compila:	
	python t1-main.py
	
executa:
	aLine --clustering --algorithm kmeans --features marcoCivil/marcocivil.mtx -k 4 --num-inter 5

clear:
	rm -Rf arquivosaida