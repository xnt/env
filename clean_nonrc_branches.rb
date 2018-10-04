#!/usr/bin/env ruby

# Cleans up non-rc, non-master and non-* branches (because * is prepended to the current branch name)
puts 'Cleaning up non-rc branches'
%x(git branch).split(' ').each do |branch|
  avoid = ["rc", "master", "*"]
  %x(git branch -D #{branch}) and puts "Deleted #{branch}" unless branch.start_with?(*avoid)
end
