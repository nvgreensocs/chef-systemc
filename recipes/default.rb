Chef::Log.warn("Assuming you have downloaded the systemc kit")

#cookbook_file "/vagrant/ModelLibrary/systemc-2.3.0.tgz" do
#  source "systemc-2.3.0.tgz"
#  mode "0644"
#end


bash "Extract systemc" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH

echo "HERE"
pwd

     tar -zxf systemc-2.3.0.tgz
exit -2
    
  EOH
  creates "/vagrant/ModelLibrary/amba_socket"
end

