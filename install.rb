#!/usr/bin/env ruby
# frozen_string_literal: true

# Symlinks dotfiles from this repo to their expected locations.
# Backs up any existing non-symlink files before overwriting.

require "fileutils"
require "pathname"

DOTFILES_DIR = Pathname.new(__dir__).expand_path
HOME = Pathname.new(Dir.home)

LINKS = {
  "zshrc"            => ".zshrc",
  "zshrc_aliases"    => ".zshrc_aliases",
  "zshrc_functions"  => ".zshrc_functions",
  "vimrc"            => ".vimrc",
  "tmux.conf"        => ".tmux.conf",
  "pryrc"            => ".pryrc",
  "irbrc"            => ".irbrc",
  "gitignore_global" => ".gitignore_global",
  "gitconfig_shared" => ".gitconfig_shared",
  "config/nvim/init.vim" => ".config/nvim/init.vim",
}.freeze

def already_linked?(source, target)
  target.symlink? && target.readlink == source
end

def backup_existing(target)
  return unless target.exist? && !target.symlink?

  FileUtils.mv(target, Pathname.new("#{target}.bak"))
end

def remove_stale_symlink(target)
  return unless target.symlink?
  target.delete
end

def ensure_parent_dir(target)
  return if target.dirname.exist?
  FileUtils.mkdir_p(target.dirname)
end

def install_link(source, target)
  return if already_linked?(source, target)

  backup_existing(target)
  remove_stale_symlink(target)
  ensure_parent_dir(target)
  File.symlink(source, target)
end

LINKS.each do |repo_path, home_path|
  source = DOTFILES_DIR.join(repo_path)
  target = HOME.join(home_path)

  if source.exist?
    install_link(source, target)
  else
    warn "SKIP: #{repo_path} (not found in repo)"
  end
end
