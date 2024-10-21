Map = function (mode, shortcut, action, options)
    vim.keymap.set(mode, shortcut, action, options)
end

LoadModules = function (modules)
    for _, module in ipairs(modules) do
        local ok, err = pcall(require, 'priyanshu.config.' .. module)
        if not ok then
            error('Error loading ' .. module .. '\n\n' .. err)
        end
    end
end
