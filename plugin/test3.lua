--[[ local NuiTree = require("nui.tree")

local node =
NuiTree.Node({ text = "b" }, {
  NuiTree.Node({ text = "b-1" }),
  NuiTree.Node({ text = { "b-2", "b-3" } }),
})

local tree = NuiTree({
  bufnr = 12,
  nodes = {
    NuiTree.Node({ text = "a" }),
    node
    -- NuiTree.Node({ text = "b" }, {
    --   NuiTree.Node({ text = "b-1" }),
    --   NuiTree.Node({ text = { "b-2", "b-3" } }),
    -- }),
  },
})

local function get_expanded_nodes(tree)
  local nodes = {}

  local function process(node)
    if node:is_expanded() then
      table.insert(nodes, node)

      if node:has_children() then
        for _, node in tree:get_nodes(node:get_id()) do
          process(node)
        end
      end
    end
  end

  for _, node in tree:get_nodes() do
    process(node)
  end

  return nodes
end

local get_node_id = function(nodee)
  if nodee.id then
    return "-" .. nodee.id
  end

  if nodee.text then
    return string.format("%s-%s-%s", nodee:get_parent_id() or "", nodee:get_depth(), nodee.text)
  end

  return "-" .. math.random()
end

-- tree:render()
-- local n = tree:get_nodes()
-- print("Nodes: ", P(n))
local fff = get_node_id(node)
print(P(tree))
-- NuiTree.Node:expand(fff) ]]
