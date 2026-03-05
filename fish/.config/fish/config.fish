if status is-interactive
    # 1. Disable the greeting message for instant start
    set -g fish_greeting

    # 2. Set your Environment Variables
    set -gx EDITOR hx

    # 3. Add to PATH (Fish handles this very cleanly)
    fish_add_path $HOME/.local/bin $HOME/bin

    # 4. Y
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end
