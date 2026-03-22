vim.filetype.add({
	extension = {
		tfvars = "terraform-vars",
		gotmpl = "gotmpl",
		mdx = "markdown.mdx",
	},
	pattern = {
		[".*%.tmpl"] = "gotmpl",
	},
})
