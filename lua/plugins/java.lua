-- ~/.config/nvim/lua/plugins/java.lua
return {
	-- nvim-jdtls: el plugin no hace nada por sí solo; ftplugin/java.lua es quien arranca el servidor
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		dependencies = { "mfussenegger/nvim-dap" },
	},

	-- DAP engine (lazy, lo activa nvim-jdtls al attach)
	{
		"mfussenegger/nvim-dap",
		lazy = true,
	},
}
