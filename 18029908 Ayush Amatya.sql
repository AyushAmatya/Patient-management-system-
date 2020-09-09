CONNECT system;
russellayush12345
CREATE USER nepal_mediciti IDENTIFIED BY russellayush;
GRANT RESOURCE, CONNECT TO nepal_mediciti;
CONNECT nepal_mediciti;
russellayush
CREATE TABLE patients(
patient_id VARCHAR2(25) NOT NULL,
f_name VARCHAR2(25) NOT NULL,
m_name VARCHAR2(25),
l_name VARCHAR2(25) NOT NULL,
type VARCHAR2(25) NOT NULL,
total_bill NUMBER(10),
PRIMARY KEY(patient_id)
);
DESC patients;
CREATE TABLE contact_details(
contact_id VARCHAR2(25) NOT NULL,
cell_num VARCHAR2(25),
email_address VARCHAR2(25) NOT NULL,
PRIMARY KEY(contact_id)
);
DESC contact_details;
CREATE TABLE address_details(
address_id VARCHAR2(25) NOT NULL,
country VARCHAR2(25) NOT NULL,
province VARCHAR2(25) NOT NULL,
city VARCHAR2(25) NOT NULL,
street VARCHAR2(25) NOT NULL,
street_num VARCHAR2(25) NOT NULL,
phone_num VARCHAR2(25) NOT NULL,
fax_num VARCHAR2(25),
PRIMARY KEY(address_id)
);
DESC address_details;
CREATE TABLE patient_contacts(
patient VARCHAR2(25) NOT NULL,
contact VARCHAR2(25) NOT NULL,
type VARCHAR2(25) NOT NULL,
FOREIGN KEY(patient) REFERENCES patients(patient_id),
FOREIGN KEY(contact) REFERENCES contact_details(contact_id)
);
DESC patient_contacts;
CREATE TABLE patient_address(
patient VARCHAR2(25) NOT NULL,
address VARCHAR2(25) NOT NULL,
type VARCHAR2(25) NOT NULL,
FOREIGN KEY(patient) REFERENCES patients(patient_id),
FOREIGN KEY(address) REFERENCES address_details(address_id)
);
DESC patient_address;
CREATE TABLE appointments(
appointment_id VARCHAR2(25) NOT NULL,
patient VARCHAR2(25) NOT NULL,
appointment_date DATE NOT NULL,
type VARCHAR2(25) NOT NULL,
specification VARCHAR2(25) NOT NULL,
PRIMARY KEY(appointment_id)
);
DESC appointments;
CREATE TABLE wards(
ward_id VARCHAR2(25) NOT NULL,
type VARCHAR2(25) NOT NULL,
price NUMBER(10) NOT NULL,
PRIMARY KEY(ward_id)
);
DESC wards;
CREATE TABLE appointment_details(
appointment VARCHAR(25) NOT NULL,
ward_id VARCHAR(25) NOT NULL,
total_appoint_bill NUMBER(10) NOT NULL,
doctor_commission NUMBER(10) NOT NULL,
appointment_charge NUMBER(10) NOT NULL,
FOREIGN KEY(appointment) REFERENCES appointments(appointment_id),
FOREIGN KEY(ward_id) REFERENCES wards(ward_id)
);
DESC appointment_details;
CREATE TABLE treatment_details(
treatment_id VARCHAR2(25) NOT NULL,
description VARCHAR2(25) NOT NULL,
treatment_price NUMBER(10) NOT NULL,
PRIMARY KEY(treatment_id)
);
DESC treatment_details;
CREATE TABLE treatment_to_be_done(
appointment VARCHAR2(25) NOT NULL,
treatment VARCHAR2(25) NOT NULL,
treatment_date DATE NOT NULL,
FOREIGN KEY(appointment) REFERENCES appointments(appointment_id),
FOREIGN KEY(treatment) REFERENCES treatment_details(treatment_id)
);
DESC treatment_to_be_done;
CREATE TABLE staffs(
staff_id VARCHAR2(25) NOT NULL,
f_name VARCHAR2(25) NOT NULL,
m_name VARCHAR2(25),
l_name VARCHAR2(25) NOT NULL,
type VARCHAR2(25) NOT NULL,
PRIMARY KEY(staff_id)
);
DESC staffs;
CREATE TABLE staff_duties(
staff VARCHAR2(25) NOT NULL,
appointment VARCHAR2(25) NOT NULL,
working_shift VARCHAR2(25) NOT NULL,
FOREIGN KEY(staff) REFERENCES staffs(staff_id),
FOREIGN KEY(appointment) REFERENCES appointments(appointment_id)
);
DESC staff_duties;
CREATE TABLE staff_contacts(
staff VARCHAR2(25) NOT NULL,
contact VARCHAR2(25) NOT NULL,
type VARCHAR2(25) NOT NULL,
FOREIGN KEY(staff) REFERENCES staffs(staff_id),
FOREIGN KEY(contact) REFERENCES contact_details(contact_id)
);
DESC staff_contacts;
CREATE TABLE staff_address(
staff VARCHAR2(25) NOT NULL,
address VARCHAR2(25) NOT NULL,
type VARCHAR2(25) NOT NULL,
FOREIGN KEY(staff) REFERENCES staffs(staff_id),
FOREIGN KEY(address) REFERENCES address_details(address_id)
);
DESC staff_address;



