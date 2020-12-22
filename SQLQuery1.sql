
create database W5_cafe

use W5_cafe

-- Combo --
create table combo(id nvarchar(5) primary key, image nvarchar(100) not null, name nvarchar(30) not null, description nvarchar(max) not null, price decimal(18,0) not null)

insert into combo values
('CB1', 'https://www.highlandscoffee.com.vn/vnt_upload/news/06_2020/Standard.png', N'Combo: Buổi sáng',N'Bắt đầu ngày mới năng động bằng combo Cafe phin và Bánh mì Việt.', CAST(75000 AS Decimal(18, 0))),
('CB2', 'https://www.highlandscoffee.com.vn/vnt_upload/news/06_2020/Standard.png', N'Combo: Thanh nhạt',N'Bữa ăn nhẹ giữa những giờ học tập và làm việc mệt mỏi. Hãy cùng nhấm nháp Bánh ngọt và Trà Việt để tiếp thêm năng lượng hứng khởi', CAST(89000 AS Decimal(18, 0))),
('CB3', 'https://www.highlandscoffee.com.vn/vnt_upload/news/06_2020/Standard.png', N'Combo: Tiệc bánh',N'Cung cấp cho bạn một bữa ăn đủ chất với Bánh mì và Bánh ngọt', CAST(95000 AS Decimal(18, 0)))

select * from combo

drop table combo

-- find --

create table find(tel nvarchar(15) primary key, email nvarchar(50) not null, open_hours nvarchar(150) not null)

insert into find values (N'0905725461', N'your', N'Monday: Closed ; Tuesday - Friday: 10:00 - 20:00 ; Saturday and Sunday: 11.00 - 21:00')

select * from find

-- pro_com --

create table pro_com(id nvarchar(5) primary key, id_pro nvarchar(5) not null, id_com nvarchar(5) not null, constraint frk_pr foreign key(id_pro) references products(id), constraint frk_cb foreign key(id_com) references combo(id))

insert into pro_com values
(N'PC1', N'PR1', N'CB1'),
(N'PC2', N'PR4', N'CB1'),
(N'PC3', N'PR3', N'CB2'),
(N'PC4', N'PR5', N'CB2'),
(N'PC5', N'PR2', N'CB3'),
(N'PC6', N'PR5', N'CB3')

select products.id,products.image,products.description,products.price,products.name from pro_com join products on pro_com.id_pro=products.id 
where pro_com.id_com='CB1'

select sum(products.price) as 'total' from pro_com join products on pro_com.id_pro=products.id 
where pro_com.id_com='CB1'

select combo.id, combo.image, combo.name, combo.description, combo.price from pro_com join combo on pro_com.id_com=combo.id 
where pro_com.id_pro='PR5'

select combo.name, combo.description, combo.price from pro_com join combo on pro_com.id_com=combo.id 
where pro_com.id_pro='PR5'

select * from pro_com

drop table pro_com

-- products --
create table products(id nvarchar(5) primary key, image nvarchar(100) not null, description nvarchar(max) not null, price decimal(18,0) not null, name nvarchar(15) not null)

