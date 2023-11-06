{ config, pkgs, ... }:

{
  # Set Zsh as the default shell for the user 'huzzyz'.
  users.users.huzzyz.shell = pkgs.zsh;

  # Configure Zsh and Oh My Zsh
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      #theme = "powerlevel10k/powerlevel10k";
      # oh-my-zsh plugins are different from zsh plugins and must be installed manually or referred to properly if installed via Nix
      plugins = [ "git" ]; # add your oh-my-zsh plugin names here
    };

    # Custom Zsh initialization commands
    interactiveShellInit = ''
      # Source the Powerlevel10k theme from the Nix store
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      # Source the Zsh plugins from the Nix store
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

      # Source custom Powerlevel10k configuration if it exists
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    # Note: There's no need to use `completionInit` as it does not exist in NixOS's Zsh module
    # Instead, completions will be initialized by the `interactiveShellInit`
  };

  # Global Zsh settings applied system-wide
  environment.etc."zshrc".text = ''
    # Global Zsh settings that apply to all users
    # ...

    # Key bindings, history size, and other interactive features
    bindkey '\e[3~' delete-char
    bindkey '\e[H' beginning-of-line
    bindkey '\e[F' end-of-line
    HISTFILE=~/.zsh_history
    HISTSIZE=10000
    SAVEHIST=1000
    setopt SHARE_HISTORY
  '';
}
