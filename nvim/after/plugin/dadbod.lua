vim.keymap.set("n" , "<leader>db" , function ()
    vim.cmd("DBUI")
    
end)

 vim.g.db_ui_save_location = '~/Desktop'
