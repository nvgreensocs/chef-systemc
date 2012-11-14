Chef::Log.warn("Assuming you have downloaded the systemc kit")


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
  creates "/usr/local/systemc-2.3.0/lib/systemc.so"
end

