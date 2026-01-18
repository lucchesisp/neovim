# NvChad Development Environment

Configuração profissional do Neovim com NvChad, otimizada para desenvolvimento backend/infraestrutura com suporte completo a debugging (DAP) e LSP.

---

## 🚀 Instalação Rápida

### macOS

```bash
# Instalar Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instalar dependências
brew install neovim tmux

# Clonar esta configuração
git clone https://github.com/lucchesisp/neovim ~/.config/nvim --depth 1

# Abrir Neovim e instalar plugins
nvim
```

Quando o Neovim abrir, digite `:MasonInstallAll` e pressione Enter para instalar todos os LSPs e debug adapters.

### Windows (WSL2 - Recomendado)

```powershell
# No PowerShell como Administrador
wsl --install

# Reiniciar e entrar no WSL
wsl

# Seguir passos do macOS acima
```

---

## ⚡ Atalhos Customizados (Mais Importantes)

### Debug (DAP)

Os atalhos de debug seguem o padrão de IDEs profissionais (F5, F9, F10, F11, F12).

**Teclas F (Padrão de IDEs):**

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Iniciar/Continuar | `F5` | Inicia ou continua o debug |
| Toggle Breakpoint | `F9` | Liga/desliga breakpoint na linha atual |
| Próxima Linha (Step Over) | `F10` | Executa a linha sem entrar em funções |
| Entrar na Função (Step Into) | `F11` | Entra dentro da função |
| Sair da Função (Step Out) | `F12` | Sai da função atual |

**Atalhos com `<leader>d` (Space + d):**

| Categoria | Atalho | Descrição |
|-----------|--------|-----------|
| **Controle** | | |
| Continue | `<leader>dc` | Continuar execução |
| Next | `<leader>dn` | Próxima linha (não entra em funções) |
| Into | `<leader>di` | Entrar na função |
| Out | `<leader>do` | Sair da função |
| Terminate | `<leader>dt` | Parar debug |
| Pause | `<leader>dp` | Pausar execução |
| Restart | `<leader>dR` | Reiniciar debug |
| **Breakpoints** | | |
| Toggle | `<leader>db` | Liga/desliga breakpoint |
| Conditional | `<leader>dB` | Breakpoint condicional |
| Log Point | `<leader>dL` | Breakpoint com log |
| Clear All | `<leader>dC` | Remove todos breakpoints |
| **UI & Info** | | |
| Toggle UI | `<leader>du` | Mostra/esconde UI do debugger |
| Evaluate | `<leader>de` | Avaliar expressão |
| Hover | `<leader>dh` | Ver valor de variável |
| REPL | `<leader>dr` | Abrir console REPL |
| Run Last | `<leader>dl` | Repetir última sessão |

**Características do Debug:**
- ✅ Breakpoints aparecem como `●` vermelho
- ✅ Linha atual do debug com `→` verde e fundo verde
- ✅ Valores de variáveis aparecem inline em azul
- ✅ Variáveis que mudaram ficam em laranja/negrito

### LSP & Code Actions

Atalhos para aplicar sugestões do LSP (correções rápidas, refatorações, etc).

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Quick Fix (Rápido!) | `gq` ou `<leader>.` | Aplica correção/sugestão do LSP |
| Code Action (Menu) | `<leader>ca` | Abre menu com todas opções |
| Code Action (Fast) | `<leader>cf` | Aplica primeira sugestão |
| Toggle Inlay Hints | `<leader>ci` | Mostra/esconde dicas inline |

**Exemplo:** Quando ver tooltip roxo dizendo "for loop can be modernized using range over int", pressione `gq` para aplicar!

### Import Management

Atalhos semânticos com prefixo `<leader>l` (LSP).

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Organize Imports | `<leader>lo` | Organiza e remove imports não usados |
| Remove Unused | `<leader>lu` | Remove apenas imports não usados |

**Auto-Organize para Go:**
- ✅ Ao salvar arquivos `.go`, imports são organizados automaticamente
- ✅ Imports não usados são removidos
- ✅ Imports faltantes são adicionados (se gopls detectar)

### Outros Atalhos Úteis

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Comando rápido | `;` | Igual a `:` (entra no modo comando) |
| Escape | `jk` (insert mode) | Volta para modo normal |
| Toggle Markdown | `<leader>m` | Renderiza/desrenderiza markdown |

