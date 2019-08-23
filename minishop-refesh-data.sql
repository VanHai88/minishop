-- REFESH DATA
SET FOREIGN_KEY_CHECKS = 0;

delete from chitiethoadon;
delete from chitietkhuyenmai;
delete from chitietsanpham;
delete from chucvu;
delete from danhmucsanpham;
delete from hoadon;
delete from khuyenmai;
delete from mausanpham;
delete from nhanvien;
delete from sanpham;
delete from sizesanpham;

INSERT INTO chitietsanpham(machitietsanpham, masanpham, masize, mamau, soluong, ngaynhap)
VALUES (4,1,1,1,15,'24/11/2017'),
		(5,1,2,2,10,'24/11/2017'),
		(6,1,3,1,8,'24/11/2017'),
		(10,2,1,1,30,'24/11/2017'),
		(11,2,1,2,20,'24/11/2017'),
		(12,2,2,2,10,'24/11/2017'),
		(17,3,1,1,5,'24/11/2017'),
		(18,3,1,2,3,'24/11/2017'),
		(19,3,2,1,5,'24/11/2017'),
		(20,3,3,2,3,'24/11/2017'),
		(21,4,1,1,4,'24/11/2017'),
		(22,4,1,2,6,'24/11/2017'),
		(23,4,2,1,5,'24/11/2017'),
		(24,5,1,1,6,'24/11/2017'),
		(25,6,1,2,7,'24/11/2017'),
		(26,7,1,1,7,'24/11/2017'),
		(27,7,2,1,7,'24/11/2017'),
		(28,7,3,2,8,'24/11/2017'),
		(29,7,2,2,8,'24/11/2017'),
		(30,8,1,1,7,'24/11/2017'),
		(31,9,1,2,7,'24/11/2017'),
		(32,10,2,2,5,'24/11/2017'),
		(33,11,3,1,4,'24/11/2017'),
		(34,12,1,1,5,'24/11/2017'),
		(35,13,1,5,5,'24/11/2017'),
		(36,14,1,3,5,'24/11/2017'),
		(37,15,1,2,4,'24/11/2017'),
		(38,16,1,2,3,'24/11/2017'),
		(39,17,1,2,4,'24/11/2017'),
		(40,18,2,2,6,'24/11/2017'),
		(41,19,1,2,6,'24/11/2017'),
		(42,20,2,3,4,'24/11/2017'),
		(43,21,1,5,6,'24/11/2017');



INSERT INTO chucvu(machucvu, tenchucvu) 
VALUES (1,'Nhân Viên'),
		(2,'Admin'),
		(3,'Người Dùng');


INSERT INTO danhmucsanpham(madanhmuc, tendanhmuc, hinhdanhmuc)
VALUES (1,'Áo Sơ Mi',NULL),
		(2,'Áo Thun',NULL),
		(3,'Quần Sort',NULL),
		(4,'Đồ Kiểu',NULL),
		(5,'Áo Khoác',NULL),
		(6,'Áo Đôi',NULL),
		(7,'Quần Tây',NULL),
		(8,'Quần Jean Adachi',NULL);


INSERT INTO mausanpham(mamau, tenmau)
VALUES (1,'Xanh Dương'),
		(2,'Xám'),
		(3,'Trắng'),
		(4,'Hồng'),
		(5,'Xanh Dương'),
		(6,'Xanh Lá'),
		(7,'Xanh Ngọc');



INSERT INTO nhanvien(manhanvien, hoten, diachi, gioitinh, cmnd, machucvu, email, tendangnhap, matkhau) 
VALUES (1,'Nguyễn Văn Hải','459-Tôn Đức Thắng- Quận Liên Chiểu- Đà Nẵng', 1,'012837233',2,'zzvanhai81@gmail.com','nguyenvanhai','admin1234'),
(2,NULL,NULL,NULL,NULL,NULL,'nguyenvana@gmail.com','nguyenvana@gmail.com','123456');



