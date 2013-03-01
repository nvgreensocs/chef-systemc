
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

remote_file Chef::Config[:file_cache_path]+"/systemc-2.3.0.tgz" do
  not_if {File.exists?('/usr/local/systemc-2.3.0/README')}
  source "http://www.greensocs.com/files/systemc-2.3.0.tgz"
  mode "0644"
  action :create_if_missing
end


bash "Extract systemc" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
 
  tar -zxf systemc-2.3.0.tgz
  cd systemc-2.3.0
  mkdir objdir
  cd objdir

  if [ -w /usr/local ]
  then
    prefix=/usr/local/systemc-2.3.0
  else
    prefix="#{node[:prefix]}/systemc-2.3.0"
  fi

  mkdir -p $prefix
  ../configure --prefix=$prefix

  make
  make install

   if [ -w /etc/ld.so.cong.d ]
   then
    echo $prefix/lib-linux64 > /etc/ld.so.conf.d/systemc.conf
    echo $prefix/lib-linux >> /etc/ld.so.conf.d/systemc.conf
   fi
   mkdir -p "#{node[:prefix]}/bash.profile.d"
   echo "export LD_LIBRARY_PATH=$prefix/lib-linux64:\\\$LD_LIBRARY_PATH" > "#{node[:prefix]}/bash.profile.d/systemc.profile"
   echo "export LD_LIBRARY_PATH=$prefix/lib-linux:\\\$LD_LIBRARY_PATH" >> "#{node[:prefix]}/bash.profile.d/systemc.profile"
   echo "export SYSTEMC_HOME=$prefix" >> "#{node[:prefix]}/bash.profile.d/systemc.profile"
   echo "export SYSTEMC_PREFIX=$prefix" >> "#{node[:prefix]}/bash.profile.d/systemc.profile"
   echo "export CFLAGS=\"-I$prefix/include \\\$CFLAGS\"" >> "#{node[:prefix]}/bash.profile.d/systemc.profile"
  EOH
  creates "#{node[:prefix]}/bash.profile.d/systemc.profile"
end


