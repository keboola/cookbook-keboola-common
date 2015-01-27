#
# Cookbook Name:: keboola-storage-api-console
# Recipe:: default
#

group "apache"

user "deploy" do
  gid "apache"
  home "/home/deploy"
  shell "/bin/bash"
end

remote_file "/home/ec2-user/.ssh/authorized_keys" do
	source "https://s3.amazonaws.com/keboola-configs/servers/devel_ssh_public_keys.txt"
  only_if { File.directory?("/home/ec2-user") }
end

directory "/home/deploy/.ssh" do
  owner "deploy"
  group "apache"
  mode 0700
  action :create
end

remote_file "/home/deploy/.ssh/authorized_keys" do
  owner "deploy"
  group "apache"
  mode 0700
  source "https://s3.amazonaws.com/keboola-configs/servers/devel_ssh_public_keys.txt"
end

include_recipe "hostname"
include_recipe "keboola-common::logging"
include_recipe "newrelic"
include_recipe "postfix"
include_recipe "monit"

template 'tmpwatch' do
  path      "/etc/cron.hourly/tmpwatch"
  source    'tmpwatch.erb'
  mode      '0755'
end

monitrc "rsyslog" do
  template_cookbook "keboola-common"
  template_source   "rsyslog.monit.conf.erb"
  source            "rsyslog.monit.conf.erb"
end

execute "monit_restart" do
  user "root"
  group "root"
  command "/bin/cp /etc/monit/monitrc /etc/monit.conf"
  notifies :restart, "service[monit]", :delayed
end

package "curl"
package "git"
package "htop"
package "strace"
