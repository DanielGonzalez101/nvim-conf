# 🚀 Neovim Config — LazyVim Edition (macOS)

Una configuración moderna, organizada y fácil de mantener basada en **LazyVim**.

---

## 📁 Estructura

```
~/.config/nvim/
├── init.lua                   ← Entrada principal
└── lua/
    ├── config/
    │   ├── lazy.lua           ← Bootstrap de lazy.nvim + opciones globales
    │   └── keymaps.lua        ← Todos los atajos de teclado
    └── plugins/
        ├── neotree.lua        ← Explorador de archivos
        ├── telescope.lua      ← Buscador de archivos/texto
        ├── floaterm.lua       ← Terminal flotante
        ├── autodarkmode.lua   ← Cambio automático dark/light
        ├── lsp.lua            ← LSP: TS, Python, C#, Java
        └── extras.lua         ← Plugins QoL (statusline, git, etc.)
```

---

## ⚡ Instalación rápida

```bash
# Clona o descarga el repositorio, luego:
bash install.sh
```

El script instala automáticamente:
- Neovim, git, fd, ripgrep, fzf
- JetBrainsMono Nerd Font
- Java (Temurin OpenJDK) + Maven + Gradle
- Python + pynvim
- Node.js + TypeScript
- .NET SDK (para C#)

---

## ⌨️ Atajos principales

### Navegación
| Atajo | Acción |
|-------|--------|
| `<Space>e` | Toggle Neo-tree |
| `<Space>o` | Focus Neo-tree |
| `<S-l>` / `<S-h>` | Buffer siguiente / anterior |
| `<C-h/j/k/l>` | Mover entre ventanas |

### Buscador (Telescope)
| Atajo | Acción |
|-------|--------|
| `<Space>ff` | Buscar archivos |
| `<Space>fg` | Buscar texto (live grep) |
| `<Space>fb` | Buffers abiertos |
| `<Space>fr` | Archivos recientes |
| `<Space>fs` | Buscar palabra bajo cursor |
| `<Space>ft` | Buscar TODOs |

### Terminal flotante
| Atajo | Acción |
|-------|--------|
| `<Space>tf` | Toggle terminal |
| `<Space>tn` | Nuevo terminal |
| `<Space>tl` / `<Space>th` | Siguiente / anterior terminal |
| `<Esc><Esc>` | Salir del modo terminal |

### Git
| Atajo | Acción |
|-------|--------|
| `<Space>gb` | Blame línea actual |
| `<Space>gp` | Preview hunk |
| `<Space>gr` | Reset hunk |
| `]h` / `[h` | Siguiente / anterior hunk |
| `<Space>ge` | Neo-tree Git Status |

### LSP
| Atajo | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `gr` | Referencias |
| `K` | Hover docs |
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename |
| `[d` / `]d` | Diagnóstico anterior / siguiente |
| `<Space>d` | Diagnóstico en línea |

### Java (solo en archivos .java)
| Atajo | Acción |
|-------|--------|
| `<Space>jo` | Organizar imports |
| `<Space>jv` | Extraer variable |
| `<Space>jc` | Extraer constante |
| `<Space>jm` | Extraer método (visual) |
| `<Space>jt` | Test método más cercano |
| `<Space>jT` | Test clase |

### Diagnósticos (Trouble)
| Atajo | Acción |
|-------|--------|
| `<Space>xx` | Todos los diagnósticos |
| `<Space>xX` | Diagnósticos del buffer |
| `<Space>xs` | Símbolos |

---

## 🌙 Auto Dark Mode

Detecta el modo del sistema macOS cada 3 segundos:
- **Dark** → `tokyonight-night`
- **Light** → `tokyonight-day`

Para cambiar el tema, edita `lua/plugins/autodarkmode.lua`.

---

## 🛠️ Lenguajes soportados

| Lenguaje | LSP | Formatter | Notas |
|----------|-----|-----------|-------|
| TypeScript/JS | `ts_ls` | Prettier | Incluye TSX/JSX |
| Python | Pyright | Black + isort | Ruff como linter |
| C# | OmniSharp | CSharpier | Requiere .NET SDK |
| Java | jdtls (nvim-jdtls) | jdtls built-in | Más features que lspconfig base |

---

## 🔧 Mantenimiento

```vim
" Actualizar todos los plugins
:Lazy update

" Ver estado de LSP servers
:Mason

" Instalar un nuevo LSP server
:MasonInstall <nombre>

" Healthcheck
:checkhealth
:LazyHealth
```

Para **agregar un plugin**, crea un archivo nuevo en `lua/plugins/`:

```lua
-- lua/plugins/mi-plugin.lua
return {
  "autor/mi-plugin",
  opts = {
    -- configuración aquí
  },
}
```

---

## 📋 Requisitos mínimos

- macOS 12+
- Neovim 0.10+
- Git
- Java 17+ (para jdtls)
- Node.js 18+
- Python 3.10+
- .NET SDK 8+
# nvim-conf
