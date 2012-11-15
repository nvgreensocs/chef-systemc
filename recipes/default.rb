Chef::Log.warn("Assuming you have downloaded the systemc kit")

#the plan is to have the recipy simply stall and wait for the file to 'arrive' in the right place 
#constantly pining the user and saying " please put systemc in this location ....

bash "Extract systemc" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
 
  tar -xf chef-solo-1/cookbooks/chef-systemc/files/default/systemc-2.3.0.tgz
  cd systemc-2.3.0
  mkdir objdir
  cd objdir
  mkdir -p /usr/local/systemc-2.3.0
   ../configure --prefix=/usr/local/systemc-2.3.0
   make
   make install

  EOH
  creates "/usr/local/systemc-2.3.0"
end

