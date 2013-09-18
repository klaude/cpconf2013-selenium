class php-testing {

	package {'php':
		ensure => latest,
	}

	package {'php-xml':
		ensure => latest,
		require => Package['php']
	}

	package {'php-devel':
		ensure => latest,
		require => Package['php']
	}

	package {'php-pear':
		ensure => latest,
		require => Package['php']	
	}

	exec {'install composer':
		command => 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin && mv composer.phar composer',
		path    => '/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin',
		cwd     => '/usr/local/bin',
		require => Package['php'],
		unless  => 'test -x /usr/local/bin/composer',
	}

}