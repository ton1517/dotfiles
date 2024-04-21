return {
	-- color scheme
	"sainnhe/everforest",
	priority = 100,
	config = function()
		vim.g.everforest_background = "hard"
		vim.g.everforest_better_performance = 1
		vim.g.everforest_disable_italic_comment = 1
		vim.g.everforest_diagnostic_text_highlight = 1
		vim.g.everforest_diagnostic_line_highlight = 1
		vim.g.everforest_diagnostic_virtual_text = 1
		vim.g.everforest_current_word = "underline"

		vim.cmd([[
    function! s:everforest_custom() abort
      let l:palette = everforest#get_palette('hard', {})
      call everforest#highlight('NormalNC', l:palette.fg, l:palette.bg_dim)
      call everforest#highlight('EndOfBuffer', l:palette.fg, l:palette.none)
      call everforest#highlight('WinbarNC', l:palette.fg, l:palette.bg_dim)
      call everforest#highlight('WinSeparator', l:palette.bg4, l:palette.bg_dim)

      call everforest#highlight('CursorLineSign', l:palette.none, l:palette.fg)
    endfunction
    
    augroup EverforestCustom
      autocmd!
      autocmd ColorScheme everforest call s:everforest_custom()
    augroup END
  ]])

		vim.cmd([[colorscheme everforest]])
	end,
}
