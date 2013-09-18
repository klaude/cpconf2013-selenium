class tests-source {
	file { '/home/vagrant/src':
		ensure => directory,
		owner => 'vagrant',
		group => 'vagrant',
        recurse => true,
        links => manage,
        source => '/vagrant/files/src/'
    }
}