insert into wards(ward_id, type, price) values ('W001', 'general', 300);
insert into wards(ward_id, type, price) values ('W002', 'general', 300);
insert into wards(ward_id, type, price) values ('W003', 'VIP', 700);
insert into wards(ward_id, type, price) values ('W004', 'VIP', 700);
insert into wards(ward_id, type, price) values ('W005', 'emergency', 700);
insert into wards(ward_id, type, price) values ('W006', 'emergency', 700);
insert into wards(ward_id, type, price) values ('W007', 'general', 700);




INSERT INTO treatment_details(treatment_id, description, treatment_price) VALUES ('T001', 'blood test', 250);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T002', 'x-ray', 450);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T003', 'tensilon test', 350);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T004', 'sleep study', 300);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T005', 'appendectomy', 560);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T006', 'prostatectomy', 260);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T007', 'ultrasound', 750);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T008', 'simulation', 230);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T009', 'catheterizations', 620);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T010', 'angioplasty', 420);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T011', 'facture care', 1520);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T012', 'Arthroplasty', 1950);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T013', 'braces', 6000);
INSERT INTO treatment_details (treatment_id, description, treatment_price) VALUES ('T014', 'crowns and caps', 1200);


INSERT INTO staffs(staff_id, f_name, m_name, l_name, type) VALUES('D001', 'Ayush', null, 'Amatya', 'certified doctor');
INSERT INTO staffs(staff_id, f_name, m_name, l_name, type) values ('D002', 'Wonjal', null, 'Shrestha', 'certified doctor');
INSERT INTO staffs(staff_id, f_name, m_name, l_name, type) values ('S001', 'Suray', 'Kiran', 'Katuwal', 'worker');
INSERT INTO staffs(staff_id, f_name, m_name, l_name, type) values ('S002', 'Bilish', null, 'Kharguja', 'worker');
INSERT INTO staffs(staff_id, f_name, m_name, l_name, type) values ('N002', 'Millan', null, 'Shrestha', 'certified nurse');
INSERT INTO staffs(staff_id, f_name, m_name, l_name, type) values ('N001', 'Kebisha', null, 'Chaguthi', 'uncertified nurse');
INSERT INTO staffs(staff_id, f_name, m_name, l_name, type) values ('D003', 'Babin', 'Raj', 'Chaguthi', 'uncertified doctor');
INSERT INTO staffs(staff_id, f_name, m_name, l_name, type) values ('N005', 'Rhisha', null, 'Silpakar', 'uncertified nurse');



