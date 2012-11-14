Chef::Log.warn("Assuming you have downloaded the systemc kit")


tar_package 'systemc-2.3.0.tgz' do
  prefix '/usr/local'
  creates '/usr/local/lib/systemc.so'
end