INSERT INTO sanpham(masanpham, madanhmuc, tensanpham, giatien, mota, hinhsanpham, gianhcho)
 VALUES (1,1,'Sơ Mi Nam No Style TN O01','185,000','- Thiết kế áo sơ mi kiểu dáng basic, dễ dàng mix với nhiều trang phục khác nhau. \n- Chất liệu Kate mềm mịn, thoáng mát. \n- Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,..\n- Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng.\n- Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu.','aosomi1.jpg','nam'),
 (2,1,'Sơ Mi Nam No Style TD R02','225,000','- Thiết kế áo sơ mi kiểu dáng basic, dễ dàng mix với nhiều trang phục khác nhau. \n- Chất liệu Kate mềm mịn, thoáng mát. \n- Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,..\n- Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng.\n- Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu.','aosomi2.jpg','nam'),
 (3,1,'Sơ Mi Nam No Style TN O02','185,000','- Thiết kế áo sơ mi kiểu dáng basic, dễ dàng mix với nhiều trang phục khác nhau. \n- Chất liệu Kate mềm mịn, thoáng mát. \n- Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,..\n- Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng.\n- Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu.','aosomi3.jpg','nam'),
 (4,1,'Sơ Mi Nam No Style TN L01','225,000','- Thiết kế đơn giản và hiện đại với sơ mi tay ngắn. \n- Điểm nhấn ở túi áo và tay áo\n- Chất liệu Kate mang lại cảm giác thoáng mát.\n- Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,..\n- Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng.\n- Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aosomi4.jpg','nam'),
 (5,1,'Áo sơ mi cách điệu - SM12','149,000','- Chất liệu Voan Hàn mang đến sự mềm mại, thoải mái. - Thiết kế cổ đức, tay cộc xẻ, buộc nơ tạo điểm nhấn. Gấu sau đuôi tôm, 2 vạt dài ngắn,mang đến sự thanh lịch. - Màu sắc kẻ nhẹ nhàng, dịu dàng.','aosomi5.jpg','nu'),
 (6,1,'Áo sơ mi cá tính - BS251','179,000','- Chất liệu Voan Hàn mang đến sự mềm mại, thoải mái. - Thiết kế cổ đức, tay cộc xẻ, buộc nơ tạo điểm nhấn. Gấu sau đuôi tôm, 2 vạt dài ngắn,mang đến sự thanh lịch. - Màu sắc kẻ nhẹ nhàng, dịu dàng.','aosomi6.jpg','nu'),
 (7,1,'Áo sơmi phối viền - 4001','77,000','- Chất liệu Voan Hàn mang đến sự mềm mại, thoải mái. - Thiết kế cổ đức, tay cộc xẻ, buộc nơ tạo điểm nhấn. Gấu sau đuôi tôm, 2 vạt dài ngắn,mang đến sự thanh lịch. - Màu sắc kẻ nhẹ nhàng, dịu dàng.','aosomi7.jpg','nu'),
 (8,1,'Áo sơ mi nữ kẻ caro nhỏ phối màu dễ thương chất đẹp - BS1004','149,000','- Chất liệu Voan Hàn mang đến sự mềm mại, thoải mái. - Thiết kế cổ đức, tay cộc xẻ, buộc nơ tạo điểm nhấn. Gấu sau đuôi tôm, 2 vạt dài ngắn,mang đến sự thanh lịch. - Màu sắc kẻ nhẹ nhàng, dịu dàng.','aosomi8.jpg','nu'),
 (9,2,'Áo Thun Nam No Style Essential AB01','255,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothun11.jpg','nam'),
