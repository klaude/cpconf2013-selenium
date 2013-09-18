class tests-source {
	vcsrepo { "/home/vagrant/src":
		ensure 		=> present,
		owner 		=> 'vagrant',
		group 		=> 'vagrant',
		provider 	=> git,
		require 	=> [
			Package['git'],
		],
		source 		=> "https://github.com/n8whnp/cpconf2013-selenium-tests.git",
	}
}