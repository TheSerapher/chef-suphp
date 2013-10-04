default['suphp']['packages'] = %w{ libtool php-devel httpd-devel }
default['suphp']['cookbooks'] = %w{ php apache2 build-essential }
default['suphp']['url'] = 'http://suphp.org/download/'
default['suphp']['version'] = '0.7.2'
default['suphp']['checksum'] = 'e09d4d73a552f4a5bb46961ac7e7ea61c5c24757a8b80d8d770e4c7ed6519760'
default['suphp']['configure_opts'] = '--prefix=/usr --sysconfdir=/etc --with-apr=/usr/bin/apr-1-config --with-apxs=/usr/sbin/apxs --with-apache-user=apache --with-setid-mode=owner --with-logfile=/var/log/httpd/suphp_log'
