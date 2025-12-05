local M = {}

local function load_plugins()
    local plugins = {}
    local plugin_files = vim.fn.globpath(vim.fn.stdpath('config') .. '/jmawirat/plugins', '*.lua', false, true)

    for _, file in ipairs(plugin_files) do
        if not file:match('init.lua') then
            local plugin = dofile(file)
            table.insert(plugins, plugin)
        end
    end

    return plugins
end

M.plugins = load_plugins()

return M.plugins

