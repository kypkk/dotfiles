{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "none";
    };
    brews = [
      "nvm"
      "ast-grep"
      "go"
      "mise"
      "libolm"
      "ttyd"
    ];
    casks = [
      "azure-data-studio"
      "chatgpt"
      "claude"
      "cursor"
      "deepl"
      "discord"
      "docker-desktop"
      "dropbox"
      "figma"
      "ghostty"
      "google-chrome"
      "helium-browser"
      "heptabase"
      "iina"
      "intellij-idea"
      "iterm2"
      "miniconda"
      "ngrok"
      "notion"
      "ollama-app"
      "orbstack"
      "postman"
      "popsql"
      "pycharm-ce"
      "raycast"
      "sublime-text"
      "tradingview"
      "tailscale-app"
      "typora"
      "visual-studio-code"
      "wireshark-app"
      "zoom"
    ];
  };
}
