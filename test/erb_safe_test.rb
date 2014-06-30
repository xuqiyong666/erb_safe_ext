
$:.unshift File.expand_path("../lib", __dir__)

require 'erb_safe_ext'

template = ERB.new <<-EOF
<%= "hello, #{'world'}." %>
<%~ "<script>alert('safety:)');</script>" %>
<%= "<script>alert('danger!');</script>" %>
this is the end.
EOF

#puts template.src
puts template.result


