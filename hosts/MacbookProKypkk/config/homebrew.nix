{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "none";
    };
    brews = [
      "nvm"
      "go"
      "mise"
    ];
    casks = [
      "arc"
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
      "heptabase"
      "iina"
      "intellij-idea"
      "iterm2"
      "microsoft-edge"
      "miniconda"
      "ngrok"
      "notion"
      "orbstack"
      "postman"
      "popsql"
      "pycharm-ce"
      "raycast"
      "sublime-text"
      "parallels"
      "the-unarchiver"
      "tradingview"
      "typora"
      "visual-studio-code"
      "whatsapp"
      "wireshark-app"
      "zoom"
    ];
  };
}
