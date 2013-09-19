#!/usr/bin/perl 

use strict;
use warnings;

use Selenium::Remote::Driver;
use Test::More tests => 1;

my $driver = new Selenium::Remote::Driver( 'remote_server_addr' => 'localhost', 'browser_name' => 'chrome' );

# Navigate to EULA page
$driver->get('http://localhost/eula.html');

my $title = $driver->find_element('html/body/h1', 'xpath')->get_text();

is($title, 'End User License Agreement', 'Confirm the page title is displayed correctly.');

$driver->quit();