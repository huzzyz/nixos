{ config, pkgs, ... }:

{
  # Set Zsh as the default shell for your user.
  users.users.huzzyz.shell = pkgs.zsh;

  # Configure Zsh and plugins
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ]; # Added plugins
    };
    interactiveShellInit = ''
      # Source the Powerlevel10k theme.
      # Assuming Powerlevel10k is installed globally and available in $HOME/.nix-profile/share
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      source $HOME/.nix-profile/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

      # Enable autosuggestions and syntax highlighting.
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    '';
  };

  # Add keybindings and history options to zshrc.
  environment.etc."zshrc".text = ''
    # Home and End keys
    bindkey '\e[H'  beginning-of-line
    bindkey '\eOH'  beginning-of-line
    bindkey '\e[F'  end-of-line
    bindkey '\eOF'  end-of-line

    # Delete and Backspace keys
    bindkey '\e[3~' delete-char
    bindkey '\e?' backward-delete-char

    # History file size and options
    HISTFILE=~/.zsh_history
    HISTSIZE=10000
    SAVEHIST=1000
    setopt SHARE_HISTORY

    # Oh My Zsh configuration
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
    source $ZSH/oh-my-zsh.sh

    # Powerlevel10k theme
    source $HOME/.nix-profile/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  '';

  # If you want to set global aliases and environment variables for all users.
  environment.etc."zshenv".text = ''
    export PATH=$HOME/bin:$PATH
    alias ll='ls -l'
    # ... other environment variables or aliases ...
  '';
}
