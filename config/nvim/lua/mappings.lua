active = false
function nmap(keys, command)
  vim.api.nvim_set_keymap("n", keys, command .. " <CR>", { noremap = true, silent = true })
end

function vmap(keys, command)
  vim.api.nvim_set_keymap("v", keys, command .. " <CR>", { noremap = true, silent = true })
end

function minimal()
  if active then
    vim.cmd [[
      set number relativenumber noshowmode showtabline=1 laststatus=2 signcolumn=yes foldcolumn=0 
      au WinEnter,BufEnter, * set number relativenumber 
    ]]
    active = false
  else 
    vim.cmd [[
      set nonumber norelativenumber showmode showtabline=0 laststatus=0 signcolumn=no foldcolumn=1
      au WinEnter,BufEnter, * set nonumber norelativenumber 
    ]]
    active = true
  end
end

-- Normal Map
nmap("<TAB>", ":tabnext")
nmap("<S-TAB>", ":tabprev")
nmap("<C-H>", ":split")
nmap("<C-S-v>", ":vs")
nmap("<C-v>", ":vs +terminal | startinsert")
nmap("<C-h>", ":split +terminal | startinsert")
nmap("<C-t>", ":tabnew")

nmap("<C-q>", ":q")
nmap("<C-s>", ":w")

nmap("<C-z>", ":u")
nmap("<C-r>", ":redo")

-- Minimal toggle
nmap("<C-m>", ":lua minimal()")

-- Telescope
nmap("<C-space>", ":Telescope")
nmap("<C-f>", ":Telescope find_files")
nmap("<C-b>", ":Telescope buffers")

-- NvimTree
nmap("<C-e>", ":NvimTreeToggle")
nmap("<C-n>", ":NvimTreeFocus")

-- Visual Map
vmap("<C-/>", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())")
vmap("<C-d>", ":d")
vmap("<C-y>", ":y")
