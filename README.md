# Miscellaneous Linux Configs

## CopyQ

- `/copyq` directory
- Import ini file from the CopyQ UI.
- Screenshot:

  ![Dump and load commands screenshot](copyq/images/screenshot.png)

## Tilix

- `/tilix` directory
- Dump config to file (example):
  ```sh
  dconf dump /com/gexperts/Tilix/ > tilix.dconf
  ```
- Load config from file (example):

  ```sh
  dconf load /com/gexperts/Tilix/ < tilix.dconf
  ```

- Screenshot (Click for sauce)

  [![Dump and load commands screenshot](tilix/images/screenshot.png)](https://github.com/gnunn1/tilix/issues/571)

  > Note: Custom background images may be missing

## ZSH + Oh My ZSH

- `/zsh` directory
- Oh My ZSH custom settings location: `/.oh-my-zsh/custom`
- Exported:
  - Oh My ZSH
    - Aliases
    - Shortcuts (may not work outside source PC)
    - Themes
- `.zshrc` not exported because effort
- Use theme `minibash`

  ```sh
  # Add this line to ~/.zshrc
  ZSH_THEME="minibash"
  ```

## Visual Studio Code

- `/vscode` directory
- Default config locations:

  | Config             | Subdirectory  | Location                               |
  | ------------------ | ------------- | -------------------------------------- |
  | Keyboard Shortcuts | `keybindings` | `~/.config/Code/User/keybindings.json` |
  | Settings           | N/A           | `~/.config/Code/User/settings.json`    |

- Subdirectories map to file names. File extensions are kept as is.

  **Example:** A file called `2022-10-10.json` in the `keybindings` directory would be imported as `keybindings.json` into the `~/.config/Code/User/` directory

## Miscellaneous

- `/misc` directory
- Convenience tweaks and configs
- Items:

  | File                  | Description                                                         | Instructions                               |
  | --------------------- | ------------------------------------------------------------------- | ------------------------------------------ |
  | `disable-tap-drag.sh` | Disables the double-tap to drag gesture on touchpads (GNOME only)   | Execute the shell script as admin          |
  | `mpv.config`          | Configurations for mpv that remove vertical tearing during playback | Load the config file from the Celluloid UI |

- Screenshots:

  - Celluloid config:

    ![Dump and load commands screenshot](misc/images/mpv.png)

## TODO

- Automate the import/export process (simple shell script should do it)
- Script to set up entire OS(?) so it's comfortable to use immediately
