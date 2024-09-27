return {
  'cedarbaum/fugitive-azure-devops.vim',
  config = function()
    vim.cmd [[command -nargs=1 Browse silent exe '!xdg-open ' . "<args>"]]
  end,
}
