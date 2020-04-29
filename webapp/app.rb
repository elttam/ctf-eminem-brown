#!/usr/bin/env ruby

class Gem::StubSpecification; def data; raise "no-data-for-you"; end; end

class Flag
  def self.[](password)
    if password == "soulintent"
      puts File.read("flag.txt")
    end
  end
end

unless ARGV.empty?
  Marshal.load(STDIN.read)
  exit!
end

require "sinatra"
require "sinatra/cookies"
require "base64"

configure do
  enable :inline_templates
end

helpers do
  include ERB::Util
end

set :environment, :production

get "/" do
  @title = "Eminem Challenge"

  erb :index
end

get "/version" do
  RUBY_VERSION
end

get "/source" do
  File.read(__FILE__)
end

get "/bruce" do
  payload = Base64.urlsafe_decode64(params[:payload].to_s)
  response = ""
  IO.popen("ruby #{__FILE__} --stan 2>/dev/null", "r+") do |pipe|
    pipe.puts payload
    pipe.close_write
    response = pipe.gets
  end
  response
end


__END__

@@ layout
<!doctype html>
<html>
 <head>
   <style>
    html, body {
        height: 100%;
        background-color: brown;
        height: 100%;
        margin: 0px;
        padding: 0px;
        color: white;
        font-family: courier, monospace;
        text-align: center;
    }
    h1 {
        margin-top: 5%;
    }
    a {
        color: green;
    }
    input {
        padding: 10px;
    }
  </style>
  <title><%= h @title %></title>
 </head>
 <body>
 <div class="box">
  <h1><%= h @title %></h1>
  <%= yield %></p>
 </div>
 </body>
</html>

@@ index
<a href="/version">Version</a><br />
<a href="/source">Source Code</a>
