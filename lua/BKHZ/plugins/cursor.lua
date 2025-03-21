return {
    "sphamba/smear-cursor.nvim",
    enabled = false,
    opts = {
        stiffness = 0.8,
        trailing_stiffness = 0.5,
        distance_stop_animating = 0.5,
        hide_target_hack = false,
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        scroll_buffer_space = true,
        smear_insert_mode = true,
        legacy_computing_symbols_support = true,
        -- Don't smear to command line
        smear_to_cmd = false,
        vertical_bar_cursor = false,
        max_length = 32,
    }
}
