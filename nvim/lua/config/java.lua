local home = os.getenv("HOME")

-- Find the JAR launcher for jdtls
local jar_patterns = vim.fn.glob(
  home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar',
  true
)
local launcher_jar = vim.split(jar_patterns, "\n")[1]

-- Build the config table
local jdtls_config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.level=ALL',
    '-Xmx1G',
    '-jar', launcher_jar,
    '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_linux/',
    '-data', home .. '/.local/share/nvim/jdtls-workspaces/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
  },
  root_dir = require('lspconfig.util').root_pattern('.git', 'mvnw', 'gradlew', 'build.gradle'),
  -- You can also add other options like on_attach, capabilities, settings etc.
}

-- Register/override the server config
vim.lsp.config('jdtls', jdtls_config)

-- Enable the server when appropriate filetype(s) are opened
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function()
    vim.lsp.enable('jdtls')
  end,
})
