# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


######################
###   Properties   ###
######################

asset_tag = Property.create(name: "Asset Tag", style:"Text Field")
manufacturer = Property.create(name: "Manufacturer", style:"Text Field")
model = Property.create(name: "Model", style:"Text Field")
mac = Property.create(name: "MAC", style:"Text Field")
location = Property.create(name: "Location", style:"Text Field")
printer_queue = Property.create(name: "Printer Queue", style:"Text Field")
serial_number = Property.create(name: "Serial Number", style:"Text Field")
service_tag = Property.create(name: "Service Tag", style:"Text Field")
port_count = Property.create(name: "Port Count", style:"Dropdown List", values:"8 Port, 24 Port, 48 Port, Other")
poe = Property.create(name: "PoE Capable", style:"Dropdown List", values:"Yes - Standard PoE, Yes - UBNT 24v/48v PoE, No")
firmware = Property.create(name: "Firmware", style:"Text Field")
user = Property.create(name: "User", style:"Person Select")
purchase_date = Property.create(name: "Purchase Date", style:"Text Field")
warranty = Property.create(name: "Warranty", style:"Dropdown List", values:"In Warranty, Expired")
ram = Property.create(name: "RAM", unit:"GB", style:"Text Field")
hdd = Property.create(name: "HD", unit:"GB", style:"Text Field")
os = Property.create(name: "OS", style:"Dropdown List", values:"Microsoft Windows 7, Microsoft Windows 8, Microsoft Server 2008R2, Microsoft Server 2012R2, Linux Ubuntu, Other")
purpose = Property.create(name: "Purpose", style:"Text Field")
ports = Property.create(name: "Ports", style:"Text Field")
flash_storage = Property.create(name: "Flash Storage", style:"Dropdown List", values:"16GB, 32GB, 64GB, 128GB")
carrier = Property.create(name: "Cellular Carrier", style:"Dropdown List", values:"ATT, Verizon, Sprint, T-Mobile, Other")
storage = Property.create(name: "Storage", style:"Text Field")
file_shares = Property.create(name: "File Shares", style:"Text Field")
hd_count = Property.create(name: "Number of HDs", style:"Text Field")

#########################
###   Device Groups   ###
#########################
printers = DeviceGroup.create(name: "Printers")
switches = DeviceGroup.create(name: "Switches")
cameras = DeviceGroup.create(name: "Cameras")
computers = DeviceGroup.create(name: "Computers")
virtual_machines = DeviceGroup.create(name: "Virtual Machines")
mfi_hardware = DeviceGroup.create(name: "mFi Hardware")
ipads = DeviceGroup.create(name: "iPads")
routers = DeviceGroup.create(name: "Routers")
physical_servers = DeviceGroup.create(name: "Physical Servers")
file_storage = DeviceGroup.create(name: "File Storage")

###################################
###   Device Group Properties   ###
###################################
printers.properties << asset_tag
printers.properties << manufacturer
printers.properties << model
printers.properties << mac
printers.properties << location
printers.properties << printer_queue
printers.properties << serial_number
printers.properties << service_tag

switches.properties << asset_tag
switches.properties << manufacturer
switches.properties << model
switches.properties << port_count
switches.properties << poe
switches.properties << location

cameras.properties << asset_tag
cameras.properties << location
cameras.properties << firmware
cameras.properties << model
cameras.properties << manufacturer
cameras.properties << mac

computers.properties << asset_tag
computers.properties << user
computers.properties << serial_number
computers.properties << purchase_date
computers.properties << warranty

virtual_machines.properties << ram
virtual_machines.properties << hdd
virtual_machines.properties << os
virtual_machines.properties << mac
virtual_machines.properties << purpose
virtual_machines.properties << ports

mfi_hardware.properties << asset_tag
mfi_hardware.properties << location
mfi_hardware.properties << purpose
mfi_hardware.properties << mac

ipads.properties << asset_tag
ipads.properties << flash_storage
ipads.properties << carrier
ipads.properties << user

routers.properties << port_count
routers.properties << location

physical_servers.properties << asset_tag
physical_servers.properties << hdd
physical_servers.properties << ram
physical_servers.properties << os
physical_servers.properties << purpose
physical_servers.properties << ports
physical_servers.properties << manufacturer
physical_servers.properties << mac
physical_servers.properties << purchase_date

file_storage.properties << asset_tag
file_storage.properties << storage
file_storage.properties << hd_count
file_storage.properties << location
file_storage.properties << manufacturer
file_storage.properties << model
file_storage.properties << file_shares

#################
###   Users   ###
#################
user = User.create(first_name: "The", last_name: "Administrator", email: "admin@testing.com", password:"password", role:"admin")