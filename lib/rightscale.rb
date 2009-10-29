require 'pathname'
require 'rubygems'
require 'httparty'
require 'pp'
require 'socket'

dir = Pathname(__FILE__).dirname.expand_path
 
require dir + 'rightscale/api'
require dir + 'rightscale/client'

# Management API
require dir + 'rightscale/deployments'
require dir + 'rightscale/servers'
require dir + 'rightscale/right_scripts'


