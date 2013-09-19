#!/usr/bin/perl 

use strict;
use warnings;

use Selenium::Remote::Driver;
use Test::More tests => 8;

my $driver = new Selenium::Remote::Driver( 'remote_server_addr' => 'localhost', 'browser_name' => 'chrome' );

# Navigate to EULA page
$driver->get('http://localhost/eula.html');

my $eula_header = $driver->find_element('html/body/h1', 'xpath')->get_text();

# Check that the page displays the important elements
is($eula_header, 'End User License Agreement', 'Confirm the eula page header is displayed correctly.');
ok($driver->find_element('//textarea', 'xpath')->is_displayed, 'Confirm the textarea with the license is displayed.');
ok($driver->find_element('agree', 'id')->is_displayed, 'Confirm the "I AGREE" button is displayed.');
ok($driver->find_element('decline', 'id')->is_displayed, 'Confirm the "I DISAGREE" is displayed.');

# Test the decline button.

my $start_page = $driver->get_current_url();
$driver->find_element('decline', 'id')->click();
is($driver->get_current_url(), $start_page, 'Confirm that clicking on the "I DISAGREE" button takes us back to the same page.');

# Test the accept button.

$start_page = $driver->get_current_url();
$driver->find_element('agree', 'id')->click();
isnt($driver->get_current_url(), $start_page, 'Confirm that clicking on the "I AGREE" button takes us to a new page.');
my $confirm_header = $driver->find_element('html/body/h1', 'xpath')->get_text();
is($confirm_header, 'Thanks for agreeing', 'Confirm the accept page header is displayed correctly.');
ok($driver->find_element('disclaimer', 'id')->is_displayed, 'Confirm the disclaimer is shown on agree page.');

