require 'pathname'
require 'rubygems'
require 'httparty'
require 'pp'
require 'socket'

dir = Pathname(__FILE__).dirname.expand_path
 
require dir + 'rightscale-api/api'
require dir + 'rightscale-api/client'

# Management API
require dir + 'rightscale-api/deployments'
require dir + 'rightscale-api/servers'
require dir + 'rightscale-api/right_scripts'
require dir + 'rightscale-api/statuses'

