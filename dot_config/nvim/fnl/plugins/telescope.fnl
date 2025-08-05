[{1 :nvim-telescope/telescope.nvim
    :branch "master"
    :dependencies {1 :nvim-lua/plenary.nvim}}
    ; Fuzzy Finder Algorithm which requires local dependencies to be built.
    ; Only load if `make` is available. Make sure you have the system
    ; requirements installed.
  {1 :nvim-telescope/telescope-fzf-native.nvim
    ; NOTE: If you are having trouble with this installation,
    ; refer to the README for telescope-fzf-native for more instructions.
    :build :make
    :cond (fn [] (= (vim.fn.executable :make) 1))}]
