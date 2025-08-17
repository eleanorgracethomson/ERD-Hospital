# Hospital Management System ERD & SQL Schema

## Project Overview  
This project demonstrates my **SQL database design and ERD modeling skills**.  
I was tasked with creating an **Entity-Relationship Diagram (ERD)** for a hospital management system and implementing the schema in SQL.

The database models the real-world operations of a hospital, including **patients, doctors, appointments, billing, services, insurance, and payments**.

---

## 🗂️ Entities & Relationships
- **Doctor** – Stores doctor details such as name, contact info, and salary.  
- **Patient** – Stores patient demographics and insurance information.  
- **Insurance** – Stores insurance provider details.  
- **Appointment** – Connects patients with doctors, tracks scheduled times and visit reasons.  
- **Bill** – Generated from appointments and linked to bill statuses.  
- **BillStatus** – Tracks bill states (e.g., pending, paid, overdue).  
- **Service** – Defines services offered (e.g., X-ray, lab tests, surgeries).  
- **Bill_Service** – Handles many-to-many relationship between bills and services.  
- **Payment** – Records payments made by either patients or insurance companies.  

---

## Key Features in Design
- **Normalization** – Reduces redundancy across entities.
- **Flexible Payments** – Supports payments by both patients and insurance providers.
- **Bill Tracking** – Allows for detailed financial reporting.
- **Realistic Workflow** – Covers the hospital process from appointment → billing → payment.  

---

## 📊 ERD Diagram
![Hospital ERD](Hospital-Model.mwb)

---

#ERD and Schema for a Hospital
The SQL implementation of the hospital management system can be found in  
[`schema.sql`](schema.sql).

---

## Tech Stack
- **SQL** – Database modeling & schema creation  
- **ERD Tools** – Diagram creation for relational database design  