INSERT INTO patients(patient_id, f_name, m_name, l_name, type, total_bill) VALUES('P001', 'Suraj', null, 'Nepal', 'new', 3500);
INSERT INTO patients(patient_id, f_name, m_name, l_name, type, total_bill) VALUES('P002', 'Pratyush', null, 'Basnet', 'new', 2500);
INSERT INTO patients(patient_id, f_name, m_name, l_name, type, total_bill) VALUES('P003', 'Subhay', null, 'Sthapit', 'regular', 2300);
INSERT INTO patients(patient_id, f_name, m_name, l_name, type, total_bill) VALUES('D002', 'Wonjal', null, 'Shrestha', 'certified doctor', 0);
INSERT INTO patients(patient_id, f_name, m_name, l_name, type, total_bill) VALUES('D003', 'Babin', 'Raj', 'Chaguthi', 'uncertified doctor', 1500);
INSERT INTO patients(patient_id, f_name, m_name, l_name, type, total_bill) VALUES('S002', 'Billish', null, 'Kharguja', 'worker', 1700);
INSERT INTO patients(patient_id, f_name, m_name, l_name, type, total_bill) VALUES('N005', 'Rhisha', null, 'Silpakar', 'uncertified nurse', 1500);
INSERT INTO patients(patient_id, f_name, m_name, l_name, type, total_bill) VALUES('D001', 'Ayush', null, 'Amatya', 'certified doctor', 1650);



INSERT INTO appointments(appointment_id, patient, appointment_date, type, specification) VALUES ('A001', 'P001', DATE '2019-05-13', 'general', 'general practitioner');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A002', 'P002', DATE '2019-12-30', 'VIP', 'dentist');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A003', 'D001', DATE '2019-09-15', 'VIP', 'dentist');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A004', 'D001', DATE '2019-09-15', 'VIP', 'cardiologist');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A005', 'D002', DATE '2019-11-15', 'VIP', 'neurologist');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A006', 'D002', DATE '2019-12-18', 'general', 'general practitioner');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A007', 'S002', DATE '2019-11-30', 'general', 'dentist');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A008', 'N005', DATE '2018-12-30', 'emergency', 'radiologist');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A009', 'P002', DATE '2018-12-25', 'emergency', 'radiologist');
insert into appointments(appointment_id, patient, appointment_date, type, specification) values('A010', 'P003', DATE '2018-12-05', 'general', 'radiologist');



INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co01', '9818963833', 'amatyahome@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co02', '9843803470', 'surajnepal@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co03', '9843368556', 'haku@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co04', '9740058923', 'phantom12@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co05', '9841285586', 'laxmiprasad77@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co06', '9235098722', 'aasthanepal69@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co07', '9032829023', 'bohora123@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co08', '9846234457', 'shristha5439@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co09', '9898374529', 'rahullpraz@yahoo.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co10', '9678394145', 'hritikstha@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co11', null, 'babinraj@hotmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co12', '9818322025', 'bublumankura@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co13', '9623693485', 'wonjalbabe@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co14', '7563892645', 'suraykiran98@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co15', '1249574903', 'kabinshreshta@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co16', null, 'kritihandari78@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co17', null, 'nagarpalikamulaXD.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co18', '9813196337', 'russellayush24.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co19', '7846297342', 'conversaitoina@gmail.com');
INSERT INTO contact_details(contact_id, cell_num, email_address) VALUES('Co20', '88923747592', 'lonelytrue@gmail.com');



INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad01','nepal', '5', 'pokhara', 'itache', '12', '016611016', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad02','nepal', '9', 'clanton', 'wall street', 'MR012', '016613897', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad03','nepal', 'par23', 'eufaula', 'pennsylyav', 'PEr12', '01665674', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad04','uk', 'utherpradesh', 'aubrun', 'changu', 'A12', '016611986', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad05','india', 'karnali', 'kathmandu', 'nasamana', 'tu29', '018459316', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad06','usa', 'dheli', 'bhaktapur', 'bansogopal', '43', '01665346', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad07','spain', '12', 'lalitpur', 'pottery square', '903', '435661016', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad08','uk', '23', 'patan', 'taumadhi', '12', '01668566', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad09','brazil', 'sudurpaschim', 'chitlang', 'chardobato', '12', '01456731016', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad10','australia', 'karnali', 'kulekhani', 'suryavinayak', '1mad2', '016741016', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad11','france', 'gandaki', 'lunbini', 'nala', '1oip', '0166116', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad12','italy', 'par23', 'pokhara', 'ohasur', '1pol', '0166134566', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad13','mexico', 'birendranagar', 'pokhara', 'anamnagar', '12312', '013455216', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad14','india', 'karnali', 'banepa', 'srijananagra', 'MT0L9', '0166134566', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad15','nepal', 'alberta', 'dhulikhel', 'tinkunne', 'L4c56', '01667867316', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad16','nepal', 'manitoba', 'boudha', 'baneshowt', '34', '01634556', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad17','uk', 'new brunswick', 'bhaktapur', 'sankhamul', '903ad2', '034511016', null);
INSERT INTO address_details(address_id, country, province, city, street, street_num, phone_num, fax_num) VALUES('Ad18','uk', 'nunavut', 'palanhok', 'kamalpokhari', 'bo234', '0165016', null);



INSERT INTO patient_contacts(patient, contact, type) VALUES ('P001', 'Co01', 'permanent');  
INSERT INTO patient_contacts(patient, contact, type) VALUES ('P002', 'Co02', 'permanent');
INSERT INTO patient_contacts(patient, contact, type) VALUES ('D002', 'Co10', 'permanent');
INSERT INTO patient_contacts(patient, contact, type) VALUES ('N005', 'Co11', 'permanent');
INSERT INTO patient_contacts(patient, contact, type) VALUES ('D003', 'Co12', 'permanent');
INSERT INTO patient_contacts(patient, contact, type) VALUES ('D001', 'Co13', 'permanent');
INSERT INTO patient_contacts(patient, contact, type) VALUES ('S002', 'Co14', 'permanent');
INSERT INTO patient_contacts(patient, contact, type) VALUES ('P003', 'Co03', 'permanent');
INSERT INTO patient_contacts(patient, contact, type) VALUES ('D001', 'Co09', 'temporary');
INSERT INTO patient_contacts(patient, contact, type) VALUES ('S002', 'Co15', 'temporary');


INSERT INTO patient_address(patient, address, type) VALUES ('P001', 'Ad01', 'permanent');
INSERT INTO patient_address(patient, address, type) VALUES ('P002', 'Ad02', 'permanent');
INSERT INTO patient_address(patient, address, type) VALUES ('D002', 'Ad03', 'permanent');
INSERT INTO patient_address(patient, address, type) VALUES ('N005', 'Ad04', 'permanent');
INSERT INTO patient_address(patient, address, type) VALUES ('D003', 'Ad05', 'permanent');
INSERT INTO patient_address(patient, address, type) VALUES ('D001', 'Ad06', 'permanent');
INSERT INTO patient_address(patient, address, type) VALUES ('S002', 'Ad07', 'permanent');
INSERT INTO patient_address(patient, address, type) VALUES ('P003', 'Ad08', 'temporary');
INSERT INTO patient_address(patient, address, type) VALUES ('D001', 'Ad09', 'temporary');
INSERT INTO patient_address(patient, address, type) VALUES ('S002', 'Ad10', 'temporary');
INSERT INTO patient_address(patient, address, type) VALUES ('N005', 'Ad11', 'temporary');
INSERT INTO patient_address(patient, address, type) VALUES ('P003', 'Ad12', 'permanent');
INSERT INTO patient_address(patient, address, type) VALUES ('D001', 'Ad13', 'temporary');


INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A001', 'T001', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A002', 'T002', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A003', 'T003', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A004', 'T004', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A005', 'T005', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A006', 'T006', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A007', 'T007', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A008', 'T008', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A009', 'T009', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A010', 'T010', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A007', 'T011', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A006', 'T012', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A003', 'T013', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A010', 'T014', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A004', 'T001', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A003', 'T005', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A009', 'T009', DATE '2019-12-30');
INSERT INTO treatment_to_be_done(appointment, treatment, treatment_date) values ('A002', 'T011', DATE '2019-12-30');



INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A001', 'W001', 9000, 900, 300);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A002', 'W003', 15000, 1500, 700);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A003', 'W004', 14000, 1400, 700);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A004', 'W004', 20000, 2000, 700);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A005', 'W003', 19000, 1900, 700);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A006', 'W001', 10000, 900, 300);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A007', 'W002', 8000, 800, 300);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A008', 'W005', 12000, 1200, 500);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A009', 'W006', 11500, 1150, 500);
INSERT INTO appointment_details(appointment, ward_id, total_appoint_bill, doctor_commission, appointment_charge) VALUES ('A010', 'W001', 8000, 800, 300);


INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('D001', 'A001', '10am - 3pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('D002', 'A002', '11am - 5pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('S001', 'A003', '01pm - 4pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('N002', 'A004', '9am - 1pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('N001', 'A005', '12am - 3pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('D003', 'A008', '7am - 12pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('N005', 'A009', '8am - 2pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('D001', 'A010', '7am - 4pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('D002', 'A006', '10am - 3pm');
INSERT INTO staff_duties(staff, appointment, working_shift) VALUES ('S001', 'A007', '6am - 11bm');

 
INSERT INTO staff_contacts(staff, contact, type) VALUES ('D001', 'Co13', 'permanent');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('D001', 'Co09', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('D002', 'Co10', 'permanent');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('S001', 'Co04', 'permanent');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('S001', 'Co05', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('S001', 'Co06', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('S001', 'Co07', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('S002', 'Co14', 'permanent');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('S002', 'Co15', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('N002', 'Co08', 'permanent');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('N002', 'Co26', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('N002', 'Co17', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('N001', 'Co18', 'permanent');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('N001', 'Co19', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('N001', 'Co20', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('D003', 'Co12', 'permanent');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('D003', 'Co03', 'temporary');
INSERT INTO staff_contacts(staff, contact, type) VALUES ('N005', 'Co11', 'permanent');

INSERT INTO staff_address(staff, address, type) VALUES ('D001', 'Ad06', 'permanent');
INSERT INTO staff_address(staff, address, type) VALUES ('D001', 'Ad09', 'temporary');
INSERT INTO staff_address(staff, address, type) VALUES ('D001', 'Ad13', 'temporary');
INSERT INTO staff_address(staff, address, type) VALUES ('D002', 'Ad03', 'permanent');
INSERT INTO staff_address(staff, address, type) VALUES ('N005', 'Ad04', 'permanent');
INSERT INTO staff_address(staff, address, type) VALUES ('N005', 'Ad11', 'temporary');
INSERT INTO staff_address(staff, address, type) VALUES ('D003', 'Ad05', 'permanent');
INSERT INTO staff_address(staff, address, type) VALUES ('D003', 'Ad12', 'temporaryt');
INSERT INTO staff_address(staff, address, type) VALUES ('S002', 'Ad10', 'permanent');
INSERT INTO staff_address(staff, address, type) VALUES ('S001', 'Ad14', 'permanent');
INSERT INTO staff_address(staff, address, type) VALUES ('S001', 'Ad17', 'temporary');
INSERT INTO staff_address(staff, address, type) VALUES ('N002', 'Ad15', 'permanent');
INSERT INTO staff_address(staff, address, type) VALUES ('N001', 'Ad15', 'permanent');
INSERT INTO staff_address(staff, address, type) VALUES ('N001', 'Ad18', 'temporary');