---

## 📋 Comandos Essenciais por Prioridade

### 1. Navegação & Busca (Mais Usados)

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Buscar arquivo | `Ctrl+p` | Busca fuzzy de arquivos |
| Buscar em arquivos | `<leader>fw` | Live grep (busca texto) |
| Ir para definição | `gd` | Pula para definição do símbolo |
| Ver referências | `gr` | Mostra onde o símbolo é usado |
| Voltar | `Ctrl+o` | Volta para posição anterior |
| Avançar | `Ctrl+i` | Avança para próxima posição |

### 2. Edição & Refatoração

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Renomear símbolo | `<leader>rn` | Renomeia variável/função |
| Formatar código | `<leader>fm` | Formata o arquivo |
| Hover (documentação) | `K` | Mostra documentação |
| Comentar linha | `gcc` | Comenta/descomenta linha |
| Comentar bloco | `gc` (visual) | Comenta bloco selecionado |

### 3. Gerenciamento de Arquivos

| Ação | Atalho | Descrição |
|------|--------|-----------|
| File explorer | `<leader>e` ou `Ctrl+n` | Abre/fecha NvimTree |
| Salvar | `:w` ou `Ctrl+s` | Salva arquivo |
| Salvar e sair | `:wq` | Salva e fecha |
| Sair sem salvar | `:q!` | Fecha sem salvar |
| Criar arquivo | `a` (no NvimTree) | Novo arquivo |
| Criar pasta | `A` (no NvimTree) | Nova pasta |
| Deletar | `d` (no NvimTree) | Deleta arquivo/pasta |
| Renomear | `r` (no NvimTree) | Renomeia arquivo/pasta |

### 4. Buffers & Janelas

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Próximo buffer | `Tab` | Vai para próximo buffer |
| Buffer anterior | `Shift+Tab` | Vai para buffer anterior |
| Fechar buffer | `<leader>x` | Fecha buffer atual |
| Split horizontal | `<leader>sv` | Divide tela horizontal |
| Split vertical | `<leader>sh` | Divide tela vertical |
| Navegar janelas | `Ctrl+h/j/k/l` | Move entre janelas |

### 5. Git

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Git status | `<leader>gt` | Ver status do git |
| Git commits | `<leader>cm` | Ver commits |
| Lazygit | `<leader>gg` | Abre lazygit |

### 6. Terminal

| Ação | Atalho | Descrição |
|------|--------|-----------|
| Toggle terminal | `Alt+i` | Terminal flutuante |
| Terminal horizontal | `Alt+h` | Terminal horizontal |
| Terminal vertical | `Alt+v` | Terminal vertical |

---

## 🎯 LSP & Debug Adapters Instalados

### Linguagens Suportadas

**LSP (Language Server Protocol):**
- Go → `gopls`
- Python → `pyright`
- TypeScript/JavaScript → `ts_ls` + `eslint`
- Java → `jdtls`
- HTML/CSS → `html`, `cssls`

**Debug Adapters (DAP):**
- Go → `delve` (dlv)
- Python → `debugpy`
- Java → `jdtls` (integrado)

### Instalação via Mason

```vim
:Mason
```

No Mason, instale:
- **LSPs**: gopls, jdtls, pyright, typescript-language-server, eslint-lsp
- **Debug**: delve, debugpy
- **Formatters**: prettier, black, gofmt, stylua

---

## 🔧 Configuração do Debug

### Recursos Visuais

- **Breakpoints**: Bolinha vermelha `●`
- **Linha atual do debug**: Seta verde `→` + fundo verde escuro
- **Valores inline**: Azul claro, itálico
- **Variáveis alteradas**: Laranja, negrito

### Virtual Text (Valores de Variáveis)

Durante o debug, os valores das variáveis aparecem diretamente no código:

```go
func main() {
    x := 10        // x = 10 (azul)
    x = x + 5      // x = 15 (laranja - mudou!)
    y := 20        // y = 20 (azul)
}
```

**Comandos do Virtual Text:**
- `:DapVirtualTextEnable` - Habilita
- `:DapVirtualTextDisable` - Desabilita
- `:DapVirtualTextToggle` - Alterna

---

## 🛠️ Configuração & Ajuda

### Ver Todos os Atalhos

