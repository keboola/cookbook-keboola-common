name             'keboola-common'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures syrup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.3'

depends 'newrelic', '~> 2.0.0'
depends 'hostname', '~> 0.3.0'
depends 'papertrail-rsyslog', '~> 1.1.0'
depends 'postfix', '~> 3.6.0'

