node.override['papertrail']['port'] = node['papertrail']['port'].to_i
include_recipe 'papertrail-rsyslog'

rsyslog_default_template = resources(:template => "/etc/rsyslog.d/50-default.conf")
rsyslog_default_template.cookbook "keboola-common"#

file "/etc/cron.daily/logrotate" do
  action :delete
end

# Add papertrail to all syslog entries for now
template "/etc/rsyslog.d/10-papertrail.conf" do
  source "rsyslog-papertrail.erb"
  mode "0644"
  notifies :restart, "service[rsyslog]"
end
