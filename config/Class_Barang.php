<?php 

/**
* 
*/
class Class_Barang
{

    // =====================================================================================
    // AMBIL DATA
    // ======================================================================================
    function hitung_data()
    {
        include("config.php");

        $sql = "select * from barang a inner join stok c on a.kode_barang=c.kode_barang";

        $data = mysqli_query($conn,$sql);

        $data1 = mysqli_num_rows($data);
        if ($data1 == 0) {

            // echo "<div class='alert alert-danger'>Tidak ada data</div>";
        }
        else{
            
            while ($d=mysqli_fetch_assoc($data)) {

                $hasil[] = $d;
            }
            return $hasil;
        }
    }

    function tampil_data()
    {
        include("config.php");

        $sql = "select * from barang";

        $data = mysqli_query($conn,$sql);

        $data1 = mysqli_num_rows($data);
        if ($data1 == 0) {

            echo "<div class='alert alert-danger'>Tidak ada data</div>";
        }
        else{
            
            while ($d=mysqli_fetch_assoc($data)) {

                $hasil[] = $d;
            }
            return $hasil;
        }
    }

    function tampil_barangmasuk()
    {
        include("config.php");

        $sql = "select * from barang a inner join barangmasuk b inner join stok c on a.kode_barang=b.kode_barang and a.kode_barang=c.kode_barang inner join supplier d on b.kode_supplier=d.kode_supplier ORDER BY b.tgl_masuk DESC";
        
        // echo $sql;
        $data = mysqli_query($conn,$sql);
        
        $data1 = mysqli_num_rows($data);
        if ($data1 == 0) {

            echo "<div class='alert alert-danger'>Tidak ada data</div>";
        }
        else{
            
            while ($d=mysqli_fetch_assoc($data)) {

                $hasil[] = $d;
            }
            return $hasil;
        }
    }

    function tampil_peminjaman()
    {
         include("config.php");

        $sql = "select * from barangkeluar";

        $data = mysqli_query($conn,$sql);

        $data1 = mysqli_num_rows($data);
        if ($data1 == 0) {

            echo "<div class='alert alert-danger'>Tidak ada data</div>";
        }
        else{
            
            while ($d=mysqli_fetch_assoc($data)) {

                $hasil[] = $d;
            }
            return $hasil;
        }
    }

    // function tampil_barangkeluar()
    // {
    //      include("config.php");

    //     $sql = "select * from barangkeluar";

    //     $data = mysqli_query($conn,$sql);

    //     $data1 = mysqli_num_rows($data);
    //     if ($data1 == 0) {

    //         echo "<div class='alert alert-danger'>Tidak ada data</div>";
    //     }
    //     else{
            
    //         while ($d=mysqli_fetch_assoc($data)) {

    //             $hasil[] = $d;
    //         }
    //         return $hasil;
    //     }
    // }


    // mengambil nama dan id_supplier
    function supplier()
    {
        include("config.php");

        $sql = "select * from supplier order by kode_supplier";

        $data = mysqli_query($conn,$sql);

        while ($d=mysqli_fetch_assoc($data)) {

            $hasil[] = $d;
        }
        return $hasil;
    }

    // mengambil nama dan kode_barang
    function barang()
    {
        include("config.php");

        $sql = "select * from barang order by kode_barang";

        $data = mysqli_query($conn,$sql);

        while ($d=mysqli_fetch_assoc($data)) {

            $hasil[] = $d;
        }
        return $hasil;
    }

    // ======================================================================================
    // INPUT DATA
    // ======================================================================================

    function input_barangbaru($kode_barang,$nama_barang,$spesifikasi,$lokasi_barang,$kategori,$stok,$kondisi,$jenis_barang,$sumber_dana,$jmlkeluar,$keterangan)
    {
        // $kode_barang = addslashes($kode_barang);
        $nama_barang = addslashes($nama_barang);
        $spesifikasi = addslashes($spesifikasi);
        $lokasi_barang = addslashes($lokasi_barang);
        $kategori = addslashes($kategori);
        $stok = addslashes($stok);
        $kondisi = addslashes($kondisi);
        $jenis_barang = addslashes($jenis_barang);
        $sumber_dana = addslashes($sumber_dana);
        $jmlkeluar = addslashes($jmlkeluar);

        include("config.php");

        $sql1 = "insert into barang values('$kode_barang','$nama_barang','$spesifikasi','$lokasi_barang','$kategori','$stok','$kondisi','$jenis_barang','$sumber_dana')";
        // echo $sql1;
        $data1 = mysqli_query($conn,$sql1);


        $sql2 = "insert into stok values('$kode_barang','$nama_barang','$stok','$jmlkeluar','$stok-$jmlkeluar','$keterangan')";
        // echo $sql2;
        $data2 = mysqli_query($conn,$sql2);
    }

