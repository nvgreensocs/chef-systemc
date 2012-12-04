
#  -------    CHEF-SYSTEMC --------

# LICENSETEXT
# 
#   Copyright (C) 2012 : GreenSocs Ltd
#       http://www.greensocs.com/ , email: info@greensocs.com
# 
# The contents of this file are subject to the licensing terms specified
# in the file LICENSE. Please consult this file for restrictions and
# limitations that may apply.
# 
# ENDLICENSETEXT

package "build-essential"

remote_file Chef::Config[:file_cache_path]+"/systemc-2.3.0.tgz" do
  not_if {File.exists?('/usr/local/systemc-2.3.0/README')}
  source "http://www.greensocs.com/files/systemc-2.3.0.tgz"
  mode "0644"
  action :create_if_missing
end


bash "Extract systemc" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
 
  tar -xf systemc-2.3.0.tgz
  cd systemc-2.3.0
  mkdir objdir
  cd objdir
  mkdir -p /usr/local/systemc-2.3.0
   ../configure --prefix=/usr/local/systemc-2.3.0
   make
   make install
   sudo ldconfig /usr/local/systemc-2.3.0/lib-linux64/

  EOH
  creates "/usr/local/systemc-2.3.0/README"
end

