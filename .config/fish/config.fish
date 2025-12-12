if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr pm podman
    abbr dkr docker

    abbr pacup sudo pacman -Syu
    abbr pacs sudo pacman -S
    abbr pacr sudo pacman -Rns

    alias cd z

    source $HOME/.config/fish/zoxide.fish
end
