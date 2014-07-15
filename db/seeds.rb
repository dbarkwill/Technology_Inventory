# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


group1 = DeviceGroup.create(name: "Printers")
attrb11 = Attr.create(name: "Manufacturer")
attrb12 = Attr.create(name: "Model")
attrb13 = Attr.create(name: "MAC")
attrb14 = Attr.create(name: "Location")
attrb15 = Attr.create(name: "Printer Queue")
attrb16 = Attr.create(name: "Serial Number")
attrb17 = Attr.create(name: "Service Tag")

group1.attrs << attrb11
group1.attrs << attrb12
group1.attrs << attrb13
group1.attrs << attrb14
group1.attrs << attrb15
group1.attrs << attrb16
group1.attrs << attrb17


group2 = DeviceGroup.create(name: "Switches")
attrb21 = Attr.create(name: "Manufacturer")
attrb22 = Attr.create(name: "Model")
attrb23 = Attr.create(name: "Port Count", style:"Dropdown List", values:"8 Port, 24 Port, 48 Port, Other")
attrb24 = Attr.create(name: "PoE Capable", style:"Dropdown List", values:"Yes - Standard PoE, Yes - UBNT 24v/48v PoE, No")
attrb25 = Attr.create(name: "Location")

group2.attrs << attrb21
group2.attrs << attrb22
group2.attrs << attrb23
group2.attrs << attrb24
group2.attrs << attrb25


group3 = DeviceGroup.create(name: "Cameras")
attrb31 = Attr.create(name: "Location")
attrb32 = Attr.create(name: "Firmware")
attrb33 = Attr.create(name: "Model")
attrb34 = Attr.create(name: "Manufacturer")
attrb35 = Attr.create(name: "MAC")

group3.attrs << attrb31
group3.attrs << attrb32
group3.attrs << attrb33
group3.attrs << attrb34
group3.attrs << attrb35


group4 = DeviceGroup.create(name: "Computers")
attrb41 = Attr.create(name: "User")
attrb42 = Attr.create(name: "Serial Number")
attrb43 = Attr.create(name: "Purchase Date")
attrb44 = Attr.create(name: "Warranty", style:"Dropdown List", values:"In Warranty, Expired")

group4.attrs << attrb41
group4.attrs << attrb42
group4.attrs << attrb43
group4.attrs << attrb44


group5 = DeviceGroup.create(name: "Virtual Machines")
attrb51 = Attr.create(name: "RAM", unit:"GB")
attrb52 = Attr.create(name: "HD", unit:"GB")
attrb53 = Attr.create(name: "OS", style:"Dropdown List", values:"Microsoft Windows 7, Microsoft Windows 8, Microsoft Server 2008R2, Microsoft Server 2012R2, Linux Ubuntu, Other")
attrb54 = Attr.create(name: "MAC")
attrb55 = Attr.create(name: "Purpose")
attrb56 = Attr.create(name: "Ports")

group5.attrs << attrb51
group5.attrs << attrb52
group5.attrs << attrb53
group5.attrs << attrb54
group5.attrs << attrb55
group5.attrs << attrb56


group6 = DeviceGroup.create(name: "mFi Hardware")
attrb61 = Attr.create(name: "Location")
attrb62 = Attr.create(name: "Purpose")
attrb63 = Attr.create(name: "MAC")

group6.attrs << attrb61
group6.attrs << attrb62
group6.attrs << attrb63


group7 = DeviceGroup.create(name: "iPads")
attrb71 = Attr.create(name: "Storage", style:"Dropdown List", values:"16GB, 32GB, 64GB, 128GB")
attrb72 = Attr.create(name: "Cellular", style:"Dropdown List", values:"ATT, Verizon, Sprint, T-Mobile, Other")
attrb73 = Attr.create(name: "Owner")

group7.attrs << attrb71
group7.attrs << attrb72
group7.attrs << attrb73


group8 = DeviceGroup.create(name: "Routers")
attrb81 = Attr.create(name: "Port Count")
attrb82 = Attr.create(name: "Location")

group8.attrs << attrb81
group8.attrs << attrb82


group9 = DeviceGroup.create(name: "Physical Servers")
attrb91 = Attr.create(name: "HD", unit:"GB")
attrb92 = Attr.create(name: "RAM", unit:"GB")
attrb93 = Attr.create(name: "OS", style:"Dropdown List", values:"Microsoft Windows 7, Microsoft Windows 8, Microsoft Server 2008R2, Microsoft Server 2012R2, Linux Ubuntu, Other")
attrb94 = Attr.create(name: "Purpose")
attrb95 = Attr.create(name: "Ports")
attrb96 = Attr.create(name: "Manufacturer")
attrb97 = Attr.create(name: "MAC")

group9.attrs << attrb91
group9.attrs << attrb92
group9.attrs << attrb93
group9.attrs << attrb94
group9.attrs << attrb95
group9.attrs << attrb96
group9.attrs << attrb97


group0 = DeviceGroup.create(name: "File Storage")
attrb01 = Attr.create(name: "Storage")
attrb02 = Attr.create(name: "Location")
attrb03 = Attr.create(name: "Manufacturer")
attrb04 = Attr.create(name: "Model")
attrb05 = Attr.create(name: "Shares")

group0.attrs << attrb01
group0.attrs << attrb02
group0.attrs << attrb03
group0.attrs << attrb04
group0.attrs << attrb05

user = User.create(first_name: "The", last_name: "Administrator", email: "admin@testing.com", password:"password", role:"admin")
