 class perl-testing {

 	package { 'perl-App-cpanminus.noarch':
 		ensure => latest,
 	}


 	package { 'perl-LWP-Protocol-https.noarch':
 		ensure => latest,
 	}

 	package { 'perl-JSON.noarch':
 		ensure => latest,
 	}

 	package { 'perl-Plack':
 		ensure => latest,
 	}
 
 	exec {'install selenium-remote-driver':
		command => 'cpanm -f Selenium::Remote::Driver',
		path    => '/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin',
		cwd     => '/usr/local/bin',
		require => Package['perl-App-cpanminus.noarch','perl-LWP-Protocol-https.noarch', 'perl-Plack','perl-JSON.noarch' ],
	}
 }