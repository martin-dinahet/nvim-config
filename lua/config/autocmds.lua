local helpers = require("config.helpers")
local telescope = require("telescope.builtin")

vim.api.nvim_create_autocmd("TextYankPost", {
  group = helpers.augroup("highlight-yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = helpers.augroup("lsp-attach"),
  callback = function(event)
    helpers.buf_nmap(event.buf, "gd", telescope.lsp_definitions, "Go to definition")
    helpers.buf_nmap(event.buf, "gr", telescope.lsp_references, "Go to references")
    helpers.buf_nmap(event.buf, "gI", telescope.lsp_implementations, "Go to implementation")
    helpers.buf_nmap(event.buf, "<leader>D", telescope.lsp_type_definitions, "Type definition")
    helpers.buf_nmap(event.buf, "<leader>r", vim.lsp.buf.rename, "Rename")
    helpers.buf_nmap(event.buf, "<leader>a", vim.lsp.buf.code_action, "Code action")
    helpers.buf_nmap(event.buf, "K", vim.lsp.buf.hover, "Hover")

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local group = helpers.augroup("lsp-highlight-" .. event.buf)
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = group,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
