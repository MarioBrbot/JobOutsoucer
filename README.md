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
