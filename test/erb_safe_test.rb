
#$:.unshift File.expand_path("../lib", __dir__)

require 'erb_safe_ext'

template = ERB.new <<-EOF
<%= "<script>alert('safety:)');</script>" %>
<%#= 'here' -%>
<%== "<script>alert('danger!');</script>" %>
----finish----
EOF
puts template.result


