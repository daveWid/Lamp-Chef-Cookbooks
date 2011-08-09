#
# Cookbook Name:: lamp
# Recipe:: phpmyadmin
#
# Copyright 2011, Dave Widmer
#
# Licensed under the MIT license
#

package "phpmyadmin" do
	action :install
end

# Link the phpmyadmin config
link "#{node[:apache][:dir]}/conf.d/phpmyadmin.conf" do
	to "../../phpmyadmin/apache.conf"
	owner "root"
	group "root"
	notifies :reload, resources(:service => "apache2"), :delayed
end