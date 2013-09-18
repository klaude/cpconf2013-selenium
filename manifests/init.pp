#
import "classes/*.pp"

# should remain blank #
node default {
	include selenium	
	include php-testing
	include perl-testing
}
