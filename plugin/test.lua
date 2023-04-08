--[[ local removeDups = function(t)
  local vals = {}
  local ans = {}
  for _, str in pairs(t) do
    if vals[str] == true then
    else
      table.insert(ans, str)
      vals[str] = true
    end
  end
  return ans
end

print("testing testing *****************************")
-- getloclist()

-- :h getqflist-examples

-- print(getqflist({'title': 0})
-- local f = { ["title"] = 0 }
local data = {}
-- print(f)
local ff = vim.fn.getqflist()
-- print("ff:", ff)
for _, value in ipairs(ff) do
  -- print(vim.fn.bufname(value.bufnr))
  local bufname = vim.fn.bufname(value.bufnr)
  table.insert(data, bufname)
  -- vim.api.nvim_command()
end

-- print("data: ", data)
print(P(data))
-- vim.api.nvim_set_current_buf(1)
-- nvim_win_set_buf
local r = removeDups(data)
-- print("no dups", P(r))
print(P(r))
print(#r)

-- vim.api.nvim_open_win(0, true,
--   { relative = "win", width = 120, height = 10, border = "single", win = 1001, row = 20, col = 20, zindex = 100 })


-- api floatwin



-- vim.cmd('vsplit')
-- local win = vim.api.nvim_get_current_win()
-- local buf = vim.api.nvim_create_buf(true, true)
-- vim.api.nvim_win_set_buf(win, buf)
--
-- vim.api.nvim_buf_set_lines(buf, 0, -1, false, r) ]]
