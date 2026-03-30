{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "none";
    };

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
      "orbstack"
      "postman"
      "popsql"
      "pycharm-ce"
      "raycast"
      "sublime-text"
      "the-unarchiver"
      "utm"
      "tradingview"
      "typora"
      "visual-studio-code"
      "whatsapp"
      "wireshark-app"
      "zoom"
    ];
  };
}
