$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'temporal_object'
require 'time_span'

require 'bundler/setup'
require 'rspec'
require 'rspec/autorun'

require 'time_span'
