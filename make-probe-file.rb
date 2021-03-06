#! /usr/bin/env ruby

open('probe.cfg', 'w') do |f|
  File.readlines('hosts.txt').each do |line|
    domain = line.strip
    name = "#{domain.gsub(/\./, "_")}"

    template = %{
probe {
  name: "#{name}_homepage"
  type: HTTP
  targets {
    host_names: "#{domain}"
  }

  http_probe {
    protocol: HTTPS
  }

  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
}
    }.strip

    f.puts template
    f.puts "\n"
  end

  f.puts %{
surfacer {
  type: PROMETHEUS
}
  }.strip
  f.puts "\n"
end
