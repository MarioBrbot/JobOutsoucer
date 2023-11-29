# JobOutsoucer - General Information
Job Outsourcing Application

Technologies used: .NET, C#, ASP.NET, Razor Pages, SQL Server, Javascript, HTML, CSS

The Job Outsourcer .NET Core Razor Pages web application serves as a platform for outsourcing common everyday jobs and services. If you want to run the app locally please first deploy the SQL database with all the necessary tables, you can find it in ~\JobOutsourcer\Job_Outsourcer.DataAccess\Data\job_outsourcer_backup.sql .

The application contains a total of three roles: administrator, user and partner. The administrator generally serves to coordinate the application, they create new categories, job types and the jobs themselves. They have insight into the requests of users and partners and manages their rights. They also have an insight into all orders and can perform any necessary actions. A partner is a person who sees all the current active orders to which they are entitled to and they can accept them if the conditions suit them. They can review all active and previous jobs and ask the administrator for rights to new types of jobs, with providing necessary evidence. The user selects what they want from the offered jobs and then select an appointment and write a possible note. They have an overview of all their own completed and active orders, where they evaluate the partner after the job is done. 

# Administrator Role

The Administrator role represents the coordinator of the application, the person with the greatest and most important capabilities. The administrator creates new jobs and all accompanying data types, handles partners and users, their requests, and has final insight into orders. 

- Administrator registration: Under the "Naslovna" option, a view opens to the administrator where he can register new administrators. After entering a set of required data (name, surname, e-mail, contact number, password) and confirming the registration from the required data, a new object of type ApplicationUser is created, which is stored in the user table, and a new record is created in the table that connects roles and users .

- View, edit, delete and add categories: Under the "Admistracija" option, we have a submenu where, by selecting "Kategorije", we get to the display of existing categories in tabular form. In the table, we have a display of some basic data, such as the name and order of display (for users) and a column with associated actions.

  ![image](https://github.com/MarioBrbot/JobOutsoucer/assets/150728108/e23f999e-a2de-4ce4-a440-f8ee35d7c098)

New categories can be added by clicking the "Dodaj Kategoriju" button on the category view. It opens a new view where information about the name of the new category and the desired number of views is entered into the form. From the entered data, a new category object is stored in the category table.
Categories can be edited by clicking the "Uredi" button on the category view. It opens a new view in which we can edit the loaded data and thus update that record in the database.
Categories can be deleted by clicking on the "Obriši" button on the category view, thus there is a possibility to delete records about the desired category. A warning dialog is displayed in which it is necessary to confirm or reject the category deletion procedure.

- Display, edit and delete job types: By selecting the "Tipovi posla" option on the administration sub-menu, the existing job types are displayed in tabular form. In the table there is a display of some basic data such as the name, the corresponding category, and there is also a column with the corresponding actions.

![image](https://github.com/MarioBrbot/JobOutsoucer/assets/150728108/d503e672-7be8-4d4a-b496-a4afe134e39e)

New job types can be added by clicking the "Add Job Type" button on the job types display. It opens a new view where information about the name of the new job type is entered into the form and its category is selected. From the entered data, a new job type object is stored in the job types table.
Job types can be edited by clicking the "Edit" button on the job types view. It opens a new view where it is possible to edit the uploaded data and thus update that record in the database.
Job types can be deleted by clicking on the "Delete" button on the job types display, thereby deleting the records of the desired job type. A warning dialog is displayed in which it is necessary to confirm or reject the process of deleting the job type.

- View, edit and delete jobs: Under the "Administration" option, there is a submenu where, by selecting the "Jobs" option, you can see the existing jobs in tabular form. In the table there is a display of some basic data such as the name, price, associated type of work and a column with associated actions.
New jobs can be added by clicking the "Add job" button on the jobs view. It opens a new view where information about the name, price, description, picture and associated job type is entered into the form. From the entered data, a new job object is stored in the job table.
Job types can be edited by clicking the "Edit" button on the job view. It opens a new view where it is possible to edit the uploaded data and thus update that record in the database.

![image](https://github.com/MarioBrbot/JobOutsoucer/assets/150728108/846700ff-7967-4410-b250-7da1271e6488)

Job types can be deleted by clicking on the "Delete" button on the job display, which makes it possible to delete records about the desired job. A warning dialog is displayed in which you need to confirm or reject the job deletion procedure.

- View, lock and unlock users: Under the "Administration" option, there is a submenu where, by selecting the "Users" option, you can view the existing users in tabular form. The table shows some basic data such as first and last name, e-mail address, contact number and columns with associated actions.
Users can be locked or unlocked by clicking the "Lock" or "Unlock" button on the user view overview. The LockUnlock function is called, which is passed the identifier of the selected user.

![image](https://github.com/MarioBrbot/JobOutsoucer/assets/150728108/412a9902-ebf0-4a63-82d5-072312f65747)

- View, edit rights, lock and unlock partners: Under the "Administration" option, there is a submenu where, by selecting the "Partners" option, you can see the existing partners in tabular form. The table shows some basic data such as first and last name, e-mail address, contact number, rating and a column with associated actions.
Partners are locked and unlocked according to the same principle as users, while rights can be edited by clicking the "Edit rights" button on the partner view. It opens a new view in which it is possible to give or remove permission for the partner to perform types of work.

- Display and review of user requests: Under the "Requests" option, there is a submenu where, by selecting the "User Requests" option, the existing user requests are displayed in tabular form. The table shows some basic information about requests, such as the title, name and surname of the sender, status (read or unread) and a column with associated actions.

![image](https://github.com/MarioBrbot/JobOutsoucer/assets/150728108/e22d6a33-504c-4152-a0ad-f42626ce76fb)

Requests can be viewed by clicking the "View" button on the user requests display. It opens a new view where the administrator can view the title and content of the request and mark it as read.

- View and review partner requests: Under the "Requests" option, there is a submenu where, by selecting the "Partner Requests" option, you can view the existing partner requests in tabular form. The table shows some basic information about requests, such as the title, name and surname of the sender, status (read or unread) and a column with associated actions.
Requests can be viewed by clicking the "View" button on the partner requests view. It opens a new view where the administrator can view the title and content of the request, download the attached evidence document and mark it as read.

- View and view details of all orders: Under the "Orders" option, a display of all orders opens in tabular form, filtered by their status (refunded, published, collected and completed). The table shows some basic information about orders, such as the order identifier, the orderer's name, the orderer's email, the total amount of the order, and a column with associated actions.

  ![image](https://github.com/MarioBrbot/JobOutsoucer/assets/150728108/ca1ec093-fb31-4c84-9006-109aadcc3b94)

  We can view order details by clicking the "Details" button on the order view. It opens a new view where the administrator can review more information about the order and, if necessary, refund it or mark it completed.



  # Partner Role

