return {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            format = {
                enable = true,
            },
            defaultConfig = {
                indent_style = "space",
                indent_size = "2",
            },
            diagnostics = {
                globals = { "vim", "it", "describe", "before_each", "after_each" }
            },
            telemetry = {
                enable = false,
            },
        }
    }
}
