# Neovim — Atajos Java & Go

> `<leader>` = **Espacio**

---

## Java (nvim-jdtls)

### Imports
| Atajo | Acción |
|-------|--------|
| `<leader>ji` | Organizar imports (elimina no usados, ordena) |
| `<leader>ca` | Code action → "Import..." (agrega import del símbolo bajo el cursor) |

### Refactor
| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>jv` | Normal / Visual | Extraer variable |
| `<leader>jm` | Normal / Visual | Extraer método |
| `<leader>jc` | Normal | Extraer constante |
| `<leader>cr` | Normal | Renombrar símbolo |

### Getters / Setters / Constructores
> Posiciona el cursor sobre el campo (o dentro de la clase) y usa:

| Atajo | Acción |
|-------|--------|
| `<leader>ca` | Code action → genera getter, setter, constructor, toString, equals/hashCode |

### Navegación de código
| Atajo | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `gr` | Ver referencias |
| `gI` | Ir a implementación |
| `gy` | Ir a definición de tipo |
| `K` | Documentación (hover) |
| `gK` | Firma del método (signature help) |

### Diagnósticos
| Atajo | Acción |
|-------|--------|
| `<leader>cd` | Diagnóstico de la línea actual |
| `[d` / `]d` | Diagnóstico anterior / siguiente |
| `<leader>xx` | Lista global de errores (Trouble) |
| `<leader>xX` | Lista de errores del buffer actual |

### Debug (DAP — requiere java-debug-adapter)
| Atajo | Acción |
|-------|--------|
| `<leader>dj` | Detectar clases con `main()` (ejecutar una vez por proyecto) |
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continuar / iniciar debug |
| `<leader>ds` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |

---

## Go (gopls + conform)

### Formato e imports
| Atajo | Acción |
|-------|--------|
| `<leader>cf` | Formatear archivo (goimports + gofumpt) |
| Al guardar | Se ejecuta automáticamente goimports + gofumpt |
| `<leader>ca` | Code action → organizar imports manualmente |

> **goimports** agrega/elimina imports automáticamente al formatear.
> No hay atajo separado para imports en Go: el formatter lo resuelve.

### Navegación de código
| Atajo | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `gr` | Ver referencias |
| `gI` | Ir a implementación de interfaz |
| `gy` | Ir a definición de tipo |
| `K` | Documentación (hover) |
| `gK` | Firma de función |

### Refactor / Code actions
| Atajo | Acción |
|-------|--------|
| `<leader>ca` | Code action (fill struct, add tags, extract variable, etc.) |
| `<leader>cr` | Renombrar símbolo |

### Diagnósticos
| Atajo | Acción |
|-------|--------|
| `<leader>cd` | Diagnóstico de la línea |
| `[d` / `]d` | Diagnóstico anterior / siguiente |
| `<leader>xx` | Lista global de errores |

---

## LSP general (aplica a ambos lenguajes)

| Atajo | Acción |
|-------|--------|
| `<leader>ss` | Buscar símbolos del documento (Telescope) |
| `<leader>sS` | Buscar símbolos del workspace |
| `<leader>xl` | Definiciones LSP (Trouble) |
| `<leader>xs` | Árbol de símbolos (Trouble) |

---

## Telescope (búsqueda de archivos)

| Atajo | Acción |
|-------|--------|
| `<C-p>` | Buscar archivos |
| `<leader>fg` | Buscar texto en todo el proyecto |
| `<leader>fr` | Archivos recientes |
| `<leader>fs` | Buscar palabra bajo el cursor |

---

## Git

| Atajo | Acción |
|-------|--------|
| `]h` / `[h` | Siguiente / anterior hunk |
| `<leader>gp` | Preview del hunk |
| `<leader>gb` | Blame de la línea |
| `<leader>gr` | Revertir hunk |
| `<leader>ge` | Neo-tree vista de git |

---

## Tips rápidos

- **Getters/Setters Java**: cursor en el campo → `<leader>ca` → elegir "Generate getters and setters"
- **Agregar import Java**: cursor en el tipo sin import → `<leader>ca` → "Import..."
- **Fill struct Go**: cursor dentro del struct literal vacío → `<leader>ca` → "Fill struct"
- **Add struct tags Go**: cursor en campo → `<leader>ca` → "Add tags to struct field"
- **Implementar interfaz Go**: cursor en el tipo → `<leader>ca` → "Implement interface"
