# Corpus de evidência — estimativa de impacto da IA

Base que sustenta os percentuais de **produtividade** e **demanda** por categoria
de atividade, na tela *Cargos → Oportunidades de otimização*. O corpus vive em
`DFT_EVIDENCIA_IA`, no `index.html`, e é enviado inteiro ao modelo a cada
estimativa; ele é obrigado a citar quais itens usou em cada categoria.

Levantamento de 11/09/2026.

## A assimetria que define o desenho

O eixo de **produtividade** tem experimentos aleatorizados com efeito medido. O
eixo de **demanda** não tem nada equivalente revisado por pares: não foi
localizado estudo com desenho experimental medindo quanto a IA reduz o *número*
de solicitações que chegam a um órgão público. O que existe é literatura de
fornecedor sobre desvio de chamadas, sem controle e com interesse comercial.

Isso não é um detalhe do levantamento — é o que o prompt faz o modelo respeitar:
estimativas de demanda saem conservadoras, marcadas como de baixa confiança, e a
tela mostra a ressalva. Tratá-las como hipótese a validar no próprio e-Protocolo
é o uso correto.

## Produtividade — efeito medido

| Estudo | Desenho | Amostra | Efeito |
|---|---|---|---|
| Noy & Zhang (2023), *Science* 381(6654):187–192 | Experimento aleatorizado pré-registrado | 453 profissionais | Tempo −40%, qualidade +18% |
| Brynjolfsson, Li & Raymond (2023), NBER WP 31161 | Implantação escalonada em campo | 5.179 atendentes | +14% casos/hora; +34% novatos; ~0 entre experientes |
| Dell'Acqua et al. (2023), HBS WP 24-013 / *Organization Science* (2025) | Experimento de campo | 758 consultores do BCG | Dentro da fronteira: +12,2% tarefas, 25,1% mais rápido, +40% qualidade. **Fora: pior que o controle** |
| Peng et al. (2023), arXiv:2302.06590 | Experimento controlado | 95 desenvolvedores | 55,8% mais rápido |

## Exposição e contrapeso

| Estudo | Papel no corpus |
|---|---|
| Eloundou et al. (2024), *Science* 384(6702):1306–1308 | Mapa de quais tarefas são expostas: ~80% da força de trabalho com ≥10% das tarefas; ~19% com ≥50%. Serve para ordenar categorias, não para fixar ganho |
| Acemoglu (2024), NBER WP 32487 / *Economic Policy* 40(121) | Contrapeso obrigatório: PTF agregada sobe no máximo 0,66% em 10 anos; ~20% das tarefas expostas, das quais só ~23% automatizáveis com lucro na década |
| OECD (2024), *Governing with Artificial Intelligence* | Aderência ao setor público: 200 casos em 11 funções de governo. Qualitativo — julga plausibilidade, não fixa percentual |

## Como o modelo é obrigado a raciocinar

O prompt separa explicitamente as duas dimensões (tempo por entrega × número de
entregas), manda ancorar cada número no estudo de escopo mais próximo, corrigir
para baixo quando a tarefa do estudo é mais curta e mais fechada que o trabalho
administrativo real, e aplicar a cautela de Acemoglu. Peng e Noy & Zhang são
tratados como teto, não como média.

Cada categoria volta com dois percentuais, duas notas de confiança, o racional,
as fontes citadas e a ressalva que mais ameaça a estimativa. Nada é gravado sem
confirmação, e o "?" de cada categoria mostra tudo isso depois de salvo.

## Limite honesto

Todos os experimentos são do setor privado e sobre tarefas mais curtas e mais
fechadas que um processo administrativo com tramitação, norma e responsável
identificado. O corpus serve para produzir uma estimativa fundamentada e
auditável — não uma medição. A validação é o piloto.
