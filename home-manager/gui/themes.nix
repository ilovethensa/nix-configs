{ pkgs, lib, ... }: {
  gtk = {
    enable = true;
    theme.name = "adw-gtk3-dark";
    cursorTheme.name = "Vimix-cursors";
    iconTheme.name = "Vimix-Doder-dark";
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
  home.packages = with pkgs; [
    adw-gtk3
    adwaita-qt
    adwaita-qt6
    vimix-icon-theme
    vimix-cursors
    fira-code-nerdfont
    morewaita
  ];
}
