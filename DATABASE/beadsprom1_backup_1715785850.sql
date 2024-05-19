

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO admin VALUES("1","admin","$2y$10$AIy0X1Ep6alaHDTofiChGeqq7k/d1Kc8vKQf1JZo0mKrzkkj6M626");



CREATE TABLE `customer` (
  `kode_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(200) NOT NULL,
  PRIMARY KEY (`kode_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO customer VALUES("C0002","Rafi Akbar","a.rafy@gmail.com","rafi","$2y$10$/UjGYbisTPJhr8MgmT37qOXo1o/HJn3dhafPoSYbOlSN1E7olHIb.","0856748564");
INSERT INTO customer VALUES("C0003","Nagita Silvana","bambang@gmail.com","Nagita","$2y$10$47./qEeA/y3rNx3UkoKmkuxoAtmz4ebHSR0t0Bc.cFEEg7cK34M3C","087804616097");
INSERT INTO customer VALUES("C0004","Nadiya","nadiya@gmail.com","nadiya","$2y$10$6wHH.7rF1q3JtzKgAhNFy.4URchgJC8R.POT1osTAWmasDXTTO7ZG","0898765432");
INSERT INTO customer VALUES("C0005","akbar","asusyudha51@gmail.com","akbar51","$2y$10$DBKRyjASPYr3CV4/DE8eRet6wIkLRbZS6r4iOFxJr1wMPg.AGqyI6","083155888856");
INSERT INTO customer VALUES("C0006","akbar","akbar202e@gmail.com","akbar202e","$2y$10$qtQg7cdydYP.DCzKAI1bSuiGoCczF0fHgHibnmkYQVkEEd0zaaj.O","+628312312312");



CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_keranjang`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO keranjang VALUES("16","C0003","P0002","Maryam","5","15000");
INSERT INTO keranjang VALUES("17","C0003","P0003","Kue tart coklat","2","100000");



CREATE TABLE `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`kode_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO produk VALUES("P0004","Gelang Glossy Pink","6644cb778c41a.png","				mantap			","15000");
INSERT INTO produk VALUES("P0005","Gelang Polymer lavender","6644cc9ebf243.png","				Tahan nyamuk","15000");
INSERT INTO produk VALUES("P0006","Gelang Biru Tropis","6644b10d2a562.jpg","				membawa kesegaran kemana saja","15000");
INSERT INTO produk VALUES("P0007","Kalung Bening","6644bdc0ec955.png","				kalung			","20000");
INSERT INTO produk VALUES("P0008","Kalung Hijau Emerald","6644ccfe0b620.png","","20000");
INSERT INTO produk VALUES("P0009","Kalung Hijau Emas Elegan","6644cd54935eb.png","","25000");



CREATE TABLE `produksi` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(200) NOT NULL,
  `kode_customer` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `terima` varchar(200) NOT NULL,
  `tolak` varchar(200) NOT NULL,
  `cek` int(11) NOT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO produksi VALUES("35","INV0001","C0005","P0004","nanas manis","1","50000","Pesanan Baru","2424-05-15","KABUPATEN BENGKAYANG","KABUPATEN BENGKAYANG","JALAN G.OBOS XXVII BLOK D NO 2","78875","2","1","0");
INSERT INTO produksi VALUES("36","INV0002","C0006","P0004","nanas manis","2","50000","0","2424-05-15","","","","","1","0","0");
INSERT INTO produksi VALUES("37","INV0002","C0006","P0005","nanas apa ini","2","1000","0","2424-05-15","","","","","1","0","0");
INSERT INTO produksi VALUES("38","INV0002","C0006","P0006","kebun nnas","2","1000","0","2424-05-15","","","","","1","0","0");
INSERT INTO produksi VALUES("39","INV0003","C0006","P0007","Kalung Bening","12","20000","0","2424-05-15","","","","","1","0","0");
INSERT INTO produksi VALUES("40","INV0004","C0006","P0007","Kalung Bening","2","20000","0","2424-05-15","","","","","1","0","0");



CREATE TABLE `report_cancel` (
  `id_report_cancel` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_report_cancel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `report_penjualan` (
  `id_report_sell` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `jumlah_terjual` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_report_sell`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO report_penjualan VALUES("1","INV0013","P0004","nanas manis","1","2424-05-15");
INSERT INTO report_penjualan VALUES("2","INV0014","P0006","kebun nnas","1","2424-05-15");
INSERT INTO report_penjualan VALUES("3","INV0001","P0004","nanas manis","1","2424-05-15");
INSERT INTO report_penjualan VALUES("4","INV0002","P0004","nanas manis","2","2424-05-15");
INSERT INTO report_penjualan VALUES("5","INV0002","P0005","nanas apa ini","2","2424-05-15");
INSERT INTO report_penjualan VALUES("6","INV0002","P0006","kebun nnas","2","2424-05-15");
INSERT INTO report_penjualan VALUES("7","INV0003","P0007","Kalung Bening","12","2424-05-15");
INSERT INTO report_penjualan VALUES("8","INV0004","P0007","Kalung Bening","2","2424-05-15");



CREATE TABLE `report_produksi` (
  `id_report_prd` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_report_prd`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO report_produksi VALUES("1","INV0007","P0006","kebun nnas","1","2424-05-15");
INSERT INTO report_produksi VALUES("6","INV0008","P0006","kebun nnas","1","2424-05-15");
INSERT INTO report_produksi VALUES("7","INV0008","P0005","nanas apa ini","1","2424-05-15");
INSERT INTO report_produksi VALUES("8","INV0008","P0004","nanas manis","10","2424-05-15");
INSERT INTO report_produksi VALUES("9","INV0009","P0004","nanas manis","1","2424-05-15");
INSERT INTO report_produksi VALUES("10","INV0010","P0006","kebun nnas","1","2424-05-15");
INSERT INTO report_produksi VALUES("12","INV0011","P0006","kebun nnas","1","2424-05-15");
INSERT INTO report_produksi VALUES("13","INV0012","P0006","kebun nnas","1","2424-05-15");
INSERT INTO report_produksi VALUES("14","INV0013","P0004","nanas manis","1","2424-05-15");
INSERT INTO report_produksi VALUES("15","INV0014","P0006","kebun nnas","1","2424-05-15");
INSERT INTO report_produksi VALUES("16","INV0001","P0004","nanas manis","1","2424-05-15");
INSERT INTO report_produksi VALUES("17","INV0002","P0004","nanas manis","2","2424-05-15");
INSERT INTO report_produksi VALUES("18","INV0002","P0005","nanas apa ini","2","2424-05-15");
INSERT INTO report_produksi VALUES("19","INV0002","P0006","kebun nnas","2","2424-05-15");
INSERT INTO report_produksi VALUES("20","INV0003","P0007","Kalung Bening","12","2424-05-15");
INSERT INTO report_produksi VALUES("21","INV0004","P0007","Kalung Bening","2","2424-05-15");



CREATE TABLE `report_profit` (
  `id_report_profit` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `jumlah` varchar(11) NOT NULL,
  `total_profit` varchar(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_report_profit`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO report_profit VALUES("1","INV0007","P0006","1","0","2424-05-15");
INSERT INTO report_profit VALUES("6","INV0008","P0006","1","0","2424-05-15");
INSERT INTO report_profit VALUES("7","INV0008","P0005","1","0","2424-05-15");
INSERT INTO report_profit VALUES("8","INV0008","P0004","10","450000.00","2424-05-15");
INSERT INTO report_profit VALUES("9","INV0009","P0004","1","0","2424-05-15");
INSERT INTO report_profit VALUES("10","INV0010","P0006","1","0","2424-05-15");
INSERT INTO report_profit VALUES("12","INV0011","P0006","1","0","2424-05-15");
INSERT INTO report_profit VALUES("13","INV0012","P0006","1","0","2424-05-15");
INSERT INTO report_profit VALUES("14","INV0013","P0004","1","0","2424-05-15");
INSERT INTO report_profit VALUES("15","INV0014","P0006","1","0","2424-05-15");
INSERT INTO report_profit VALUES("16","INV0001","P0004","1","0","2424-05-15");
INSERT INTO report_profit VALUES("17","INV0002","P0004","2","50000.00","2424-05-15");
INSERT INTO report_profit VALUES("18","INV0002","P0005","2","1000.00","2424-05-15");
INSERT INTO report_profit VALUES("19","INV0002","P0006","2","1000.00","2424-05-15");
INSERT INTO report_profit VALUES("20","INV0003","P0007","12","220000.00","2424-05-15");
INSERT INTO report_profit VALUES("21","INV0004","P0007","2","20000.00","2424-05-15");

