{ config, lib, pkgs, ... }:

{
  environment.variables.EDITOR = "nvim";
  programs.neovim.defaultEditor = lib.mkForce true;
  programs.neovim.enable = true;
  programs.nixvim = {
    enable = true;
  keymaps = [
  {
    action = "<cmd>CHADopen --always-focus<cr>";
    key = "<Space>e";
  }
  {
    action = "<cmd>Telescope live_grep<CR>";
    key = "<Space>g";
  }
];
  extraPackages = [
     pkgs.ripgrep
   ];
  plugins = {
    lightline.enable = true;
    chadtree.enable = true;
    nix-develop.enable = true;
    nix.enable = true;
    comment-nvim.enable = true;
    nvim-autopairs.enable = true;   
    telescope.enable = true;
    startify = {
      enable = true; 
      bookmarks = [
        "/home/tht/Projects/nix-configs"  
      ];
    };
    auto-save = {
      enable = true;
      enableAutoSave = true;
    };
    coq-nvim = {
      enable = true;
      alwaysComplete = true;
      autoStart = true;
      installArtifacts = true;     
    };
    lsp = {
      enable = true;

      servers = {
        tsserver.enable = true;

        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust-analyzer = {
          enable = true;
          installCargo = true;
      installRustc = true;
        };
      };
    };

  };
  extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = vim-multiple-cursors;
        config = "lua require(\"Comment\").setup()";
      }
  ];
  clipboard.providers.wl-copy.enable = true;
  colorschemes.base16.enable = true;
  colorschemes.base16.colorscheme = "gruvbox-dark-pale";
  };
}
