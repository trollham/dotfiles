{1 :folke/snacks.nvim
  :priority 1000
  :lazy false
  ; ---@type snacks.Config
  :opts {
    :input { :enabled true }
    :picker { :enabled true }}
  :keys [
         { 1 "<leader>f" 2 (fn [] (Snacks.picker.smart)) :desc "Smart Find Files"}
         { 1 "<leader>g" 2 (fn [] (Snacks.picker.grep)) :desc "Grep"}
         { 1 "<leader>b" 2 (fn [] (Snacks.picker.buffers)) :desc "Buffers"}
         ]}
