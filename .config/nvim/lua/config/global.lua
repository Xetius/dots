P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

URLENC = function(unescaped)
	if #unescaped == 0 then
		return ""
	end

	return unescaped:gsub("([^%w %-%_%.%~])", function(c)
		return string.format("%%%02X", string.byte(c))
	end)
end

URLDEC = function(encoded)
	if #encoded == 0 then
		return "", nil
	end

	return encoded:gsub("%%(%x%x)", function(hex)
		return string.char(tonumber(hex, 16))
	end), nil
end

URLENC2 = function(unescaped)
	if #unescaped == 0 then
		return ""
	end

	return unescaped:gsub("([^%w %-%_%.%~])", function(c)
		return string.format("%%%02X", string.byte(c))
	end)
end

URLDEC2 = function(encoded)
	if #encoded == 0 then
		return "", nil
	end

	return encoded:gsub("%%(%x%x)", function(hex)
		return string.char(tonumber(hex, 16))
	end), nil
end
