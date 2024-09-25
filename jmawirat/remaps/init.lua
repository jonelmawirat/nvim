local function load_remaps()
    local remap_files = vim.fn.globpath(vim.fn.stdpath('config') .. '/jmawirat/remaps', '*.lua', false, true)

    for _, file in ipairs(remap_files) do
        if not file:match('init.lua') then
            dofile(file)
        end
    end
end

load_remaps()
