# Tmux TIDAL Plugin

Tmux plugin that shows the current music status for TIDAL 
(OSX only, desktop app required)

Introduces the following new status variables:

* `#{music_status}`
* `#{track}`

### Usage

The following interpolations are made available for your statusline:

* `#{music_status}` - TIDAL status icons
* `#{artist}` - Current playing track the 'song title - artist'

Here's the example in `.tmux.conf`:

    set -g status-right "♫ #{music_status} #{track} | %a %h-%d %H:%M "

Customize the icons with:

    set -g @tidal_playing_icon ">"
    set -g @tidal_paused_icon "="


### Screenshots
<img width="1163" alt="Screenshot 2023-11-11 at 03 27 01" src="https://github.com/kdssoftware/tmux-tidal/assets/10829524/6e776feb-6da7-4b1e-ac91-427c3e3b85c9">

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'kdssoftware/tmux-tidal'

Hit `prefix + I` to fetch the plugin and source it.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/kdssoftware/tmux-tidal ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/music.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

### Thanks
Thanks to https://github.com/robhurring/tmux-spotify for a good boilerplate good which was used to create this repo
