#!/usr/bin/ruby

# content

#theme = "bootstrap"
index = "about"
# todo add page order
pages = {}
pages["about"] =
'
# About

## h2 one

here\'s markdown for my about page

## h2 two

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.
'

pages["portfolio"] =
'
# Portfolio

## h2

here\'s markdown for my portfolio page
'





# template

header_template =
'
<head>
  <title>TITLE_GOES_HERE</title>
  <link rel="stylesheet" href="./bootstrap.min.css">
  <link rel="stylesheet" href="./strapdown/strapdown.css">
  <link rel="stylesheet" href="./bootstrap-responsive.min.css">
</head>
'

navbar_template =
'
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="./">Francesco Georg</a>
      </div>
      <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
PAGE_LINKS_GO_HERE
        </ul>
      </div>
    </div>
  </nav>
</body>
'

# generate html and save

pages.each do |key, val|
  fname = "#{key == index ? 'index' : key}.html"
  puts "building #{fname}..."
  links = "";
  i = 0
  pages.each do |key2, val2|
    fname2 = "#{key2 == index ? 'index' : key2}.html"
    links += "          <li#{' class="active"' if key == key2}><a href=\"#{key2}\">#{key2.capitalize}</a></li>#{"\n" if i < pages.count - 1}"
    i += 1
  end
  content = 
'<!DOCTYPE html>
<html>
'
  content += header_template.sub 'TITLE_GOES_HERE', "Francesco Georg: #{key.capitalize}"
  content +=
'<xmp style="display:none;" >
'
  content += val
  content +=
'</xmp>
<script src="strapdown/strapdown.js"></script>
'
  content += navbar_template.sub 'PAGE_LINKS_GO_HERE', links
  content +=
'</html>
'

  File.open("build/#{fname}", 'w') { |file| file.write(content) }

end

puts "done!"