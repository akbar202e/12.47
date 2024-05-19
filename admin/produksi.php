<?php 
include 'header.php';

// Proses menyimpan pesanan baru ke dalam tabel daftar_pesanan
if(isset($_POST['submit'])) {
    $invoice = $_POST['invoice'];
    $kodeCustomer = $_POST['kode_customer'];
    $status = $_POST['status'];
    $tanggal = date('Y-m-d'); // Mengambil tanggal saat ini

    // Menyimpan pesanan ke dalam tabel daftar_pesanan
    $query = "INSERT INTO daftar_pesanan (invoice, kode_customer, status, tanggal) VALUES ('$invoice', '$kodeCustomer', '$status', '$tanggal')";
    $result = mysqli_query($conn, $query);

    if ($result) {
        // Pesanan berhasil disimpan
        echo "<script>alert('Pesanan berhasil disimpan dalam daftar_pesanan.');</script>";
    } else {
        // Pesanan gagal disimpan
        echo "<script>alert('Gagal menyimpan pesanan dalam daftar_pesanan: " . mysqli_error($conn) . "');</script>";
    }
}

$sortage = mysqli_query($conn, "SELECT * FROM produksi where cek = '1'");
$cek_sor = mysqli_num_rows($sortage);
?>

<div class="container">
    <h2 style=" width: 100%; border-bottom: 4px solid #98639E"><b>Daftar Pesanan</b></h2>
    <br>
    <h5 class="bg-success" style="padding: 7px; width: 710px; font-weight: bold;"><marquee>Lakukan Reload Setiap Masuk Halaman ini, untuk menghindari terjadinya kesalahan data dan informasi</marquee></h5>
    <a href="produksi.php" class="btn btn-default"><i class="glyphicon glyphicon-refresh"></i> Reload</a>
    <br>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Invoice</th>
                <th scope="col">Kode Customer</th>
                <th scope="col">Status</th>
                <th scope="col">Tanggal</th>
            </tr>
        </thead>
        <tbody>

            <?php 
            $result = mysqli_query($conn, "SELECT DISTINCT invoice, kode_customer, status, kode_produk, qty, terima, tolak, cek FROM produksi group by invoice");
            $no = 1;
            $array = 0;
            while($row = mysqli_fetch_assoc($result)){
                $kodep = $row['kode_produk'];
                $inv = $row['invoice'];
                ?>

                <tr>
                    <td><?= $no; ?></td>
                    <td><?= $row['invoice']; ?></td>
                    <td><?= $row['kode_customer']; ?></td>
                    <?php if($row['terima'] == 1){ ?>
                        <td style="color: green;font-weight: bold;">Pesanan Diterima (Siap Kirim)</td>
                        <?php
                    } else if($row['tolak'] == 1){
                        ?>
                        <td style="color: red;font-weight: bold;">Pesanan Ditolak</td>
                        <?php 
                    } else if($row['terima'] == 0 && $row['tolak'] == 0){
                        ?>
                        <td style="color: orange;font-weight: bold;"><?= $row['status']; ?></td>
                        <?php 
                    }
                    ?>
                    <td><?= date('Y/m/d'); ?></td>
                    <td>
                        <?php if( $row['tolak'] == 0 && $row['cek'] == 1 && $row['terima'] == 0){ ?>
                            <a href="inventory.php?cek=0" id="rq" class="btn btn-warning">
                                <i class="glyphicon glyphicon-warning-sign"></i> Request Material Shortage
                            </a>
                            <a href="proses/tolak.php?inv=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menolak ?')">
                                <i class="glyphicon glyphicon-remove-sign"></i> Tolak
                            </a>
                            <a href="proses/hapus_pesanan.php?inv=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menghapus Pesanan?')">
                                <i class="glyphicon glyphicon-trash"></i> Hapus
                            </a>
							<?php } else if($row['terima'] == 0 && $row['cek'] == 0){ ?>
                            <a href="proses/terima.php?inv=<?= $row['invoice']; ?>&kdp=<?= $row['kode_produk']; ?>" class="btn btn-success">
                                <i class="glyphicon glyphicon-ok-sign"></i> Terima
                            </a>
                            <a href="proses/tolak.php?inv=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menolak ?')">
                                <i class="glyphicon glyphicon-remove-sign"></i> Tolak
                            </a>
                            <a href="proses/hapus_pesanan.php?inv=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menghapus Pesanan?')">
                                <i class="glyphicon glyphicon-trash"></i> Hapus
                            </a>
                        <?php } ?>
                    </td>
                </tr>
                <?php
                $no++; 
            }
            ?>

        </tbody>
    </table>
</div>

