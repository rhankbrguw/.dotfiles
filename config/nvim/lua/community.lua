-- ============================================================================
-- community.lua — AstroCommunity integrations
-- ============================================================================

---@type LazySpec
return {
	"AstroNvim/astrocommunity",

	-- Core packs
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.laravel" },
	{ import = "astrocommunity.pack.docker" },
}
