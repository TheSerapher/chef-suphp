name             'suphp'
maintainer       'Sebastian Grewe'
maintainer_email 'sebastian@grewe.ca'
license          'Apache 2.0'
description      'Installs/Configures suphp for Apache'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

%w{ php build-essential apache2 }.each do |cb|
  depends cb
end
