#!/usr/bin/env rvm 1.9.3 do ruby

require 'net/http'
require 'json'
require_relative '../config/config'
require_relative '../lib/display_current'

display_current