class testing-pages {

	file { '/var/www/html/':
		ensure => directory,
		owner => 'vagrant',
		group => 'vagrant',
        recurse => true,
        links => manage,
        source => '/vagrant/files/html/',
        require => Package['httpd']
    }

    package { 'httpd':
    	ensure => latest,
    }

    service { 'httpd':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Package['httpd']
    }
}