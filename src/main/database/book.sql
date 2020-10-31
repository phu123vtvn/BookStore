-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'phu123vtvn@gmail.com','2020-09-26 00:30:09','phu123vtvn@gmail.com','2020-09-26 00:30:09','Sách Khoa học công nghệ',NULL,0),(2,'phu123vtvn@gmail.com','2020-09-26 23:16:51','phu123vtvn@gmail.com','2020-09-26 23:16:51','Sách thiếu nhi',NULL,0),(3,'phu123vtvn@gmail.com','2020-09-26 23:23:53','phu123vtvn@gmail.com','2020-09-26 23:23:53','Sách Chính trị',NULL,0),(4,'phu123vtvn@gmail.com','2020-10-01 22:11:59','phu123vtvn@gmail.com','2020-10-01 22:11:59','Sách Triết Lý',NULL,0),(5,'phu123vtvn@gmail.com','2020-10-01 22:12:11','phu123vtvn@gmail.com','2020-10-01 22:12:11','Sách Kinh Doanh',NULL,0),(6,'phu123vtvn@gmail.com','2020-10-31 21:09:22','phu123vtvn@gmail.com','2020-10-31 21:09:22','Sách Thể Thao',NULL,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `amount` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKb8bg2bkty0oksa3wiq5mp5qnc` (`product_id`),
  CONSTRAINT `FKb8bg2bkty0oksa3wiq5mp5qnc` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,'phu123vtvn@gmail.com','2020-10-02 20:30:57','phu123vtvn@gmail.com','2020-10-02 20:30:57',89000,89000,1,1,5),(2,'phu123vtvn@gmail.com','2020-10-02 20:30:57','phu123vtvn@gmail.com','2020-10-02 20:30:57',149000,149000,1,1,11),(3,'phu123vtvn@gmail.com','2020-10-02 22:01:58','phu123vtvn@gmail.com','2020-10-02 22:01:58',89000,89000,1,2,10),(4,'phu123vtvn@gmail.com','2020-10-02 22:01:58','phu123vtvn@gmail.com','2020-10-02 22:01:58',119000,119000,1,2,12),(5,'phu123vtvn@gmail.com','2020-10-02 22:19:51','phu123vtvn@gmail.com','2020-10-02 22:19:51',318000,159000,2,3,7),(6,'admin@gmail.com','2020-10-31 16:46:08','admin@gmail.com','2020-10-31 16:46:08',15000,15000,1,4,2),(7,'admin@gmail.com','2020-10-31 16:46:08','admin@gmail.com','2020-10-31 16:46:08',159000,159000,1,4,7);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `delivery_email` varchar(255) NOT NULL,
  `delivery_name` varchar(255) NOT NULL,
  `delivery_phone` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  `total` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'phu123vtvn@gmail.com','2020-10-02 20:30:57','phu123vtvn@gmail.com','2020-10-02 20:30:57','ddeee877-5214-4127-89b2-98a7653a01eb','No Trang Long','phu123vtvn@gmail.com','Nguyen Duc Phu','0389251839',0,238000,NULL),(2,'phu123vtvn@gmail.com','2020-10-02 22:01:58','phu123vtvn@gmail.com','2020-10-02 22:01:58','b60b8c31-8590-4c13-9a66-b6237779fdee','No Trang Long','phu123vtvn@gmail.com','Nguyen Duc Phu','0389251839',0,208000,NULL),(3,'phu123vtvn@gmail.com','2020-10-02 22:19:51','phu123vtvn@gmail.com','2020-10-02 22:19:51','5e3d3804-1f50-4849-b5e3-40596b1366c3','No Trang Long','phu123vtvn@gmail.com','Nguyen Duc Phu','0389251839',0,318000,NULL),(4,'admin@gmail.com','2020-10-31 16:46:08','admin@gmail.com','2020-10-31 16:46:08','76c0bf87-51d7-4810-a9fd-ab76018cae85','','','','',0,174000,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `detail` longtext NOT NULL,
  `imgae` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int NOT NULL,
  `price` int NOT NULL,
  `price_sale` int DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,NULL,'phu123vtvn@gmail.com','2020-10-01 22:09:53','Sự toàn cầu hóa và những phát triển công nghệ khiến thế giới ngày nay càng trở nên liên kết. Sự gắn kết và lệ thuộc sẽ gắn kết và phụ thuộc mang lại lợi ích cho tất cả các bên trong những thời điểm tốt đẹp, nhưng khi khủng hoảng xảy ra, nó càng nhanh chóng lan tỏa những tồn tại to lớn và đẩy các doanh nghiệp đứng trước đến trước bờ vực sụp đổ.\r\nSự hỗn loạn đã trở thành điều bình thường ở mọi ngành nghề, mọi thị trường và mọi công ty. Làm thế nào để trang bị lớp giáp vững chắc trong Kỷ nguyên Hỗn loạn, nhưng không bỏ lỡ tiềm năng phát triển vượt bậc khi đối thủ phạm sai lầm ? Với quản lý khủng hoảng và phát triển doanh nghiệp trong thời đại 4.0, Philip Kotler và Jonh A. Caslione đã đưa ra lời đáp cho câu hỏi này, thông qua những bước đi chiến lược chi tiết, có tên áp dụng cho mọi doanh nghiệp.\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','14e30ff515320df842221ff4b5dcb5d6.jpg','Quản Lý Khủng Hoảng Và Phát Triển Doanh Nghiệp Trong Thời Đại 4.0',14,120000,0,NULL,1,1,'1980 Books'),(2,NULL,NULL,'phu123vtvn@gmail.com','2020-10-01 22:32:06','Khả năng giao tiếp hạn chế sẽ tạo nên những tổn thất rất lớn về tâm sinh lí của mỗi người nói chung và mỗi đứa trẻ nói riêng. Vì vậy, ngay từ khi em bé được sinh ra, phụ huynh nên chú trọng việc giao tiếp với bé và hình thành kĩ năng giao tiếp cho bé.\r\nBộ sách KĨ NĂNG GIAO TIẾP gồm 10 cuốn sẽ giúp các bé 2- 6 tuổi nhanh chóng có kĩ năng giao tiếp tốt. Qua mỗi câu chuyện và tình huống nhỏ, bé sẽ hiểu khi nào cần nói lời chào, lời mời, lời cảm ơn, lời xin lỗi. Những câu nói hay và những cử chỉ đẹp sẽ khiến bé trở thành một người lịch sự, thân thiện và vô cùng đáng mến!\r\n\r\nMỗi cuốn gồm từ 2-3 câu chuyện nhỏ kèm tranh vẽ ngộ nghĩnh đáng yêu chắc chắn sẽ làm bé thích thú và học được nhiều điều:\r\nBé sẽ biết nói lời cảm ơn khi người khác giúp đỡ, quan tâm, tặng quà cho mình.\r\nBé biết xin lỗi khi mình làm sai, làm người khác phải buồn lòng.\r\nBé biết dùng lời mời trước bữa ăn, mời khách vào nhà, mời khách uống nước.\r\nBé biết chào hỏi người lớn và bạn bè khi gặp mặt.\r\nBé biết nói lời tạm biệt khi chia tay.\r\nBé biết động viên, an ủi khi người thân hoặc bạn bè mình buồn.\r\nBé biết hứa và giữ lời hứa.\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','loixinloi.jpg','Lời Xin Lỗi (Tái Bản 2019)',12,15000,0,NULL,1,2,'Nhà Xuất Bản Kim Đồng'),(3,'phu123vtvn@gmail.com','2020-10-01 22:23:30','phu123vtvn@gmail.com','2020-10-01 22:23:30','Bộ sách gồm 2 cuốn:\r\n\r\n1. Lý Gia Thành – “Ông Chủ Của Những Ông Chủ” Trong Giới Kinh Doanh Hồng Kông \r\n\r\n\r\n\r\n\r\nLý Gia Thành, tỷ phú Hồng Kông là một trong những người giàu nhất thế giới và nổi tiếng là nhạy bén trong kinh doanh. Ông được đánh giá là nhà đầu tư có tầm ảnh hưởng lớn nhất châu Á. Năm 2007 tên ông đứng ở vị trí thứ 9 trong danh sách những người giàu có nhất thế giới do tạp chí Forbes bầu chọn, với giá trị tài sản khoảng 23 tỷ đô Mỹ. Hãy cùng đọc cuốn sách để khám phá hành trình Lý Gia Thành từ một cậu bé nghèo di cư phải bỏ học để nuôi sống gia đình xây dựng đế chế của mình bằng tài nhìn xa trông rộng, phân tích dự đoán xu hướng thị trường để nắm bắt cơ hội và kiên định, nhạy bén trong kinh doanh.\r\n\r\nLý Gia Thành sinh năm 1928 trong bối cảnh Trung Quốc có nhiều biến động chính trị. Để thoát khỏi chiến dịch thảm sát tận gốc của quân Nhật năm 1940, cha ông đã đưa cả gia đình di cư sang Hồng Kông, nếm trải cảm giác ở thuộc địa với hai bàn tay trắng nhưng đầy hy vọng.\r\n\r\nÔng vua hoa nhựa\r\n\r\nTrong bối cảnh năm 1947, ngành công nghiệp nhựa bước vào thời kì phát triển bùng nổ do nhu cầu của người dân tăng lên nhanh chóng, Lý Gia Thành cũng muốn thử sức vì ông đã có sẵn xuất phát điểm là công việc bán các sản phẩm vật dụng trong gia đình, thắt lưng nhựa, quai đeo đồng hồ. Kinh nghiệm học được với Lý Gia Thành là những tài sản vô giá. Mỗi ngày, việc kinh doanh sản phẩm nhựa lại giúp Lý Gia Thành biết thêm những nguyên tắc cơ bản trong kinh doanh. Kỹ năng thành thục trong đàm phán giao dịch với khách hàng được ông kết hợp một cách hoàn hảo với khả năng phân tích xu hướng thị trường. Ông cũng nhận ra rằng, để tăng doanh số bán hàng một cách hiệu quả, một người bán hàng thành công cần phải biết nghe ngóng, nắm bắt thông tin thị trường và những nhu cầu không ngừng thay đổi của người tiêu dùng.\r\n\r\nTuy nhiên, điều mà Lý Gia Thành nhận thức một cách sâu sắc là có nhiều doanh nhân thành đạt đều khởi sự từ một nhân viên bán hàng trước khi tự mình đứng ra làm kinh doanh. Luôn chú ý tới việc tự mình khởi nghiệp kinh doanh, ông đã tạo dựng mối quan hệ thân tình rộng khắp với nhiều nhà cung cấp và khách hàng, những người đã giúp đỡ ông rất nhiều trong sự nghiệp sau này. Công việc hàng ngày của ông thường bắt đầu từ lúc sáng sớm đến tận tối muộn. Ông sẵn sàng làm việc tới 16 tiếng mỗi ngày dù mức lương không có gì thay đổi. Ban ngày, ông tới văn phòng để điều hành việc kinh doanh và bán hàng, sau đó, ông lại tới nhà máy để xem xét việc thực hiện các đơn hàng. Nhờ đó mà khách hàng rất hài lòng và tin tưởng giao cho ông ngày càng nhiều đơn hàng hơn.\r\n\r\nĐặc biệt, ông còn tiếp tục việc học hành. Ông quan niệm học tập là nền tảng để tạo dựng 1 nhân cách, 1 tổ ấm và 1 tương lai xán lạn. Ông tận dụng mọi cơ hội để có thể học tập, thậm chí là theo học với thầy giáo 2 buổi 1 tuần vào lúc 22h30 sau 1 ngày bán hàng bận rộn hay tranh thủ đọc các cuốn sách từ 1 thư viện địa phương. Nhiều năm sau, ông còn tự học đọc, viết và nói tiếng Anh bởi ông biết rằng nếu muốn tiếp tục kinh doanh trên mảnh đất Hồng Kông của người Anh, ông buộc phải học ngôn ngữ này.\r\n\r\nĐây chắc hẳn là bài học, là tấm gương sáng cho các bạn trẻ mong muốn trở thành nhân viên nổi bật hay tạo dựng sự nghiệp cho riêng mình. Bài học về tinh thần tự học, vượt qua mọi khó khăn trở ngại, học để lấy kiến thức phục vụ cho công việc vì 1 mục đích sau cùng, sẵn sàng bỏ ra nhiều công sức và cống hiến cho công ty, công việc hơn những gì mà đồng lương đem lại.\r\n\r\nLý Gia Thành luôn có cái nhìn bao quát toàn cảnh, dự đoán trước những biến động chính trị, xã hội, kinh tế và nhu cầu của thị trường để có kế hoạch sản xuất và đầu tư kinh doanh cho phù hợp. Nhận thấy tiềm năng của thị trường sản xuất đồ nhựa sau khi cuộc nội chiến kết thúc, nhu cầu về các mặt hàng vật dụng thiết yếu của người dân tăng lên, vào những năm 1950, Lý Gia Thành đã sẵn sàng nhập cuộc khi chưa đầy 22 tuổi. Ông am hiểu mọi khía cạnh của việc kinh doanh mặt hàng nhựa, từ khâu sản xuất đến phân phối sản phẩm. Ông có quan hệ rất rộng với nhiều nhà cung cấp, phân phối. Ông được nhiều người biết đến và tin tưởng. Ban đầu ông chỉ sản xuất các mặt hàng nhựa nhỏ như lược, hộp đựng xà phòng, tiếp đến là các đồ chơi bằng nhựa và bước đột phá táo bạo khi ông tìm hiểu thị trường hoa nhựa ở các nước phương Tây để đưa công ty Trường Giang của mình có sức cạnh tranh và vươn lên thành 1 ông lớn trong ngành công nghiệp nhựa và biến Lý Gia Thành trở thành ông vua hoa nhựa của Hồng Kông.\r\n\r\nÔng hoàng bất động sản\r\n\r\nKhi Lý Gia Thành dự cảm được thời kì sắp chững lại của việc kinh doanh hoa nhựa, ông cần tìm ra những lĩnh vực đầu tư sinh lời khác. Cùng với sự di dân ồ ạt vào Hồng Kông, khiến cho nhu cầu nhà ở cho tầng lớp hạ-trung lưu tăng cao và đẩy giá bất động sản ở Hồng Kông leo thang, chính sự đi trước đón đầu xu hướng đã giúp Lý Gia Thành trở thành tỷ phú. Năm 1992, tổng giá trị bất động sản trên thế giới của Lý Gia Thành chiếm tới 15% tổng giá trị thị trường cổ phiếu Hồng Kông.\r\n\r\nTriết lí kinh doanh của ông là không bao giờ được lợi dụng 1 ai, ngay cả khi hoạt động kinh doanh còn chưa phát triển, ông vẫn coi danh tiếng là của cải quan trọng nhất. Ông quan niệm: Nếu anh có danh tiếng, chăm chỉ, tử tế với mọi người, luôn giữ lời hứa, việc kinh doanh của anh sẽ trở nên dễ dàng. Ông không chỉ nghĩ đến lợi nhuận của mình mà còn nghĩ đến cả phần của đối tác. Vì vậy, nhiều cơ hội đã đến với ông.\r\n\r\nÔng luôn tìm kiếm và đầu tư những khu đất đẹp, có vị trí chiến lược và lòng kiên định, tin vào sự phán đoán và tài nhìn xa trông rộng của mình. Trong giai đoạn 1966-1967, với sự biến động chính trị ở Hồng Kông, nhiều nhà đầu tư đã rút khỏi đây nhưng Lý Gia Thành đã tận dụng những cơ hội mà thời kì biến động khó khăn mang tới. Ông xem xét và mua lại những khu đất mà theo ông sẽ đem lại lợi nhuận khi tình hình trở lại ổn định, hay sự hợp tác với ngân hàng CIBC khiến cho tới năm 1979, Lý Gia Thành trở thành ông chủ nhà đất tư nhân lớn nhất Hồng Kông, chỉ duy nhất chính phủ thuộc địa là sở hữu nhiều bất dộng sản hơn ông.\r\n\r\nCông ty thương mại đầu tiên của 1 thương gia Trung Quốc\r\n\r\nViệc mua lại cổ phần của công ty Hòa Ký Hoàng Phố đã giúp cho Lý Gia Thành vươn lên vị trí dẫn đầu về sức mạnh và tầm ảnh hưởng thương mại ở Trung Quốc và sau này là trên toàn châu Á. Đặc biệt, với việc nắm giữ quyền lực chính ở Hòa Ký Hoàng Phố, Lý Gia Thành cùng công ty Trường Giang giờ đây đã có những khoản lợi nhuận lớn đến từ các hoạt động giao dịch thương mại. Hoa Kỳ Hoàng Phố điều hành 1 khoản đáng kể các cảng công-ten-nơ tại thuộc địa và sở hữu mạng lưới siêu thị cua tập đoàn Park’N Shop. Thế lực của Lý Gia Thành còn bành trướng tới tập đoàn dược phẩm Watson. Như vậy, ngoài đầu tư vào bất động sản, Trường Giang giờ đây còn hoạt động trong các lĩnh vực buôn bán, khai thác đá, nhà xưởng, vận chuyển hàng hóa và công-ten-nơ, cơ khí, bán lẻ và sản xuất đồ uống.\r\n\r\nThương vụ mua lại Hoà Ký Hoàng Phố đã giúp Lý Gia Thành từ 1 ông chủ nhà đất đơn thuần trở thành 1 doanh nhân hợp tác mang tầm quốc tế. Nó giúp ông nâng cao vị thế của mình trong giới kinh doanh thượng lưu Hồng Kông, trở thành 1 nhân vật quan trọng và uy tín. Kể từ đây, bất kì lời nói và hành động nào từ ông cũng sẽ được những người quan tâm tới nền kinh tế Hồng Kông chú ý. Ông cũng thật sự đã trở thành thước đo quan trọng cho những bước thăng trầm của nền kinh tế này.\r\n\r\nLý Gia Thành luôn thể hiện lòng yêu nước của mình với Trung Quốc – quê hương của ông qua các dự án hợp tác đầu tư tại đây và lòng tin tưởng sâu sắc vào sự ổn định kinh tế, chính trị, các cuộc cải cách và chính sách mở cửa của quốc gia này.\r\n\r\nÔng cũng tích cực chuẩn bị cho 2 con trai – Victor và Richard kế thừa quyền lực của mình trong đế chế do ông tạo dựng nên bằng việc đặt họ vào nơi đầu sóng ngọn gió, trực tiếp tham gia vào các dự án bất dộng sản, tài chính của các tập đoàn do ông lãnh đạo tại Canada và Mỹ khi ông vươn tới các thị trường rộng lớn đầy tiềm năng này.\r\n\r\nStar TV\r\n\r\nTriết lí chung nhất được đúc kết ở tập đoàn thương mại của Lý Gia Thành là “chủ nghĩa cơ hội kết hợp với ham muốn khám phá”. Lý Gia Thành đương nhiên là người hiểu rõ hơn hết về những quy luật kinh doanh cũng như những cơ hội của ông có tới đâu. Ông bắt đầu với việc bán dây nhựa plastic đúng vào thời điểm cầu thế giới tăng mạnh, tiếp tục phát triển những dự án bất động sản khi nhu cầu nhà đất tăng cao. Có vẻ như ông không bao giờ để cơ hội vượt khỏi tầm tay. Khi dành được quyền điều hành Hòa Ký Hoàng Phố vào năm 1979, Lý Gia Thành có trong tay hệ thống cửa hàng dược phẩm, tạp hóa, các xưởng đóng tàu, và thậm chí sau này phát triển cả sang các lĩnh vực như xi măng, dầu lửa. Tất cả những lĩnh vực kinh doanh mà ông lựa chọn vào thời điểm đó lại là những lĩnh vực đáp ứng nhu cầu thiết yếu của người tiêu dùng. Từ Chile tới Zimbabwe, từ Hồng Kong tới Canada, từ Trung Quốc tới Anh, từ Singapore tới Mỹ, Lý Gia Thành đã tự tạo cho mình những thị trường hùng hậu chỉ nhờ vào khả năng biết tận dụng cơ hội của ông.\r\n\r\nĐến năm 1985, Lý Gia Thành chắc chắn không thể bỏ lỡ cơ hội đầu tư vào thị trường nhiều tiềm năng nhất thời bấy giờ đó là lĩnh vực truyền hình. Có thể nói không một kế hoạch đầu tư nào lại thật sự “Lý Gia Thành” như kế hoạch này. Ban đầu, ông gọi dự án của mình là truyền hình vệ tinh châu Á, gọi tắt là Star TV. Đây thật sự là 1 dự án đặc trưng cho Lý Gia Thành với sự liều lĩnh và tính toán, xứng đáng với cái tên lâu nay vẫn được giới thương nhân dành tặng “Mr Money”. Ông bỏ qua thị trường truyền hình cáp vốn đã trở nên khá nhạt nhẽo đối với 1 người như ông để tiến tới lĩnh vực truyền hình vệ tinh mà ông không hề có nhiều kinh nghiệm cũng như sự hiểu biết. Một lần nữa ông chứng minh cho chúng ta thấy rằng kinh nghiệm hay sự hiểu biết đều có thể thuê. Cái mà Lý Gia Thành sở hữu, 1 lượng thật sự lớn, đó là độ nhạy cảm kỳ lạ trong việc tìm kiếm và nắm bắt cơ hội.\r\n\r\nTrở về cội nguồn\r\n\r\nLý Gia Thành luôn tìm cách để tiếp tục mở rộng đế chế của mình. Đến đầu năm 90, khu vực kinh doanh của ông đã mở rộng nhanh chóng bao gồm ở cả Trung Quốc. Trung Quốc không chỉ là quê hương của ông mà đất nước ấy còn có tiềm lực phát triển bắt kịp với thế giới, đem đến cho thế giới 1,2 tỷ người tiêu dùng. Sau nhiều năm cách mạng nghèo khổ, họ ao ước điều kiện sống được cải thiện và những người có thể cung cấp những sản phẩm họ muốn như Lý Gia Thành.\r\n\r\nĐế chế được Lý Gia Thành tạo nên chỉ từ 1 lời hứa duy nhất của ông với người cha rằng 1 ngày nào đó ông sẽ kiếm thật nhiều tiền và sẽ không bao giờ quên gốc gác của mình. Cả 2 điều đó ông đều đã giữ lời.\r\n\r\n2. Mã Vân - Triết Lý Sống Của Tôi\r\n\r\nDáng người gầy gò, tướng mạo xấu xí, kết quả môn Toán bết bát, hai lần thi trượt Đại học nhưng chưa bao giờ bằng lòng với cuộc sống thực tại. Trong một lần tình cờ tiếp xúc với máy vi tính, hiểu về internet, anh kiên quyết bỏ việc làm công ăn lương để bắt đầu gây dựng sự nghiệp, lập nên trang thương mại điện tử đầu tiên của Trung Quốc (China Pages). Dù mù tịt về máy tính nhưng anh lại trở thành một huyền thoại trong ngành thương mại điện tử. Anh được cả thế giới vinh danh và rất có thể sẽ trở thành \"Bill Gates Trung Quốc\". Một đời vang danh khắp nơi, giữ vị thế độc tôn trong lĩnh vực thương mại điện tử, nhưng đúng vào thời khắc được tung hô và tán thưởng nhiều nhất, anh lại lặng lẽ giấu đi ánh hào quang, tuyên bố nghỉ hưu để hưởng thụ cuộc sống. Người đàn ông hành động không theo lẽ thường ấy chính là Mã Vân.\r\n\r\nCuốn sách Mã Vân - Triết lý sống của tôi đã ghi chép hết sức tường tận và chân thực hành trình lập nghiệp của Mã Vân, qua đó giúp chúng ta hiểu rõ trí tuệ, quan niệm về sự thành bại, những điều tâm đắc rút ra trong quá trình lập nghiệp và cả kinh nghiệm quản lý doanh nghiệp hết sức độc đáo của anh.\r\n\r\nCó lẽ cuốn sách không thể trực tiếp thay đổi cuộc sống và nâng cao hiệu quả công việc của chúng ta, nhưng nó có thể đem tới những gợi mở trên nhiều khía cạnh, giúp chúng ta nhớ lại những ước mơ đã từng ấp ủ, giúp chúng ta vững tin bước tiếp trong cuộc sống đầy chông gai, thử thách.\r\n\r\nCùng với cuốn Mã Vân giày vải, đây cũng là một trong những cuốn sách thú vị về một nhân vật kiệt xuất trong giới doanh nhân.\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','8df831e17c141d2bae4739f87a993ccb.jpg','Combo Triết Lý Sống Và Con Đường Dẫn Tới Thành Công Của Hai Tỷ Phú Thế Giới Người Hoa - Lý Gia Thành Và Jack Ma',9,299000,0,NULL,1,4,'Alphabooks'),(4,'phu123vtvn@gmail.com','2020-10-01 23:07:04','phu123vtvn@gmail.com','2020-10-01 23:07:04','Thế nào? Đó là thắc mắc về rất nhiều điều mà trẻ em ngày nào cũng hỏi. Với cuốn “Những câu hỏi Thế nào” trong bộ “Cuốn sách lớn đầu tiên của tớ” - loạt sách do Hội địa lí quốc gia Natinal Geographic giới thiệu, bạn đọc nhỏ tuổi sẽ được thỏa mãn trí tò mò về cách thức hoạt động của nhiều sự vật, hiện tượng quanh ta.\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','31ca171249c302690e8a62227fde7cf6.jpg','Combo Cuốn Sách Lớn Đầu Tiên Của Tớ (6 cuốn)',4,499000,0,NULL,1,2,'Nhà Xuất Bản Kim Đồng'),(5,'phu123vtvn@gmail.com','2020-10-01 23:09:03','phu123vtvn@gmail.com','2020-10-01 23:09:03','Cuốn sách “Dữ liệu lớn – cuộc cách mạng thay đổi chúng ta và thế giới” do Rob Thomas và Patrick McSharry là đồng tác giả. Dữ liệu lớn - cuộc cách mạng thay đổi chúng ta và thế giới nêu bật sức mạnh, tiềm năng và cả những cạm bẫy của dữ liệu lớn, cung cấp nhãn quan thấu đáo, cần thiết để cải thiện các kết quả kinh doanh bằng việc đổi mới và sử dụng công nghệ hiệu quả. Các công ty đang tạo ra dữ liệu nhanh hơn bao giờ hết, và các dữ liệu này có thể là đòn bẩy để chuyển đổi các ngành nghề. Dữ liệu lớn có thể là công cụ đầy quyền năng để kiến tạo các giải pháp kinh doanh hiệu quả, nhưng để xây dựng và thực thi một chiến lược dữ liệu lớn đúng đắn đòi hỏi phải có sự hiểu biết sâu về lĩnh vực ngày càng trở nên phức tạp này.\r\n\r\nRob Thomas là Phó Chủ tịch phụ trách phát triển sản phẩm phụ vụ quản trị thông tin và dữ liệu lớn của IBM Software Group. Trước đó, ông là người phụ trách việc bán hàng, mua bán và sát nhập toàn cầu.\r\n\r\nPatrick McSharry là Nghiên cứu viên cao cấp tại Trường Doanh nghiệp và Môi trường Smith, Giảng viên Viện Tài chính định lượng Oxford Man thuộc Đại học Oxford, Giáo sư thỉnh giảng tại Khoa Kỹ thuật điện và Máy tính, Đại học Carnegie Mellon.\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','c08a35353e61d331bc41b9650a3b4670.jpg','Dữ Liệu Lớn – Cuộc Cách Mạng Thay Đổi Chúng Ta Và Thế Giới',4,89000,0,NULL,1,1,'Nhà xuất bản Khoa học và Kỹ thuật'),(6,'phu123vtvn@gmail.com','2020-10-01 23:11:02','phu123vtvn@gmail.com','2020-10-01 23:11:02','Nội dung cuốn sách phân tích, đánh giá tình hình và triển vọng cạnh tranh công nghệ Mỹ – Trung, nhóm tác giả còn đưa ra những dự báo về xu hướng cạnh tranh, từ đó gợi mở hàm ý chính sách cho việc phát triển khoa học – công nghệ ở Việt Nam để lĩnh vực này thực sự là quốc sách hàng đầu cho phát triển nền kinh tế theo hướng hiện đại, bảo đảm an ninh, quốc phòng trong thời kỳ hội nhập quốc tế sâu rộng.\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','73f4e622d0bde0d6f3c7977fbf6198ad.jpg','Cạnh Tranh Công Nghệ Mỹ – Trung Quốc Thời Đại 4.0',8,87000,0,NULL,1,1,'Nhà Xuất Bản Chính Trị Quốc Gia Sự Thật'),(7,'phu123vtvn@gmail.com','2020-10-01 23:14:10','phu123vtvn@gmail.com','2020-10-01 23:14:10','Cuốn sách Tôi đã kiếm 1 triệu đô đầu tiên trên internet như thế nào? - Và Bạn Cũng Có Thể Làm Như Thế hướng dẫn rất dễ hiểu, với từng bước cụ thể để gây dựng một công việc kinh doanh trên mạng Internet đang bùng nổ và dễ dàng kiếm lợi nhuận hàng triệu đô-la, Ewen Chia đã làm sáng tỏ những biệt ngữ trong marketing và chia sẻ những bí quyết và kỹ xảo vẫn đang giúp ông thu về một tài sản đáng mơ ước từ những vụ kinh doanh trực tuyến.\r\nDù bạn đang cố gắng tạo dựng và phát triển một công việc kinh doanh phát đạt trên Internet từ con số không hay đang tìm cách phát huy hết tiềm năng của công việc hiện tại, dù bạn không biết gì về Internet hay đã có một tấm bằng kinh doanh, bản kế hoạch kiếm triệu đô chi tiết của Ewen sẽ giúp bạn:\r\nTôi đã kiếm một triệu đô đầu tiên trên Internet như thế nào? và bạn cũng có thể làm như thế là cuốn sách đầu tiên của tác giả, diễn giả Ewen Chia được xuất bản tại Việt Nam. Cuốn sách này trình bày chi tiết cách thức marketing và kiếm tiền online − tiếp thị liên kết (Affiliate Marketing), là hình thức giới thiệu, quảng bá các sản phẩm và dịch vụ cho công ty khác để hưởng hoa hồng (một dạng môi giới).\r\nĐiểm khác biệt cơ bản là, phương pháp này không đòi hỏi đầu tư vốn hay sản xuất sản phẩm, không phải tính toán hay điều hành hoạt động kinh doanh. Hoạt động chủ yếu của nó là quảng bá, giới thiệu sản phẩm đó đến người có nhu cầu. Mục đích là làm cho nhiều người mua sản phẩm và bạn sẽ nhận được nhiều tiền hoa hồng. Việc lựa chọn sản phẩm nào để giới thiệu, quảng bá thế nào, quảng bá cho ai, ở đâu, thị trường nà để khách hàng biết và mua sản phẩm chính là “bí quyết” giúp bạn có kiếm được nhiều tiền hay không. Phương pháp này chưa thực sự phổ biến trong môi trường trực tuyến của Việt nam hiện tại, nhưng chắc chắn sẽ lan truyền mạnh mẽ trong thời gian tới. Bởi lợi ích mà phương pháp này mang lại là vô cùng to lớn. Nó giúp kết nối thông tin giữa người mua và người bán, giữa nhà sản xuất và người tiêu dùng một cách nhanh chóng, giảm chi phí qua trung gian.\r\nĐặc biệt, với mô hình marketing này, thông tin được lan truyền nhanh chóng, giảm thiểu chi phí marketing theo truyền thống. Đưa thông tin, tin tức đến đúng người đọc và người dùng. Điều này ngày càng trở nên rất quan trọng, bởi khi thông tin, tin tức và sản phẩm càng ngày càng nhiều, người tiêu dùng hoang mang trong sự đa dạng và hỗn loạn, cần có một giải pháp để họ ra lựa chọn nhanh hơn.\r\nĐó là lý do ra đời Affilate marketing. Ở nước ngoài, mô hình này hoạt động khá mạnh mẽ, giúp thương hiệu và sản phẩm nhanh chóng được người tiêu dùng biết đến. Đặc biệt là những doanh nghiệp nhỏ và vừa, những sản phẩm trong thị trường ngách.\r\nCuốn sách rất hữu ích cho những ai muốn tìm hiểu về cách bán hàng và tiếp thị sản phẩm trên Internet, từ đó trở thành trung gian bán hàng cho nhà sản xuất đến người tiêu dùng.\r\nNhằm giới thiệu tới độc giả Việt Nam một phương pháp marketing trực tuyến mới và hiệu qủa, công ty cổ phần truyền thông trực tuyến Micronet và Công ty Sách Alpha đã hợp tác xuất bản cuốn sách Kinh doanh này. Hy vọng rằng cuốn sách là một cẩm nang đặc biệt cho các doanh nghiệp và cá nhân muốn tiếp thị, bán hàng và kiếm tiền Online.\r\nChúc các bạn thành công trong quá trình ứng dụng cuốn sách này để sớm trở thành triệu phú nhờ Internet!\r\n“Bằng cách thuật lại câu chuyện của chính mình về marketing liên kết, Ewen Chia đưa ra chỉ dẫn rõ ràng cho bất kỳ ai muốn sử dụng công thức mà ông thấy thành công.”\r\nPAUL EDWARDS, Đồng tác giả cuốn Kiếm tiền trong thế giới số “Ewen Chia là bậc thầy về marketing trên Internet. Ngay cả khi bạn chỉ áp dụng một phần nhỏ trong những điều ông truyền lại, bạn sẽ vẫn tiến xa hơn đến 10 bước so với những người đang cố kiếm tiền trực tuyến.”\r\nJOEL COMM, Tác giả cuốn Kiếm tiền bằng Adsense\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','8aa5b8400e892bf8532ef7fed289c03a.jpg','Tôi Đã Kiếm 1 Triệu Đô Đầu Tiên Trên Internet Như Thế Nào Và Bạn Cũng Có Thể Làm Như Thế',6,159000,0,NULL,1,5,'Ewen Chia'),(8,'phu123vtvn@gmail.com','2020-10-01 23:17:48','phu123vtvn@gmail.com','2020-10-01 23:17:48','Với kinh nghiệm và bài học thực tế từ các nhà đầu tư bất động sản hàng đầu thế giới, nội dung cuốn sách chỉ cho bạn con đường gần nhất, dễ dàng nhất để thành công trong kinh doanh bất động sản cỡ nhỏ. Bạn sẽ khám phá ra cách thức hoàn hảo nhất để kinh doanh bất động sản mà không cần nguồn tài chính lớn, cách đọc hiểu thị trường và mua bất động sản vào thời điểm hợp lý nhất…\r\n\r\nBằng việc cung cấp tất cả thông tin và chiến lược cần thiết trong đầu tư bất động sản, đây là cuốn cẩm nang thiết thực và toàn diện nhất trong sự nghiệp kinh doanh bất động sản của bạn. Một cuốn sách hữu ích giúp bạn có thể thu lợi nhuận tối đa trong kinh doanh bất động sản…\r\n\r\nVới cuốn sách, bạn sẽ khám phá ra các vấn đề:\r\n\r\nBắt đầu trở thành một nhà đầu tư nhỏ\r\nHiểu và đọc được vòng quay thăng trầm của thị trường bất động sản\r\nTìm kiếm khách hành và giao dịch thành công\r\nSử dụng những kỹ thuật để định giá bất động sản\r\nĐánh giá bất động sản và phát hiện các nguy cơ rủi ro\r\nTìm kiếm và thu hút nguồn vốn đầu tư\r\nPhát hiện nhân sự để duy trì kinh doanh khi quy mô phát triển\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','9b3ad9fb60d75663989aed437cb75111.jpg','Đầu Tư Bất Động Sản',12,79000,0,NULL,1,5,'DAVID LINDAHL'),(9,'phu123vtvn@gmail.com','2020-10-01 23:25:04','phu123vtvn@gmail.com','2020-10-01 23:25:04','Chủ tịch Hồ Chí Minh - Anh hùng giải phóng dân tộc, nhà văn hóa kiệt xuất, người đã cống hiến cả cuộc đời cho sự nghiệp đấu tranh giải phóng dân tộc, giai cấp, giải phóng con người.\r\nXuyên suốt tư tưởng cách mạng của Người, chữ “dân” - con người, luôn được quan tâm và đặt lên hàng đầu, bởi, giải phóng dân tộc, giải phóng giai cấp cuối cùng chính là để giải phóng con người; và cách mạng chỉ thực sự thành công khi nhân dân được hưởng những quyền con người tốt đẹp. Việc đi sâu nghiên cứu và vận dụng tư tưởng Hồ Chí Minh về quyền con người là một nhiệm vụ quan trọng và cần được đặt ra trong bối cảnh Việt Nam hiện nay.\r\nĐể đáp ứng nhu cầu tìm hiểu, nghiên cứu và học tập sâu hơn về tư tưởng Hồ Chí Minh về quyền con người, Nhà xuất bản Chính trị quốc gia Sự thật xuất bản cuốn sách Tư tưởng Hồ Chí Minh về quyền con người, của TS. Lại Thị Thanh Bình - Trưởng khoa Kiến thức cơ bản, Trường Đại học Sân khấu điện ảnh Hà Nội. Cuốn sách là nghiên cứu tâm huyết của tác giả về quyền con người trong tư tưởng Hồ Chí Minh, từ đó khẳng định những giá trị mang tính định hướng của tư tưởng Hồ Chí Minh trong việc thực thi và bảo vệ quyền con người Việt Nam trong thời kỳ mới.\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','414522646e6fc4bb916005ea05c65f98.jpg','Tư Tưởng Hồ Chí Minh Về Quyền Con Người',15,250000,0,NULL,1,3,'Nhà Xuất Bản Chính Trị Quốc Gia Sự Thật'),(10,NULL,'2020-10-01 23:27:06','phu123vtvn@gmail.com','2020-10-31 21:03:27','Một ấn phẩm nằm trong Bộ sưu tập KHƠI DẬY ĐỨC TIN (gồm 14 quyển với 5 chủ đề Kinh Thánh – Tin Mừng – Cầu Nguyện – Khơi dậy đức tin và Những ngày Lễ lớn) dành cho lứa tuổi Mẫu giáo (từ 1 đến 5 tuổi) \r\n\r\nTập truyện nhỏ xinh với những hình vẽ ngộ nghĩnh, màu sắc bắt mắt sẽ là món quà ý nghĩa dành tặng các bé để cả nhà cùng bé tìm hiểu về ý nghĩa ngày lễ Giáng Sinh.\r\n\r\nBayard Việt Nam chuyển ngữ từ Collection La foi en poche. \r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','f50230a5c7bfabe2f2d1f6ce46d4e6b6.jpg','Câu Chuyện Giáng Sinh',11,89000,0,NULL,1,2,'NXB Tôn Giáo'),(11,NULL,NULL,'phu123vtvn@gmail.com','2020-10-31 20:53:25','Trên cơ sở cuốn “Bình Luận Phần Chung Bộ Luật Hình Sự Năm 1999”, căn cứ vào các quy định của Bộ luật hình sự năm 2015, so sánh với Bộ luật hình sự năm 1999, đối chiếu với thực tiễn đấu tranh phòng, chống tội phạm, tác giả đã giải thích một cách khoa học về các chế định trong Phần thứ nhất của Bộ luật hình sự năm 2015, đồng thời cũng nêu một số vấn đề cần tiếp tục hoàn thiện cho phù hợp với lý luận và thực tiễn.\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...','160498cec062552771d5328180b21f3c.jpg','Bình Luận Bộ Luật Hình Sự Năm 2015 Phần Thứ Nhất: Những Quy Định Chung',6,149000,0,NULL,1,3,'NXB Chính Trị Quốc Gia'),(12,'phu123vtvn@gmail.com','2020-10-02 22:00:26','phu123vtvn@gmail.com','2020-10-02 22:00:26','Nhiều người cho rằng bán hàng là kỹ năng đặc biệt hoặc phải lì lợm thậm chí thô lỗ mới làm tốt được. Điều đó không đúng và Robert Herjavec là một minh chứng. Được biết đến với cái tên \"Cá mập nhã nhặn\", trong show truyền hình SHARK TANK, Robert Herjavec được người xem yêu thích vì tính cách nhẹ nhàng lịch sự. Anh có cách tiếp cận trung thực và chân thành với cuộc sống và bán hàng, đó làm điều khiến ông trở nên khác biệt. \r\n\r\nTrong cuốn sách này, Robert chia sẻ những kỹ thuật bán hàng tinh túy nhất từ cơ bản đến nâng cao. Hướng dẫn những \"lính mới\" cũng như những người đã có kinh nghiệm từng bước một để trở thành người bán hàng xuất sắc. Triết lý của Robert rất đơn giản: Bán hàng là một kỹ năng có thể học được, không phải do bẩm sinh, không ai có được thành công trong cuộc sống mà không biết cách bán hàng cả. Thú vị, khai sáng và hiệu quả, cuốn sách này sẽ tiết lộ những bí mật về cách bán hàng của một trong những doanh nhân thành công nhất ở Bắc Mỹ. \r\n\r\nBạn sẽ học được gì?\r\n\r\nNghệ thuật bán hàng hiệu quả mà bạn không cần trở thành gian thương.\r\nBí quyết bán hàng qua điện thoại.\r\nPhương pháp bán hàng thượng hạng tôi học được từ một điệu nhảy.\r\nLàm sao bạn biết bạn giỏi về điều gì?\r\nChuyện hoang đường nhất về việc bán hàng và cuộc sống.\r\n5 điều mỗi nhân viên bán hàng cần biết\r\nHọc cách bơi cùng cá mập mà không trở thành cá mập.\r\nVươn mình trở thành người bán hàng đỉnh ','2ae88501b8b50d7493bdc82a7403eae7.jpg','America Shark Tank: Bùng Nổ Bán Hàng Cùng Shark Robert Herjavec',23,119000,0,NULL,1,5,'Robert Herjavec'),(13,'phu123vtvn@gmail.com','2020-10-31 21:41:10','phu123vtvn@gmail.com','2020-10-31 21:41:10','','','',0,0,0,NULL,0,1,''),(14,'phu123vtvn@gmail.com','2020-10-31 21:41:35','phu123vtvn@gmail.com','2020-10-31 21:41:35','ưeqdứađawà','c08a35353e61d331bc41b9650a3b4670.jpg','Nguyen Duc Phu',12,123213,0,NULL,1,1,'Nhà Xuất Bản Kim Đồng'),(15,'phu123vtvn@gmail.com','2020-10-31 22:40:31','phu123vtvn@gmail.com','2020-10-31 22:40:31','','','',0,0,0,NULL,0,2,'');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `access` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'2020-09-26 00:28:33',NULL,'2020-09-26 00:28:33',NULL,'phu123vtvn@gmail.com',NULL,0,NULL,'$2a$10$7NDTlqgRcqzUSU29hoyHzebwsLIfIeydnp/zgYtt4o.QB8CTDRXzK','0389251839',1,NULL,1),(2,'phu123vtvn@gmail.com','2020-09-30 23:07:38','phu123vtvn@gmail.com','2020-09-30 23:07:38',NULL,'admin@gmail.com',NULL,0,NULL,'$2a$10$exrrqfWq1HHH1LjSGPekMuWCuxLNyxluP9nIVFv6IeR8zjE75u6ju','0389251839',1,NULL,2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-31 23:19:09
