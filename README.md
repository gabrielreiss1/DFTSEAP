# DFT — Dimensionamento da Força de Trabalho

Aplicação de página única (`index.html`) para dimensionamento da força de
trabalho. Não tem build nem dependência instalada: é um arquivo só, que roda
direto no navegador. Os dados ficam no `localStorage` da máquina de quem usa.

## Rodando

A aba de IA chama a API da Anthropic pelo navegador, e essa chamada é
bloqueada quando a página é aberta pelo disco (`file://`). Sirva a pasta:

```bash
python3 -m http.server 8000
# depois abra http://localhost:8000
```

O resto do sistema funciona também abrindo o `index.html` direto.

## Chave da API (aba "Descobrir entregas")

O DFT fala direto com a API da Anthropic, sem servidor no meio. **Uma chave
escrita dentro do `index.html` seria lida por qualquer pessoa que abrisse a
página** — e este repositório é público, então ela também vazaria no código.
Por isso a chave nunca é versionada. Há três formas de fornecê-la:

### 1. Arquivo local (recomendado para uso no dia a dia)

```bash
cp chave-local.exemplo.js chave-local.js
# edite chave-local.js e cole a sua chave
```

O `chave-local.js` está no `.gitignore` e fica só na sua máquina. Com ele
presente, a aba já abre com a chave carregada e nem mostra o campo.

### 2. Guardar no navegador

Digite a chave na aba e marque **"Lembrar a chave neste navegador"**. Ela fica
no `localStorage` daquele computador e a aba volta preenchida nas próximas
vezes. Para apagar, é só desmarcar.

### 3. Digitar a cada uso

Sem marcar nada, a chave vale enquanto a página estiver aberta e some ao
recarregar. É o caminho mais seguro em computador compartilhado.

### Se a chave vazar

Revogue em <https://console.anthropic.com/settings/keys> e gere outra. Uma
chave exposta dá acesso à cobrança da conta.