| Ação | Atalho |
|------|--------|
| NvCheatsheet (NvChad) | `<leader>ch` |
| WhichKey (todos) | `<leader>wK` |

### Gerenciadores

| Ação | Comando |
|------|---------|
| Mason (LSP/DAP) | `:Mason` |
| Lazy (plugins) | `:Lazy` |
| Atualizar plugins | `:Lazy sync` |
| Health check | `:checkhealth` |

---

## 💡 Workflows de Produtividade

### Debug Workflow

```
1. <leader>db ou F9 → Colocar breakpoint
2. F5 → Iniciar debug
3. F10 → Próxima linha
4. F11 → Entrar em função
5. <leader>de → Avaliar variável
```

### Refatoração Rápida

```
1. gd → Ir para definição
2. gr → Ver onde é usado
3. <leader>rn → Renomear símbolo
4. gq → Aplicar sugestão do LSP
```

### Busca e Substituição

```
1. <leader>fw → Buscar em todos arquivos
2. :%s/old/new/gc → Substituir no arquivo atual (com confirmação)
3. :args **/*.go → Selecionar arquivos
4. :argdo %s/old/new/ge | update → Substituir em todos
```

---

## 📦 TMUX Essencial

### Sessões

| Ação | Comando |
|------|---------|
| Nova sessão | `tmux new -s nome` |
| Listar sessões | `tmux ls` |
| Anexar sessão | `tmux attach -t nome` |
| Sair (detach) | `Ctrl+b d` |
| Matar sessão | `tmux kill-session -t nome` |

### Windows

| Ação | Comando |
|------|---------|
| Nova window | `Ctrl+b c` |
| Próxima | `Ctrl+b n` |
| Anterior | `Ctrl+b p` |
| Listar | `Ctrl+b w` |

### Panes

| Ação | Comando |
|------|---------|
| Split vertical | `Ctrl+b %` |
| Split horizontal | `Ctrl+b "` |
| Navegar | `Ctrl+b` + setas |
| Fechar | `Ctrl+b x` |
| Zoom | `Ctrl+b z` |

---

## 📚 Recursos Adicionais

### Busca & Navegação Avançada

<details>
<summary>Ver comandos avançados de busca</summary>

| Ação | Comando |
|------|---------|
| Buscar buffers | `<leader>fb` |
| Buscar help | `<leader>fh` |
| Buscar marks | `<leader>ma` |
| Buscar oldfiles | `<leader>fo` |
| Busca fuzzy no buffer | `<leader>fz` |
| Buscar palavra sob cursor | `*` (frente) / `#` (trás) |

</details>

### Text Objects & Macros

<details>
<summary>Ver comandos de text objects e macros</summary>

**Text Objects:**
| Ação | Comando |
|------|---------|
| Mudar dentro de aspas | `ci"` ou `ci'` |
| Mudar dentro de parênteses | `ci(` |
| Mudar dentro de chaves | `ci{` |
| Deletar dentro de aspas | `di"` |
| Selecionar dentro de aspas | `vi"` |

**Macros:**
| Ação | Comando |
|------|---------|
| Gravar macro no registro a | `qa` |
| Parar gravação | `q` |
| Executar macro | `@a` |
| Repetir último macro | `@@` |
| Executar 10 vezes | `10@a` |

</details>

### Diff & Comparação

<details>
<summary>Ver comandos de diff</summary>

| Ação | Comando |
|------|---------|
| Diff com arquivo | `:diffsplit arquivo` |
| Próxima diferença | `]c` |
| Diferença anterior | `[c` |
| Aplicar mudança | `dp` |
| Obter mudança | `do` |
| Atualizar diff | `:diffupdate` |

</details>

---

## 🎯 Notas macOS

- **Teclas F**: No Mac sem teclado numérico, use `fn + F5` (ou configure para usar F-keys diretamente)
- **Leader key**: `Space` (padrão do NvChad)
- **Option (⌥)**: Funciona como `Alt` (`<M-...>` no Neovim)
- **Control**: Funciona normalmente

---

## 📖 Links Úteis

- [NvChad](https://github.com/NvChad/NvChad)
- [Neovim](https://neovim.io/doc/)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [LSP Config](https://github.com/neovim/nvim-lspconfig)
- [TMUX](https://github.com/tmux/tmux/wiki)

---

**Configuração mantida por:** [lucchesisp](https://github.com/lucchesisp/neovim)
