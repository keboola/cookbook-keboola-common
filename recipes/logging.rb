node.override['papertrail']['port'] = node['papertrail']['port'].to_i
include_recipe 'papertrail-rsyslog'

rsyslog_default_template = resources(:template => "/etc/rsyslog.d/50-default.conf")
rsyslog_default_template.cookbook "keboola-common"#