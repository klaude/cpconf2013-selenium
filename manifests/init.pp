#
import "classes/*.pp"

# should remain blank #
node default {

}

node selenium-demo-box inherits default {
	
}

node /selenium/ inherits selenium-demo-box {
	
}