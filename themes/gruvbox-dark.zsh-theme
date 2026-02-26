# Gruvbox Dark — based on steeef prompt
# https://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme

export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt prompt_subst
autoload -U add-zsh-hook
autoload -Uz vcs_info

turquoise="%F{#8ec07c}"
orange="%F{#fe8019}"
purple="%F{#d3869b}"
hotpink="%F{#fb4934}"
limegreen="%F{#b8bb26}"
PR_RST="%F{#fbf1c7}"

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*:prompt:*' check-for-changes false
zstyle ':vcs_info:*:prompt:*' formats       '%b'
zstyle ':vcs_info:*:prompt:*' actionformats '%b|%a'
zstyle ':vcs_info:*:prompt:*' nvcsformats   ''

function _gruvbox_git_info {
    vcs_info 'prompt'
    local branch="$vcs_info_msg_0_"
    [[ -z "$branch" ]] && return

    local staged unstaged untracked
    local line
    while IFS= read -r line; do
        [[ "${line[1]}" == '?' ]]                            && untracked=1
        [[ "${line[1]}" != '?' && "${line[1]}" != ' ' ]]    && staged=1
        [[ "${line[2]}" != '?' && "${line[2]}" != ' ' ]]    && unstaged=1
    done < <(command git status --porcelain 2>/dev/null)

    local indicators=""
    [[ -n "$unstaged"  ]] && indicators+="%{$orange%}●"
    [[ -n "$staged"    ]] && indicators+="%{$limegreen%}●"
    [[ -n "$untracked" ]] && indicators+="%{$hotpink%}●"

    echo "(%{$turquoise%}${branch}${indicators}${PR_RST}) "
}

function virtualenv_info {
    [[ -n "$VIRTUAL_ENV" ]] && echo "(%F{#83a598}$(basename "$VIRTUAL_ENV")${PR_RST}) "
}

if [[ -n "$SSH_CONNECTION" || -n "$SSH_CLIENT" ]]; then
    HOST_INFO="${PR_RST}@%{$orange%}%m"
else
    HOST_INFO=""
fi

PROMPT=$'
%{$purple%}%n${HOST_INFO}${PR_RST} in %{$limegreen%}%3~${PR_RST} $(_gruvbox_git_info)$(virtualenv_info)
${PR_RST}$ %f'