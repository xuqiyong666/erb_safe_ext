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


## Test code

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

## About Sinatra
work fine with sinatra(current version is 1.4.4).
but you should know that sinatra use [tilt](http://rubygems.org/gems/tilt) to render template.
and Sinatra also got Runtime Dependencies with `tilt >= 1.3.4, ~> 1.3`, that will do something make this gem lose effectiveness when you got `erubis` in your environment.
So don't do following things:
1. `require 'erubis'`
2. add gems that dependent on erubis, such as `better_errors` (you may find out all dependences in file `Gemfile.lock`)

yeah.happy coding:)




