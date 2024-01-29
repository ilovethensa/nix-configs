{ pkgs, lib, ... }: {
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    plugins = [
        pkgs.vimPlugins.nvim-tree-lua
        vimPlugins.vim-nerdtree-tabs
        {
          plugin = pkgs.vimPlugins.vim-startify;
          config = "let g:startify_change_to_vcs_root = 0";
        }
    ];
  };
}
