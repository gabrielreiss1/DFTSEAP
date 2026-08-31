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

## Unidades e órgãos

A base de unidades vem do **Anexo I — Unidades dimensionáveis por órgão e método
de dimensionamento** (SEAP/PR, posição de 28/08/2026): 246 unidades validadas
nos nove órgãos que devolveram o instrumento de taxonomia, mais as 57 da relação
prévia de SEED e SESA, que ainda não se manifestaram — 303 no total. Os dois
órgãos pendentes aparecem marcados como *relação prévia* na tela de Órgãos,
porque os números deles podem mudar.

O Anexo I separa "Razão por Direcionador" de "Medição de Esforço por Atividade".
O DFT trata as duas sob um método só — *Direcionador Histórico ou Esforço por
Entrega* —, que é o que o motor de cálculo implementa.

### Importar uma planilha de unidades

Em **Órgãos → Importar planilha de unidades** (perfil Gestor SEAP) é possível
subir uma planilha e gerar órgãos e unidades a partir dela.

- Aceita `.xlsx`, `.xls`, `.csv` e `.tsv`. Nos arquivos com várias abas, elas são
  varridas até achar uma com cabeçalho reconhecível.
- O cabeçalho é procurado nas 20 primeiras linhas — títulos e notas antes dele
  não atrapalham — e as colunas são reconhecidas pelo nome, não pela posição.
  Bastam **órgão** e **nome da unidade**; sigla, natureza, método, código, tipo,
  eixo e replicabilidade entram quando existirem.
- Os órgãos são criados a partir da coluna de órgão; não precisam existir antes.
- Nada é gravado antes da prévia, que mostra o que será criado, atualizado e o
  que ficou de fora.
- Uma unidade já cadastrada é reconhecida pelo código, quando ele for único dos
  dois lados, e por órgão + sigla + nome nos demais casos — assim uma unidade
  renomeada na planilha é atualizada em vez de duplicada.
- Unidades dos órgãos da planilha que não constam dela ficam como estão, salvo
  se a remoção for marcada. Removidas, suas entregas são preservadas no acervo.

Para ler `.xlsx` o DFT baixa o SheetJS de um CDN. Em rede que bloqueia CDN, baixe
`xlsx.full.min.js` uma vez e deixe-o na pasta do `index.html`: ele é usado de
preferência ao CDN. Sem nenhum dos dois, o CSV continua funcionando.

## Chave da API (aba "Mapear entregas")

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
