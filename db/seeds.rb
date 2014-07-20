# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


group1 = DeviceGroup.create(name: "Printers")
attrb11 = Attr.create(name: "Manufacturer", style:"Text Field")
attrb12 = Attr.create(name: "Model", style:"Text Field")
attrb13 = Attr.create(name: "MAC", style:"Text Field")
attrb14 = Attr.create(name: "Location", style:"Text Field")
attrb15 = Attr.create(name: "Printer Queue", style:"Text Field")
attrb16 = Attr.create(name: "Serial Number", style:"Text Field")
attrb17 = Attr.create(name: "Service Tag", style:"Text Field")

group1.attrs << attrb11
group1.attrs << attrb12
group1.attrs << attrb13
group1.attrs << attrb14
group1.attrs << attrb15
group1.attrs << attrb16
group1.attrs << attrb17


group2 = DeviceGroup.create(name: "Switches")
attrb21 = Attr.create(name: "Manufacturer", style:"Text Field")
attrb22 = Attr.create(name: "Model", style:"Text Field")
attrb23 = Attr.create(name: "Port Count", style:"Dropdown List", values:"8 Port, 24 Port, 48 Port, Other")
attrb24 = Attr.create(name: "PoE Capable", style:"Dropdown List", values:"Yes - Standard PoE, Yes - UBNT 24v/48v PoE, No")
attrb25 = Attr.create(name: "Location", style:"Text Field")

group2.attrs << attrb21
group2.attrs << attrb22
group2.attrs << attrb23
group2.attrs << attrb24
group2.attrs << attrb25


group3 = DeviceGroup.create(name: "Cameras")
attrb31 = Attr.create(name: "Location", style:"Text Field")
attrb32 = Attr.create(name: "Firmware", style:"Text Field")
attrb33 = Attr.create(name: "Model", style:"Text Field")
attrb34 = Attr.create(name: "Manufacturer", style:"Text Field")
attrb35 = Attr.create(name: "MAC", style:"Text Field")

group3.attrs << attrb31
group3.attrs << attrb32
group3.attrs << attrb33
group3.attrs << attrb34
group3.attrs << attrb35


group4 = DeviceGroup.create(name: "Computers")
attrb41 = Attr.create(name: "User", style:"Person Select")
attrb42 = Attr.create(name: "Serial Number", style:"Text Field")
attrb43 = Attr.create(name: "Purchase Date", style:"Text Field")
attrb44 = Attr.create(name: "Warranty", style:"Dropdown List", values:"In Warranty, Expired")

group4.attrs << attrb41
group4.attrs << attrb42
group4.attrs << attrb43
group4.attrs << attrb44


group5 = DeviceGroup.create(name: "Virtual Machines")
attrb51 = Attr.create(name: "RAM", unit:"GB", style:"Text Field")
attrb52 = Attr.create(name: "HD", unit:"GB", style:"Text Field")
attrb53 = Attr.create(name: "OS", style:"Dropdown List", values:"Microsoft Windows 7, Microsoft Windows 8, Microsoft Server 2008R2, Microsoft Server 2012R2, Linux Ubuntu, Other")
attrb54 = Attr.create(name: "MAC", style:"Text Field")
attrb55 = Attr.create(name: "Purpose", style:"Text Field")
attrb56 = Attr.create(name: "Ports", style:"Text Field")

group5.attrs << attrb51
group5.attrs << attrb52
group5.attrs << attrb53
group5.attrs << attrb54
group5.attrs << attrb55
group5.attrs << attrb56


group6 = DeviceGroup.create(name: "mFi Hardware")
attrb61 = Attr.create(name: "Location", style:"Text Field")
attrb62 = Attr.create(name: "Purpose", style:"Text Field")
attrb63 = Attr.create(name: "MAC", style:"Text Field")

group6.attrs << attrb61
group6.attrs << attrb62
group6.attrs << attrb63


group7 = DeviceGroup.create(name: "iPads")
attrb71 = Attr.create(name: "Storage", style:"Dropdown List", values:"16GB, 32GB, 64GB, 128GB")
attrb72 = Attr.create(name: "Cellular", style:"Dropdown List", values:"ATT, Verizon, Sprint, T-Mobile, Other")
attrb73 = Attr.create(name: "Owner", style:"Person Select")

group7.attrs << attrb71
group7.attrs << attrb72
group7.attrs << attrb73


group8 = DeviceGroup.create(name: "Routers")
attrb81 = Attr.create(name: "Port Count", style:"Text Field")
attrb82 = Attr.create(name: "Location", style:"Text Field")

group8.attrs << attrb81
group8.attrs << attrb82


group9 = DeviceGroup.create(name: "Physical Servers")
attrb91 = Attr.create(name: "HD", unit:"GB")
attrb92 = Attr.create(name: "RAM", unit:"GB")
attrb93 = Attr.create(name: "OS", style:"Dropdown List", values:"Microsoft Windows 7, Microsoft Windows 8, Microsoft Server 2008R2, Microsoft Server 2012R2, Linux Ubuntu, Other")
attrb94 = Attr.create(name: "Purpose", style:"Text Field")
attrb95 = Attr.create(name: "Ports", style:"Text Field")
attrb96 = Attr.create(name: "Manufacturer", style:"Text Field")
attrb97 = Attr.create(name: "MAC", style:"Text Field")

group9.attrs << attrb91
group9.attrs << attrb92
group9.attrs << attrb93
group9.attrs << attrb94
group9.attrs << attrb95
group9.attrs << attrb96
group9.attrs << attrb97


group0 = DeviceGroup.create(name: "File Storage")
attrb01 = Attr.create(name: "Storage", style:"Text Field")
attrb02 = Attr.create(name: "Location", style:"Text Field")
attrb03 = Attr.create(name: "Manufacturer", style:"Text Field")
attrb04 = Attr.create(name: "Model", style:"Text Field")
attrb05 = Attr.create(name: "Shares", style:"Text Field")

group0.attrs << attrb01
group0.attrs << attrb02
group0.attrs << attrb03
group0.attrs << attrb04
group0.attrs << attrb05

user = User.create(first_name: "The", last_name: "Administrator", email: "admin@testing.com", password:"password", role:"admin")
