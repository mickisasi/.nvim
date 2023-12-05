vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- Allows to switch buffers
function cycle_buffers(direction)
    if direction == 'next' then
        vim.cmd('bnext')
    elseif direction == 'prev' then
        vim.cmd('bprev')
    end

    -- If at the last buffer, go to the first one
    if vim.fn.bufnr('$') == 1 then
        vim.cmd('bfirst')
    -- If at the first buffer, go to the last one
    elseif vim.fn.bufnr('%') == 1 then
        vim.cmd('blast')
    end
end

vim.api.nvim_set_keymap('n', '<Tab>', ':lua cycle_buffers("next")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':lua cycle_buffers("prev")<CR>', { noremap = true, silent = true })
