# Gruvbox ZSH Theme

A clean, informative ZSH theme tailored for the Gruvbox color palette. Based on the `steeef` theme from Oh My Zsh, adapted to strictly use Gruvbox hex colors for prompts with several usability improvements.

Available in two variants: **Dark** (for dark backgrounds) and **Light** (for light backgrounds).

## Features

- **Gruvbox Colors:** Native Gruvbox hex color integration for prompts. The Dark variant uses bright colors for contrast, while the Light variant uses faded/darker colors for readability on light backgrounds.
- **VCS / Git Status:** Displays the current branch, staged/unstaged changes, and untracked files.
- **Smart Hostname:** The `@hostname` is hidden for local sessions to save space and only shown when connected via SSH.
- **Path Truncation:** Limits the working directory display to the last 3 directories (`%3~`) to keep the prompt clean in deep directory structures.
- **Virtualenv Support:** Displays the active Python virtual environment.

## Installation

You can install the theme either automatically via the provided interactive script, or manually.

### Option 1: Automatic Installation (Interactive)

Run the following command in your terminal. The script will ask you which variant (Dark or Light) you want to install:

```bash
curl -fsSL https://raw.githubusercontent.com/moinferdi/gruvbox-zsh/main/themes/install.sh | bash
```

### Option 2: Manual Installation

1. Download the desired theme variant to your Oh My Zsh custom themes directory.

   **Dark variant:**
   ```bash
   curl -o ~/.oh-my-zsh/custom/themes/gruvbox-dark.zsh-theme https://raw.githubusercontent.com/moinferdi/themes/gruvbox-zsh/main/themes/gruvbox-dark.zsh-theme
   ```

   **Light variant:**
   ```bash
   curl -o ~/.oh-my-zsh/custom/themes/gruvbox-light.zsh-theme https://raw.githubusercontent.com/moinferdi/themes/gruvbox-zsh/main/themes/gruvbox-light.zsh-theme
   ```

2. Open your ZSH configuration file:

   ```bash
   vim ~/.zshrc
   ```

3. Set the `ZSH_THEME` variable to the variant you downloaded:

   ```bash
   ZSH_THEME="gruvbox-dark"
   # or
   ZSH_THEME="gruvbox-light"
   ```

4. Save the file and apply the changes:

   ```bash
   source ~/.zshrc
   ```

## Requirements

- [Oh My Zsh](https://ohmyz.sh/)
- A terminal emulator configured with a Gruvbox color scheme (Dark or Light) for the best visual experience.

## License

This project is licensed under the MIT License.
