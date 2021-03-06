#
# Cookbook Name:: suphp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install dependencies
node['suphp']['cookbooks'].each do |cb|
  include_recipe cb
end
node['suphp']['packages'].each do |pkg|
  package pkg
end

if node['platform_family'] == 'rhel'
  # Download archive
  remote_file "#{Chef::Config[:file_cache_path]}/suphp-#{node['suphp']['version']}.tar.gz" do
    source node['suphp']['url'] + 'suphp-' + node['suphp']['version'] + '.tar.gz'
    checksum node['suphp']['checksum']
    notifies :run, 'bash[extract_suphp]', :immediately
  end

  bash 'extract_suphp' do
    action :nothing
    cwd Chef::Config[:file_cache_path]
    code <<-EOF
      tar xzf suphp-#{node['suphp']['version']}.tar.gz
    EOF
    notifies :run, 'bash[install_suphp]', :immediately
  end

  bash 'install_suphp' do
    action :nothing
    cwd Chef::Config[:file_cache_path] + '/suphp-' + node['suphp']['version']
    code <<-EOF
      [[ '#{node['apache']['version']}' == '2.4' ]] && export CPPFLAGS="-I/usr/include/apr-0 -I/usr/include/apr-1"
      autoreconf -if
      ./configure #{node['suphp']['configure_opts']}
      [[ '#{node['apache']['version']}' == '2.4' ]] && sed -e 's/^MAYBE_AP.*/MAYBE_AP\ =\ apache2/g' -i src/Makefile
      make -j #{node['cpu']['total']}
      make install
    EOF
  end

  template '/etc/suphp.conf' do
    source 'suphp.conf.erb'
  end
end

# Install our module
apache_module 'suphp' do
  conf true
end
