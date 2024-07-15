{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "gerben-tools";
      paths = [
        bash-completion
        neovim
        go
        nodejs_22
        starship
        fd
        ripgrep
        fzf
        lazygit        
      ];
    };
  };
}