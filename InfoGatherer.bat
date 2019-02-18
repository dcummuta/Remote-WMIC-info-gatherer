:: Created by: David Cummuta November 17th, 2017
:: Last Updated: January 16th, 2018 
:: This is a batch file to remotely gather information from machines.  
:: The IP address or hostname/clientname need to be filled out as "NODE" and local pc creds "User: and PASSWORD:" 
:: of the target machine need to be filled in for the commands to work.  
:: When ran it creates an HTML table file in the directory you choose at the end of each command where you choose a filename.  
::-------------------------------------------------------------
::OS info
@ECHO Getting Operating System Information
@wmic /NODE:AMSCCAR1 /USER:"\Administrator" /PASSWORD:password OS get OSArchitecture, Manufacturer, CSName,CSDVersion,OSProductSuite, ServicePackMajorVersion, OSType, Version /format:hform >>"c:\Temp\Clientinfo.html"
@ECHO DONE!
::-------------------------------------------------------------
::Hardware Info
@ECHO Gathering Hardware Specifications
::CPU 
@ECHO CPU 
@wmic /NODE:AMSCCAR1 /USER:"\Administrator" /PASSWORD:password CPU get Architecture, MaxClockSpeed, ProcessorType /format:hform >>"c:\Temp\Clientinfo.html"
@ECHO DONE!
:: RAM
@ECHO RAM
@wmic /NODE:AMSCCAR1 /USER:"\Administrator" /PASSWORD:password memorychip get BankLabel, Capacity, Manufacturer, MemoryType, Speed, Name /format:htable >>"c:\Temp\Clientinfo.html"
@wmic /NODE:AMSCCAR1 /USER:"\Administrator" /PASSWORD:password memphysical get MaxCapacity, MemoryDevices /format:hform >>"c:\Temp\Clientinfo.html"
@ECHO DONE!
::-------------------------------------------------------------
::Network Info
@ECHO Gathering Client Network Information
@wmic /NODE:AMSCCAR1 /USER:"\Administrator" /PASSWORD:password nicconfig get MACAddress, DefaultIPGateway, IPAddress, IPSubnet, DNSDomain  /format:hform >>"c:\Temp\Clientinfo.html"
@ECHO DONE!
::Host Name
@ECHO Adding Hostname
@wmic /NODE:AMSCCAR1 /USER:"\Administrator" /PASSWORD:password computersystem get name /format:hform >>"c:\Temp\Clientinfo.html"
@ECHO DONE!
::-------------------------------------------------------------
@ECHO If any file that is created have 0KB-1KB size than something didn't go right with its connection.  
@ECHO Try using Client name in the Bat file instead of IP Adress or Vice Versa for the /NODE: If permissions issue it will say so when command fails
@pause>nul|set/p =any key to exit ...
