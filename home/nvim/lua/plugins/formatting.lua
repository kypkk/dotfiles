return {
  -- Prettier: formats JS, TS, JSON, HTML, CSS, YAML, Markdown, etc.
  -- Requires `prettier` to be installed (mason installs it automatically)
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- JSON: jsonls LSP + schemastore (schema-aware autocomplete/validation)
  { import = "lazyvim.plugins.extras.lang.json" },
}
