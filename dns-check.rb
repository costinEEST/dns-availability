#!/usr/bin/env ruby

def check_domain(domain)
  unless domain =~ /^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$/
    # The domain is 'invalid' format
    puts "#{domain},invalid"
    return
  end

  result = `dig +short #{domain}`

  if result == "" && `whois #{domain}` =~ /not found|no data found|no match/i
    # No NS records for this domain
    puts "#{domain},FALSE\n"
  else
    # There are NS records for this domain
    puts "#{domain},true\n"    
  end  
end

ARGV.each do |domain|
  check_domain(domain)
end