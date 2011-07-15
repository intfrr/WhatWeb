##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DLI-LPC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-15
version "0.1"
description "Digital Loggers Inc remote switch with built-in web server for remote reboot and power control - Homepage: http://www.digital-loggers.com/lpc.html"

# Defaults Settings #
# IP: 192.168.0.100
# Username: admin
# Password: 1234

# Manuals #
# http://www.digital-loggers.com/lpcman.pdf
# http://www.digital-loggers.com/lpc2man.pdf
# http://www.digital-loggers.com/lpc3man.pdf

# ShodanHQ results as at 2011-07-15 #
# 1,583 for DLILPC

# Examples #
examples %w|
207.231.214.196
204.249.202.150
70.35.52.179
168.105.206.150
67.207.109.107
76.8.226.52
63.249.82.42
96.46.14.202
38.101.245.194
70.35.52.179
68.186.39.252
204.249.202.150
|

# Matches #
matches [

# Title
{ :text=>'<title>Power Controller </title>' },

# Form
{ :text=>'<FORM NAME="login" ID="login" ACTION="/login.tgi" METHOD=post>' },
{ :text=>'<FORM NAME="secin" ID="secin" ACTION="/login.tgi" METHOD=post>' },

# h1 warning
{ :text=>'<tr><td align=center><h1>Warning: Insecure Authentication</h1></td></tr>' },

# Submitbtn
{ :text=>'<TD><INPUT onClick="calcResponse(); return false;" TYPE="Submit" NAME="Submitbtn" VALUE="OK">' },

]

# Passive #
def passive
	m=[]

	# DLILPC Cookie
	m << { :name=>"DLILPC Cookie" } if @meta["set-cookie"] =~ /DLILPC=""; Version=[\d]+; Max-Age=[\d]+; Path=/

	# Return passive matches
	m
end

end

