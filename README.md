# Public Library Database Management System

This project involves the design and implementation of a Database Management System (DBMS) for a public library using PostgreSQL. The system tracks the library's collection of materials, their catalogs, the genres to which they belong, borrowing activity of members, the authors of the materials, and the staff who manage the library. It also includes functionalities for querying and manipulating the data, as well as triggers for alerting staff about overdue materials and managing member statuses based on overdue occurrences.

## Scope

The scope of this project includes:
1. Designing the database schema for the library management system.
2. Implementing the database schema using PostgreSQL.
3. Populating the database with sample data.
4. Writing SQL queries for data retrieval and manipulation.
5. Creating triggers to automate specific functionalities.

## Database Design

### Entities and Attributes
1. **Material**
   - Attributes: Material_ID, Title, Publication_Date, Catalog_ID, Genre_ID
   - Constraints: A Material can be associated with a single Catalog entry and a single Genre.

2. **Catalog**
   - Attributes: Catalog_ID, Name, Location

3. **Genre**
   - Attributes: Genre_ID, Name, Description

4. **Borrow**
   - Attributes: Borrow_ID, Material_ID, Member_ID, Staff_ID, Borrow_Date, Due_Date, Return_Date

5. **Author**
   - Attributes: Author_ID, Name, Birth_Date, Nationality

6. **Authorship**
   - Attributes: Authorship_ID, Author_ID, Material_ID

7. **Member**
   - Attributes: Member_ID, Name, Contact_Info, Join_Date

8. **Staff**
   - Attributes: Staff_ID, Name, Contact_Info, Job_Title, Hire_Date

### Constraints
- Primary keys: Material_ID, Borrow_ID, Genre_ID, Catalog_ID, Author_ID, Authorship_ID, Member_ID, and Staff_ID should all be unique identifiers for their respective tables.
- Foreign keys: Referencing appropriate tables.
- Attribute constraints: For example, Due_Date should be after Borrow_Date, Publication_Date should not be after the current date.

### Relationships
- A Material has many Authorship entries (1:M relationship).
- A Material has one Genre (M:1 relationship).
- A Material has one Catalog entry (M:1 relationship).
- An Author has many Authorship entries (1:M relationship).
- An Authorship entry has one Material and one Author (many-to-one-to-many relationship).
- A Member has many Borrow records (1:M relationship).
- A Catalog entry has one Material (1:M relationship).
- A Borrow field has one Material, one Member, and one Staff (many-to-one-to-many relationship).

## Database Implementation

### DBMS
- PostgreSQL was chosen for this project.

### Tables Creation
- The following tables were created: Catalog, Genre, Material, Member, Staff, Borrow, Author, Authorship.

### Sample Data Insertion
- Sample data was populated into each table.

### SQL Queries

1. Retrieve currently available materials in the library.
2. Identify overdue materials as of a specific date.
3. List the top 10 most borrowed materials.
4. Count the books written by a specific author.
5. Count and list books written by two or more authors.
6. Identify the most popular genres.
7. Count materials borrowed within a specific date range.
8. Update the return date for a specific borrowed material.
9. Delete a specific member and their related records.
10. Add a new material to the database.

### Stored Procedures and Triggers

1. **Alert Staff on Overdue Materials**: 
   - A stored procedure is created to check daily for overdue materials and alert staff.

2. **Membership Management**:
   - Triggers were created to:
     - Deactivate a membership after three overdue occurrences.
     - Reactivate a membership once the overdue fee is paid.

## Getting Started

### Prerequisites
- PostgreSQL installed.
- SQL client (e.g., pgAdmin, DBeaver).

### Installation
1. Clone the repository.
2. Run the SQL scripts to create the database and tables.
3. Insert sample data using provided SQL scripts.
4. Execute provided queries to interact with the database.

## Usage
- Modify the SQL scripts as needed to customize the database.
- Use the provided queries to perform various data retrieval and manipulation operations.
- Extend the database with additional features and functionalities as needed.

## Contributing
- Contributions are welcome. Please open an issue or submit a pull request for any changes.

## License
- This project is licensed under the MIT License.

## Acknowledgments
- Professor Binqian Yin for guidance and support.

---

**Author:** Junaid Mohammed 
**Institution:** George Mason University
