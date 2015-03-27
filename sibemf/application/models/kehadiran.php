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
        $query = $this->db->query("SELECT (
                                            SELECT COUNT(kehadiran2.id_staff)
                                            FROM kehadiran kehadiran2, rapat rapat2 WHERE rapat2.ID_Departemen = ".$id_dp." AND rapat2.ID_Rapat = kehadiran2.ID_Rapat AND kehadiran2.keterangan = 1
                                            AND rapat2.ID_Rapat = rapat.ID_Rapat
                                            ) AS JUMLAH_HADIR,
                                            (
                                            SELECT COUNT(kehadiran2.id_staff)
                                            FROM kehadiran kehadiran2, rapat rapat2 WHERE rapat2.ID_Departemen = ".$id_dp." AND rapat2.ID_Rapat = kehadiran2.ID_Rapat AND kehadiran2.keterangan = 2
                                            AND rapat2.ID_Rapat = rapat.ID_Rapat
                                            ) AS JUMLAH_IZIN,
                                            (
                                            SELECT COUNT(kehadiran2.id_staff)
                                            FROM kehadiran kehadiran2, rapat rapat2 WHERE rapat2.ID_Departemen = ".$id_dp." AND rapat2.ID_Rapat = kehadiran2.ID_Rapat AND kehadiran2.keterangan = 0
                                            AND rapat2.ID_Rapat = rapat.ID_Rapat
                                            ) AS JUMLAH_ABSEN, kehadiran.id_rapat AS ID_RAPAT, rapat.Nama AS NAMA_RAPAT, rapat.Tempat AS TEMPAT_RAPAT, rapat.Tanggal AS TANGGAL_RAPAT
                                    FROM kehadiran, rapat WHERE rapat.ID_Departemen = ".$id_dp." AND kehadiran.id_rapat = rapat.ID_Rapat GROUP BY kehadiran.id_rapat");
        return $query;
    }

    public function getMonthlyStaff()
    {
        $query = $this->db->query("SELECT COUNT(kehadiran.id_staff) AS JUMLAH, kehadiran.id_staff AS ID_STAFF FROM kehadiran, rapat WHERE kehadiran.id_rapat = rapat.ID_Rapat GROUP BY rapat.ID_Departemen ORDER BY COUNT(kehadiran.id_staff) DESC");
    }

    public function setKehadiran($data){
        $this->db->insert('kehadiran',$data);
    }
}

?>