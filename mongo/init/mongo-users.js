db.createUser(
    {
        user: "employees",
        pwd: "employees123",
        roles: [
            {
                role: "readWrite",
                db: "Employees"
            }
        ]
    }
);