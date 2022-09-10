print "In globals file"
local ok, plenary_reload = pcall(require, "plenary.reload")
if not ok then
  print "not ok"
  reloader = require
else
  print "ok"
  reloader = plenary_reload.reload_module
end

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return reloader(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end