    function input_barangmasuk($id_barangmasuk,$kode_barang,$nama_barang,$tgl,$jumlah,$kode_supplier,$jml_barangmasuk,$totalbarang,$totjml_barang)
    {
        // $id_barangmasuk = addslashes($id_barangmasuk);
        $kode_barang = addslashes($kode_barang);
        $nama_barang = addslashes($nama_barang);
        $tgl = addslashes($tgl);
        $jumlah = addslashes($jumlah);
        $kode_supplier = addslashes($kode_supplier);
        $jml_barangmasuk = addslashes($jml_barangmasuk);
        $totalbarang = addslashes($totalbarang);
        $totjml_barang = addslashes($totjml_barang);

        include("config.php");

        // Menyimpan barang masuk
        $sql1 = "insert into barangmasuk values('".$id_barangmasuk."','".$kode_barang."','".$nama_barang."','".$tgl."','".$jumlah."','".$kode_supplier."')";
        // echo $sql1;
        $data1 = mysqli_query($conn,$sql1);

        // update stok
        $sql2 = "update stok set jml_barangmasuk='".$jml_barangmasuk."', total_barang='".$totalbarang."' where kode_barang='".$kode_barang."' ";
        // echo $sql2;
        $data2 = mysqli_query($conn,$sql2);

        // update barang
        $sql3 = "update barang set jumlah_brg='".$totjml_barang."' where kode_barang='".$kode_barang."'";
        // echo $sql3;
        $data3 = mysqli_query($conn,$sql3);

    }

    function input_datapeminjaman($no_pinjam,$tgl_pinjam,$kode_barang,$nama_barang,$jumlah_pinjam,$nama_peminjam,$keterangan,$totalbarang,$jmlbarangkeluar)
    {
        include("config.php");

        $sql = "insert into keluarbarang values('".$no_pinjam."','".$kode_barang."','".$nama_barang."','".$tgl_pinjam."','".$nama_peminjam."','".$jumlah_pinjam."')";
        // echo $sql;
        //$data = mysqli_query($conn,$sql);

        $sql1 = "insert into barangkeluar values('".$no_pinjam."','".$tgl_pinjam."','".$kode_barang."','".$nama_barang."','".$jumlah_pinjam."','".$nama_peminjam."','".$keterangan."')";
        // echo $sql1;
        $data1 = mysqli_query($conn,$sql1);

        $sql2 = "update barang set jumlah_brg='".$totalbarang."' where kode_barang='".$kode_barang."'";
        // echo $sql2;

        $data2 = mysqli_query($conn,$sql2);

        $sql3 = "update stok set jml_barangkeluar='".$jmlbarangkeluar."' where kode_barang='".$kode_barang."'";
        // echo $sql3;

        $data3 = mysqli_query($conn,$sql3);





    }

    // ======================================================================================
    // UPDATE DATA
    // ======================================================================================
    
    function update_datapeminjaman($jumlah_brg,$kode_barang,$keterangan,$no_pinjam,$stok)
    {
        include("config.php");
        $sql1 = "update barang set jumlah_brg='".$jumlah_brg."' where kode_barang='".$kode_barang."'";
        // echo $sql1;

        $data1 = mysqli_query($conn,$sql1);

        $sql2 = "update barangkeluar set keterangan='".$keterangan."' where nomor_pinjam='".$no_pinjam."'";
        // echo $sql2;

        $data2 = mysqli_query($conn,$sql2);

        $sql3 = "update stok set jml_barangkeluar='".$stok."' where kode_barang='".$kode_barang."'";
        // echo $sql3;

        $data3 = mysqli_query($conn,$sql3);
    }

    function edit_barang($kode_barang)
    {
        include("config.php");

        $sql = "select * from barang where kode_barang='".$kode_barang."'";

        $data = mysqli_query($conn,$sql);

        $data1 = mysqli_num_rows($data);
        if ($data1 == 0) {

            echo "<div class='alert alert-danger'>Tidak ada data</div>";
        }
        else{
            
            while ($d=mysqli_fetch_assoc($data)) {

                $hasil[] = $d;
            }
            return $hasil;
        }
    }

    function update_barang($nama_barang,$spesifikasi,$lokasi_barang,$kategori,$kondisi,$jenis_barang,$sumber_dana,$kode_barang)
    {
        include("config.php");

        $sql = "update barang a inner join stok e on a.kode_barang=e.kode_barang set 
        
        a.nama_barang='".$nama_barang."',
        e.nama_barang='".$nama_barang."',
        a.spesifikasi='".$spesifikasi."',
        a.lokasi_barang='".$lokasi_barang."',
        a.kategori='".$kategori."',
        a.kondisi='".$kondisi."',
        a.jenis_brg='".$jenis_barang."',
        a.sumber_dana='".$sumber_dana."' where a.kode_barang='".$kode_barang."' ";

        // echo $sql;
        $data = mysqli_query($conn,$sql);

    }
    // ======================================================================================
    // HAPUS DATA
    // ======================================================================================


    function hapus($id)
    {
        include ("config.php");

        $sql1 = "delete from barang where kode_barang='".$id."' ";
        $data1 = mysqli_query($conn,$sql1);

        $sql2 = "delete from stok where kode_barang= '".$id."' ";
        $data2 = mysqli_query($conn,$sql2);

        $sql3 = "delete from barangkeluar where kode_barang= '".$id."' ";
        $data3 = mysqli_query($conn,$sql3);

        $sql4 = "delete from barangmasuk where kode_barang= '".$id."' ";
        $data4 = mysqli_query($conn,$sql4);

        $sql5 = "delete from keluarbarang where kode_barang= '".$id."' ";
        $data5 = mysqli_query($conn,$sql5);

    }

}
 ?>