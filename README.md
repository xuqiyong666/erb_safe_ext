# erb_safe_ext

a gem make ERB html safe default.Protect from XSS attack.

## Install

```sh
$ gem install erb_safe_ext
```

## Introduction

``` erb
<%= "<script>alert('safety:)');</script>" %>
## &lt;script&gt;alert(&#39;safety:)&#39;);&lt;/script&gt;
```

it will default wrap the dangerous code with `ERB::Util.html_escape(code)`

works fine with ruby2.0.

I didn't test this code with other version ruby, you may test yourself.

the `<%==` is the backup of ERB's original `<%=` function. 

``` erb
<%== "<script>alert('danger!');</script>" %>
## <script>alert('danger!');</script>
```


Test code

``` ruby
require 'erb_safe_ext'
template = ERB.new <<-EOF
<%= "<script>alert('safety:)');</script>" %>
<%#= 'here' -%>
<%== "<script>alert('danger!');</script>" %>
----finish----
EOF
puts template.result
```