insert into products values
(N'PR1', 'https://highlandscoffee.com.vn/vnt_upload/product/03_2018/menu-PSD-inside.jpg', N'Việt Nam tự hào sở hữu một di sản văn hóa cà phê giàu có, và ''Phin'' chính là linh hồn, là nét văn hóa thưởng thức cà phê đã ăn sâu vào tiềm thức biết bao người Việt.//nCà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loại có tên là ''Phin'', cũng giống như thể hiện sự sâu sắc trong từng suy nghĩ và chân thành trong những mối quan hệ hiện hữu.//nBạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá, có hoặc không có sữa đặc.//nHighlands Coffee tự hào phục vụ cà phê Việt theo cách truyền thống của người Việt.', CAST(29000 AS Decimal(18, 0)), N'Cà phê Phin'),
(N'PR2', 'https://highlandscoffee.com.vn/vnt_upload/product/03_2018/menu-FREEZE_1.png', N'Thức uống rất được ưa chuộng!//nTrà xanh thượng hạng từ cao nguyên Việt Nam, kết hợp cùng đá xay, thạch trà dai dai, thơm ngon và một lớp kem...', CAST(49000 AS Decimal(18, 0)), N'FREEZE Trà xanh'),
(N'PR3', 'https://highlandscoffee.com.vn/vnt_upload/product/03_2018/menu-TEA_1.png', N'Hương vị tự nhiên, thơm ngon của Trà Việt với phong cách hiện đại tại Highlands Coffee sẽ giúp bạn gợi mở vị giác của bản thân và tận hưởng một cảm giác thật khoan khoái, tươi mới.', CAST(39000 AS Decimal(18, 0)), N'Trà Sen Vàng'),
(N'PR4', 'https://highlandscoffee.com.vn/vnt_upload/product/03_2018/banh-mi-thit-nuong-vn.png', N'Bạn đã quá quen thuộc với Bánh mì Việt Nam?//nHãy nếm thử một miếng Bánh mì ngon, giòn, nóng hổi tại Highlands Coffee.//nMột kết hợp hoàn hảo giữa lớp nhân chua, cay, mặn, ngọt quyện với lớp vỏ bánh mì giòn tan, mịn màng tạo ra tầng tầng lớp lớp dư vị cho thực khách.', CAST(19000 AS Decimal(18, 0)), N'Bánh mì chả lụa'),
(N'PR5', 'https://highlandscoffee.com.vn/vnt_upload/product/03_2018/menu-OTHERS-cakes.jpg', N'Còn gì tuyệt vời hơn khi kết hợp thưởng thức đồ uống của bạn cùng với những chiếc bánh ngọt ngon tinh tế được làm thủ công ngay tại bếp bánh của Highlands Coffee.//nNhững chiếc bánh của chúng tôi mang hương vị đặc trưng của ẩm thực Việt và còn là sự Tận Tâm, gửi gắm mà chúng tôi dành cho Quý khách hàng.', CAST(29000 AS Decimal(18, 0)), N'Bánh phô mai')

select * from products

truncate table products
drop table products

-- User -> Account: trùng tên với biền trong sql -> lỗi --
create table account(name nvarchar(10) primary key, pass nvarchar(5) not null, brand nvarchar(50) not null, address nvarchar(5) not null, image varchar(255) not null, content nvarchar(max) not null)



insert into account values(N'son', N'son', N'Highlands''s Cofee', N'add', N'user/img', N'Từ tình yêu với Việt Nam và niềm đam mê cà phê, năm 1999, thương hiệu Highlands Coffee® ra đời với khát vọng nâng tầm di sản cà phê lâu đời của Việt Nam và lan rộng tinh thần tự hào, kết nối hài hoà giữa truyền thống với hiện đại.

Bắt đầu với sản phẩm cà phê đóng gói tại Hà Nội vào năm 2000, chúng tôi đã nhanh chóng phát triển và mở rộng thành thương hiệu quán cà phê nổi tiếng và không ngừng mở rộng hoạt động trong và ngoài nước từ năm 2002.

Qua một chặng đường dài, chúng tôi đã không ngừng mang đến những sản phẩm cà phê thơm ngon, sánh đượm trong không gian thoải mái và lịch sự. Những ly cà phê của chúng tôi không chỉ đơn thuần là thức uống quen thuộc mà còn mang trên mình một sứ mệnh văn hóa phản ánh một phần nếp sống hiện đại của người Việt Nam.

Đến nay, Highlands Coffee® vẫn duy trì khâu phân loại cà phê bằng tay để chọn ra từng hạt cà phê chất lượng nhất, rang mới mỗi ngày và phục vụ quý khách với nụ cười rạng rỡ trên môi. Bí quyết thành công của chúng tôi là đây: không gian quán tuyệt vời, sản phẩm tuyệt hảo và dịch vụ chu đáo với mức giá phù hợp.'
)

select * from account

---
select * from account where name='son' and pass='son'


create table viewLog(viewCount int primary key default 0)
select * from viewLog
insert into viewLog values (0)
update viewLog set viewCount =((select viewCount from viewLog) +1)

drop table viewLog