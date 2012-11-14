Chef::Log.warn("Assuming you have downloaded the systemc kit")


bash "Extract systemc" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  
echo "HERE"
pwd

     tar -zxf /tmp/systemc-2.3.0.tgz
exit -2
    
  EOH
  creates "/usr/lib/systemc.so"
end

