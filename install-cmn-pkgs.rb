#!/usr/bin/ruby
require 'os'

def run cmd
  puts "=============== execute: #{cmd}"
  system(cmd)
  exitNo = $?.exitstatus
  exit(exitNo) if exitNo != 0
end

pkgs = [
  'abseil',
  'catch2',
  'cxxopts',
  'magic-enum',
  'nameof',
  'openssl',
  'poco',
  'pugixml',
  'sqlite3',
  'toml11',
]

if OS.windows?
  run('bootstrap-vcpkg.bat')
elsif
  run('./bootstrap-vcpkg.sh')
end

pkgs.each do |pkg|
  cmd = "./vcpkg install #{pkg}"
  run(cmd)
end