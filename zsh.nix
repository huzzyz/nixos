{
  programs.zsh = {
    enable = true;
    initExtra = ''
      # Add ZSH as a login shell
      chsh -s $(which zsh) $USER
    '';
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ "as:theme" "depth:1" ]; }
      ];
    };
  };
}
