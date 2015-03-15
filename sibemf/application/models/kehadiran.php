<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 6:06 PM
 */

class Kehadiran extends CI_Model {
    public function getKehadiranRapat($nrp)
    {
        $query = $this->db->query("SELECT kehadiran.keterangan as KETERANGAN, rapat.Nama as NAMA_RAPAT, rapat.Tanggal as TANGGAL_RAPAT,
                            rapat.Tempat as TEMPAT_RAPAT from kehadiran, rapat where rapat.ID_Rapat = kehadiran.id_rapat and kehadiran.id_staff = '".$nrp."'");
        return $query;
    }

    public function getDetailAbsensiRapat($id_dp)
    {
        $query = $this->db->query("SELECT rapatapat.ID_Rapat AS NO_RAPAT, rapat.Nama AS NAMA_RAPAT, rapat.Tempat AS TEMPAT_RAPAT, rapat.Tanggal AS TANGGAL_RAPAT, TEMP1.JUMLAH_HADIR AS HADIR, TEMP2.JUMLAH_IZIN AS IZIN, TEMP3.JUMLAH_ABSEN AS ABSEN FROM Rapat,
                                    (
                                        SELECT COUNT(kehadiran.id_staff) AS JUMLAH_HADIR, kehadiran.id_rapat AS ID_RAPAT FROM kehadiran, rapat WHERE kehadiran.id_rapat = rapat.ID_Rapat AND rapat.ID_Departemen = ".$id_dp." AND kehadiran.keterangan = 1 GROUP BY kehadiran.id_rapat;
                                    ) AS TEMP1,
                                    (
                                        SELECT COUNT(kehadiran.id_staff) AS JUMLAH_IZIN, kehadiran.id_rapat AS ID_RAPAT FROM kehadiran, rapat WHERE kehadiran.id_rapat = rapat.ID_Rapat AND rapat.ID_Departemen = ".$id_dp." AND kehadiran.keterangan = 2 GROUP BY kehadiran.id_rapat;
                                    ) AS TEMP2,
                                    (
                                        SELECT COUNT(kehadiran.id_staff) AS JUMLAH_ABSEN, kehadiran.id_rapat AS ID_RAPAT FROM kehadiran, rapat WHERE kehadiran.id_rapat = rapat.ID_Rapat AND rapat.ID_Departemen = ".$id_dp." AND kehadiran.keterangan = 0 GROUP BY kehadiran.id_rapat;
                                    ) AS TEMP3,
                                WHERE rapat.ID_RAPAT = TEMP1.ID_Rapat AND rapat.ID_Rapat = TEMP2.ID_RAPAT AND rapat.ID_Rapat = TEMP3.ID_RAPAT");
        return $query;
    }

    public function setKehadiran($data){
        $this->db->insert('kehadiran',$data);
    }
}

?>