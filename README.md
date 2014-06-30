# erb_safe_ext

add method to erb. Protect from XSS attack.

I think change the origin `<%=` method is not always good. maybe add  a `<%~` method is better. 

## Install

```sh
$ gem install erb_safe_ext
```

## Introduction

``` erb
<%~ "<script>alert('safety:)');</script>" %>
## &lt;script&gt;alert(&#39;safety:)&#39;);&lt;/script&gt;
```

``` erb
<%= "<script>alert('danger!');</script>" %>
## <script>alert('danger!');</script>
```


## Test code

``` ruby
require 'erb_safe_ext'
template = ERB.new <<-EOF
<%~ "<script>alert('safety:)');</script>" %>
<%= "<script>alert('danger!');</script>" %>
----finish----
EOF
puts template.result
```

# readme about version <= 1.0.4

## Introduction

``` erb
<%= "<script>alert('safety:)');</script>" %>
## &lt;script&gt;alert(&#39;safety:)&#39;);&lt;/script&gt;
```

it will default wrap the dangerous code with `ERB::Util.html_escape(code)`

works fine with ruby2.0.

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

but don't do following things:

1. `require 'erubis'`

2. add gems that dependent on erubis, such as `better_errors` (you may find out all dependences in file `Gemfile.lock`)

### Sinatra exception template
the original sinatra exception template display ugly with erb_safe_ext, so I rewrite it.

``` ruby
require 'sinatra/base'
require 'erb_safe_ext/sinatra/exception_template'
```