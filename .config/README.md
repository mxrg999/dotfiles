## Set up dotfiles in a new machine
Clone as a bare repo:

``git clone —bare https://github.com/mxrg999/dotfiles.git ~/.dotfiles``

Add alias:

``alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"``

Hide untracked files:

``dotfiles config --local status.showUntrackedFiles no``

## Usage

Add files:

``dotfiles add <file path>``

``dotfiles commit -m "message"``

``dotfiles push``

Pull:

``dotfiles fetch && dotfiles pull``
