function table.getn(t)
	local count = 0
    for _, __ in pairs(t) do
        count = count + 1
    end
    return count
end

function table.tostring(t)
	local i,o,r,ltype
	local ln = table.getn(t) -- Realiza una verificación
	local c = 1
	r = "{"
	for i,o in pairs(t) do
		ltype = type(o)
		if type(i) == "number" then
			r = r .. "[" .. i .. "] = "
		else
			r = r .. '"' .. i .. '" = '
		end
		if ltype == "string" then
			r = r .. '"' .. o .. '"'
		elseif ltype == "number" then
			r = r .. o
		elseif ltype == "table" then
			r = r .. table.tostring(o)
		elseif ltype == "function" then
			r = r .. tostring(o)
		end
		if c < ln then r = r .. "," end
		c = c + 1
	end
	return r .. "}"
end