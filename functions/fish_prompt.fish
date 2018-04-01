function fish_prompt
    set -l status_copy $status

    set -l time_now (date +"%H:%M:%S")

    # set -l cwd_dir (
    #     set -l dir (dirname $PWD)

    #     if test "$PWD" != "$HOME" -a "$dir" != /
    #         echo $dir | sed -E "s|$HOME||;s|(^/)?([^/.])[^/]*|\2|g;s|/| |g"
    #     end
    #     )
    # 
    set -l cwd_dir (
        # set -l dir (dirname $PWD)
        set -l dir $PWD

        if test "$PWD" != "$HOME" -a "$dir" != /
            echo $dir | sed -E "s|$HOME/||"
        end
        )
    

    # set -l cwd_base (
    #     if test "$PWD" != / -a "$PWD" != "$HOME"
    #         basename $PWD
    #     end
    #     )

    set -l branch_name

    if set branch_name (git_branch_name)
        set -l color 222 9f3
        set -l repo_status
        set -l branch_ref ➦

        if git symbolic-ref HEAD ^ /dev/null > /dev/null
            set branch_ref 
        end

        if git_is_touched
            if git_is_staged
                set repo_status S

            else if git_is_touched
                set color 9f3 222
            end
        end

        if git_is_dirty
            set repo_status $repo_status D
        end

        if git_is_stashed
            set repo_status $repo_status Z
        end

        if test ! -z "$repo_status"
            segment 9f3 222 " $repo_status "
        end

        segment $color " $branch_ref $branch_name "

        if test ! -z "$cwd_base"
            segment 9f3 222 "$cwd_base  "
        end
    else
        if test ! -z "$cwd_base"
            set -l color 222

            if test ! -z "$cwd_dir"
                set color 444
            end

            segment fff $color "  $cwd_base  "
        end
    end

    if test ! -z "$cwd_dir"
        segment fff 222 "  $cwd_dir  "
    end

    set -l segment
    set -l segment_colors

    switch "$PWD"
        case "$HOME"\*
            set segment " ~ "
            set segment_colors black 9f3

        case \*
            set segment " /→ "
            set segment_colors black 9f3
    end

    if test "$status_copy" -ne 0
        set segment_colors fff red
    end

    segment $segment_colors $segment
    # segment white 400 " $time_now "
    segment 0f0 000 " $time_now "

    segment_close
end
