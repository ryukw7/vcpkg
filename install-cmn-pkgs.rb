#!/usr/bin/ruby

def run cmd
  puts "=============== execute: #{cmd}"
  system(cmd)
  exitNo = $?.exitstatus
  exit(exitNo) if exitNo != 0
end

pkgs = [
  'abseil',
  'catch2',
  'magic-enum',
  'nameof',
  'openssl',
  'poco',
  'pugixml',
  'sqlite3',
  'toml11',
]

run('./bootstrap-vcpkg.sh')

pkgs.each do |pkg|
  cmd = "./vcpkg install #{pkg}"
  run(cmd)
end