(10,2,'Áo thun nữ in hình hoa bồ công anh AoK1565','120,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothunnu1.jpg','nu'),
(11,2,'Áo Thun Nam No Style Essential GB01','250,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothun22.jpg','nam'),
(12,2,'Áo Thun Nam Ma Bư Essential ST56','255,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothun33.jpg','nam'),
(13,2,'Áo thun nữ in hình Khủng Long QooBee AoK1870','100,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần duyên dáng.','aothunnu2.jpg','nu'),
(14,2,'Áo Thun Nam KiriMaru Basic DN02','255,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothun44.jpg','nam'),
(15,2,'Áo Thun Nam KiriMaru Basic DN04','255,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothun55.jpg','nam'),
(16,2,'Áo Thun Nam No Style Cổ Trụ N02','155,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothun66.jpg','nam'),
(17,2,'THUN NAM 019038WH','255,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothun77.jpg','nam'),
(18,2,'THUN NAM ATB049021RD','215,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát.  - Thiết kế thời trang phù hợp xu hướng hiện nay - Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính. - Cotton chủ yếu trong thành phần sợi vải mang lại nhiều tính năng vượt trội: Thấm hút ẩm tốt, Không co rút,.. - Sử dụng công nghệ dệt may hiện đại hạn chế tối đa nhăn vải trong sử dụng. - Vải không nhuộm với chì an toàn cho sức khỏe, nhưng vẫn ít ra màu','aothun88.jpg','nam'),
(19,3,'QUẦN SORT NAM THỜI TRANG NĂNG ĐỘNG ','115,000','- Được thiết kế với kiểu dáng hiện tại, hợp thời trang. Chúng tôi luôn cặp nhật mẫu mã liên tục để quí khách hàng có nhiều sự lựa chọn hơn. Các bạn nên bấm THEO DÕI shop để nhận được nhiều chương trình khuyến mãi hơn nữa.  - Chất liệu: JEAN (dài, bền, cam kết giống hình 97%)','quansort11.jpg','nam'),
(20,3,'QUẦN SORT NỮ CAO CẤP SHYNFASHION 6','80,000','- MÔ TẢ: Chất liệu: thành phần vải 100% cotton jean. sợi vải bền, đường may tỉ mỉ chắc chắn.  - Quần short jeans thời trang thích hợp phối với các loại áo thun form rộng, áo croptop đầy cá tính. - Vải cực mát - Mịn. Vải loại 1 không xù - chống nhăn. - Thích hợp cho bạn Nữ mặc dạo phố, đi học, đi chơi, chơi thể thao, du lịch, cặp với người yêu. Hoặc có thể mặc tập thể nhóm, lớp.','quansort22.jpg','nam'),
(21,4,'Bộ Quần Áo Thun Nam Tay Lỡ Quần Dài In Chữ Soul Phong Cách 4MENHCM SET NAM 9000021CC','112,000','- Sản Phẩm: Bộ Quần Áo Thun Nam Tay Lỡ Quần Dài In Chữ Soul Phong Cách.  - Chất vải thun mềm mại, dễ thấm hút mồ hôi.  - Thiết kế thời trang, đơn giản, phong cách.  - Kiểu dáng gọn nhẹ, thể thao, năng động.  - Phù hợp nhiều hoàn cảnh: mặc nhà, đi học, đi chơi, du lịch...','dokieu11.jpg','nam'),
(22,4,'Bộ Quần Áo Thun Nam Ngắn Tay Quần Lửng Có Mũ Phong Cách 4MENHCM SET NAM 9000017CC','120,000','- Sản Phẩm: Bộ Quần Áo Thun Nam Ngắn Tay Quần Lửng Có Mũ.  - Chất vải thun mềm mại, dễ thấm hút mồ hôi.  - Thiết kế thời trang, đơn giản, phong cách.  - Kiểu dáng gọn nhẹ, thể thao, năng động.  - Phù hợp nhiều hoàn cảnh: mặc nhà, đi học, đi chơi, du lịch...','dokieu22.jpg','nam'),
(23,4,'YANO áo thun nữ form rộng phong cách hàn quốc vải dày mịn (ĐN)','80,000','- Chất liệu thun mềm mại co giãn tốt , thoáng mát -Thiết kế thời trang phù hợp xu hướng hiện nay -Kiểu dáng đa phong cách, Form rộng Nam nữ đều mặc được -Đường may tinh tế sắc sảo -Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần cá tính.','dokieu33.jpg','nu'),
(24,4,'YANO áo thun nữ form rộng phong cách hàn quốc TN2','100,000','- Hàn Quốc,Quân đội,Cơ bản,Nautical,Thường ngày,Cổ điển,Đơn giản,Thời trang dạo phố,Thời trang học đường,Rock and Roll,Đảo nhiệt đới,Phong cách Bohemian,Lướt ván & Bãi biển,Quyến rũ.','dokieu44.jpg','nu'),
(25,5,'Áo Khoác Nam Ma Bư Kaki AF02','385,000','- Chất liệu vải cao cấp -Cảm giác thoải mái khi mặc -Thấm hút mồ hôi tốt -Thích hợp mặc đi dạo phố cùng bạn bè, đi làm, đi chơi và mặc hàng ngày ở nhà..','aokhoac11.jpg','nam'),
(26,5,'áo khoác dù nhẹ 2 lớp nữ chống nắng W112','120,000','- Chất liệu: Vải dù 2 lớp, lớp bên trong có vải lót giúp thoáng khí mát mẻ -Vải dày đẹp, không nhăn, thời trang -Đường may chắc chắn bền đẹp -Dây kéo (khóa) chắc chắn, không kẹt không hư hỏng -Hàng Việt Nam xuất khẩu, giặt thoải mái không phai không ra màu -Kiểu dáng: Thời trang, trẻ trung, năng động thích hợp cho mọi lứa tuổi.','aokhoac22.jpg','nu'),
(27,6,'THUN DT ĐÔI 127002BL','144,500','- Chất liệu thun mềm mại co giãn tốt , thoáng mát -Thiết kế thời trang phù hợp xu hướng hiện nay -Kiểu dáng đa phong cách-Đường may tinh tế sắc sảo -Áo thun được thiết kế vể đẹp trẻ trung năng động nhưng không kém phần duyên dáng.','aodoi11.jpg','nam'),
(28,6,'ÁO THUN CẶP ĐÔI ROMANTIC THỜI TRANG NHIỀU MÀU','120,000','- Chất liệu cao cấp: mềm hơn, mịn hơn, thoáng mát hơn -Kiểu dáng: trẻ trung, năng động, cá tính -Màu sắc: đa dạng để bạn lựa chọn -Hình in: rõ nét, chất lượng cao, không phai màu -Chất liệu vải: không xù lông, giặt không phai màu.','aodoi22.jpg','nam'),
(29,7,'Quần tây nam Hàn Quốc AT01','300,00','- Chất vải: Co giãn tốt, không bay màu, giữ dáng quần không bị bai -Sản phẩm quần vải nam công sở cao cấp sử dụng chất liệu vải thun cotton dày dặn ,co giãn nhẹ giúp ôm dáng người mặc ,chất liệu mềm mịn ,thoáng mát thấm hút mồ hôi tốt giúp hoạt động thoải mái trong công việc hàng ngày.. -Thiết kế chi tiết ,tỉ mỉ từng chi tiết dù là nhỏ. Kiểu dáng slim trẻ trung ,ống đứng xếp li ôm dáng..','quantay1.jpg','nam'),
(30,7,'Quần tây nam Hàn Quốc AT02','300,000','- Chất vải: Co giãn tốt, không bay màu, giữ dáng quần không bị bai -Sản phẩm quần vải nam công sở cao cấp sử dụng chất liệu vải thun cotton dày dặn ,co giãn nhẹ giúp ôm dáng người mặc ,chất liệu mềm mịn ,thoáng mát thấm hút mồ hôi tốt giúp hoạt động thoải mái trong công việc hàng ngày.. -Thiết kế chi tiết ,tỉ mỉ từng chi tiết dù là nhỏ. Kiểu dáng slim trẻ trung ,ống đứng xếp li ôm dáng..','quantay2.jpg','nam'),
(31,8,'quần jean nam trắng / 6080 violet_fashion','255,000','- Kiểu dáng thời trang,sành điệu. - Tổng thể màu Trắng hài hòa phối rách táo bạo tạo sự năng động, cá tính. - Có hai túi xéo trước và hai túi sau rất tiện dụng. - Chất liệu jean cotton bền đẹp, chắc chắn, không phai màu, không co rút khi giặt.','quanjean1.jpg','nam'),
(32,8,'Quần jean nam ống suông phong cách Âu - Mỹ','200,000','- Kiểu dáng thời trang,sành điệu. - Tổng thể màu xanh hài hòa phối rách táo bạo tạo sự năng động, cá tính. - Có hai túi xéo trước và hai túi sau rất tiện dụng. - Chất liệu jean cotton bền đẹp, chắc chắn, không phai màu, không co rút khi giặt.','quanjean2.jpg','nam'),
(33,8,'Quần Jean Nữ Lưng Cao Dáng Skinny Form ','200,000','- Kiểu dáng thời trang,sành điệu. - Tổng thể màu Đen hài hòa phối rách táo bạo tạo sự năng động, cá tính. - Có hai túi xéo trước và hai túi sau rất tiện dụng. - Chất liệu jean cotton bền đẹp, chắc chắn, không phai màu, không co rút khi giặt.','quanjean3.jpg','nam'),
(34,8,'QUẦN KAKI JEAN RÁCH NHIỀU CỰC CHẤT','250,000','- Kiểu dáng thời trang,sành điệu. - Tổng thể màu xanh hài hòa phối rách táo bạo tạo sự năng động, cá tính. - Có hai túi xéo trước và hai túi sau rất tiện dụng. - Chất liệu jean cotton bền đẹp, chắc chắn, không phai màu, không co rút khi giặt.','quanjean4.jpg','nam');


INSERT INTO sizesanpham(masize, size) 
VALUES (1,'M'),
		(2,'L'),
		(3,'XL'),
		(4,'XXL');

SET FOREIGN_KEY_CHECKS = 1;