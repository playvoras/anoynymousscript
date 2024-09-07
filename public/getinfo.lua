local debug = table.clone(debug)

debug.getinfo = function(levelorfunc, options)
    local info = {}
    local function fetchinfo(opt, key, convert)
        if string.find(options, opt) then
            local value = debug.info(levelorfunc, opt)
            if value ~= nil then
                info[key] = convert and convert(value) or value
            end
        end
    end
    fetchinfo("S", "source")
    fetchinfo("s", "short_src", function(s) return s:sub(1, 60) end)
    fetchinfo("w", "what")
    fetchinfo("l", "currentline", tonumber)
    fetchinfo("n", "name")
    fetchinfo("N", "namewhat")
    fetchinfo("f", "func")
    fetchinfo("v", "isvararg", function(v) return v == "V" end)
    fetchinfo("p", "nparams", tonumber)
    fetchinfo("u", "nups", tonumber)
    if string.find(options, "L") then
        info.activelines = {}
        local i = 1
        while true do
            local line = tonumber(debug.info(levelorfunc, "L", i))
            if not line then break end
            table.insert(info.activelines, line)
            i = i + 1
        end
    end
    if string.find(options, "t") then
        info.istailcall = debug.info(levelorfunc, "t") == "T"
    end
    if string.find(options, "e") then
        local env = debug.info(levelorfunc, "e")
        if env then
            info.funcenv = env
        end
    end
    if type(levelorfunc) == "number" then
        fetchinfo("L", "linedefined", tonumber)
        fetchinfo("l", "lastlinedefined", tonumber)
    end
    return info
end
