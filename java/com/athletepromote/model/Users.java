package com.athletepromote.model;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="accounts")
public class Users {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;		
	private String lname;
	private String fname;
    private String password;
    private String email;  
    @Transient
    private String password2;
    private String role;
    private String image;
    private String video;
    private int age;
    @Transient
	private MultipartFile file;
    
    @Lob
    @Column(name="imageBytes")
    private byte[] data;
    
    private String fileName;

    private String fileType;
    
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Addressess address;
			
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private List<PaymentMethod> paymentMethod;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private Set<PhoneBook> PhoneBook;
	
	@ManyToMany(cascade = CascadeType.DETACH )
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
    inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles =new HashSet <Role>();
	
	@OneToMany(mappedBy="users_id", cascade=CascadeType.ALL)
	private List<Products> products;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private List<AthleteStats> athleteStats;
	
	  
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	
	public Addressess getAddress() {
		return address;
	}

	public void setAddress(Addressess address) {
		this.address = address;
	}

	public List<PaymentMethod> getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(List<PaymentMethod> paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Set<PhoneBook> getPhoneBook() {
		return PhoneBook;
	}

	public void setPhoneBook(Set<PhoneBook> phoneBook) {
		PhoneBook = phoneBook;
	}
	
	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}


	public List<Products> getProducts() {
		return products;
	}

	public void setProducts(List<Products> products) {
		this.products = products;
	}

	public List<AthleteStats> getAthleteStats() {
		return athleteStats;
	}

	public void setAthleteStats(List<AthleteStats> athleteStats) {
		this.athleteStats = athleteStats;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", lname=" + lname + ", fname=" + fname + ", password=" + password + ", email="
				+ email + ", password2=" + password2 + ", role=" + role + ", image=" + image + ", video=" + video
				+ ", age=" + age + ", file=" + file + ", data=" + Arrays.toString(data) + ", fileName=" + fileName
				+ ", fileType=" + fileType + ", address=" + address + ", paymentMethod=" + paymentMethod
				+ ", PhoneBook=" + PhoneBook + ", roles=" + roles + ", products=" + products + ", athleteStats="
				+ athleteStats + "]";
	}

	
	
	

	
}
