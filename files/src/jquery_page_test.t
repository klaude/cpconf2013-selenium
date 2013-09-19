#!/usr/bin/perl 

use strict;
use warnings;

use Selenium::Remote::Driver;
use Test::More tests => 2;

my $driver = new Selenium::Remote::Driver( 'remote_server_addr' => 'localhost', 'browser_name' => 'chrome' );

# Slow down checking to allow ajax calls to return.
$driver->set_implicit_wait_timeout(1000);

$driver->get('http://localhost/jquery_ui_page.html');

# Confirm your on the page
is($driver->get_title(), 'jQuery UI Example Page', 'Confirm page title matches expectations.');

# Test Autocomplete Box
$driver->find_element('countries', 'id')->send_keys('United');

$driver->find_element('United States', 'link_text')->click();

is($driver->find_element('countries', 'id')->get_value(), 'United States', 'Confirm clicking on an autocomplete puts in the right value');

# Test Accordion
ok($driver->find_element('ui-accordion-1-panel-0', 'id')->is_displayed(), 'Confirm the first accordion panel is visable at start.');
ok(!$driver->find_element('ui-accordion-1-panel-1', 'id')->is_displayed(), 'Confirm the second accordion panel is not visable at start.');
$driver->find_element('ui-accordion-1-header-1', 'id')->click();
ok(!$driver->find_element('ui-accordion-1-panel-0', 'id')->is_displayed(), 'Confirm the first accordion panel is not visable after switching to second panel.');
ok($driver->find_element('ui-accordion-1-panel-1', 'id')->is_displayed(), 'Confirm the second accordion panel is visable after switching to second panel.');


$driver->quit();