require "nvchad.options"

-- add yours here!

local o = vim.o

-- Quebra de linha para textos longos
o.wrap = true          -- Habilita quebra de linha
o.linebreak = true     -- Quebra em palavras completas, não no meio
o.showbreak = "↪ "     -- Mostra um símbolo no início de linhas quebradas
o.breakindent = true   -- Mantém indentação nas linhas quebradas

-- Gerenciamento de arquivos swap, backup e undo
o.swapfile = true      -- Habilita swap files
o.updatetime = 300     -- Atualiza swap mais rápido (300ms)
o.backup = false       -- Desabilita backup files
o.writebackup = false  -- Desabilita backup antes de sobrescrever

-- o.cursorlineopt ='both' -- to enable cursorline!
