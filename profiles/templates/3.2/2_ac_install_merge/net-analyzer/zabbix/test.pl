# Calculate path=/etc/zabbix/scripts chown=zabbix:zabbix chmod=500

#!/usr/bin/perl
 
 $first = 1;
  
  print "{\n";
  print "\t\"data\":[\n\n";
   
   for (`lsblk -ndo NAME`)
   {
       if(m/sd[a-z]/){
       $fsname =$&;
       $devmodel='';
       
       for(`sudo smartctl -i /dev/$fsname`)
       {
            if(m/Device\sModel\:\s+/){
	       $devmodel=$';
	      $devmodel=~s/\W$//
            
	    }
       
       }

        print "\t,\n" if not $first;
	$first = 0;
	
	print "\t{\n";
        print "\t\t\"{#DEVNAME}\":\"$fsname\",\n";
        print "\t\t\"{#DEVMODEL}\":\"$devmodel\"\n";
        print "\t}\n";
        }
    }
print "\n\t]\n";
print "}\n";



#   for (`lsblk -ld | awk {'print $1'}`)
