class selenium {


    file { "/etc/yum.repos.d/google-chrome.repo":
        ensure => present,
        content => '
[google-chrome]
name=google-chrome - 64-bit
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub',
    }

    package { 'google-chrome-stable':
		ensure => latest,
		require => File['/etc/yum.repos.d/google-chrome.repo'],
	}

	package { 'java-1.8.0-openjdk.x86_64':
		ensure => latest,
	}

    package{ 'libstdc++':
    	ensure => latest,
    }

    package{'redhat-lsb':
        ensure => latest,
    }

    package{'firefox':
        ensure => latest,
    }

    file { '/home/vagrant/bin/':
		ensure => directory,
		owner => 'vagrant',
		group => 'vagrant',
        recurse => true,
        links => manage,
        source => '/vagrant/files/selenium/',
    }

        file { '/home/vagrant/.config':
		ensure => directory,
		owner => 'vagrant',
		group => 'vagrant',
    }

    file { '/home/vagrant/.config/autostart':
		ensure => directory,
		owner => 'vagrant',
		group => 'vagrant',
    }

    # Automatically start selenium in a terminal
    file { '/home/vagrant/.config/autostart/Selenium.desktop':
		ensure => file,
		owner => 'vagrant',
		group => 'vagrant',
		mode => 0755,
        require => File['/home/vagrant/bin/'],
        content => "[Desktop Entry]
Type=Application
Exec=lxterminal -e 'java -jar /home/vagrant/bin/selenium-server.jar -maxSession=4 -timeout=300'
Hidden=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Selenium
Name=Selenium
Comment[en_US]=Selenium WebDriver
Comment=Selenium WebDriver",
    }

    # Provide a link on the desktop for it as well
    file { '/home/vagrant/Desktop/':
		ensure => directory,
		owner => 'vagrant',
		group => 'vagrant',
    }

    file { '/home/vagrant/Desktop/Selenium.desktop':
		ensure => link,
		owner => 'vagrant',
		group => 'vagrant',
        target => '/home/vagrant/.config/autostart/Selenium.desktop',
    }

}