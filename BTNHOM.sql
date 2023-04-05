--TẠO BẢNG
CREATE DATABASE QLBH

CREATE TABLE SANPHAM(
MASP VARCHAR(2) NOT NULL ,
TENSP NVARCHAR(50) NOT NULL,
GIA MONEY
CONSTRAINT PK_SP PRIMARY KEY(MASP)
)

CREATE TABLE NHANVIEN(
MANV VARCHAR(4),
TENNV NVARCHAR(50),
SDT VARCHAR(15)
CONSTRAINT PK_NV PRIMARY KEY (MANV)
)
CREATE TABLE BAN(
MABAN VARCHAR(6),
TENBAN VARCHAR (20)
CONSTRAINT PK_BAN PRIMARY KEY (MABAN)
)
CREATE TABLE HOADON(
MAHD VARCHAR(4),
MANV VARCHAR(4),
MABAN VARCHAR(6),
NGAYDAT DATE,
GIODAT TIME(7)
CONSTRAINT PK_HD PRIMARY KEY(MAHD),
CONSTRAINT FK_HD_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
CONSTRAINT FK_HD_B FOREIGN KEY (MABAN) REFERENCES BAN (MABAN)
)
CREATE TABLE HOADON_CHITIET(
MAHD VARCHAR(4),
MASP VARCHAR(2),
SOLUONG INT
CONSTRAINT FK_HDCT FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD),
CONSTRAINT FK_HD FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
)
--NHẬP LIỆU
INSERT INTO SANPHAM values('1',N'Sữa chua dâu tây',27000)
INSERT INTO SANPHAM values('2',N'Nước ép thơm',27000)
INSERT INTO SANPHAM values('3',N'Trà sữa truyền thống',17000)
INSERT INTO SANPHAM values('4',N'Espresso',15000)
INSERT INTO SANPHAM values('5',N'Sinh tố dừa',30000)
INSERT INTO SANPHAM values('6',N'Trà sữa kem cheese',25000)
INSERT INTO SANPHAM values('7',N'cà phê muối',25000)
INSERT INTO SANPHAM values('8',N'Sữa chua đá',20000)
INSERT INTO SANPHAM values('9',N'Bánh flan',6000)
INSERT INTO SANPHAM values('10',N'Trà tắc xí muội',19000)
INSERT INTO SANPHAM values('11',N'Trà sữa thái xanh',17000)
INSERT INTO SANPHAM values('12',N'Sữa chua việt quất',27000)

INSERT INTO NHANVIEN values('NV01',N'Trần Thị Hiền','0836734187')
INSERT INTO NHANVIEN values('NV02',N'Nguyễn Thị Ngân Hà','0836734183')

INSERT INTO BAN values('T2-12', N'Tầng 2, Bàn 12')
INSERT INTO BAN values('T1-05', N'Tầng 1, Bàn 5')
INSERT INTO BAN values('T2-10', N'Tầng 2, Bàn 10')
INSERT INTO BAN values('T2-06', N'Tầng 2, Bàn 6')
INSERT INTO BAN values('T2-04', N'Tầng 2, Bàn 4')
INSERT INTO BAN values('T1-09', N'Tầng 1, Bàn 9')


INSERT INTO HOADON values('HD1','NV01','T2-04','2022-11-9','21:23:00')
INSERT INTO HOADON values('HD2','NV01','T2-04','2022-11-15','15:35:00')
INSERT INTO HOADON values('HD3','NV01','T2-04','2022-11-9','21:20:00')
INSERT INTO HOADON values('HD4','NV01',null,'2022-11-9','21:21:00')
INSERT INTO HOADON values('HD5','NV01',null,'2022-11-9','17:28:00')
INSERT INTO HOADON values('HD6','NV01',null,'2022-11-9','14:14:00')
INSERT INTO HOADON values('HD7','NV01','T1-09','2022-11-9','18:58:00')
INSERT INTO HOADON values('HD8','NV01','T2-06','2022-11-9','21:27:00')
INSERT INTO HOADON values('HD9','NV01','T2-06','2022-11-9','21:27:00')
INSERT INTO HOADON values('HD10','NV01','T2-12','2022-11-9','19:55:00')
INSERT INTO HOADON values('HD11','NV01','T1-05','2022-11-15','15:43:00')
INSERT INTO HOADON values('HD12','NV01','T2-12','2022-11-15','15:23:00')
INSERT INTO HOADON values('HD13','NV02','T2-10','2022-11-17','14:54:00')
INSERT INTO HOADON values('HD14','NV02','T2-06','2022-11-17','14:46:00')
INSERT INTO HOADON values('HD15','NV02','T2-12','2022-12-02','15:45:00')

INSERT INTO HOADON_CHITIET values('HD15','12',1)
INSERT INTO HOADON_CHITIET values('HD14','5',1)
INSERT INTO HOADON_CHITIET values('HD13','5',2)
INSERT INTO HOADON_CHITIET values('HD12','10',1)
INSERT INTO HOADON_CHITIET values('HD12','11',1)
INSERT INTO HOADON_CHITIET values('HD11','2',1)
INSERT INTO HOADON_CHITIET values('HD10','3',1)
INSERT INTO HOADON_CHITIET values('HD9','6',1)
INSERT INTO HOADON_CHITIET values('HD8','6',1)
INSERT INTO HOADON_CHITIET values('HD7','7',1)
INSERT INTO HOADON_CHITIET values('HD6','4',1)
INSERT INTO HOADON_CHITIET values('HD5','9',1)
INSERT INTO HOADON_CHITIET values('HD5','3',1)
INSERT INTO HOADON_CHITIET values('HD4','5',1)
INSERT INTO HOADON_CHITIET values('HD3','8',1)
INSERT INTO HOADON_CHITIET values('HD2','5',1)
INSERT INTO HOADON_CHITIET values('HD1','1',1)

select * from HOADON
select * from HOADON_CHITIET
select * from BAN
select * from NHANVIEN 
select * from SANPHAM

--enable để đăng nhập được vào login và user
ALTER LOGIN sa ENABLE ;  
GO  
ALTER LOGIN sa WITH PASSWORD = '<enterStrongPasswordHere>' ;  
GO  
--tạo login và user, phân quyền cho user
create login ngothuong with password ='1234'
create user ngothuong for login ngothuong
grant select, insert on SANPHAM to ngothuong
--Vì phân quyền cho từng user, nếu trường hợp có nhiều user thì khá mất thời gian nên có cách khác là tạo nhóm
--tiếp theo phân quyền nhóm rồi sau này user thuộc nhóm nào chỉ cần add vào thì sẽ tiết kiệm thời gian hơn
--tạo nhóm
create role nhom
--phân quyền cho nhóm
grant select on SANPHAM to nhom--(đoạn này phải dùng dbo của QLBH thì mới "on KHACHHANG" được chứ ở dbo khác thì không đâu nha)
--thêm user vào nhóm
--nếu trường hợp user mới thì tạo
create login user1 with password= '1234'
create user user1 for login user1
Sp_AddRoleMember 'nhom','user1' 

