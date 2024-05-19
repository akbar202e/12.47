<?php 
include '../../koneksi/koneksi.php';
$inv = $_GET['inv'];

$result = mysqli_query($conn, "SELECT * FROM produksi WHERE invoice = '$inv'");


// Pembaruan status di luar loop while
$update_status = mysqli_query($conn, "UPDATE produksi SET terima = '1', status = '0' WHERE invoice = '$inv'");

if ($update_status) {
    echo "
    <script>
    alert('PESANAN BERHASIL DITERIMA');
    window.location = '../produksi.php';
    </script>
    ";
} else {
    echo "
    <script>
    alert('GAGAL MENERIMA PESANAN');
    window.location = '../produksi.php';
    </script>
    ";
}
?>
