{ config, pkgs, ... }:

{
  
  z3 = import <home-manager> {
    inherit (pkgs) lib;

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    # home.username = "dt";
    # home.homeDirectory = "/home/dt";

    # Packages that should be installed to the user profile.

    # home.packages = with pkgs; [
    #   zsh
    #   zsh-autosuggestions
    #   zsh-syntax-highlighting
    #   zsh-completions
    #   git
    #   curl
    #   wget
    #   neovim
    #   tmux
    #   tree
    #   fzf
    # ];

    home = {
      username = "dt";
      homeDirectory = "/home/dt";
      packages = [
        pkgs.zsh
        pkgs.zsh-autosuggestions
        pkgs.zsh-syntax-highlighting
        pkgs.zsh-completions
        pkgs.git
        pkgs.curl
        pkgs.wget
        pkgs.neovim
        pkgs.tmux
        pkgs.tree
        pkgs.fzf
      ];
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "23.11";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}

# fix The option `home' does not exist.

