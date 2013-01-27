# dotfiles

Collection of configuration files for various programs. Namely:

*   Zsh.
*   [Vim](http://www.vim.org/download.php).
*   Git

Also has config files for programs I no longer use including:

*   Bash
*   [Fish](http://ridiculousfish.com/shell/). Fish is fast, has awesome
    command-line completion, color, and a more refined scripting language than
    Bash. It is too unstable for my preferences at the moment though.


# Installation

    git clone https://github.com/Ceasar/dotfiles.git

To install my dotfiles as *your* dotfiles, you can create symlinks with `rake`. If you do *not* run the rake command, everything will be isolated inside of the `.dotfiles` directory and will not interfere with your existing environment.

    rake install:all

Rake will ask you before overwriting any files that already exist.

You can also install subsets of the environment using one of the following.

    rake install:bash
    rake install:git
    rake install:python
    rake install:vim
    rake install:zsh

Credit to @tangledhelix for this idea (and many others).

# Updating

I periodically change the Vim bundles I use. There are two rake tasks for Vim.

The first updates the bundles from their repositories.

    rake update:vim

The second cleans up any bundles which are no longer known to `Rakefile`.

    rake cleanup:vim

Credit again to @tangledhelix.

# Goals

## Portability

The advantage of having my config files on a remote repo is that I can clone them to remote machines and maintain close to my exact settings anywhere. No need to relearn aliases.

## Accumulated Knowledge

Many existing interfaces for various tools are confusing, undiscoverable, and not worth remembering. Therefore, as much as possible, everything should be documented and stored in order to avoid having to relearn anything.

## Shell independence

Wherever possible, aliases and exports should be shell independent. This is important because sometimes I might not have access to certain shells on certain machines.

To facilitate this, each shell of interest should source the `.rc` file when relevant, and all aliases should go in there.

### Machine independence

Occasionally I have commands that only make sense on one-machine. These commands are not included in this repo (and should not be). The point of this repo is to have a universal setup on whatever machine I'm using.

This could be a problem if I just were to dump all my aliases inside of the `.rc` file. To fix this, machine-specific configuration files should go into a `.localrc` file, which `.rc` sources at the bottom.
