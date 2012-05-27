#!/usr/bin/ruby

def run
  psha=""
  while true
    sha = `ls -lR . | sha1sum`
    if sha != psha then
      a = `rspec tests/*_spec.rb`
      puts Time.now.inspect + "\n" + a + "\n----------------------------\n"
    end
    psha = sha
    sleep 1
  end
end
run
