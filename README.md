Technology Inventory
=====================
<i>Helping to organize every day IT<i>

Objective
---------------------
Technology Inventory is a project that helps organize your IT infrastructure. Everything from Networks, Devices, and People can all be organized in an easy to view manner. Devices can be related to multiple different networks and to the People whom they belong to.

Technology Inventory also helps organize documentation through the creation of knowledge base articles. Articles can be related to devices and device groups to help keep tabs on configurations and important information on everything. 

This project is a continuous endevor. There is plans for more features to be added, with several already in development.

Getting Started
---------------------

To setup the development environment:

```
$ git clone https://github.com/dbarkwill/Technology_Inventory
$ bundle install
$ rake db:migrate
$ rake db:seed
$ rails s
```

This will get the server running and will prepopulate the database with all of the default device groups, as well as the administrator user. 

The default login is:

```
email: admin@testing.com
password: password
```

Feel free to change this information once you are up and running. 