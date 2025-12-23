if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr pm podman
    abbr dkr docker

    abbr pacup sudo pacman -Syu
    abbr pacs sudo pacman -S
    abbr pacr sudo pacman -Rns

    abbr vpn sudo snx-rs -m command &

    alias cd z
    abbr l ls -lA
    alias hx helix

    abbr ga git add .
    abbr gc git commit
    abbr gcm git commit -m
    abbr gp git push

    source $HOME/.config/fish/zoxide.fish
end
