package "build-essential"

remote_file Chef::Config[:file_cache_path]+"/systemc-2.3.0.tgz" do
  source "http://www.greensocs.com/files/systemc-2.3.0.tgz"
  mode "0644"
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

  EOH
  creates "/usr/local/systemc-2.3.0/README"
end

