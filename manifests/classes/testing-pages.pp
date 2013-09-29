class testing-pages {

	 exec {'install_test_pages':
		command => 'rsync -ap /vagrant/files/www /var/; chown -R apache. /var/www/html; setenforce 0',
		path    => '/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin',
		cwd     => '/usr/local/bin',
		require => Package['httpd'],
	}

    package { 'httpd':
    	ensure => latest,
    }

    service { 'httpd':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => [ Package['httpd'], Exec['install_test_pages'] ]
    }
}