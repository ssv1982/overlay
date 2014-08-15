# Calculate merge()!= path=/etc/zabbix/script chown=zabbix:zabbix chmod=500

use nvidia::ml qw(:all);
 
     nvmlInit();
      

#  ($ret, $version) = nvmlSystemGetDriverVersion();
#  die nvmlErrorString($ret) unless $ret == $nvidia::ml::bindings::NVML_SUCCESS;
#  print "Driver version: " . $version . "\n";
  
($ret, $handle) = nvmlDeviceGetHandleByIndex($i);
#($ret, $memory) = nvmlDeviceGetMemoryInfo($handle);
# print "Total memory " . $memory->{"total"} . "\n";
# print "Used memory " . $memory->{"used"} . "\n";
# print "Free memory " . $memory->{"free"} . "\n";
 
# ($ret, $speed) = nvmlDeviceGetFanSpeed($handle);
# next if $ret != $nvidia::ml::bindings::NVML_SUCCESS;
# print "Device " . $i . " fan speed: " . $speed . "%\n";

($ret, $temp) = nvmlDeviceGetTemperature($handle,$NVML_TEMPERATURE_GPU);
 print $temp . "\n";
