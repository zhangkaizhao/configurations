local wezterm = require 'wezterm';

return {
    enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = false,
    window_close_confirmation = "NeverPrompt",

    window_background_opacity = 0.8,
    text_background_opacity = 0.8,

    font = wezterm.font_with_fallback({
        "Inconsolata",
        "Noto Color Emoji",
        "Swei Gothic CJK SC",
        "PingFang SC",
        "PingFang TC",
        "PingFang HK",
        "HanaMinA",
        "HanaMinB",
    }),
    font_size = 14,

    initial_cols = 122,
    initial_rows = 26,

    use_ime = true,
}
