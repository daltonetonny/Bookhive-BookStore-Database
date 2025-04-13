# BookStore Database Project
Welcome to the **BookStore Database Project** – a comprehensive SQL-powered system designed to manage and streamline the operations of a modern bookstore. Developed as part of the *Database Design & Programming with SQL* course, this project demonstrates practical mastery in MySQL, database normalization, user security, and schema design.

Even with minimal resources, our team ensured a clean, maintainable, and fully normalized database schema that addresses real-world bookstore needs.

---

## Contributors

- **Courage Joshua**  
  [joshuacourage9@gmail.com](mailto:joshuacourage9@gmail.com)

- **Babatunde Folarin Joel**  
  [folababsscopee@yahoo.com](mailto:folababsscopee@yahoo.com)

- **Tonny Oballah**  
  [daltonetonny@gmail.com](mailto:daltonetonny@gmail.com)

---

## Submission Date

**April 13, 2025**

---

## What's Inside?

- **`bookstore.sql`**  
  The heart of the system. It includes:
  - Database and table creation
  - Primary/foreign key constraints
  - Data integrity constraints
  - User role setup
  - Security and permission control

- **`README.md`**  
  You're reading it! This file outlines the project's architecture, setup guide, and design rationale.

- **Full Project Docs**  
  [View Full Documentation](https://docs.google.com/document/d/13tApectCmuTZD-oybPMcpZEcHjasq40Ws_3iGD9gU6w/edit?usp=drivesdk)

---

## Database Schema Overview

### Reference Tables
These hold supporting data for relationships and normalization:
- `book_language` – Languages available  
- `publisher` – Publishing companies  
- `author` – Author profiles  
- `country` – Address countries  
- `address_status` – Current or old address flag  
- `shipping_method` – Shipping options  
- `order_status` – Status stages for orders  

### Main Entities
The primary data tables powering the system:
- `book` – Metadata for each book  
- `book_author` – Linking table for many-to-many book-author relation  

### Customer & Address Handling
Customer and address-related storage:
- `customer` – Customer records  
- `address` – Physical address details  
- `customer_address` – Status-tagged relationship between customers and addresses  

### Order Management
Track everything from cart to shipment:
- `cust_order` – Core order table  
- `order_line` – Books in each order  
- `order_history` – Tracks status changes over time  

### User Access & Security
Role-based access control using:
- `bookstore_read` – Read-only access  
- `bookstore_admin` – Full administrative access  

---

## How to Run the Project

1. **Clone the Repository**
   ```bash
   git clone <your-repository-url>
   cd <repository-folder>
