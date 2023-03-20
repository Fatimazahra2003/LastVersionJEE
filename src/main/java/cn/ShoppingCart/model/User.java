package cn.ShoppingCart.model;
public class User {
		private static int id;
		private String name;
		private String email;
		private String adresse;
		private String phone; 
		private String role;
		private String password;

		public User() {
		}

		public User(String name, String email,String a,String ph ,String password, String role) {
			id += 1;
			this.name = name;
			this.email = email;
			this.adresse=a;
			this.phone=ph;
			this.password = password;
			this.role = role;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
		
		public String getAdresse() {
			return adresse;
		}

		public void setAdresse(String a) {
			this.adresse = a;
		}
		
		public String getPhone() {
			return phone;
		}

		public void setPhone(String ph) {
			this.phone = ph;
		}
		
		public boolean isAdmin() {
			return this.role.equals("admin");
		}
		
		

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		@Override
		public String toString() {
			return "User [id=" + id + ", name=" + name + ", email=" + email + ", role= "+ this.role +", adresse= "+adresse+", Phone= "+phone +", password=" + password + "]";
		}
		
	}
