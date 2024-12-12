-- MAXIMUM BUFFER NUMBERS
-- makes `:bnext` and `:bprevious` less crowded
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local maxBufs = 8 -- CONFIG

		vim.defer_fn(function() -- defer to ensure `lastused` of new buffer is set
			local openBuffers = vim.fn.getbufinfo { buflisted = 1 }
			if #openBuffers <= maxBufs then return end

			-- sort by oldest first
			table.sort(openBuffers, function(a, b) return a.lastused < b.lastused end)

			-- close oldest buffers
			for i = 1, #openBuffers - maxBufs do
				vim.cmd.bdelete(openBuffers[i].bufnr)
			end
		end, 1)
	end,
})

--------------------------------------------------------------------------------
-- GIT CONFLICT MARKERS
-- if there are conflicts, jump to first conflict, highlight conflict markers,
-- and disable diagnostics (simplified version of `git-conflict.nvim`)
-- vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
-- 	callback = function(ctx)
-- 		local hlgroup = "DiagnosticVirtualTextInfo" -- CONFIG
--
-- 		local bufnr = ctx.buf
-- 		if not vim.api.nvim_buf_is_valid(bufnr) then return end
--
-- 		vim.system(
-- 			{ "git", "diff", "--check", "--", vim.api.nvim_buf_get_name(bufnr) },
-- 			{},
-- 			vim.schedule_wrap(function(out)
-- 				local noConflicts = out.code == 0
-- 				local notGitRepo = vim.startswith(out.stdout, "warning: Not a git repository")
-- 				if noConflicts or notGitRepo then return end
--
-- 				local ns = vim.api.nvim_create_namespace("conflictMarkers")
-- 				local firstConflictLn
-- 				for conflictLnum in out.stdout:gmatch("(%d+): leftover conflict marker") do
-- 					local lnum = tonumber(conflictLnum)
-- 					vim.api.nvim_buf_add_highlight(bufnr, ns, hlgroup, lnum - 1, 0, -1)
-- 					if not firstConflictLn then firstConflictLn = lnum end
-- 				end
-- 				if not firstConflictLn then return end
--
-- 				vim.api.nvim_win_set_cursor(0, { firstConflictLn, 0 })
-- 				vim.diagnostic.enable(false, { bufnr = bufnr })
-- 				vim.notify_once("Conflict markers found.", nil, { title = "Git Conflicts" })
-- 			end)
-- 		)
-- 	end,
-- })
