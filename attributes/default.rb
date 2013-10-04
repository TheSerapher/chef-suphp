case platform_family
when 'rhel'
  default['suphp']['cookbooks'] = %w{ php apache2 build-essential }
  default['suphp']['packages'] = %w{ libtool php-devel httpd-devel }
  default['suphp']['install_method'] = 'source'
  default['suphp']['apxs'] = '/usr/sbin/apxs'
when 'debian'
  default['suphp']['cookbooks'] = %w{ php apache2 }
  default['suphp']['packages'] = %w{ libapache2-mod-suphp }
end
default['suphp']['configure_opts'] = "--prefix=/usr --sysconfdir=/etc --with-apr=/usr/bin/apr-1-config --with-apxs=#{node['suphp']['apxs']} --with-apache-user=#{node['apache']['user']} --with-setid-mode=owner --with-logfile=#{node['apache']['log_dir']}/suphp_log"
default['suphp']['url'] = 'http://suphp.org/download/'
default['suphp']['version'] = '0.7.2'
default['suphp']['checksum'] = 'e09d4d73a552f4a5bb46961ac7e7ea61c5c24757a8b80d8d770e4c7ed6519760'
