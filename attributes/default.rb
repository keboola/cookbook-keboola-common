

default['papertrail']['port'] = 49730

default['postfix']['main']['smtp_sasl_auth_enable'] = 'yes'
default['postfix']['main']['smtp_sasl_password_maps'] = 'static:'
default['postfix']['main']['header_size_limit'] = 4096000
default['postfix']['main']['relayhost'] = '[smtp.sendgrid.net]:587'
default['postfix']['main']['smtp_sasl_security_options'] = 'noanonymous'
default['postfix']['main']['smtp_tls_security_level'] = 'may'


default['set_fqdn'] = "*.keboola.com"
