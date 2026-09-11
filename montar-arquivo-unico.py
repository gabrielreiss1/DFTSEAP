#!/usr/bin/env python3
"""Gera DFT-completo.html: o index.html com os regulamentos embutidos.

Existe por um motivo prático: a versão que lê a pasta normativos/ falha quando
o zip é extraído um nível abaixo, ou quando a página é aberta do disco. O
arquivo único não depende de nada ao lado dele.

    python3 montar-arquivo-unico.py
"""
import base64, glob, io, json, os, sys

RAIZ = os.path.dirname(os.path.abspath(__file__))
ENTRADA = os.path.join(RAIZ, 'index.html')
PASTA = os.path.join(RAIZ, 'normativos')
SAIDA = os.path.join(RAIZ, 'DFT-completo.html')
MARCA = '<script src="chave-local.js" onerror="this.remove()"></script>'

def main():
    if not os.path.isdir(PASTA):
        sys.exit('Não achei a pasta normativos/ ao lado deste script.')
    html = io.open(ENTRADA, encoding='utf-8').read()

    acervo = {}
    for caminho in sorted(glob.glob(os.path.join(PASTA, '*'))):
        nome = os.path.basename(caminho)
        if nome.lower().endswith(('.txt', '.md')):
            acervo[nome] = {'texto': io.open(caminho, encoding='utf-8').read()}
        else:
            with open(caminho, 'rb') as f:
                acervo[nome] = {'base64': base64.b64encode(f.read()).decode('ascii')}
        print(f'  embutido: {nome} ({os.path.getsize(caminho)//1024} KB)')

    # </script> dentro do JSON encerraria o bloco antes da hora
    dados = json.dumps(acervo, ensure_ascii=False).replace('</', '<\\/')
    bloco = f'<script type="application/json" id="dft-normativos">{dados}</script>'

    if MARCA not in html:
        sys.exit('Não achei o ponto de inserção no index.html.')
    html = html.replace(MARCA, MARCA + '\n' + bloco, 1)

    io.open(SAIDA, 'w', encoding='utf-8').write(html)
    print(f'\n{os.path.basename(SAIDA)}: {os.path.getsize(SAIDA)/1048576:.1f} MB, '
          f'{len(acervo)} regulamentos embutidos.')

if __name__ == '__main__':
    main()
