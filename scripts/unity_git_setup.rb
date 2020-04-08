#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

puts('Creating .gitignore and .gitattributes for Unity project...')

file_dir = ENV['HOME'] + '/dotfiles/scripts/'

FileUtils.cp(file_dir + 'unity_gitignore.txt', './.gitignore')
FileUtils.cp(file_dir + 'unity_gitattributes.txt', './.gitattributes')

puts('Complete!')
