
# ⚙️ Unidades Lógicas e Aritméticas (ULA) — Verilog

Repositório destinado ao estudo e à implementação de **Unidades Lógicas e Aritméticas (ULAs)** utilizando a linguagem de descrição de hardware **Verilog HDL**.

Os códigos foram desenvolvidos como exercícios práticos para aprofundar conhecimentos em lógica digital, circuitos combinacionais e arquitetura de computadores.

## 🎯 Objetivos

- Praticar a descrição de hardware utilizando Verilog.
- Compreender o funcionamento de uma ULA.
- Implementar operações aritméticas e lógicas em hardware.
- Estudar a seleção de operações por sinais de controle.
- Explorar a utilização de operadores e estruturas combinacionais.
- Desenvolver habilidades de simulação e verificação de circuitos digitais.

## 🧠 Conceitos estudados

Uma **Unidade Lógica e Aritmética (ULA)** é um circuito digital responsável por executar operações aritméticas e lógicas sobre dados binários.

É um dos principais componentes do caminho de dados (*datapath*) de um processador.

Entre as operações que podem ser implementadas em uma ULA, estão:

| Operação | Descrição |
|----------|-----------|
| ADD | Adição |
| SUB | Subtração |
| AND | E lógico |
| OR | OU lógico |
| XOR | OU exclusivo |
| NOT | Negação lógica bit a bit |
| SHL | Deslocamento à esquerda |
| SHR | Deslocamento à direita |
| SLT | Comparação de magnitude |

As operações disponíveis dependem de cada implementação presente no repositório.

## 🛠️ Tecnologias e ferramentas

![Verilog](https://img.shields.io/badge/Verilog-HDL-555555?style=for-the-badge)
![Icarus Verilog](https://img.shields.io/badge/Icarus_Verilog-Simulation-007ACC?style=for-the-badge)
![GTKWave](https://img.shields.io/badge/GTKWave-Waveforms-4B8BBE?style=for-the-badge)

**Linguagem:** Verilog HDL

**Ferramentas de estudo e simulação:**
- Icarus Verilog
- GTKWave
- Testbenches em Verilog

## 🧩 Estrutura básica de uma ULA

Uma ULA recebe dois operandos binários e um sinal de controle responsável por selecionar a operação a ser executada.

```text
               +-------------------+
      A ------>|                   |
               |                   |
      B ------>|        ULA        |------> RESULT
               |                   |
      OP ----->|                   |
               +-------------------+
```

Onde:

- **A:** primeiro operando.
- **B:** segundo operando.
- **OP:** sinal de seleção da operação.
- **RESULT:** resultado da operação selecionada.

Dependendo da implementação, também podem existir sinais adicionais, como Carry, Zero, Overflow e Negative.

## 💻 Exemplo de implementação

O código abaixo apresenta uma ULA combinacional simples de 8 bits, utilizada apenas como exemplo didático.

```verilog
module ula (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [2:0] OP,
    output reg  [7:0] RESULT
);

always @(*) begin
    case (OP)
        3'b000: RESULT = A + B;
        3'b001: RESULT = A - B;
        3'b010: RESULT = A & B;
        3'b011: RESULT = A | B;
        3'b100: RESULT = A ^ B;
        3'b101: RESULT = ~A;
        3'b110: RESULT = A << 1;
        3'b111: RESULT = A >> 1;
        default: RESULT = 8'b0;
    endcase
end

endmodule
```

Este exemplo demonstra a seleção de operações por meio de uma estrutura `case`, utilizando lógica combinacional.

## 🧪 Simulação

Para compilar uma implementação e seu respectivo testbench utilizando Icarus Verilog:

```bash
iverilog -o simulacao ula.v ula_tb.v
```

Para executar:

```bash
vvp simulacao
```

Caso o testbench gere um arquivo VCD, é possível visualizar as formas de onda com:

```bash
gtkwave simulacao.vcd
```

Os nomes dos arquivos devem ser ajustados conforme a implementação utilizada.

## 📚 Aplicações e aprendizado

O estudo de ULAs permite compreender conceitos fundamentais utilizados na construção de sistemas digitais mais complexos, incluindo:

- Caminhos de dados de processadores.
- Execução de instruções aritméticas e lógicas.
- Circuitos combinacionais.
- Seleção de operações por multiplexação.
- Representação binária e aritmética de complemento de dois.
- Organização e arquitetura de computadores.

## 📌 Sobre o repositório

Este repositório possui finalidade **educacional**, reunindo implementações desenvolvidas durante o estudo de descrição de hardware e sistemas digitais.

O foco está na compreensão dos conceitos e na experimentação com diferentes formas de implementação de circuitos.

---

<div align="center">

**Desenvolvido para fins de estudo e aprofundamento**

</div>
