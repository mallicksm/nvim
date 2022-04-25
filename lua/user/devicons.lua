local status_ok, nvim_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
   return
end

nvim_devicons.setup({
   default = true,
})
nvim_devicons.get_icon("*", ".S", { default = true })
nvim_devicons.set_default_icon('', '#6d8086')
