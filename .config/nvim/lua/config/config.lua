vim.filetype.add({
  extension = {
    gowork = "gowork",
    gotmpl = "gotmpl",
    tfvars = "terraform-vars",
  },
  pattern = {
    [".*%.go%.tmpl"] = "gotmpl",
    ["docker%-compose%.yml"] = "yaml.docker-compose",
    ["docker%-compose%.yaml"] = "yaml.docker-compose",
    ["compose%.yml"] = "yaml.docker-compose",
    ["compose%.yaml"] = "yaml.docker-compose",
    ["%.gitlab%-ci%.yml"] = "yaml.gitlab",
    ["%.gitlab%-ci%.yaml"] = "yaml.gitlab",
    ["values%.yml"] = "yaml.helm-values",
    ["values%.yaml"] = "yaml.helm-values",
  },
})

