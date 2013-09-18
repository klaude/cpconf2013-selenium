#
import "classes/*.pp"

node default {
	include common-packages
	include selenium	
	include php-testing
	include perl-testing
	include tests-source
	include testing-pages
}
