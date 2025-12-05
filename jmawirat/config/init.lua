local function load_configs()
    local config_files = vim.fn.globpath(vim.fn.stdpath('config') .. '/jmawirat/config', '*.lua', false, true)

    for _, file in ipairs(config_files) do
        if not file:match('init.lua') then
            dofile(file)
        end
    end
end

load_configs()

