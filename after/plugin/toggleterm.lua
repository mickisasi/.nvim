require('toggleterm').setup {
  size = 20,
  open_mapping = [[<leader>h]],
  insert_mappings = false,
  hide_numbers = true,
  start_in_insert = true,
  direction = 'float',
  auto_scroll = true,
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}
