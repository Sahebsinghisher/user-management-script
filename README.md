# user-management-script

# User Creation Script
This Bash script automates the process of creating a new user on a Linux system. It includes setting up a user account with a username, comment, and an automatically generated secure password. The password is designed to expire on first login, prompting the user to change it for security purposes.

# Features
User Creation: Creates a new user with a specified username and optional comment.
Password Generation: Generates a random 16-character password using `sha256sum`.
Password Expiration: Forces the user to change the password upon first login for enhanced security.
Error Handling: Provides clear error messages if the user creation or password setup fails.

# Usage
To run this script, execute the following command with root or sudo privileges:

bash
$sudo ./create_user.sh USER_NAME [COMMENT]...
->Replace USER_NAME with the desired username.
->Optionally, add a comment about the user, which will be stored in the account's description field.

Example-
$sudo ./create_user.sh johndoe "John Doe - IT Department"
->This command will create a user named johndoe with a comment "John Doe - IT Department".

#Requirements
->Root or sudo access is required to run the script.
->The script should be executed on a Linux system with useradd and chpasswd commands available.
#Important Notes
->Ensure that the script is run with appropriate permissions (sudo or root).
->The generated password will be displayed on the terminal; ensure this is handled securely.

License
This project is licensed under the MIT License - see the LICENSE file for details.

